> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/12-ai-llm.md))

# BC-250'de AI / LLM

> **Özet** — BC-250'nin AI için cazibesi, çöp-fiyatına gelen **16 GB GDDR6**'sıdır. Onu kullanmanın gerçekçi yolu, **Vulkan (RADV) arka ucu üzerinde llama.cpp / Ollama**'dır — ROCm *değil*. GPU **gfx1013 (Cyan Skillfish)**'tir ve hiçbir ROCm derlemesi onu resmi olarak hedeflemez, bu yüzden ROCm çoğu insanın atladığı derin bir tavşan deliğidir. Vulkan'da, VRAM'e sığan bir MoE modeliyle topluluk kabaca **30–40 tok/s** görür (örn. gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). İşin püf noktası **bellektir**: 16 GB paylaşımlı CPU+GPU'dur, dolayısıyla büyük modeller tam kenarda yaşar ve OOM bir numaralı arızadır. BIOS VRAM'ini ayarlayın, çekirdek TTM sayfa limitini yükseltin ve **MoE** modelleri çalıştırın — bütün oyun budur.

BC-250 iyi bir *bütçe çıkarım (inference) kutusu* ve kötü bir *eğitim kutusudur*. Onu "Vulkan üzerinden kuantize modeller çalıştıran 16 GB'lık bir kart" olarak ele alın, keyifli vakit geçirirsiniz.

---

## Neden Vulkan, ROCm değil

GPU çipi **Cyan Skillfish = `gfx1013`**'tür (RDNA-1.x sınıfı bir parça, Navi 10/`gfx1010`'un kardeşi). Bu tek gerçek her şeyi belirler:

- **ROCm `gfx1013` için destek sevk etmez.** AMD'nin ROCm yığını belirli bir GPU ID'leri izin listesini hedefler ve Cyan Skillfish onun üzerinde değildir. Yani resmi `ROCm/ROCm` yolu kartı basitçe görmez. Somut olarak: `gfx1013` LLVM'de `rocm-amdhsa`-yetenekli olarak *listelenir*, ancak **AMD'nin ROCm kullanıcı alanı (rocBLAS/Tensile) hiçbir `gfx1013` matematik (çözüm) kütüphanesi sevk etmez** — yani bir GEMM rocBLAS'a çarptığı anda `rocblas_abort()` ("GFX1013 not in GPU list") alırsınız. Çağrılacak bir matematik çekirdeği yoktur ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **Bunu bir kenara bıraksanız bile, ROCm'in bu APU'larda kullanılabilir bir shader önbelleği yoktur — her başlatmada yeniden derler**, oysa **Vulkan arka ucu derlenmiş shader'ları diske önbelleğe alır**. Bu tek başına Vulkan'ı pratik compute yolu yapar: akandr'ın testi, bu kartta kullanılabilir bulunan tek GPU-compute yolunun Vulkan olduğu sonucuna varır ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (Bunun bir *sürücü/kütüphane* boşluğu olduğunu, eksik bir donanım özelliği olmadığını unutmayın — RDNA2'nin `gfx103x` ISA'sı INT8 dp4a içerir, örn. `v_dot4c_i32_i8`; sorun tamamen ROCm'in bu ID için hiçbir şey sevk etmemesidir.)
- İyi bilinen "eski kartlarda ROCm'i aç" repoları da **onu kapsamaz**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) **yalnızca `gfx803`'tür** (Polaris: RX 580/570/480). Tamamen yanlış mimari — burada kullanılamaz.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) ekstra hedefler ekler (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — ama **`gfx1013` listede yok** ve repo **2025-08-12'de arşivlendi**. `HSA_OVERRIDE_GFX_VERSION=10.1.0` ile `gfx1010` (Navi 10) gibi davranmayı *deneyebilirsiniz*, tıpkı insanların ekran sürücüsünü ayağa kaldırmak için Navi 10 firmware'ini sembolik bağladığı gibi (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), ama bu BC-250'de compute için doğrulanmamıştır ve sohbette kimse çalışan bir ROCm LLM yığını bildirmez.  ⚠ doğrula

İnsanların ortalıkta dolaştırdığı diğer repolar — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) ve [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — sırasıyla Navi 10 dGPU'lar ve Polaris içindir, Cyan Skillfish değil. Faydalı arka plandırlar, bu kart için bir tarif değil.

**Sonuç (2026 ortası itibarıyla):** BC-250'de ROCm, çözülmemiş/ekonomik olmayan bir hack'tir. Topluluğun paylaştığı her çalışan kurulum, BC-250'nin sürücü yığınının oyun için zaten size verdiği **Mesa RADV üzerinden Vulkan**'da çalışır. Birisi ROCm'i çalıştırırsa, bu yamalı bir konteynerde `gfx1010`'u taklit ederek olacaktır — bir hafta sonunuzu kaybetmeyi bekleyin, garanti yok.

> **Güncelleme — birisi HIP/ROCm'i çalıştırmayı başardı (Discord, 2026 ortası).** Yukarıdaki "kimse çalışan bir yığın bildirmedi" hükmünden sonra, bir üye **MEC bellenimini modifiye ettikten**, BIOS ayarlarını değiştirdikten ve yığını yeniden derledikten sonra BC-250 üzerinde **ROCm, HIP ve PyTorch hesaplamasının çalıştığını** bildirdi ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). Bu yöntemde, varsayılan saat hızlarında **HIP ile derlenen `llama.cpp`**, **TinyLlama-1.1B (pp512) üzerinde 709 tok/s** ve **Llama-3.1-8B (pp512) üzerinde 115 tok/s** değerlerini ölçtü ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)) ve prefill performansı CU kilidinin açılmasıyla ölçeklendi — **her ikisi de 1500 MHz'de olmak üzere, 24 CU (94–95 W) ile ~230 tok/s'ye karşı 40 CU (125 W) ile 371.6 tok/s** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). Bu, bellenim derinliğinde, deneysel bir yoldur — önerilen yöntem değildir — ancak "ROCm imkansız" hükmünün artık mutlak olmadığını gösteriyor. ⚠ ileri düzey.

---

## 16 GB VRAM avantajı (ve püf noktası)

16 GB, **kuantize** olduğunda (Q3–Q4) 20–35B'lik bir modeli tutmaya yeter — aksi halde size bir 4060 Ti 16 GB ya da ikinci el bir 3090'a mal olacak VRAM. Kartın LLM'ler için ilginç olmasının bütün nedeni budur.

Püf noktası: **16 GB, CPU ile GPU arasında paylaşılır.** Geri düşülecek ayrı bir sistem RAM havuzu yoktur. Yani:

- Model + KV-önbellek + işletim sistemi + her arka plan işlemi hepsi *aynı* 16 GB'ye sığar.
- Modeli fazla büyütürseniz "yavaş" almazsınız — sert bir **OOM** alırsınız ve bazı dağıtımlarda KDE çöker ve sizi bir konsola düşürür ([src](https://t.me/c/2424231195/101077)).
- Düzenli bir katkıcının aylarca süren testten sonraki kararı: *"Performans birçok şey için yeterli; yetmeyen **bellek**."* ([src](https://t.me/c/2424231195/101077))

İki kaldıraç size hareket alanı kazandırır:

1. **VRAM'i BIOS'ta ayarlayın.** `vram = 12` (GB) ile çalışmak, sisteme RAM bırakan bilinen-iyi bir tabandır ([src](https://t.me/c/2424231195/101077)). Daha yüksek VRAM bölmeleri daha büyük modellerin yüklenmesine izin verir ama işletim sistemini aç bırakır.
2. **Çekirdek TTM sayfa limitini yükseltin** ki GPU bellek yöneticisi 14B+ bir modelin ihtiyaç duyduğu büyük tahsisleri gerçekten dağıtsın (aşağıdaki kuruluma bakın). Vulkan'da daha büyük modelleri açan tek değişiklik budur.

1–2 GB geri kazanmak için bir topluluk hilesi: bir **başsız (headless) sunucu işletim sistemi** çalıştırın ve onunla ağ üzerinden konuşun (örn. Open WebUI / bir API), böylece VRAM yiyen bir masaüstü olmaz ([src](https://t.me/c/2424231195/101077)).

---

## Yoğun değil, MoE modelleri çalıştırın

Bu, 16 GB paylaşımlı bellekli bir kutuda en önemli modelleme seçimidir ve sohbet nedenini açıkça söyler ([src](https://t.me/c/2424231195/125233)):

- Bir **yoğun (dense)** model için onu yalnızca *ardışık* olarak katman-katman bölebilirsiniz; tensor-paralel hileleri yardımcı olmaz, dolayısıyla sığanla ve ham bant genişliğiyle sınırlısınız.
- Bir **MoE** modeli için yoğun/dikkat kısmını kartta tutar ve token başına yalnızca birkaç küçük uzmanı etkinleştirirsiniz. Sonuç: **çok daha büyük bir model iyi bir kalitede sığar ve bir verim çarpanı elde edersiniz**, çünkü token başına ağırlıkların yalnızca bir kısmına dokunulur.

İnsanların BC-250'de gerçekten çalıştırdığı modellerin küçük aktif-parametre sayılı MoE olmasının nedeni tam olarak budur: **gpt-oss-20b** (sohbetin favorisi), **Qwen3.5-35B-A3B** (35B toplam / ~3B aktif), **Gemma-4-26B-A3B**. Aynı VRAM ayak izine sahip bir yoğun modelin yapabileceğinin çok üzerinde vururlar.

> Çok-kartlı kurulumlar için ilgili bir içgörü: MoE için **uzman sütunlarını** kartlar arasında bölebilir ve toplam bant genişliği kazanabilirsiniz, oysa bir yoğun modelin gizli durumu küçücüktür (70B için bile ~1 MB), dolayısıyla düğümler arasında bir gigabit bağlantı darboğaz *değildir* ([src](https://t.me/c/2424231195/125233)). Tek bir BC-250 için bu konu dışıdır, ama insanların onları neden zincirlediğini açıklar.

---

## Kurulum A — Ollama + Vulkan (önerilen, tekrarlanabilir)

En eksiksiz, tekrarlanabilir BC-250 tarifi, topluluk kılavuzu [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup)'tır (sohbette defalarca atıfta bulunulur). Çalışan bir BC-250 grafik yığınını varsayar (bkz. [06-linux.md](06-linux.md)) — güncel bir Mesa/RADV ile Fedora — ve sonra üstüne Ollama'yı katmanlar. O repodan alınmıştır:

**1. Ollama'yı kurun:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Vulkan arka ucunu + bellek-güvenli seçenekleri etkinleştirin**, bir systemd geçersiz kılması (`/etc/systemd/system/ollama.service.d/override.conf`) aracılığıyla:
```ini
[Service]
Environment=OLLAMA_VULKAN=1
Environment=OLLAMA_FLASH_ATTENTION=1
Environment=OLLAMA_KV_CACHE_TYPE=q4_0
Environment=OLLAMA_MAX_LOADED_MODELS=1
Environment=OLLAMA_KEEP_ALIVE=30m
Environment=OLLAMA_CONTEXT_LENGTH=65536
Environment=OLLAMA_GPU_OVERHEAD=0
Environment=OLLAMA_MAX_QUEUE=4
OOMScoreAdjust=-1000
```
Sonra:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` ve `OLLAMA_KV_CACHE_TYPE=q4_0` KV-önbelleğini küçültür, böylece uzun bir bağlam sığar; `OOMScoreAdjust=-1000` çekirdeğin bellek baskısı altında önce Ollama'yı öldürmesini engeller.

**3. Anahtar bellek düzeltmesi — TTM sayfa limitini yükseltin** (14B+ / büyük-bağlam modellerinin hiç yüklenmesini sağlayan budur):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Yeniden başlatmalar boyunca kalıcı yapın:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Bir MoE modeli çekin ve çalıştırın**, örn.:
```bash
ollama run gpt-oss:20b
```

> `akandr/bc250` kılavuzu **Fedora 43 / kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0** üzerinde doğrulandı. Tam paket sürümleri kayacaktır — env vars'ları ve TTM düzeltmesini tutun; gerisini güncelleyin. ⚠ kopyalamadan önce sürümleri repoya karşı doğrula.

**Oberon governor'ı üst üste yığın.** [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) çalıştırmanın (oyun için kullanılan aynı governor, bkz. [09-overclock-undervolt.md](09-overclock-undervolt.md)) daha yüksek saat hızlarını tutarak **gpt-oss-20b'de +10–20 tok/s** eklediği bildirilir ([src](https://t.me/c/2424231195/101077)). Mevcut en ucuz hızlanmadır.

---

## Kurulum B — llama.cpp (Vulkan), derlenmiş veya paketlenmiş

Ham `llama.cpp` isterseniz (daha fazla kontrol, herhangi bir yerden GGUF, `llama-server`'ın OpenAI-uyumlu API'si):

**Arch / paru (sohbette doğrulanan tek komut):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — bu bölümün sohbet külliyatındaki tek derleme komutu; paket adına karşı çapraz-kontrol edildi.)

**Kaynaktan derleyin** ([`ggml-org/llama.cpp` derleme dokümanlarına](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) göre) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(Fedora'da SPIR-V başlıkları paketi `spirv-headers-devel`'dir.) Sonra tüm katmanlar GPU'da olacak şekilde çalıştırın:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` her katmanı Vulkan cihazına boşaltır. llama.cpp'nin seçtiği cihazın BC-250 olduğunu doğrulamak için `--list-devices` kullanın ve birden fazlanız varsa onu zorlamak için `--device` kullanın. Önceden derlenmiş ikili dosyalar [llama.cpp releases sayfasındadır](https://github.com/ggml-org/llama.cpp/releases).

> **HIP/ROCm arka ucunu derlemeyin** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). `gfx1013` için ROCm çalışma zamanı yoktur, dolayısıyla derlense bile çalışmaz. Buradaki desteklenen yol Vulkan'dır. ([build doc](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**İnsanların gerçekten kullandığı ön uçlar:**
- **[Jan AI](https://jan.ai/)** — sohbetin mevcut günlük sürücüsü: büyük model seçici, bağlam/araç ayarları, modele web erişimi verebilir + görsel/doküman okuyabilir, MCP desteği. Modeli altta Vulkan üzerinde çalıştırır ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — Vulkan'lı tek-ikili llama.cpp sarmalayıcısı, tek-dosya dağıtım için kullanışlı.
- **Open WebUI** — başka bir makineden sürmek için başsız bir kutuyla eşleştirin (masaüstü VRAM'ini kurtarır).

---

## Gerçekçi token/s beklentileri

Aşağıdaki sayılar 16 GB'ye sığacak boyutta MoE modelleriyle **Vulkan'da topluluk tarafından bildirilmiştir**. Onları bir benchmark paketi değil, büyüklük-mertebesi olarak ele alın — `akandr/bc250` kılavuzundan ve sohbetten gelirler, TTM düzeltmesi + flash-attention + `q4_0` KV-önbellekli tek bir kartta.

| Model | Quant | Aktif / toplam param | Bildirilen üretim hızı |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | yoğun 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | topluluk favorisi; Oberon governor ile +10–20 tok/s |

Kaynaklar: hızlar [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup)'tan; gpt-oss-20b kullanımı ve governor artışı ([src](https://t.me/c/2424231195/101077)). Model GGUF'ları Hugging Face'ten gelir — örn. [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Dürüst okuma:** 20–35B'lik bir MoE'de ~30–40 tok/s, sohbet, kodlama yardımı ve agent/araç döngüleri için gerçekten kullanılabilir. Bir 4090 **değildir**. Kalite, 16 GB'nin dayattığı agresif kuantizasyonla (35B modellerde IQ2/Q3) sınırlanır — ve bir kullanıcı bir 30B'yi daha sert bir quant'ta zorlamanın "muhtemelen çok hata yapacağını" belirtti ([src](https://t.me/c/2424231195/101077)). En ideal nokta, kararlı kalırken tekrar tekrar "tüm küçüklerden daha akıllı" diye tanımlanan **gpt-oss-20b**'dir ([src](https://t.me/c/2424231195/101077)).

### 40-CU açma LLM'leri hızlandırır mı? Evet — yoğun bir modelde canlı ölçüldü

40-CU açma (bkz. [09-overclock-undervolt.md](09-overclock-undervolt.md)) çıkarıma oyunlara olduğundan daha fazla yardım eder, çünkü token üretimi compute unit'leri gerçekten kullanır. Bir video, bir **yoğun** modelde CU'ları açıp kapatırken bunu **canlı** ölçtü — **Ollama + Vulkan** üzerinde Qwen3.5-9B (~10 GB GDDR6) — ve verim CU sayısını neredeyse doğrusal izledi ([Old Lamer — RU CU-unlock video](https://youtu.be/M7PsojWr4KA), ~8:30–12:03): *(⚠ otomatik-altyazılı — ondalıkları ≈ olarak ele alın.)*

| Aktif CU | Üretim hızı | 24 CU'ya karşı |
|---|---|---|
| 24 CU (stok) | ≈25.7 tok/s | taban |
| açma adımı | ≈31.9 tok/s | **~+%16–17** |
| 36 CU | ≈33.4 tok/s | **toplam ~+%20** |

O kart **36 CU'da tavan yaptı** — son iki CU gerçekten kusurluydu ve etkinleştirildiklerinde **llama yüklemede çöktü**, OC bölümündeki "38/40 bir loteridir" noktasının somut bir örneği. Ollama ortamı yukarıdaki tarifle eşleşti (`OLLAMA_VULKAN=1`, KV-önbellek `q4_0`, bağlam 65536, `ttm.pages_limit=4194304`). *Yoğun* bir model olduğundan, kazanç saf CU ölçeklemesidir — üstüne MoE uzman-yönlendirme çarpanı yoktur ([Old Lamer — RU CU-unlock video](https://youtu.be/M7PsojWr4KA)).

`akandr/bc250` kılavuzu, 40-CU açma genelinde **MoE** modellerinde daha dolu bir A/B çalıştırdı (açma yamasının kendisi akandr'da değil [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock)'ta yaşar; akandr bağımsız bir FP32 sağlık kontrolü + verim yeniden-çalıştırması ekler). İkisi de **llama.cpp aracılığıyla** iki manşet üretim deltası ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)):

| Model | Quant | Üretim @ 24 CU | Üretim @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+%32** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+%32** |

11 model genelinde medyan, açmadan **+%32 üretim / +%50 prefill**'di. O tablodan çekilmeye değer iki şey: **gpt-oss-20b rahatça çalışır (66 → 87 tok/s)**, sohbetin favorisini doğrular ve akandr MoE modellerini **Ollama'ya göre `llama.cpp` üzerinden doğrudan epey daha hızlı** ölçtü (Ollama'nın uzman-sevk yolu bu mimari için daha az verimlidir — örn. Qwen3.5-35B-A3B stok saat hızlarında Ollama'da 25.1 tok/s'ye karşı llama.cpp'de 59.5 tok/s'ydi) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **Doğrulanmamış MoE veri noktaları (Hackaday yorumları — söylenti olarak ele alın).** Tekrarlanmış bir çalıştırma yerine okuyucu yorumlarından: **MTP** (çok-token tahmini) ile bir Qwen "27b" **≈14.5 tok/s** ve MTP'li bir "35b" **≈47 tok/s**. Geniş yayılım tam olarak MTP + MoE aktif-parametre farklarının üreteceği şeydir, ama hiçbir rakam burada bağımsız olarak doğrulanmadı — bir benchmark olarak değil, bağlam için işaretlendi. ⚠ doğrula

---

## Acı veren şeyler (dürüst olalım)

- **OOM varsayılan arıza modudur.** 16 GB paylaşımlı bellekte büyük model = kenarda yaşamak. Çökmeleri bekleyin; KDE'de masaüstü ölebilir ve yalnızca bir konsol bırakabilir ([src](https://t.me/c/2424231195/101077)). BIOS VRAM bölmesi, TTM düzeltmesi, `q4_0` KV-önbellek, flash attention ve başsız bir kurulumla hafifletin.
- **Dağıtım kararlılığı değişkendir.** Fedora belgeli taban olmasına rağmen, sohbet Vulkan'da bellek baskısı altında çökmeme konusunda **Ubuntu'yu Fedora'dan daha kararlı** buldu ([src](https://t.me/c/2424231195/101077)). Bir dağıtım OOM-çökmeye devam ederse diğerini deneyin.
- **ROCm fiilen masada değil** (üstteki bölüme bakın). Bu kartta PyTorch/vLLM eğitiminin peşinde günler harcamayın — [vLLM'in AMD yolu](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) ROCm'e ihtiyaç duyar, o da bu kartın sahip olmadığı desteklenen bir GPU ID'sine ihtiyaç duyar.
- **Bu bir çıkarım kutusudur, bir eğitici değil.** Herhangi bir gerçek ölçekte ince-ayar daha fazla VRAM ve çalışan bir compute yığını ister. Onu modelleri *çalıştırmak* için kullanın, eğitmek için değil.
- **Verim saat hızlarına bağlıdır.** Yüksek saat hızlarını tutan bir governor olmadan masada 10–20 tok/s bırakırsınız ([src](https://t.me/c/2424231195/101077)); sürekli çıkarım sürekli bir yük olduğundan burada soğutma da önemlidir (bkz. [04-cooling.md](04-cooling.md)).

---

## Önerilen başlangıç kurulumu

| Kademe | Bunu yapın | Bekleyin |
|------|---------|--------|
| Minimum | Çalışan RADV yığını ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → TTM düzeltmesi → `ollama run gpt-oss:20b` | ~30+ tok/s, kararlı sohbet |
| Daha iyi | Oberon governor + flash-attn + `q4_0` KV-önbellek ekleyin; ön uç Jan AI üzerinden | +10–20 tok/s, daha uzun bağlam, araçlar/MCP |
| Daha büyük model | TTM `pages_limit` yükseltilmiş IQ2/Q3'te 35B-A3B MoE; VRAM kurtarmak için başsız + Open WebUI | ~38 tok/s, bellek tavanına yakın |
| Yapmayın | `gfx1013`'te ROCm / HIP / vLLM eğitimi | çıkmaz sokak, atlayın |

---

## Kaynaklar

- BC-250 LLM tarifi (Ollama+Vulkan, TTM düzeltmesi, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- ROCm'in gfx1013'te neden başarısız olduğu (rocBLAS/Tensile çözüm kütüphanesi yok → `rocblas_abort()`; ROCm her başlatmada yeniden derler, Vulkan shader'ları önbelleğe alır) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · RDNA2 `gfx103x` ISA'sı INT8 dp4a'ya sahiptir (`v_dot4c_i32_i8`), dolayısıyla bu bir donanım değil kütüphane boşluğudur — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- MoE'de 40-CU açma, ölçülen üretim deltaları (gpt-oss-20b 66.1→87.5, Qwen3.5-35B-A3B 59.5→78.7, 11 model genelinde medyan +%32 üretim / +%50 prefill; MoE için llama.cpp ≫ Ollama) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 benchmarks](https://github.com/akandr/bc250#4-benchmarks) · açma yaması: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- Çalışan kurulum, gpt-oss-20b, Oberon artışı, OOM/dağıtım notları — https://t.me/c/2424231195/101077
- MoE'ye karşı yoğun, çok-kartlı bant genişliği — https://t.me/c/2424231195/125233
- 40-CU açma LLM ölçekleme, canlı ölçüldü (⚠ ASR — yaklaşık) — Ollama+Vulkan'da Qwen3.5-9B yoğun: 25.7 → 31.9 → 33.4 tok/s (24 → açma → 36 CU, toplam ~+%20); kart 36 CU'da sınırlandı (2 CU kusurlu, llama yüklemede çöktü) — [Old Lamer — RU CU-unlock video](https://youtu.be/M7PsojWr4KA)
- MTP'li MoE veri noktaları (⚠ doğrulanmamış, Hackaday yorumları) — Qwen "27b"+MTP ≈14.5 tk/s, "35b"+MTP ≈47 tk/s — Hackaday BC-250 makalesi yorum dizisi
- Doğrulanmış paket komutu — https://t.me/c/2424231195/101026 · Navi10→Cyan Skillfish firmware sembolik bağlantısı — https://t.me/c/2424231195/7458/136321
- llama.cpp derleme (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [releases](https://github.com/ggml-org/llama.cpp/releases) · [install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- gfx1013'te ROCm gerçeği — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (yalnızca gfx803)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (arşivlendi; gfx1013 yok)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Ön uçlar — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Modeller (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/governor — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Linux tabanı — [06-linux.md](06-linux.md) · Soğutma — [04-cooling.md](04-cooling.md)
