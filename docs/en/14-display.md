# Display & Output

> **TL;DR** — The BC-250 drives your monitor over **DisplayPort**. That's the connector to plug into. If your board also has an HDMI port, it **frequently shows nothing** — so a black screen there is *not* a dead board, you're just on the wrong output. Need HDMI? Use an **active DP→HDMI adapter** — the community has tested it and **both video and audio pass through fine, no lag** ([src](https://t.me/c/2424231195/9148)). One real quirk: **DisplayPort audio comes out distorted/slowed on Linux**; the same DP→HDMI adapter sidesteps it, and a proper kernel-side fix lands around **kernel 6.17** ([src](https://t.me/c/2424231195/17953), [src](https://t.me/c/2424231195/68051)).

"No picture on first boot" is the **#1 newcomer panic**. Read the box below before you decide anything is broken.

---

## No picture? Do this

1. **Plug into DisplayPort, not HDMI.** The BC-250's working video output is DisplayPort ([src](https://t.me/c/2424231195/104784)). The HDMI port (where present) is the one that's usually blank — don't judge the board by it.
2. **Reseat the card and try again.** Boards routinely don't initialize on the first try — power-cycle (full off/on), and physically reseat. One owner: *"when mine arrived it didn't power up on the first try either … sometimes it doesn't fully initialize on a button reboot — off/on fixes it"* ([src](https://t.me/c/2424231195/15701)).
3. **Suspect the cable/adapter before the board.** With a single card, a bad cable or adapter is the prime suspect ([src](https://t.me/c/2424231195/15699)). Some adapters work in firmware but go black once the OS loads — *"image was fine before GRUB, black screen in the system"* ([src](https://t.me/c/2424231195/38184)).
4. **Reset the BIOS / reflash a known-good image** if several cards in a batch give no image — that points at firmware, not your monitor ([src](https://t.me/c/2424231195/15697), [src](https://t.me/c/2424231195/15705)).

If you cross all four off and still have nothing, head to [troubleshooting.md](troubleshooting.md).

---

## Outputs at a glance

| Output | Works? | Notes |
|--------|--------|-------|
| **DisplayPort** | **Yes — this is the output** | Primary/only display connector; carries audio. Repo I/O spec lists `1x DisplayPort` ([repo](https://github.com/mothenjoyer69/bc250-documentation)). |
| **HDMI port** (if fitted) | **Often blank** | Newcomers think the board is dead; it usually isn't — switch to DP. ([src](https://t.me/c/2424231195/104784)) |
| **DP → HDMI via active adapter** | **Yes — video + audio** | Community-tested, no lag ([src](https://t.me/c/2424231195/9148)). Also the standard fix for DP audio distortion (below). |
| **Second video output** | **Not out of the box** | Electrically present but **not populated**; forcing a 2nd monitor needs hacks, and others say the chip has no real 2nd head — treat single-output as the safe assumption. ([src](https://t.me/c/2424231195/92978), [src](https://t.me/c/2424231195/104682)) |
| **Second screen over the network** | **Yes** | Stream the BC-250's output to another machine over LAN (Steam/Sunshine). ([src](https://t.me/c/2424231195/23660)) |

---

## DisplayPort audio is distorted — the adapter fix

On Linux, audio sent **directly out of DisplayPort** comes out wrong on the BC-250 — described as distorted, *"stretched, like it's slowed to half speed,"* with crackle ([src](https://t.me/c/2424231195/9895)). This is a **Linux/DP-protocol issue, not a board defect** — it has been seen on non-BC-250 hardware too ([src](https://t.me/c/2424231195/15983)).

The blunt, reliable workaround the chat settled on: **run the signal through a DP→HDMI adapter.** Converted to HDMI, the audio artifacts disappear ([src](https://t.me/c/2424231195/17953), [src](https://t.me/c/2424231195/51763)). A user verified it directly: *"I tested audio out through a DisplayPort→HDMI adapter. All fine, no lag"* ([src](https://t.me/c/2424231195/9148)).

**If you have no adapter handy,** route audio over **Bluetooth** instead — most speakers/headsets support it and it dodges the DP path entirely ([src](https://t.me/c/2424231195/89769)). See [10-wifi-bt.md](10-wifi-bt.md) for the BT dongle.

### Adapter notes (community)
- **Get an *active* DP→HDMI adapter/cable.** A working, tested example: **UGREEN DP125 (DP→HDMI 4K cable)** — rated 4K@30 but negotiated 4K@60 on a TV ([src](https://t.me/c/2424231195/52398)).
- **Not all adapters carry audio.** One owner's Belsis adapter passed 4K@60 *with* sound, while several pricier Ugreen units showed "HDMI digital audio" in the device list but output no sound — and one shifted voices down an octave ([src](https://t.me/c/2424231195/106617)). If you get video but no audio, the adapter is the variable — try another.
- Cheap **4K@60 DP→HDMI** adapters that pass both video and audio do exist and are reported working ([src](https://t.me/c/2424231195/133977)).
- Some adapters misbehave specifically on **4K monitors** ([src](https://t.me/c/2424231195/1988)).

### The kernel-6.17 fix (DP-direct audio, no adapter)

If you want clean audio **straight over DisplayPort** without an adapter, the cause and fix were tracked down in the chat. Fedora's stock kernel config built `snd-hda-codec-hdmi.ko` + `snd-hdmi-lpe-audio.ko`; **kernel 6.17 changed the HDMI audio path** and broke sound on that default config. The fix is to also build the **ATI HDMI codec** — flip the kernel config from `# CONFIG_SND_HDA_CODEC_HDMI_ATI is not set` to `CONFIG_SND_HDA_CODEC_HDMI_ATI=m`, which packages `snd-hda-codec-atihdmi.ko`; sound then works **without patches** ([src](https://t.me/c/2424231195/68051), [src](https://t.me/c/2424231195/68061)).

```text
# Fedora kernel config change for DP/HDMI audio on kernel 6.17+
# from:
# CONFIG_SND_HDA_CODEC_HDMI_ATI is not set
# to:
CONFIG_SND_HDA_CODEC_HDMI_ATI=m
```

With that third codec (`snd-hda-codec-atihdmi.ko`) present, ALSA exposes the board's audio outputs (e.g. `pcm=3` and `pcm=7` as two HDMI devices) ([src](https://t.me/c/2424231195/68062), [src](https://t.me/c/2424231195/67569)). ⚠ verify — this requires building a custom kernel; treat the DP→HDMI adapter as the no-build path for most users. See [06-linux.md](06-linux.md) for kernel/driver setup.

---

## The second output (initially inactive)

There is a **second video output on the board that is not active out of the box.** The community read is split and worth knowing both halves:

- It's **electrically present but not populated/soldered**, and *"with hacks you can make a 2nd monitor work"* ([src](https://t.me/c/2424231195/92978)).
- Others report the chip simply **has no usable second head** — *"the problem is in the chip, the second output physically isn't there"* ([src](https://t.me/c/2424231195/104682)).

Practically: **assume one DisplayPort output.** A DP **MST splitter for two independent screens has been asked about but not confirmed working** on the BC-250 ([src](https://t.me/c/2424231195/92109)). ⚠ verify — no community success story for native dual-monitor as of this writing.

---

## Second screen over the network (the easy "2nd display")

If you actually want the BC-250 picture on a second device, the proven route isn't a second cable — it's **streaming over LAN.** One user: *"I launched a Steam game on the BC-250 (Fedora) and streamed it over the network to my work laptop, controlled it from the laptop. Everything worked"* ([src](https://t.me/c/2424231195/23660)).

- **Sunshine** (host encoder) works here because it isn't NVIDIA-only — it does the encoding, the client just decodes ([src](https://t.me/c/2424231195/25091)). Over gigabit LAN it's reported near-flawless ([src](https://t.me/c/2424231195/25563)).
- **Moonlight as the host** does *not* fit — it expects an NVIDIA encoder and stutters/complains about a missing hardware decoder ([src](https://t.me/c/2424231195/25050)). Use Sunshine as host, Moonlight only as the client.

This is also the practical way to get a "dual display" feel without the unpopulated second output above.

---

## Sources

- DP→HDMI adapter passes video+audio, no lag — https://t.me/c/2424231195/9148
- DP audio distortion is a Linux issue; adapter fixes it — https://t.me/c/2424231195/17953 · https://t.me/c/2424231195/9895 · https://t.me/c/2424231195/51763 · https://t.me/c/2424231195/15983
- Kernel 6.17 audio fix (`CONFIG_SND_HDA_CODEC_HDMI_ATI=m`) — https://t.me/c/2424231195/68051 · https://t.me/c/2424231195/68061 · https://t.me/c/2424231195/68062 · https://t.me/c/2424231195/67569
- Working adapters — UGREEN DP125 https://t.me/c/2424231195/52398 · Belsis vs others (audio varies) https://t.me/c/2424231195/106617 · cheap 4K@60 https://t.me/c/2424231195/133977
- DP is the working output; spend on a good DP→HDMI adapter — https://t.me/c/2424231195/104784
- First-boot no-image / reseat / reflash — https://t.me/c/2424231195/15697 · https://t.me/c/2424231195/15699 · https://t.me/c/2424231195/15701 · https://t.me/c/2424231195/38184
- Second output present but not populated / debated — https://t.me/c/2424231195/92978 · https://t.me/c/2424231195/104682 · MST asked https://t.me/c/2424231195/92109
- Network second screen (Sunshine/Steam over LAN) — https://t.me/c/2424231195/23660 · https://t.me/c/2424231195/25091 · https://t.me/c/2424231195/25050 · https://t.me/c/2424231195/25563
- Bluetooth audio as alternative — https://t.me/c/2424231195/89769
- Hardware I/O reference (`1x DisplayPort`) — [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) · [`hardware.md`](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md)

> Driver/kernel setup is in [06-linux.md](06-linux.md); audio/output gotchas are also indexed in [troubleshooting.md](troubleshooting.md) and [faq.md](faq.md).
