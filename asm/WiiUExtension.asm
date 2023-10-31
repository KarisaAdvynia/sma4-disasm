.org 0x083F0000
Sub083F0000:
push  {lr}                          ; 083F0000
ldr   r3,[@@_03007000]              ; 083F0002
ldrb  r3,[r3]                       ; 083F0004
ldr   r0,[@@_03002A69]              ; 083F0006
ldrb  r0,[r0]                       ; 083F0008
cmp   r0,0x3                        ; 083F000A
beq   @@Code083F0014                ; 083F000C
cmp   r0,0x6                        ; 083F000E
beq   @@Code083F0014                ; 083F0010
b     @@Code083F0034                ; 083F0012
@@Code083F0014:
mov   r0,0x14                       ; 083F0014
mov   r1,0x0                        ; 083F0016
lsl   r0,r0,0x8                     ; 083F0018  1400
add   r0,r0,r1                      ; 083F001A
cmp   r3,0xEF                       ; 083F001C
bne   @@Code083F0030                ; 083F001E
ldr   r3,[@@_030046CF]              ; 083F0020
ldrb  r3,[r3]                       ; 083F0022
cmp   r3,0x1                        ; 083F0024
beq   @@Code083F0030                ; 083F0026
mov   r0,0x10                       ; 083F0028
mov   r1,0xCD                       ; 083F002A
lsl   r0,r0,0x8                     ; 083F002C  CD00
add   r0,r0,r1                      ; 083F002E
@@Code083F0030:
ldr   r1,[@@_05000000]              ; 083F0030
strh  r0,[r1]                       ; 083F0032
@@Code083F0034:
ldr   r3,[@@_03007000]              ; 083F0034
strh  r2,[r3]                       ; 083F0036
ldr   r0,[@@_03002240]              ; 083F0038 \ replaced instructions at 08071492
ldr   r3,[@@_151C]                  ; 083F003A /
pop   {r1}                          ; 083F003C
bx    r1                            ; 083F003E

; this pool isn't arranged in the usual order
@@_03002240: .d32 0x03002240        ; 083F0040
@@_151C:     .d32 0x0000151C        ; 083F0044
@@_05000000: .d32 0x05000000        ; 083F0048
@@_03007000: .d32 0x03007000        ; 083F004C
@@_030046CF: .d32 0x030046CF        ; 083F0050
@@_03002A69: .d32 0x03002A69        ; 083F0054
nop                                 ; 083F0058
nop                                 ; 083F005A
nop                                 ; 083F005C
nop                                 ; 083F005E

.org 0x08400000
.incbin "data/eLevels/S01_Classic_World_1-1.bin"
.incbin "data/eLevels/S02_Classic_World_1-2.bin"
.incbin "data/eLevels/S03_Classic_World_1-3.bin"
.incbin "data/eLevels/S04_Classic_World_1-4.bin"
.incbin "data/eLevels/S05_Classic_World_2-2.bin"
.incbin "data/eLevels/M01_Wild_Ride_in_the_Sky.bin"
.incbin "data/eLevels/M02_Slidin'_the_Slopes.bin"
.incbin "data/eLevels/M03_Vegetable_Volley.bin"
.incbin "data/eLevels/M04_Doors_o'_Plenty.bin"
.incbin "data/eLevels/M05_Bombarded_by_Bob-ombs.bin"
.incbin "data/eLevels/M06_Magical_Note_Blocks.bin"
.incbin "data/eLevels/M07_The_ol'_Switcheroo.bin"
.incbin "data/eLevels/M08_Piped_Full_of_Plants.bin"
.incbin "data/eLevels/M09_Swinging_Bars_of_Doom.bin"
.incbin "data/eLevels/M10_Para_Beetle_Challenge.bin"
.incbin "data/eLevels/M11_A_Musical_Trek.bin"
.incbin "data/eLevels/M12_Armored_Airship.bin"
.incbin "data/eLevels/M13_Ice_Dungeon.bin"
.incbin "data/eLevels/M14_A_Sky-High_Adventure.bin"
.incbin "data/eLevels/M15_Sea_to_Sky.bin"
.incbin "data/eLevels/M16_It's_a_Shoe-In.bin"
.incbin "data/eLevels/M17_Slip_Slidin'_Away.bin"
.incbin "data/eLevels/M18_Ice_Cubed.bin"
.incbin "data/eLevels/M19_Puzzling_Pipe_Maze.bin"
.incbin "data/eLevels/M20_A_Towering_Tour.bin"
.incbin "data/eLevels/M21_Castle_Dash.bin"
.incbin "data/eLevels/M22_Rich_with_Ropes.bin"
.incbin "data/eLevels/M23_Vexing_Doors.bin"
.incbin "data/eLevels/M24_Caped_Escape.bin"
.incbin "data/eLevels/M25_Ground_Work.bin"
.incbin "data/eLevels/M26_An_Aqueous_Adventure.bin"
.incbin "data/eLevels/M27_Bowser's_Last_Stand.bin"
.incbin "data/eLevels/M28_Koopaling_Confusion.bin"
.incbin "data/eLevels/M29_Bowser's_Airship_1.bin"
.incbin "data/eLevels/M30_Bowser's_Airship_2.bin"
.incbin "data/eLevels/PR1_Airship's_Revenge.bin"
.incbin "data/eLevels/PR2_No_Time_to_Dawdle!.bin"
.incbin "data/eLevels/PR3_Treacherous_Halls.bin"

.org 0x08424000
Data08424000:
.incbin "data/Data08424000.bin"
Data08424600:                       ; 08424600
.d8 0x20, 0x20, 0x20, 0x20, 0x20, 0x80, 0x80, 0xA0
.d8 0xA0, 0xA0, 0x60, 0xA0, 0x60, 0x80, 0xA0, 0xA0
.d8 0x80, 0x80, 0xA0, 0xA0, 0x60, 0xA0, 0x80, 0x40
.d8 0xA0, 0xA0, 0x60, 0xA0, 0xA0, 0x80, 0x80, 0xA0
.d8 0xA0, 0x60, 0x60, 0xA0, 0xA0, 0xA0

.org 0x08424648
Data08424648:                       ; 08424648
.d8 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
.d8 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
.d8 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
.d8 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20
.d8 0x21, 0x22, 0x23, 0x24, 0x25, 0x26

.org 0x08424690
Data08424690:
.d8 0xFF, 0xFF, 0xFF, 0xFF, 0x3F

.org 0x084246B0
Data084246B0:
.d8 0x09, 0x0C, 0x12, 0x1D, 0x21, 0x1B, 0x08, 0x18

.org 0x084246D0
ELevelSelectParams:
.d16 0x0841, 0x0842, 0x0843, 0x0844, 0x0845, 0x1401, 0x1502, 0x1083
.d16 0x1244, 0x1605, 0x1546, 0x1107, 0x1588, 0x1109, 0x140A, 0x144B
.d16 0x128C, 0x154D, 0x144E, 0x14CF, 0x1110, 0x1551, 0x1112, 0x1093
.d16 0x1194, 0x1115, 0x1496, 0x1257, 0x1418, 0x1099, 0x14DA, 0x161B
.d16 0x165C, 0x129D, 0x129E, 0xFA81, 0xFC42, 0xF903

.org 0x08424770
Data08424770:                       ; 08424770
.d16 0x0000, 0x0000, 0x0001, 0x0001, 0x0002, 0x0002, 0x0003, 0x0003
.d16 0x0004, 0x0004, 0x0005, 0x0005, 0x0006, 0x0006, 0x0007, 0x0007
.d16 0x0008, 0x0008, 0x0009, 0x0009, 0x000A, 0x000A, 0x000B, 0x000B
.d16 0x000C, 0x000C, 0x000D, 0x000D, 0x000E, 0x000E, 0x000F, 0x000F
.d16 0x0010, 0x0010, 0x0011, 0x0011, 0x0012, 0x0012

.org 0x08424900
Sub08424900:
push  {lr}                          ; 08424900
ldr   r3,=0x02015A30                ; 08424902
bl    Sub08424924                   ; 08424904
pop   {r0}                          ; 08424908
bx    r0                            ; 0842490A

Sub0842490C:
push  {lr}                          ; 0842490C
ldr   r3,=0x02016068                ; 0842490E
bl    Sub08424924                   ; 08424910
pop   {r0}                          ; 08424914
bx    r0                            ; 08424916

Sub08424918:
push  {lr}                          ; 08424918
ldr   r3,=0x020160B0                ; 0842491A
bl    Sub08424924                   ; 0842491C
pop   {r0}                          ; 08424920
bx    r0                            ; 08424922

Sub08424924:
push  {r4-r6,lr}                    ; 08424924
b     @@Code08424936                ; 08424926
@@Loop08424928:
ldrb  r4,[r1]                       ; 08424928
ldrb  r5,[r3]                       ; 0842492A
orr   r5,r4                         ; 0842492C
strb  r5,[r0]                       ; 0842492E
add   r0,0x1                        ; 08424930
add   r1,0x1                        ; 08424932
add   r3,0x1                        ; 08424934
@@Code08424936:
mov   r6,r2                         ; 08424936
sub   r2,0x1                        ; 08424938
cmp   r6,0x0                        ; 0842493A
bne   @@Loop08424928                ; 0842493C
pop   {r4-r6}                       ; 0842493E
pop   {r0}                          ; 08424940
bx    r0                            ; 08424942

nop                                 ; 08424944
nop                                 ; 08424946
nop                                 ; 08424948
nop                                 ; 0842494A
nop                                 ; 0842494C
nop                                 ; 0842494E
.pool                               ; 08424950
nop                                 ; 0842495C
nop                                 ; 0842495E

.org 0x08424A00
Sub08424A00:
push  {r4,lr}                       ; 08424A00
mov   r4,0x84                       ; 08424A02
lsl   r4,r4,0x14                    ; 08424A04
lsl   r0,r0,0xC                     ; 08424A06
add   r0,r0,r4                      ; 08424A08
add   r0,r0,r1                      ; 08424A0A
lsr   r0,r0,0x2                     ; 08424A0C
lsl   r0,r0,0x2                     ; 08424A0E
lsr   r2,r2,0x2                     ; 08424A10
lsl   r2,r2,0x2                     ; 08424A12
mov   r1,r2                         ; 08424A14
lsr   r3,r3,0x5                     ; 08424A16
lsl   r3,r3,0x3                     ; 08424A18
mov   r2,r3                         ; 08424A1A
bl    swi_MemoryCopy32              ; 08424A1C
pop   {r4}                          ; 08424A20
pop   {r0}                          ; 08424A22
bx    r0                            ; 08424A24

.org 0x08425000
.d8 "S4RE"                          ; 08425000
.d8 0xF4,0xE6                       ; 08425004
.fill 0x3A                          ; 08425006
Data08425040:                       ; 08425040
.incbin "data/Graphics/eCoins.bin"

.org 0x08426B40
Data08426B40:                       ; 08426B40
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F, 0x0000, 0x0000, 0x0000
.d16 0x7FF7, 0x008D, 0x7FFF, 0x5FFF, 0x17DF, 0x137D, 0x0EDA, 0x0A57
.d16 0x05D5, 0x0553, 0x1219, 0x1EFF, 0x277F
