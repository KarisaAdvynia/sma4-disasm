.gba
.create "sma4-disasm.gba", 0x08000000

.relativeinclude on

.include "asm/Code.asm"
.include "asm/SharedSubroutines.asm"

.include "asm/SingleCart1.asm"
.include "asm/SingleCart2.asm"
.include "asm/Data.asm"
.include "asm/Data2.asm"
.include "asm/DataSound.asm"

.fill 0x08400000-.

.close