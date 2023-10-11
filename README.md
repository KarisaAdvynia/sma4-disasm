# Super Mario Advance 4: Super Mario Bros. 3 (U rev 1) disassembly

For assembling with [Armips](https://github.com/Kingcom/armips).

Produces an exact match for the entire ROM. All ROM pointers have been replaced by labels, to allow freely adding/removing code, though this hasn't yet been thoroughly tested.

Remaining regions:
- 080E9978-0811DBF0: Currently labeled as "single-cart pseudo-ROM", a ROM region copied into RAM (for all players) when playing Mario Bros. multiplayer from a single cartridge. This needs further research to determine the correct RAM pointers for labels, particularly for the single-cart data sectors (080ED4A4-080F261C, 0811521C-0811CEF0).

## About data files
This repository does not include in-game data files (graphics, sound, etc), which must be extracted from the vanilla game before assembling. A script is provided to do so:
- Place the vanilla ROM in the directory containing the `sma4-disasm` directory
    - Optionally: name the vanilla ROM `sma4.gba`. If the vanilla ROM is the only .gba file in the directory, it will be auto-detected, but if there are multiple .gba files, this is required.
- Run `exportbin.py` (in `scripts`) to create the `data` folder.

## Virtual Console differences
This assembles the GBA version by default. Use `armips sma4-disasm.asm -definelabel wiiu 1` to assemble the Wii U VC version, which includes all 38 e-levels and code to load them. This will only work if the level/graphics data were extracted from the VC version originally; `exportbin.py` accounts for this.

## Vanilla ROM hashes
GBA:
- SHA1: `532F3307021637474B6DD37DA059CA360F612337`
- SHA256: `53EC98FC672D94E3962BA854805CE5005E07E10A4C7ED4E7DBEC7A2CA7846562`
- MD5: `605286B3AEDEFFBA70BF46B834B120B1`

VC:
- SHA1: `DD2879329EC52BD5372F26B75297A67F1A81215A`
- SHA256: `C8DB146071462572B3BE6D2CAEFE453C584547515F9A2E3E75264CDF9243442E`
- MD5: `E7A2792C5913A8420A419F2D01358487`

## See also
- [Super Mario Bros. 3 (SMA4) (U rev 1) documentation](https://docs.google.com/spreadsheets/d/11yqKUdmwM5VvnmiFArOUQOQbXO-p_nrHTId2JwMaEKQ/) - Documentation spreadsheet, including ROM/RAM maps, various IDs, and other info
