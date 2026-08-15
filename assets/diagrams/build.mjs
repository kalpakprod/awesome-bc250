#!/usr/bin/env node
// Строит tradeoff-диаграммы awesome-bc250 из data.json.
//   node assets/diagrams/build.mjs
// Правишь числа в data.json — пересобираешь, разметку руками не трогаешь.

import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const DIR = dirname(fileURLToPath(import.meta.url));
const W = 1200, H = 640;
const PAD = { l: 150, r: 60, t: 150, b: 170 };
const PLOT = { w: W - PAD.l - PAD.r, h: H - PAD.t - PAD.b };

// Палитра GitHub-dark. Синий и оранжевый различимы при дейтеранопии,
// в отличие от зелёного с красным — а читатель тут технический.
const C = {
  bg: "#0d1117", panel: "#161b22", grid: "#21262d", axis: "#30363d",
  fg: "#e6edf3", muted: "#8b949e", faint: "#6e7681",
  gain: "#58a6ff", cost: "#f0883e", neutral: "#d29922", band: "#1f6feb",
};
const esc = (s) => String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");

function marker(kind, x, y, color) {
  if (kind === "gain") return `<circle cx="${x}" cy="${y}" r="7" fill="${color}"/>`;
  if (kind === "cost") return `<rect x="${x - 6}" y="${y - 6}" width="12" height="12" fill="${color}"/>`;
  return `<path d="M${x} ${y - 7} L${x + 7} ${y} L${x} ${y + 7} L${x - 7} ${y} Z" fill="${color}"/>`;
}

function chart(id, d) {
  const n = d.xLabels.length;
  const xAt = (i) => PAD.l + (PLOT.w * i) / (n - 1);
  const yAt = (v) => PAD.t + PLOT.h - (PLOT.h * v) / d.yMax;
  const ticks = 4;
  const parts = [];

  parts.push(`<rect width="${W}" height="${H}" rx="18" fill="${C.bg}"/>`);
  parts.push(`<rect x="1" y="1" width="${W - 2}" height="${H - 2}" rx="17" fill="none" stroke="${C.axis}" stroke-width="2"/>`);

  parts.push(`<text x="${PAD.l}" y="66" font-size="38" font-weight="700" fill="${C.fg}">${esc(d.title)}</text>`);
  // подзаголовок в две строки по ширине
  const words = d.subtitle.split(" ");
  const lines = [[]];
  for (const w of words) {
    const cur = lines[lines.length - 1];
    if ((cur.join(" ") + " " + w).length > 82) lines.push([w]);
    else cur.push(w);
  }
  lines.slice(0, 2).forEach((ln, i) =>
    parts.push(`<text x="${PAD.l}" y="${102 + i * 30}" font-size="21" fill="${C.muted}">${esc(ln.join(" "))}</text>`));

  // зона рекомендации
  if (d.band) {
    const x1 = xAt(d.band.from), x2 = xAt(d.band.to);
    parts.push(`<rect x="${x1}" y="${PAD.t}" width="${x2 - x1}" height="${PLOT.h}" fill="${C.band}" opacity="0.14"/>`);
    // подпись зоны живёт внутри графика, иначе сталкивается с подзаголовком,
    // и уходит в ту половину, где кривые не проходят
    const bx = Math.min(Math.max((x1 + x2) / 2, PAD.l + 130), PAD.l + PLOT.w - 130);
    const near = d.series.flatMap((s) => s.values.slice(d.band.from, d.band.to + 1));
    const high = Math.max(...near) > d.yMax * 0.6;
    const by = high ? PAD.t + PLOT.h - 22 : PAD.t + 34;
    parts.push(`<text x="${bx}" y="${by}" text-anchor="middle" font-size="20" font-weight="600" fill="${C.gain}">${esc(d.band.label)}</text>`);
  }

  // сетка
  for (let i = 0; i <= ticks; i++) {
    const v = (d.yMax * i) / ticks, y = yAt(v);
    parts.push(`<line x1="${PAD.l}" y1="${y}" x2="${PAD.l + PLOT.w}" y2="${y}" stroke="${C.grid}" stroke-width="2"/>`);
    parts.push(`<text x="${PAD.l - 20}" y="${y + 8}" text-anchor="end" font-size="20" fill="${C.muted}">${Math.round(v)}</text>`);
  }
  parts.push(`<text transform="translate(46 ${PAD.t + PLOT.h / 2}) rotate(-90)" text-anchor="middle" font-size="20" fill="${C.faint}">${esc(d.axisY)}</text>`);

  // линии и точки
  for (const s of d.series) {
    const pts = s.values.map((v, i) => `${xAt(i)},${yAt(v)}`).join(" ");
    const col = C[s.role] ?? C.neutral;
    const dash = s.role === "neutral" ? ` stroke-dasharray="10 8"` : "";
    parts.push(`<polyline points="${pts}" fill="none" stroke="${col}" stroke-width="4.5" stroke-linejoin="round" stroke-linecap="round"${dash}/>`);
    s.values.forEach((v, i) => parts.push(marker(s.role, xAt(i), yAt(v), col)));
  }

  // ось X
  const yBase = PAD.t + PLOT.h;
  parts.push(`<line x1="${PAD.l}" y1="${yBase}" x2="${PAD.l + PLOT.w}" y2="${yBase}" stroke="${C.axis}" stroke-width="3"/>`);
  // крайние подписи прижимаем к краям, иначе они вылезают за холст
  d.xLabels.forEach((l, i) => {
    const anchor = i === 0 ? "start" : i === n - 1 ? "end" : "middle";
    parts.push(`<text x="${xAt(i)}" y="${yBase + 36}" text-anchor="${anchor}" font-size="21" fill="${C.fg}">${esc(l)}</text>`);
  });
  parts.push(`<text x="${PAD.l + PLOT.w / 2}" y="${yBase + 68}" text-anchor="middle" font-size="20" fill="${C.faint}">${esc(d.axisX)}</text>`);

  // легенда
  let lx = PAD.l;
  const ly = H - 62;
  for (const s of d.series) {
    const col = C[s.role] ?? C.neutral;
    parts.push(marker(s.role, lx + 8, ly - 6, col));
    parts.push(`<text x="${lx + 26}" y="${ly}" font-size="21" fill="${C.fg}">${esc(s.name)}</text>`);
    lx += 34 + s.name.length * 11;
  }

  // предупреждение
  if (d.note) {
    parts.push(`<text x="${PAD.l}" y="${H - 24}" font-size="19" fill="${C.cost}">${esc(d.note)}</text>`);
  }

  return `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}" role="img" aria-labelledby="t-${id} d-${id}" font-family="-apple-system, BlinkMacSystemFont, Segoe UI, sans-serif">
<title id="t-${id}">${esc(d.title)}</title>
<desc id="d-${id}">${esc(d.subtitle)} ${d.series.map((s) => `${s.name}: ${s.values.join(", ")}`).join(". ")}. ${esc(d.note ?? "")}</desc>
${parts.join("\n")}
</svg>
`;
}

const data = JSON.parse(readFileSync(join(DIR, "data.json"), "utf8"));
for (const [id, d] of Object.entries(data)) {
  writeFileSync(join(DIR, `${id}.svg`), chart(id, d));
  console.log(`${id}.svg`);
}
