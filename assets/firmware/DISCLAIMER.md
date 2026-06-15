# Firmware / Driver Mirror — Disclaimer & Provenance

BIOS images, VBIOS dumps, and vendor drivers are mirrored **via this repo's GitHub Releases** (kept out of the git tree) **for preservation and community recovery** — un-bricking a BC-250, reproducing a known-good config. Keeping them out of the source tree means a takedown of any single artifact does not affect the handbook.

## Rights

- All mirrored firmware/drivers remain the property of their respective owners (AMD, Sony, board vendors, and the individual mod authors).
- No license is granted or implied. These are provided **as-is, for interoperability and archival** with hardware the user already owns.
- Community-made *modded* BIOS images are mirrored **with the mod author's handle** and a link to the original post; if you are the author and want yours removed or re-credited, open an issue.

## Provenance

Each mirrored file has an entry in [`PROVENANCE.md`](../PROVENANCE.md) (see the "GitHub Releases" section): original filename, source message/repo, author handle, date, and SHA-256.

## Takedown

If you hold rights to a mirrored artifact and want it removed, open an issue titled `takedown: <filename>` or contact the maintainer. It will be removed promptly.

## Safety

- ⚠️ Flashing BIOS can **brick** the board. Read [docs/en/08-bios.md](../../docs/en/08-bios.md) first. Have a CH341A programmer ready for recovery — wired to the on-board **J4004 header** (the SOIC-8 clip does **not** work on this board).
- Verify SHA-256 against `PROVENANCE.md` before flashing anything from here.
