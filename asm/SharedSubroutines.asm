swi_arctan2:
swi   0xA                           ; 080E758C
bx    lr                            ; 080E758E

swi_MemoryCopy32:
swi   0xC                           ; 080E7590  Memory copy/fill, 32-byte blocks
bx    lr                            ; 080E7592

swi_MemoryCopy4or2:
swi   0xB                           ; 080E7594  Memory copy/fill, 4- or 2-byte blocks
bx    lr                            ; 080E7596

swi_Divide:
swi   0x6                           ; 080E7598
bx    lr                            ; 080E759A

swi_Remainder:
swi   0x6                           ; 080E759C
mov   r0,r1                         ; 080E759E
bx    lr                            ; 080E75A0
.pool                               ; 080E75A2

swi_Huffman:
swi   0x13                          ; 080E75A4  Huffman decompress
bx    lr                            ; 080E75A6

swi_LZ77_VRAM:
swi   0x12                          ; 080E75A8  LZ77 decompress (VRAM)
bx    lr                            ; 080E75AA

swi_LZ77_WRAM:
swi   0x11                          ; 080E75AC  LZ77 decompress (WRAM)
bx    lr                            ; 080E75AE

swi_25_1:
mov   r1,0x1                        ; 080E75B0
swi   0x25                          ; 080E75B2
bx    lr                            ; 080E75B4
.pool                               ; 080E75B6

swi_0F:
swi   0xF                           ; 080E75B8
bx    lr                            ; 080E75BA

swi_01:
swi   0x1                           ; 080E75BC
bx    lr                            ; 080E75BE

SoftResetSinglePlayer:
ldr   r3,=0x04000208                ; 080E75C0
mov   r2,0x0                        ; 080E75C2
strb  r2,[r3]                       ; 080E75C4
ldr   r1,=0x03007F00                ; 080E75C6
mov   sp,r1                         ; 080E75C8
swi   0x1                           ; 080E75CA
swi   0x0                           ; 080E75CC
.pool                               ; 080E75CE

swi_SoundBias_0:
mov   r0,0x0                        ; 080E75D8
swi   0x19                          ; 080E75DA
bx    lr                            ; 080E75DC
.pool                               ; 080E75DE

swi_SoundBias_1:
mov   r0,0x1                        ; 080E75E0
swi   0x19                          ; 080E75E2
bx    lr                            ; 080E75E4
.pool                               ; 080E75E6

SoftResetMultiplayer:
ldr   r3,=0x04000208                ; 080E75E8
mov   r2,0x0                        ; 080E75EA
strb  r2,[r3]                       ; 080E75EC
ldr   r3,=0x03007FFA                ; 080E75EE
mov   r2,0x0                        ; 080E75F0
strb  r2,[r3]                       ; 080E75F2
sub   r3,0xFA                       ; 080E75F4
mov   sp,r3                         ; 080E75F6
swi   0x1                           ; 080E75F8
swi   0x0                           ; 080E75FA
.pool                               ; 080E75FC

Sub080E7604:
lsl   r0,r0,0x18                    ; 080E7604
lsr   r0,r0,0x18                    ; 080E7606
ldr   r3,=0x0E005555                ; 080E7608
mov   r1,0xAA                       ; 080E760A
strb  r1,[r3]                       ; 080E760C
ldr   r2,=0x0E002AAA                ; 080E760E
mov   r1,0x55                       ; 080E7610
strb  r1,[r2]                       ; 080E7612
mov   r1,0xB0                       ; 080E7614
strb  r1,[r3]                       ; 080E7616
mov   r1,0xE0                       ; 080E7618
lsl   r1,r1,0x14                    ; 080E761A
strb  r0,[r1]                       ; 080E761C
bx    lr                            ; 080E761E
.pool                               ; 080E7620

Sub080E7628:
push  {r4-r5,lr}                    ; 080E7628
add   sp,-0x44                      ; 080E762A
mov   r0,sp                         ; 080E762C
bl    Sub080E7818                   ; 080E762E
mov   r5,sp                         ; 080E7632
add   r5,0x1                        ; 080E7634
ldr   r2,=0x0E005555                ; 080E7636
mov   r0,0xAA                       ; 080E7638
strb  r0,[r2]                       ; 080E763A
ldr   r1,=0x0E002AAA                ; 080E763C
mov   r0,0x55                       ; 080E763E
strb  r0,[r1]                       ; 080E7640
mov   r0,0x90                       ; 080E7642
strb  r0,[r2]                       ; 080E7644
add   r1,sp,0x40                    ; 080E7646
ldr   r2,=0x4E20                    ; 080E7648
mov   r0,r2                         ; 080E764A
b     @@Code080E7660                ; 080E764C
.pool                               ; 080E764E

@@Code080E765C:
ldrh  r0,[r1]                       ; 080E765C
sub   r0,0x1                        ; 080E765E
@@Code080E7660:
strh  r0,[r1]                       ; 080E7660
ldrh  r0,[r1]                       ; 080E7662
cmp   r0,0x0                        ; 080E7664
bne   @@Code080E765C                ; 080E7666
ldr   r0,=0x0E000001                ; 080E7668
bl    Sub_bx_r5                     ; 080E766A
lsl   r0,r0,0x18                    ; 080E766E
lsr   r4,r0,0x10                    ; 080E7670
mov   r0,0xE0                       ; 080E7672
lsl   r0,r0,0x14                    ; 080E7674
bl    Sub_bx_r5                     ; 080E7676
lsl   r0,r0,0x18                    ; 080E767A
lsr   r0,r0,0x18                    ; 080E767C
orr   r4,r0                         ; 080E767E
ldr   r1,=0x0E005555                ; 080E7680
mov   r0,0xAA                       ; 080E7682
strb  r0,[r1]                       ; 080E7684
ldr   r2,=0x0E002AAA                ; 080E7686
mov   r0,0x55                       ; 080E7688
strb  r0,[r2]                       ; 080E768A
mov   r0,0xF0                       ; 080E768C
strb  r0,[r1]                       ; 080E768E
strb  r0,[r1]                       ; 080E7690
add   r1,sp,0x40                    ; 080E7692
ldr   r2,=0x4E20                    ; 080E7694
mov   r0,r2                         ; 080E7696
b     @@Code080E76B0                ; 080E7698
.pool                               ; 080E769A

@@Code080E76AC:
ldrh  r0,[r1]                       ; 080E76AC
sub   r0,0x1                        ; 080E76AE
@@Code080E76B0:
strh  r0,[r1]                       ; 080E76B0
ldrh  r0,[r1]                       ; 080E76B2
cmp   r0,0x0                        ; 080E76B4
bne   @@Code080E76AC                ; 080E76B6
mov   r0,r4                         ; 080E76B8
add   sp,0x44                       ; 080E76BA
pop   {r4-r5}                       ; 080E76BC
pop   {r1}                          ; 080E76BE
bx    r1                            ; 080E76C0
.pool                               ; 080E76C2

Sub080E76C4:
push  {lr}                          ; 080E76C4
ldr   r1,=0x03002202                ; 080E76C6
ldrh  r0,[r1]                       ; 080E76C8
cmp   r0,0x0                        ; 080E76CA
beq   @@Code080E76E0                ; 080E76CC
ldrh  r0,[r1]                       ; 080E76CE
sub   r0,0x1                        ; 080E76D0
strh  r0,[r1]                       ; 080E76D2
lsl   r0,r0,0x10                    ; 080E76D4
cmp   r0,0x0                        ; 080E76D6
bne   @@Code080E76E0                ; 080E76D8
ldr   r1,=0x030079DC                ; 080E76DA
mov   r0,0x1                        ; 080E76DC
strb  r0,[r1]                       ; 080E76DE
@@Code080E76E0:
pop   {r0}                          ; 080E76E0
bx    r0                            ; 080E76E2
.pool                               ; 080E76E4

Sub080E76EC:
push  {lr}                          ; 080E76EC
mov   r2,r1                         ; 080E76EE
lsl   r0,r0,0x18                    ; 080E76F0
lsr   r1,r0,0x18                    ; 080E76F2
cmp   r1,0x3                        ; 080E76F4
bhi   @@Code080E7720                ; 080E76F6
ldr   r0,=0x03002200                ; 080E76F8
strb  r1,[r0]                       ; 080E76FA
ldr   r1,=0x03002204                ; 080E76FC
ldrb  r0,[r0]                       ; 080E76FE
lsl   r0,r0,0x2                     ; 080E7700
ldr   r3,=0x04000100                ; 080E7702
add   r0,r0,r3                      ; 080E7704
str   r0,[r1]                       ; 080E7706
ldr   r0,=Sub080E76C4+1             ; 080E7708
str   r0,[r2]                       ; 080E770A
mov   r0,0x0                        ; 080E770C
b     @@Code080E7722                ; 080E770E
.pool                               ; 080E7710

@@Code080E7720:
mov   r0,0x1                        ; 080E7720
@@Code080E7722:
pop   {r1}                          ; 080E7722
bx    r1                            ; 080E7724
.pool                               ; 080E7726

Sub080E7728:
push  {r4-r6,lr}                    ; 080E7728
mov   r6,r10                        ; 080E772A
mov   r5,r9                         ; 080E772C
mov   r4,r8                         ; 080E772E
push  {r4-r6}                       ; 080E7730
lsl   r0,r0,0x18                    ; 080E7732
lsr   r0,r0,0x18                    ; 080E7734
ldr   r1,=0x030079FC                ; 080E7736
lsl   r2,r0,0x1                     ; 080E7738
add   r2,r2,r0                      ; 080E773A
lsl   r2,r2,0x1                     ; 080E773C
ldr   r0,[r1]                       ; 080E773E
add   r2,r2,r0                      ; 080E7740
ldr   r1,=0x03002208                ; 080E7742
ldr   r0,=0x04000208                ; 080E7744
mov   r9,r0                         ; 080E7746
ldrh  r0,[r0]                       ; 080E7748
strh  r0,[r1]                       ; 080E774A
mov   r3,0x0                        ; 080E774C
mov   r1,r9                         ; 080E774E
strh  r3,[r1]                       ; 080E7750
ldr   r0,=0x03002204                ; 080E7752
mov   r8,r0                         ; 080E7754
ldr   r4,[r0]                       ; 080E7756
strh  r3,[r4,0x2]                   ; 080E7758
ldr   r6,=0x04000200                ; 080E775A
ldr   r1,=0x03002200                ; 080E775C
mov   r10,r1                        ; 080E775E
ldrb  r1,[r1]                       ; 080E7760
mov   r5,0x8                        ; 080E7762
mov   r0,r5                         ; 080E7764
lsl   r0,r1                         ; 080E7766
mov   r1,r0                         ; 080E7768
ldrh  r0,[r6]                       ; 080E776A
orr   r0,r1                         ; 080E776C
strh  r0,[r6]                       ; 080E776E
ldr   r0,=0x030079DC                ; 080E7770
strb  r3,[r0]                       ; 080E7772
ldr   r1,=0x03002202                ; 080E7774
ldrh  r0,[r2]                       ; 080E7776
strh  r0,[r1]                       ; 080E7778
add   r2,0x2                        ; 080E777A
ldrh  r0,[r2]                       ; 080E777C
strh  r0,[r4]                       ; 080E777E
add   r0,r4,0x2                     ; 080E7780
mov   r1,r8                         ; 080E7782
str   r0,[r1]                       ; 080E7784
ldrh  r0,[r2,0x2]                   ; 080E7786
strh  r0,[r4,0x2]                   ; 080E7788
str   r4,[r1]                       ; 080E778A
ldr   r1,=0x04000202                ; 080E778C
mov   r2,r10                        ; 080E778E
ldrb  r0,[r2]                       ; 080E7790
lsl   r5,r0                         ; 080E7792
strh  r5,[r1]                       ; 080E7794
mov   r0,0x1                        ; 080E7796
mov   r3,r9                         ; 080E7798
strh  r0,[r3]                       ; 080E779A
pop   {r3-r5}                       ; 080E779C
mov   r8,r3                         ; 080E779E
mov   r9,r4                         ; 080E77A0
mov   r10,r5                        ; 080E77A2
pop   {r4-r6}                       ; 080E77A4
pop   {r0}                          ; 080E77A6
bx    r0                            ; 080E77A8
.pool                               ; 080E77AA

Sub080E77D0:
ldr   r3,=0x04000208                ; 080E77D0
mov   r1,0x0                        ; 080E77D2
strh  r1,[r3]                       ; 080E77D4
ldr   r2,=0x03002204                ; 080E77D6
ldr   r0,[r2]                       ; 080E77D8
strh  r1,[r0]                       ; 080E77DA
add   r0,0x2                        ; 080E77DC
str   r0,[r2]                       ; 080E77DE
strh  r1,[r0]                       ; 080E77E0
sub   r0,0x2                        ; 080E77E2
str   r0,[r2]                       ; 080E77E4
ldr   r2,=0x04000200                ; 080E77E6
ldr   r0,=0x03002200                ; 080E77E8
ldrb  r0,[r0]                       ; 080E77EA
mov   r1,0x8                        ; 080E77EC
lsl   r1,r0                         ; 080E77EE
ldrh  r0,[r2]                       ; 080E77F0
bic   r0,r1                         ; 080E77F2
strh  r0,[r2]                       ; 080E77F4
ldr   r0,=0x03002208                ; 080E77F6
ldrh  r0,[r0]                       ; 080E77F8
strh  r0,[r3]                       ; 080E77FA
bx    lr                            ; 080E77FC
.pool                               ; 080E77FE

Sub080E7814:
ldrb  r0,[r0]                       ; 080E7814
bx    lr                            ; 080E7816

Sub080E7818:
push  {lr}                          ; 080E7818
mov   r2,r0                         ; 080E781A
ldr   r1,=0x030079E0                ; 080E781C
add   r0,r2,0x1                     ; 080E781E
str   r0,[r1]                       ; 080E7820
ldr   r3,=Sub080E7814+1             ; 080E7822
mov   r0,0x1                        ; 080E7824
bic   r3,r0                         ; 080E7826
ldr   r0,=Sub080E7818+1             ; 080E7828
ldr   r1,=Sub080E7814+1             ; 080E782A
sub   r0,r0,r1                      ; 080E782C
lsl   r0,r0,0xF                     ; 080E782E
b     @@Code080E784C                ; 080E7830
.pool                               ; 080E7832

@@Code080E7840:
ldrh  r0,[r3]                       ; 080E7840
strh  r0,[r2]                       ; 080E7842
add   r3,0x2                        ; 080E7844
add   r2,0x2                        ; 080E7846
sub   r0,r1,0x1                     ; 080E7848
lsl   r0,r0,0x10                    ; 080E784A
@@Code080E784C:
lsr   r1,r0,0x10                    ; 080E784C
cmp   r1,0x0                        ; 080E784E
bne   @@Code080E7840                ; 080E7850
pop   {r0}                          ; 080E7852
bx    r0                            ; 080E7854
.pool                               ; 080E7856

Sub080E7858:
push  {r4,lr}                       ; 080E7858
mov   r4,r0                         ; 080E785A
sub   r3,r2,0x1                     ; 080E785C
cmp   r2,0x0                        ; 080E785E
beq   @@Code080E7874                ; 080E7860
mov   r2,0x1                        ; 080E7862
neg   r2,r2                         ; 080E7864
@@Code080E7866:
ldrb  r0,[r4]                       ; 080E7866
strb  r0,[r1]                       ; 080E7868
add   r4,0x1                        ; 080E786A
add   r1,0x1                        ; 080E786C
sub   r3,0x1                        ; 080E786E
cmp   r3,r2                         ; 080E7870
bne   @@Code080E7866                ; 080E7872
@@Code080E7874:
pop   {r4}                          ; 080E7874
pop   {r0}                          ; 080E7876
bx    r0                            ; 080E7878
.pool                               ; 080E787A

Sub080E787C:
push  {r4-r7,lr}                    ; 080E787C
add   sp,-0x80                      ; 080E787E
mov   r5,r1                         ; 080E7880
mov   r6,r2                         ; 080E7882
mov   r7,r3                         ; 080E7884
lsl   r3,r0,0x10                    ; 080E7886
lsr   r4,r3,0x10                    ; 080E7888
ldr   r2,=0x04000204                ; 080E788A
ldrh  r0,[r2]                       ; 080E788C
ldr   r1,=0xFFFC                    ; 080E788E
and   r0,r1                         ; 080E7890
mov   r1,0x3                        ; 080E7892
orr   r0,r1                         ; 080E7894
strh  r0,[r2]                       ; 080E7896
ldr   r0,=0x030079EC                ; 080E7898
ldr   r0,[r0]                       ; 080E789A
ldr   r1,[r0]                       ; 080E789C
mov   r0,0x80                       ; 080E789E
lsl   r0,r0,0xA                     ; 080E78A0
cmp   r1,r0                         ; 080E78A2
bne   @@Code080E78B4                ; 080E78A4
lsr   r0,r3,0x14                    ; 080E78A6
lsl   r0,r0,0x18                    ; 080E78A8
lsr   r0,r0,0x18                    ; 080E78AA
bl    Sub080E7604                   ; 080E78AC
mov   r0,0xF                        ; 080E78B0
and   r4,r0                         ; 080E78B2
@@Code080E78B4:
ldr   r3,=Sub080E7858+1             ; 080E78B4
mov   r0,0x1                        ; 080E78B6
bic   r3,r0                         ; 080E78B8
mov   r2,sp                         ; 080E78BA
ldr   r0,=Sub080E787C+1             ; 080E78BC
ldr   r1,=Sub080E7858+1             ; 080E78BE
sub   r0,r0,r1                      ; 080E78C0
lsl   r0,r0,0xF                     ; 080E78C2
b     @@Code080E78E8                ; 080E78C4
.pool                               ; 080E78C6

@@Code080E78DC:
ldrh  r0,[r3]                       ; 080E78DC
strh  r0,[r2]                       ; 080E78DE
add   r3,0x2                        ; 080E78E0
add   r2,0x2                        ; 080E78E2
sub   r0,r1,0x1                     ; 080E78E4
lsl   r0,r0,0x10                    ; 080E78E6
@@Code080E78E8:
lsr   r1,r0,0x10                    ; 080E78E8
cmp   r1,0x0                        ; 080E78EA
bne   @@Code080E78DC                ; 080E78EC
mov   r3,sp                         ; 080E78EE
add   r3,0x1                        ; 080E78F0
ldr   r0,=0x030079EC                ; 080E78F2
ldr   r0,[r0]                       ; 080E78F4
ldrb  r0,[r0,0x8]                   ; 080E78F6
lsl   r4,r0                         ; 080E78F8
mov   r0,r4                         ; 080E78FA
mov   r2,0xE0                       ; 080E78FC
lsl   r2,r2,0x14                    ; 080E78FE
add   r1,r5,r2                      ; 080E7900
add   r0,r0,r1                      ; 080E7902
mov   r1,r6                         ; 080E7904
mov   r2,r7                         ; 080E7906
bl    Sub_bx_r3                     ; 080E7908
add   sp,0x80                       ; 080E790C
pop   {r4-r7}                       ; 080E790E
pop   {r0}                          ; 080E7910
bx    r0                            ; 080E7912
.pool                               ; 080E7914

Sub080E7918:
push  {r4-r5,lr}                    ; 080E7918
mov   r5,r0                         ; 080E791A
mov   r3,r1                         ; 080E791C
sub   r4,r2,0x1                     ; 080E791E
cmp   r2,0x0                        ; 080E7920
beq   @@Code080E793E                ; 080E7922
mov   r2,0x1                        ; 080E7924
neg   r2,r2                         ; 080E7926
@@Code080E7928:
ldrb  r1,[r3]                       ; 080E7928
ldrb  r0,[r5]                       ; 080E792A
add   r5,0x1                        ; 080E792C
add   r3,0x1                        ; 080E792E
cmp   r1,r0                         ; 080E7930
beq   @@Code080E7938                ; 080E7932
sub   r0,r3,0x1                     ; 080E7934
b     @@Code080E7940                ; 080E7936
@@Code080E7938:
sub   r4,0x1                        ; 080E7938
cmp   r4,r2                         ; 080E793A
bne   @@Code080E7928                ; 080E793C
@@Code080E793E:
mov   r0,0x0                        ; 080E793E
@@Code080E7940:
pop   {r4-r5}                       ; 080E7940
pop   {r1}                          ; 080E7942
bx    r1                            ; 080E7944
.pool                               ; 080E7946

Sub080E7948:
push  {r4-r5,lr}                    ; 080E7948
add   sp,-0x100                     ; 080E794A
mov   r5,r1                         ; 080E794C
lsl   r3,r0,0x10                    ; 080E794E
lsr   r4,r3,0x10                    ; 080E7950
ldr   r2,=0x04000204                ; 080E7952
ldrh  r0,[r2]                       ; 080E7954
ldr   r1,=0xFFFC                    ; 080E7956
and   r0,r1                         ; 080E7958
mov   r1,0x3                        ; 080E795A
orr   r0,r1                         ; 080E795C
strh  r0,[r2]                       ; 080E795E
ldr   r0,=0x030079EC                ; 080E7960
ldr   r0,[r0]                       ; 080E7962
ldr   r1,[r0]                       ; 080E7964
mov   r0,0x80                       ; 080E7966
lsl   r0,r0,0xA                     ; 080E7968
cmp   r1,r0                         ; 080E796A
bne   @@Code080E797C                ; 080E796C
lsr   r0,r3,0x14                    ; 080E796E
lsl   r0,r0,0x18                    ; 080E7970
lsr   r0,r0,0x18                    ; 080E7972
bl    Sub080E7604                   ; 080E7974
mov   r0,0xF                        ; 080E7978
and   r4,r0                         ; 080E797A
@@Code080E797C:
ldr   r3,=Sub080E7918+1             ; 080E797C
mov   r0,0x1                        ; 080E797E
bic   r3,r0                         ; 080E7980
mov   r2,sp                         ; 080E7982
ldr   r0,=Sub080E7948+1             ; 080E7984
ldr   r1,=Sub080E7918+1             ; 080E7986
sub   r0,r0,r1                      ; 080E7988
lsl   r0,r0,0xF                     ; 080E798A
b     @@Code080E79B0                ; 080E798C
.pool                               ; 080E798E

@@Code080E79A4:
ldrh  r0,[r3]                       ; 080E79A4
strh  r0,[r2]                       ; 080E79A6
add   r3,0x2                        ; 080E79A8
add   r2,0x2                        ; 080E79AA
sub   r0,r1,0x1                     ; 080E79AC
lsl   r0,r0,0x10                    ; 080E79AE
@@Code080E79B0:
lsr   r1,r0,0x10                    ; 080E79B0
cmp   r1,0x0                        ; 080E79B2
bne   @@Code080E79A4                ; 080E79B4
mov   r3,sp                         ; 080E79B6
add   r3,0x1                        ; 080E79B8
ldr   r0,=0x030079EC                ; 080E79BA
ldr   r0,[r0]                       ; 080E79BC
ldrb  r1,[r0,0x8]                   ; 080E79BE
lsl   r4,r1                         ; 080E79C0
mov   r1,r4                         ; 080E79C2
mov   r2,0xE0                       ; 080E79C4
lsl   r2,r2,0x14                    ; 080E79C6
add   r1,r1,r2                      ; 080E79C8
ldrh  r2,[r0,0x4]                   ; 080E79CA
mov   r0,r5                         ; 080E79CC
bl    Sub_bx_r3                     ; 080E79CE
add   sp,0x0100                     ; 080E79D2
pop   {r4-r5}                       ; 080E79D4
pop   {r1}                          ; 080E79D6
bx    r1                            ; 080E79D8
.pool                               ; 080E79DA

Sub080E79E0:
push  {r4-r6,lr}                    ; 080E79E0
add   sp,-0x100                     ; 080E79E2
mov   r5,r1                         ; 080E79E4
mov   r6,r2                         ; 080E79E6
lsl   r2,r0,0x10                    ; 080E79E8
lsr   r4,r2,0x10                    ; 080E79EA
ldr   r0,=0x030079EC                ; 080E79EC
ldr   r0,[r0]                       ; 080E79EE
ldr   r1,[r0]                       ; 080E79F0
mov   r0,0x80                       ; 080E79F2
lsl   r0,r0,0xA                     ; 080E79F4
cmp   r1,r0                         ; 080E79F6
bne   @@Code080E7A08                ; 080E79F8
lsr   r0,r2,0x14                    ; 080E79FA
lsl   r0,r0,0x18                    ; 080E79FC
lsr   r0,r0,0x18                    ; 080E79FE
bl    Sub080E7604                   ; 080E7A00
mov   r0,0xF                        ; 080E7A04
and   r4,r0                         ; 080E7A06
@@Code080E7A08:
ldr   r2,=0x04000204                ; 080E7A08
ldrh  r0,[r2]                       ; 080E7A0A
ldr   r1,=0xFFFC                    ; 080E7A0C
and   r0,r1                         ; 080E7A0E
mov   r1,0x3                        ; 080E7A10
orr   r0,r1                         ; 080E7A12
strh  r0,[r2]                       ; 080E7A14
ldr   r3,=Sub080E7918+1             ; 080E7A16
mov   r0,0x1                        ; 080E7A18
bic   r3,r0                         ; 080E7A1A
mov   r2,sp                         ; 080E7A1C
ldr   r0,=Sub080E7948+1             ; 080E7A1E
ldr   r1,=Sub080E7918+1             ; 080E7A20
sub   r0,r0,r1                      ; 080E7A22
lsl   r0,r0,0xF                     ; 080E7A24
b     @@Code080E7A48                ; 080E7A26
.pool                               ; 080E7A28

@@Code080E7A3C:
ldrh  r0,[r3]                       ; 080E7A3C
strh  r0,[r2]                       ; 080E7A3E
add   r3,0x2                        ; 080E7A40
add   r2,0x2                        ; 080E7A42
sub   r0,r1,0x1                     ; 080E7A44
lsl   r0,r0,0x10                    ; 080E7A46
@@Code080E7A48:
lsr   r1,r0,0x10                    ; 080E7A48
cmp   r1,0x0                        ; 080E7A4A
bne   @@Code080E7A3C                ; 080E7A4C
mov   r3,sp                         ; 080E7A4E
add   r3,0x1                        ; 080E7A50
ldr   r0,=0x030079EC                ; 080E7A52
ldr   r0,[r0]                       ; 080E7A54
ldrb  r1,[r0,0x8]                   ; 080E7A56
lsl   r4,r1                         ; 080E7A58
mov   r1,r4                         ; 080E7A5A
mov   r0,0xE0                       ; 080E7A5C
lsl   r0,r0,0x14                    ; 080E7A5E
add   r1,r1,r0                      ; 080E7A60
mov   r0,r5                         ; 080E7A62
mov   r2,r6                         ; 080E7A64
bl    Sub_bx_r3                     ; 080E7A66
add   sp,0x0100                     ; 080E7A6A
pop   {r4-r6}                       ; 080E7A6C
pop   {r1}                          ; 080E7A6E
bx    r1                            ; 080E7A70
.pool                               ; 080E7A72

push  {r4-r6,lr}                    ; 080E7A78
mov   r5,r1                         ; 080E7A7A
lsl   r0,r0,0x10                    ; 080E7A7C
lsr   r4,r0,0x10                    ; 080E7A7E
mov   r6,0x0                        ; 080E7A80
b     @@Code080E7A8A                ; 080E7A82
@@Code080E7A84:
add   r0,r6,0x1                     ; 080E7A84
lsl   r0,r0,0x18                    ; 080E7A86
lsr   r6,r0,0x18                    ; 080E7A88
@@Code080E7A8A:
cmp   r6,0x2                        ; 080E7A8A
bhi   @@Code080E7AB0                ; 080E7A8C
ldr   r0,=0x030079E8                ; 080E7A8E
ldr   r2,[r0]                       ; 080E7A90
mov   r0,r4                         ; 080E7A92
mov   r1,r5                         ; 080E7A94
bl    Sub_bx_r2                     ; 080E7A96
lsl   r0,r0,0x10                    ; 080E7A9A
lsr   r2,r0,0x10                    ; 080E7A9C
cmp   r2,0x0                        ; 080E7A9E
bne   @@Code080E7A84                ; 080E7AA0
mov   r0,r4                         ; 080E7AA2
mov   r1,r5                         ; 080E7AA4
bl    Sub080E7948                   ; 080E7AA6
mov   r2,r0                         ; 080E7AAA
cmp   r2,0x0                        ; 080E7AAC
bne   @@Code080E7A84                ; 080E7AAE
@@Code080E7AB0:
mov   r0,r2                         ; 080E7AB0
pop   {r4-r6}                       ; 080E7AB2
pop   {r1}                          ; 080E7AB4
bx    r1                            ; 080E7AB6
.pool                               ; 080E7AB8

Sub080E7ABC:
push  {r4-r7,lr}                    ; 080E7ABC
mov   r5,r1                         ; 080E7ABE
mov   r7,r2                         ; 080E7AC0
lsl   r0,r0,0x10                    ; 080E7AC2
lsr   r4,r0,0x10                    ; 080E7AC4
mov   r6,0x0                        ; 080E7AC6
b     @@Code080E7AD0                ; 080E7AC8
@@Code080E7ACA:
add   r0,r6,0x1                     ; 080E7ACA
lsl   r0,r0,0x18                    ; 080E7ACC
lsr   r6,r0,0x18                    ; 080E7ACE
@@Code080E7AD0:
cmp   r6,0x2                        ; 080E7AD0
bhi   @@Code080E7AF8                ; 080E7AD2
ldr   r0,=0x030079E8                ; 080E7AD4
ldr   r2,[r0]                       ; 080E7AD6
mov   r0,r4                         ; 080E7AD8
mov   r1,r5                         ; 080E7ADA
bl    Sub_bx_r2                     ; 080E7ADC
lsl   r0,r0,0x10                    ; 080E7AE0
lsr   r3,r0,0x10                    ; 080E7AE2
cmp   r3,0x0                        ; 080E7AE4
bne   @@Code080E7ACA                ; 080E7AE6
mov   r0,r4                         ; 080E7AE8
mov   r1,r5                         ; 080E7AEA
mov   r2,r7                         ; 080E7AEC
bl    Sub080E79E0                   ; 080E7AEE
mov   r3,r0                         ; 080E7AF2
cmp   r3,0x0                        ; 080E7AF4
bne   @@Code080E7ACA                ; 080E7AF6
@@Code080E7AF8:
mov   r0,r3                         ; 080E7AF8
pop   {r4-r7}                       ; 080E7AFA
pop   {r1}                          ; 080E7AFC
bx    r1                            ; 080E7AFE
.pool                               ; 080E7B00

Sub080E7B04:
push  {r4,lr}                       ; 080E7B04
ldr   r2,=0x04000204                ; 080E7B06
ldrh  r0,[r2]                       ; 080E7B08
ldr   r1,=0xFFFC                    ; 080E7B0A
and   r0,r1                         ; 080E7B0C
mov   r1,0x3                        ; 080E7B0E
orr   r0,r1                         ; 080E7B10
strh  r0,[r2]                       ; 080E7B12
bl    Sub080E7628                   ; 080E7B14
lsl   r0,r0,0x10                    ; 080E7B18
lsr   r3,r0,0x10                    ; 080E7B1A
ldr   r2,=DataPtrs0826464C          ; 080E7B1C
mov   r4,0x1                        ; 080E7B1E
b     @@Code080E7B32                ; 080E7B20
.pool                               ; 080E7B22

@@Code080E7B30:
add   r2,0x4                        ; 080E7B30
@@Code080E7B32:
ldr   r1,[r2]                       ; 080E7B32
mov   r0,r1                         ; 080E7B34
add   r0,0x28                       ; 080E7B36
ldrb  r0,[r0]                       ; 080E7B38
cmp   r0,0x0                        ; 080E7B3A
beq   @@Code080E7B46                ; 080E7B3C
ldrh  r0,[r1,0x28]                  ; 080E7B3E
cmp   r3,r0                         ; 080E7B40
bne   @@Code080E7B30                ; 080E7B42
mov   r4,0x0                        ; 080E7B44
@@Code080E7B46:
ldr   r1,=0x030079E8                ; 080E7B46
ldr   r0,[r2]                       ; 080E7B48
ldr   r0,[r0]                       ; 080E7B4A
str   r0,[r1]                       ; 080E7B4C
ldr   r1,=0x030079F4                ; 080E7B4E
ldr   r0,[r2]                       ; 080E7B50
ldr   r0,[r0,0x4]                   ; 080E7B52
str   r0,[r1]                       ; 080E7B54
ldr   r1,=0x030079F8                ; 080E7B56
ldr   r0,[r2]                       ; 080E7B58
ldr   r0,[r0,0x8]                   ; 080E7B5A
str   r0,[r1]                       ; 080E7B5C
ldr   r1,=0x030079E4                ; 080E7B5E
ldr   r0,[r2]                       ; 080E7B60
ldr   r0,[r0,0xC]                   ; 080E7B62
str   r0,[r1]                       ; 080E7B64
ldr   r1,=0x030079FC                ; 080E7B66
ldr   r0,[r2]                       ; 080E7B68
ldr   r0,[r0,0x10]                  ; 080E7B6A
str   r0,[r1]                       ; 080E7B6C
ldr   r1,=0x030079EC                ; 080E7B6E
ldr   r0,[r2]                       ; 080E7B70
add   r0,0x14                       ; 080E7B72
str   r0,[r1]                       ; 080E7B74
mov   r0,r4                         ; 080E7B76
pop   {r4}                          ; 080E7B78
pop   {r1}                          ; 080E7B7A
bx    r1                            ; 080E7B7C
.pool                               ; 080E7B7E

Sub080E7B98:
push  {r4-r7,lr}                    ; 080E7B98
mov   r7,r9                         ; 080E7B9A
mov   r6,r8                         ; 080E7B9C
push  {r6-r7}                       ; 080E7B9E
mov   r4,r1                         ; 080E7BA0
lsl   r0,r0,0x18                    ; 080E7BA2
lsr   r7,r0,0x18                    ; 080E7BA4
lsl   r2,r2,0x18                    ; 080E7BA6
lsr   r5,r2,0x18                    ; 080E7BA8
mov   r0,0x0                        ; 080E7BAA
mov   r8,r0                         ; 080E7BAC
mov   r0,r7                         ; 080E7BAE
bl    Sub080E7728                   ; 080E7BB0
ldr   r6,=0x030079E0                ; 080E7BB4
ldr   r1,=0x0E005555                ; 080E7BB6
mov   r9,r1                         ; 080E7BB8
b     @@Code080E7BFC                ; 080E7BBA
.pool                               ; 080E7BBC

@@Code080E7BC4:
mov   r0,0xF0                       ; 080E7BC4
mov   r1,r9                         ; 080E7BC6
strb  r0,[r1]                       ; 080E7BC8
mov   r0,0xA0                       ; 080E7BCA
lsl   r0,r0,0x8                     ; 080E7BCC
b     @@Code080E7BF2                ; 080E7BCE
@@Code080E7BD0:
ldr   r0,=0x030079DC                ; 080E7BD0
ldrb  r0,[r0]                       ; 080E7BD2
cmp   r0,0x0                        ; 080E7BD4
beq   @@Code080E7BFC                ; 080E7BD6
ldr   r1,[r6]                       ; 080E7BD8
mov   r0,r4                         ; 080E7BDA
bl    Sub_bx_r1                     ; 080E7BDC
lsl   r0,r0,0x18                    ; 080E7BE0
lsr   r0,r0,0x18                    ; 080E7BE2
cmp   r0,r5                         ; 080E7BE4
beq   @@Code080E7C24                ; 080E7BE6
mov   r0,0xF0                       ; 080E7BE8
mov   r1,r9                         ; 080E7BEA
strb  r0,[r1]                       ; 080E7BEC
mov   r0,0xC0                       ; 080E7BEE
lsl   r0,r0,0x8                     ; 080E7BF0
@@Code080E7BF2:
orr   r7,r0                         ; 080E7BF2
mov   r8,r7                         ; 080E7BF4
b     @@Code080E7C24                ; 080E7BF6
.pool                               ; 080E7BF8

@@Code080E7BFC:
ldr   r1,[r6]                       ; 080E7BFC
mov   r0,r4                         ; 080E7BFE
bl    Sub_bx_r1                     ; 080E7C00
lsl   r0,r0,0x18                    ; 080E7C04
lsr   r1,r0,0x18                    ; 080E7C06
cmp   r1,r5                         ; 080E7C08
beq   @@Code080E7C24                ; 080E7C0A
mov   r0,0x20                       ; 080E7C0C
and   r0,r1                         ; 080E7C0E
cmp   r0,0x0                        ; 080E7C10
beq   @@Code080E7BD0                ; 080E7C12
ldr   r1,[r6]                       ; 080E7C14
mov   r0,r4                         ; 080E7C16
bl    Sub_bx_r1                     ; 080E7C18
lsl   r0,r0,0x18                    ; 080E7C1C
lsr   r0,r0,0x18                    ; 080E7C1E
cmp   r0,r5                         ; 080E7C20
bne   @@Code080E7BC4                ; 080E7C22
@@Code080E7C24:
bl    Sub080E77D0                   ; 080E7C24
mov   r0,r8                         ; 080E7C28
pop   {r3-r4}                       ; 080E7C2A
mov   r8,r3                         ; 080E7C2C
mov   r9,r4                         ; 080E7C2E
pop   {r4-r7}                       ; 080E7C30
pop   {r1}                          ; 080E7C32
bx    r1                            ; 080E7C34
.pool                               ; 080E7C36

Sub080E7C38:
push  {r4-r6,lr}                    ; 080E7C38
add   sp,-0x40                      ; 080E7C3A
ldr   r5,=0x04000204                ; 080E7C3C
ldrh  r1,[r5]                       ; 080E7C3E
ldr   r6,=0xFFFC                    ; 080E7C40
and   r1,r6                         ; 080E7C42
ldr   r0,=0x030079EC                ; 080E7C44
ldr   r0,[r0]                       ; 080E7C46
ldrh  r0,[r0,0x10]                  ; 080E7C48
orr   r1,r0                         ; 080E7C4A
strh  r1,[r5]                       ; 080E7C4C
ldr   r1,=0x0E005555                ; 080E7C4E
mov   r4,0xAA                       ; 080E7C50
strb  r4,[r1]                       ; 080E7C52
ldr   r3,=0x0E002AAA                ; 080E7C54
mov   r2,0x55                       ; 080E7C56
strb  r2,[r3]                       ; 080E7C58
mov   r0,0x80                       ; 080E7C5A
strb  r0,[r1]                       ; 080E7C5C
strb  r4,[r1]                       ; 080E7C5E
strb  r2,[r3]                       ; 080E7C60
mov   r0,0x10                       ; 080E7C62
strb  r0,[r1]                       ; 080E7C64
mov   r0,sp                         ; 080E7C66
bl    Sub080E7818                   ; 080E7C68
ldr   r0,=0x030079E4                ; 080E7C6C
mov   r1,0xE0                       ; 080E7C6E
lsl   r1,r1,0x14                    ; 080E7C70
ldr   r3,[r0]                       ; 080E7C72
mov   r0,0x3                        ; 080E7C74
mov   r2,0xFF                       ; 080E7C76
bl    Sub_bx_r3                     ; 080E7C78
lsl   r0,r0,0x10                    ; 080E7C7C
lsr   r0,r0,0x10                    ; 080E7C7E
ldrh  r1,[r5]                       ; 080E7C80
and   r1,r6                         ; 080E7C82
mov   r2,0x3                        ; 080E7C84
orr   r1,r2                         ; 080E7C86
strh  r1,[r5]                       ; 080E7C88
add   sp,0x40                       ; 080E7C8A
pop   {r4-r6}                       ; 080E7C8C
pop   {r1}                          ; 080E7C8E
bx    r1                            ; 080E7C90
.pool                               ; 080E7C92

Sub080E7CAC:
push  {r4-r7,lr}                    ; 080E7CAC
add   sp,-0x40                      ; 080E7CAE
lsl   r0,r0,0x10                    ; 080E7CB0
lsr   r6,r0,0x10                    ; 080E7CB2
ldr   r0,=0x030079EC                ; 080E7CB4
ldr   r0,[r0]                       ; 080E7CB6
ldrh  r0,[r0,0xA]                   ; 080E7CB8
cmp   r6,r0                         ; 080E7CBA
blo   @@Code080E7CCC                ; 080E7CBC
ldr   r0,=0x80FF                    ; 080E7CBE
b     @@Code080E7D68                ; 080E7CC0
.pool                               ; 080E7CC2

@@Code080E7CCC:
lsr   r0,r6,0x4                     ; 080E7CCC
lsl   r0,r0,0x18                    ; 080E7CCE
lsr   r0,r0,0x18                    ; 080E7CD0
bl    Sub080E7604                   ; 080E7CD2
mov   r0,0xF                        ; 080E7CD6
and   r6,r0                         ; 080E7CD8
mov   r7,0x0                        ; 080E7CDA
@@Code080E7CDC:
ldr   r3,=0x04000204                ; 080E7CDC
ldrh  r1,[r3]                       ; 080E7CDE
ldr   r0,=0xFFFC                    ; 080E7CE0
and   r1,r0                         ; 080E7CE2
ldr   r0,=0x030079EC                ; 080E7CE4
ldr   r2,[r0]                       ; 080E7CE6
ldrh  r0,[r2,0x10]                  ; 080E7CE8
orr   r1,r0                         ; 080E7CEA
strh  r1,[r3]                       ; 080E7CEC
ldrb  r4,[r2,0x8]                   ; 080E7CEE
mov   r0,r6                         ; 080E7CF0
lsl   r0,r4                         ; 080E7CF2
mov   r4,r0                         ; 080E7CF4
mov   r0,0xE0                       ; 080E7CF6
lsl   r0,r0,0x14                    ; 080E7CF8
add   r4,r4,r0                      ; 080E7CFA
ldr   r1,=0x0E005555                ; 080E7CFC
mov   r5,0xAA                       ; 080E7CFE
strb  r5,[r1]                       ; 080E7D00
ldr   r3,=0x0E002AAA                ; 080E7D02
mov   r2,0x55                       ; 080E7D04
strb  r2,[r3]                       ; 080E7D06
mov   r0,0x80                       ; 080E7D08
strb  r0,[r1]                       ; 080E7D0A
strb  r5,[r1]                       ; 080E7D0C
strb  r2,[r3]                       ; 080E7D0E
mov   r0,0x30                       ; 080E7D10
strb  r0,[r4]                       ; 080E7D12
mov   r0,sp                         ; 080E7D14
bl    Sub080E7818                   ; 080E7D16
ldr   r0,=0x030079E4                ; 080E7D1A
ldr   r3,[r0]                       ; 080E7D1C
mov   r0,0x2                        ; 080E7D1E
mov   r1,r4                         ; 080E7D20
mov   r2,0xFF                       ; 080E7D22
bl    Sub_bx_r3                     ; 080E7D24
lsl   r0,r0,0x10                    ; 080E7D28
lsr   r3,r0,0x10                    ; 080E7D2A
mov   r0,0xA0                       ; 080E7D2C
lsl   r0,r0,0x8                     ; 080E7D2E
and   r0,r3                         ; 080E7D30
cmp   r0,0x0                        ; 080E7D32
beq   @@Code080E7D58                ; 080E7D34
cmp   r7,0x0                        ; 080E7D36
bne   @@Code080E7D58                ; 080E7D38
mov   r7,0x1                        ; 080E7D3A
b     @@Code080E7CDC                ; 080E7D3C
.pool                               ; 080E7D3E

@@Code080E7D58:
ldr   r2,=0x04000204                ; 080E7D58
ldrh  r0,[r2]                       ; 080E7D5A
ldr   r1,=0xFFFC                    ; 080E7D5C
and   r0,r1                         ; 080E7D5E
mov   r1,0x3                        ; 080E7D60
orr   r0,r1                         ; 080E7D62
strh  r0,[r2]                       ; 080E7D64
mov   r0,r3                         ; 080E7D66
@@Code080E7D68:
add   sp,0x40                       ; 080E7D68
pop   {r4-r7}                       ; 080E7D6A
pop   {r1}                          ; 080E7D6C
bx    r1                            ; 080E7D6E
.pool                               ; 080E7D70

Sub080E7D78:
push  {r4,lr}                       ; 080E7D78
ldr   r4,=0x0E005555                ; 080E7D7A
mov   r2,0xAA                       ; 080E7D7C
strb  r2,[r4]                       ; 080E7D7E
ldr   r3,=0x0E002AAA                ; 080E7D80
mov   r2,0x55                       ; 080E7D82
strb  r2,[r3]                       ; 080E7D84
mov   r2,0xA0                       ; 080E7D86
strb  r2,[r4]                       ; 080E7D88
ldrb  r2,[r0]                       ; 080E7D8A
strb  r2,[r1]                       ; 080E7D8C
ldr   r3,=0x030079E4                ; 080E7D8E
ldrb  r2,[r0]                       ; 080E7D90
ldr   r3,[r3]                       ; 080E7D92
mov   r0,0x1                        ; 080E7D94
bl    Sub_bx_r3                     ; 080E7D96
lsl   r0,r0,0x10                    ; 080E7D9A
lsr   r0,r0,0x10                    ; 080E7D9C
pop   {r4}                          ; 080E7D9E
pop   {r1}                          ; 080E7DA0
bx    r1                            ; 080E7DA2
.pool                               ; 080E7DA4

Sub080E7DB0:
push  {r4-r7,lr}                    ; 080E7DB0
add   sp,-0x40                      ; 080E7DB2
mov   r7,r1                         ; 080E7DB4
lsl   r0,r0,0x10                    ; 080E7DB6
lsr   r4,r0,0x10                    ; 080E7DB8
ldr   r0,=0x030079EC                ; 080E7DBA
ldr   r0,[r0]                       ; 080E7DBC
ldrh  r0,[r0,0xA]                   ; 080E7DBE
cmp   r4,r0                         ; 080E7DC0
blo   @@Code080E7DD0                ; 080E7DC2
ldr   r0,=0x80FF                    ; 080E7DC4
b     @@Code080E7E4A                ; 080E7DC6
.pool                               ; 080E7DC8

@@Code080E7DD0:
mov   r0,r4                         ; 080E7DD0
bl    Sub080E7CAC                   ; 080E7DD2
lsl   r0,r0,0x10                    ; 080E7DD6
lsr   r5,r0,0x10                    ; 080E7DD8
cmp   r5,0x0                        ; 080E7DDA
bne   @@Code080E7E48                ; 080E7DDC
lsr   r0,r4,0x4                     ; 080E7DDE
lsl   r0,r0,0x18                    ; 080E7DE0
lsr   r0,r0,0x18                    ; 080E7DE2
bl    Sub080E7604                   ; 080E7DE4
mov   r0,0xF                        ; 080E7DE8
and   r4,r0                         ; 080E7DEA
mov   r0,sp                         ; 080E7DEC
bl    Sub080E7818                   ; 080E7DEE
ldr   r3,=0x04000204                ; 080E7DF2
ldrh  r1,[r3]                       ; 080E7DF4
ldr   r0,=0xFFFC                    ; 080E7DF6
and   r1,r0                         ; 080E7DF8
ldr   r0,=0x030079EC                ; 080E7DFA
ldr   r2,[r0]                       ; 080E7DFC
ldrh  r0,[r2,0x10]                  ; 080E7DFE
orr   r1,r0                         ; 080E7E00
strh  r1,[r3]                       ; 080E7E02
ldr   r1,=0x030079F0                ; 080E7E04
ldr   r0,[r2,0x4]                   ; 080E7E06
strh  r0,[r1]                       ; 080E7E08
ldrb  r0,[r2,0x8]                   ; 080E7E0A
lsl   r4,r0                         ; 080E7E0C
mov   r0,0xE0                       ; 080E7E0E
lsl   r0,r0,0x14                    ; 080E7E10
add   r4,r4,r0                      ; 080E7E12
mov   r6,r1                         ; 080E7E14
b     @@Code080E7E32                ; 080E7E16
.pool                               ; 080E7E18

@@Code080E7E28:
ldrh  r0,[r6]                       ; 080E7E28
sub   r0,0x1                        ; 080E7E2A
strh  r0,[r6]                       ; 080E7E2C
add   r7,0x1                        ; 080E7E2E
add   r4,0x1                        ; 080E7E30
@@Code080E7E32:
ldrh  r0,[r6]                       ; 080E7E32
cmp   r0,0x0                        ; 080E7E34
beq   @@Code080E7E48                ; 080E7E36
mov   r0,r7                         ; 080E7E38
mov   r1,r4                         ; 080E7E3A
bl    Sub080E7D78                   ; 080E7E3C
lsl   r0,r0,0x10                    ; 080E7E40
lsr   r5,r0,0x10                    ; 080E7E42
cmp   r5,0x0                        ; 080E7E44
beq   @@Code080E7E28                ; 080E7E46
@@Code080E7E48:
mov   r0,r5                         ; 080E7E48
@@Code080E7E4A:
add   sp,0x40                       ; 080E7E4A
pop   {r4-r7}                       ; 080E7E4C
pop   {r1}                          ; 080E7E4E
bx    r1                            ; 080E7E50
.pool                               ; 080E7E52

Sub_bx_r0:
bx    r0                            ; 080E7E54
nop                                 ; 080E7E56

Sub_bx_r1:
bx    r1                            ; 080E7E58
nop                                 ; 080E7E5A

Sub_bx_r2:
bx    r2                            ; 080E7E5C
nop                                 ; 080E7E5E

Sub_bx_r3:
bx    r3                            ; 080E7E60
nop                                 ; 080E7E62

Sub_bx_r4:
bx    r4                            ; 080E7E64
nop                                 ; 080E7E66

Sub_bx_r5:
bx    r5                            ; 080E7E68
nop                                 ; 080E7E6A

bx    r6                            ; 080E7E6C
nop                                 ; 080E7E6E

Sub_bx_r7:
bx    r7                            ; 080E7E70
nop                                 ; 080E7E72

Sub_bx_r8:
bx    r8                            ; 080E7E74
nop                                 ; 080E7E76

bx    r9                            ; 080E7E78
nop                                 ; 080E7E7A

bx    r10                           ; 080E7E7C
nop                                 ; 080E7E7E

bx    r11                           ; 080E7E80
nop                                 ; 080E7E82

bx    r12                           ; 080E7E84
nop                                 ; 080E7E86

bx    sp                            ; 080E7E88
nop                                 ; 080E7E8A

bx    lr                            ; 080E7E8C
nop                                 ; 080E7E8E

Sub080E7E90:
cmp   r1,0x0                        ; 080E7E90
beq   @@Code080E7F18                ; 080E7E92
push  {r4}                          ; 080E7E94
mov   r4,r0                         ; 080E7E96
eor   r4,r1                         ; 080E7E98
mov   r12,r4                        ; 080E7E9A
mov   r3,0x1                        ; 080E7E9C
mov   r2,0x0                        ; 080E7E9E
cmp   r1,0x0                        ; 080E7EA0
bpl   @@Code080E7EA6                ; 080E7EA2
neg   r1,r1                         ; 080E7EA4
@@Code080E7EA6:
cmp   r0,0x0                        ; 080E7EA6
bpl   @@Code080E7EAC                ; 080E7EA8
neg   r0,r0                         ; 080E7EAA
@@Code080E7EAC:
cmp   r0,r1                         ; 080E7EAC
blo   @@Code080E7F0A                ; 080E7EAE
mov   r4,0x1                        ; 080E7EB0
lsl   r4,r4,0x1C                    ; 080E7EB2
@@Code080E7EB4:
cmp   r1,r4                         ; 080E7EB4
bhs   @@Code080E7EC2                ; 080E7EB6
cmp   r1,r0                         ; 080E7EB8
bhs   @@Code080E7EC2                ; 080E7EBA
lsl   r1,r1,0x4                     ; 080E7EBC
lsl   r3,r3,0x4                     ; 080E7EBE
b     @@Code080E7EB4                ; 080E7EC0
@@Code080E7EC2:
lsl   r4,r4,0x3                     ; 080E7EC2
@@Code080E7EC4:
cmp   r1,r4                         ; 080E7EC4
bhs   @@Code080E7ED2                ; 080E7EC6
cmp   r1,r0                         ; 080E7EC8
bhs   @@Code080E7ED2                ; 080E7ECA
lsl   r1,r1,0x1                     ; 080E7ECC
lsl   r3,r3,0x1                     ; 080E7ECE
b     @@Code080E7EC4                ; 080E7ED0
@@Code080E7ED2:
cmp   r0,r1                         ; 080E7ED2
blo   @@Code080E7EDA                ; 080E7ED4
sub   r0,r0,r1                      ; 080E7ED6
orr   r2,r3                         ; 080E7ED8
@@Code080E7EDA:
lsr   r4,r1,0x1                     ; 080E7EDA
cmp   r0,r4                         ; 080E7EDC
blo   @@Code080E7EE6                ; 080E7EDE
sub   r0,r0,r4                      ; 080E7EE0
lsr   r4,r3,0x1                     ; 080E7EE2
orr   r2,r4                         ; 080E7EE4
@@Code080E7EE6:
lsr   r4,r1,0x2                     ; 080E7EE6
cmp   r0,r4                         ; 080E7EE8
blo   @@Code080E7EF2                ; 080E7EEA
sub   r0,r0,r4                      ; 080E7EEC
lsr   r4,r3,0x2                     ; 080E7EEE
orr   r2,r4                         ; 080E7EF0
@@Code080E7EF2:
lsr   r4,r1,0x3                     ; 080E7EF2
cmp   r0,r4                         ; 080E7EF4
blo   @@Code080E7EFE                ; 080E7EF6
sub   r0,r0,r4                      ; 080E7EF8
lsr   r4,r3,0x3                     ; 080E7EFA
orr   r2,r4                         ; 080E7EFC
@@Code080E7EFE:
cmp   r0,0x0                        ; 080E7EFE
beq   @@Code080E7F0A                ; 080E7F00
lsr   r3,r3,0x4                     ; 080E7F02
beq   @@Code080E7F0A                ; 080E7F04
lsr   r1,r1,0x4                     ; 080E7F06
b     @@Code080E7ED2                ; 080E7F08
@@Code080E7F0A:
mov   r0,r2                         ; 080E7F0A
mov   r4,r12                        ; 080E7F0C
cmp   r4,0x0                        ; 080E7F0E
bpl   @@Code080E7F14                ; 080E7F10
neg   r0,r0                         ; 080E7F12
@@Code080E7F14:
pop   {r4}                          ; 080E7F14
mov   pc,lr                         ; 080E7F16

@@Code080E7F18:
push  {lr}                          ; 080E7F18
bl    Return080E7F24                ; 080E7F1A
mov   r0,0x0                        ; 080E7F1E
pop   {pc}                          ; 080E7F20
.pool                               ; 080E7F22

Return080E7F24:
mov   pc,lr                         ; 080E7F24
.pool                               ; 080E7F26

Sub080E7F28:
push  {r4-r5,lr}                    ; 080E7F28
mov   r5,r1                         ; 080E7F2A
mov   r4,r0                         ; 080E7F2C
ldr   r3,[@@_0a]                    ; 080E7F2E
ldr   r2,=0x41E00000                ; 080E7F30
bl    Sub080E8CA8                   ; 080E7F32
cmp   r0,0x0                        ; 080E7F36
bge   @@Code080E7F4C                ; 080E7F38
mov   r1,r5                         ; 080E7F3A
mov   r0,r4                         ; 080E7F3C
bl    Sub080E8E08                   ; 080E7F3E
b     @@Code080E7F62                ; 080E7F42
.pool                               ; 080E7F44
@@_0a: .d32 0x0                     ; 080E7F48

@@Code080E7F4C:
ldr   r3,[@@_0b]                    ; 080E7F4C
ldr   r2,=0xC1E00000                ; 080E7F4E
mov   r1,r5                         ; 080E7F50
mov   r0,r4                         ; 080E7F52
bl    Sub080E8600                   ; 080E7F54
bl    Sub080E8E08                   ; 080E7F58
mov   r1,0x80                       ; 080E7F5C
lsl   r1,r1,0x18                    ; 080E7F5E
add   r0,r0,r1                      ; 080E7F60
@@Code080E7F62:
pop   {r4-r5,pc}                    ; 080E7F62
.pool                               ; 080E7F64
@@_0b: .d32 0x0                     ; 080E7F68

Sub080E7F6C:
mov   r3,0x1                        ; 080E7F6C
cmp   r1,0x0                        ; 080E7F6E
beq   @@Code080E8030                ; 080E7F70
bpl   @@Code080E7F76                ; 080E7F72
neg   r1,r1                         ; 080E7F74
@@Code080E7F76:
push  {r4}                          ; 080E7F76
push  {r0}                          ; 080E7F78
cmp   r0,0x0                        ; 080E7F7A
bpl   @@Code080E7F80                ; 080E7F7C
neg   r0,r0                         ; 080E7F7E
@@Code080E7F80:
cmp   r0,r1                         ; 080E7F80
blo   @@Code080E8024                ; 080E7F82
mov   r4,0x1                        ; 080E7F84
lsl   r4,r4,0x1C                    ; 080E7F86
@@Code080E7F88:
cmp   r1,r4                         ; 080E7F88
bhs   @@Code080E7F96                ; 080E7F8A
cmp   r1,r0                         ; 080E7F8C
bhs   @@Code080E7F96                ; 080E7F8E
lsl   r1,r1,0x4                     ; 080E7F90
lsl   r3,r3,0x4                     ; 080E7F92
b     @@Code080E7F88                ; 080E7F94
@@Code080E7F96:
lsl   r4,r4,0x3                     ; 080E7F96
@@Code080E7F98:
cmp   r1,r4                         ; 080E7F98
bhs   @@Code080E7FA6                ; 080E7F9A
cmp   r1,r0                         ; 080E7F9C
bhs   @@Code080E7FA6                ; 080E7F9E
lsl   r1,r1,0x1                     ; 080E7FA0
lsl   r3,r3,0x1                     ; 080E7FA2
b     @@Code080E7F98                ; 080E7FA4
@@Code080E7FA6:
mov   r2,0x0                        ; 080E7FA6
cmp   r0,r1                         ; 080E7FA8
blo   @@Code080E7FAE                ; 080E7FAA
sub   r0,r0,r1                      ; 080E7FAC
@@Code080E7FAE:
lsr   r4,r1,0x1                     ; 080E7FAE
cmp   r0,r4                         ; 080E7FB0
blo   @@Code080E7FC0                ; 080E7FB2
sub   r0,r0,r4                      ; 080E7FB4
mov   r12,r3                        ; 080E7FB6
mov   r4,0x1                        ; 080E7FB8
ror   r3,r4                         ; 080E7FBA
orr   r2,r3                         ; 080E7FBC
mov   r3,r12                        ; 080E7FBE
@@Code080E7FC0:
lsr   r4,r1,0x2                     ; 080E7FC0
cmp   r0,r4                         ; 080E7FC2
blo   @@Code080E7FD2                ; 080E7FC4
sub   r0,r0,r4                      ; 080E7FC6
mov   r12,r3                        ; 080E7FC8
mov   r4,0x2                        ; 080E7FCA
ror   r3,r4                         ; 080E7FCC
orr   r2,r3                         ; 080E7FCE
mov   r3,r12                        ; 080E7FD0
@@Code080E7FD2:
lsr   r4,r1,0x3                     ; 080E7FD2
cmp   r0,r4                         ; 080E7FD4
blo   @@Code080E7FE4                ; 080E7FD6
sub   r0,r0,r4                      ; 080E7FD8
mov   r12,r3                        ; 080E7FDA
mov   r4,0x3                        ; 080E7FDC
ror   r3,r4                         ; 080E7FDE
orr   r2,r3                         ; 080E7FE0
mov   r3,r12                        ; 080E7FE2
@@Code080E7FE4:
mov   r12,r3                        ; 080E7FE4
cmp   r0,0x0                        ; 080E7FE6
beq   @@Code080E7FF2                ; 080E7FE8
lsr   r3,r3,0x4                     ; 080E7FEA
beq   @@Code080E7FF2                ; 080E7FEC
lsr   r1,r1,0x4                     ; 080E7FEE
b     @@Code080E7FA6                ; 080E7FF0
@@Code080E7FF2:
mov   r4,0xE                        ; 080E7FF2
lsl   r4,r4,0x1C                    ; 080E7FF4
and   r2,r4                         ; 080E7FF6
beq   @@Code080E8024                ; 080E7FF8
mov   r3,r12                        ; 080E7FFA
mov   r4,0x3                        ; 080E7FFC
ror   r3,r4                         ; 080E7FFE
tst   r2,r3                         ; 080E8000
beq   @@Code080E8008                ; 080E8002
lsr   r4,r1,0x3                     ; 080E8004
add   r0,r0,r4                      ; 080E8006
@@Code080E8008:
mov   r3,r12                        ; 080E8008
mov   r4,0x2                        ; 080E800A
ror   r3,r4                         ; 080E800C
tst   r2,r3                         ; 080E800E
beq   @@Code080E8016                ; 080E8010
lsr   r4,r1,0x2                     ; 080E8012
add   r0,r0,r4                      ; 080E8014
@@Code080E8016:
mov   r3,r12                        ; 080E8016
mov   r4,0x1                        ; 080E8018
ror   r3,r4                         ; 080E801A
tst   r2,r3                         ; 080E801C
beq   @@Code080E8024                ; 080E801E
lsr   r4,r1,0x1                     ; 080E8020
add   r0,r0,r4                      ; 080E8022
@@Code080E8024:
pop   {r4}                          ; 080E8024
cmp   r4,0x0                        ; 080E8026
bpl   @@Code080E802C                ; 080E8028
neg   r0,r0                         ; 080E802A
@@Code080E802C:
pop   {r4}                          ; 080E802C
mov   pc,lr                         ; 080E802E

@@Code080E8030:
push  {lr}                          ; 080E8030
bl    Return080E7F24                ; 080E8032
mov   r0,0x0                        ; 080E8036
pop   {pc}                          ; 080E8038
.pool                               ; 080E803A

DivideUnsigned:
cmp   r1,0x0                        ; 080E803C
beq   @@Code080E80AA                ; 080E803E
mov   r3,0x1                        ; 080E8040
mov   r2,0x0                        ; 080E8042
push  {r4}                          ; 080E8044
cmp   r0,r1                         ; 080E8046
blo   @@Code080E80A4                ; 080E8048
mov   r4,0x1                        ; 080E804A
lsl   r4,r4,0x1C                    ; 080E804C
@@Code080E804E:
cmp   r1,r4                         ; 080E804E
bhs   @@Code080E805C                ; 080E8050
cmp   r1,r0                         ; 080E8052
bhs   @@Code080E805C                ; 080E8054
lsl   r1,r1,0x4                     ; 080E8056
lsl   r3,r3,0x4                     ; 080E8058
b     @@Code080E804E                ; 080E805A
@@Code080E805C:
lsl   r4,r4,0x3                     ; 080E805C
@@Code080E805E:
cmp   r1,r4                         ; 080E805E
bhs   @@Code080E806C                ; 080E8060
cmp   r1,r0                         ; 080E8062
bhs   @@Code080E806C                ; 080E8064
lsl   r1,r1,0x1                     ; 080E8066
lsl   r3,r3,0x1                     ; 080E8068
b     @@Code080E805E                ; 080E806A
@@Code080E806C:
cmp   r0,r1                         ; 080E806C
blo   @@Code080E8074                ; 080E806E
sub   r0,r0,r1                      ; 080E8070
orr   r2,r3                         ; 080E8072
@@Code080E8074:
lsr   r4,r1,0x1                     ; 080E8074
cmp   r0,r4                         ; 080E8076
blo   @@Code080E8080                ; 080E8078
sub   r0,r0,r4                      ; 080E807A
lsr   r4,r3,0x1                     ; 080E807C
orr   r2,r4                         ; 080E807E
@@Code080E8080:
lsr   r4,r1,0x2                     ; 080E8080
cmp   r0,r4                         ; 080E8082
blo   @@Code080E808C                ; 080E8084
sub   r0,r0,r4                      ; 080E8086
lsr   r4,r3,0x2                     ; 080E8088
orr   r2,r4                         ; 080E808A
@@Code080E808C:
lsr   r4,r1,0x3                     ; 080E808C
cmp   r0,r4                         ; 080E808E
blo   @@Code080E8098                ; 080E8090
sub   r0,r0,r4                      ; 080E8092
lsr   r4,r3,0x3                     ; 080E8094
orr   r2,r4                         ; 080E8096
@@Code080E8098:
cmp   r0,0x0                        ; 080E8098
beq   @@Code080E80A4                ; 080E809A
lsr   r3,r3,0x4                     ; 080E809C
beq   @@Code080E80A4                ; 080E809E
lsr   r1,r1,0x4                     ; 080E80A0
b     @@Code080E806C                ; 080E80A2
@@Code080E80A4:
mov   r0,r2                         ; 080E80A4
pop   {r4}                          ; 080E80A6
mov   pc,lr                         ; 080E80A8

@@Code080E80AA:
push  {lr}                          ; 080E80AA
bl    Return080E7F24                ; 080E80AC
mov   r0,0x0                        ; 080E80B0
pop   {pc}                          ; 080E80B2

Sub080E80B4:
cmp   r1,0x0                        ; 080E80B4
beq   @@Code080E816A                ; 080E80B6
mov   r3,0x1                        ; 080E80B8
cmp   r0,r1                         ; 080E80BA
bhs   @@Code080E80C0                ; 080E80BC
mov   pc,lr                         ; 080E80BE

@@Code080E80C0:
push  {r4}                          ; 080E80C0
mov   r4,0x1                        ; 080E80C2
lsl   r4,r4,0x1C                    ; 080E80C4
@@Code080E80C6:
cmp   r1,r4                         ; 080E80C6
bhs   @@Code080E80D4                ; 080E80C8
cmp   r1,r0                         ; 080E80CA
bhs   @@Code080E80D4                ; 080E80CC
lsl   r1,r1,0x4                     ; 080E80CE
lsl   r3,r3,0x4                     ; 080E80D0
b     @@Code080E80C6                ; 080E80D2
@@Code080E80D4:
lsl   r4,r4,0x3                     ; 080E80D4
@@Code080E80D6:
cmp   r1,r4                         ; 080E80D6
bhs   @@Code080E80E4                ; 080E80D8
cmp   r1,r0                         ; 080E80DA
bhs   @@Code080E80E4                ; 080E80DC
lsl   r1,r1,0x1                     ; 080E80DE
lsl   r3,r3,0x1                     ; 080E80E0
b     @@Code080E80D6                ; 080E80E2
@@Code080E80E4:
mov   r2,0x0                        ; 080E80E4
cmp   r0,r1                         ; 080E80E6
blo   @@Code080E80EC                ; 080E80E8
sub   r0,r0,r1                      ; 080E80EA
@@Code080E80EC:
lsr   r4,r1,0x1                     ; 080E80EC
cmp   r0,r4                         ; 080E80EE
blo   @@Code080E80FE                ; 080E80F0
sub   r0,r0,r4                      ; 080E80F2
mov   r12,r3                        ; 080E80F4
mov   r4,0x1                        ; 080E80F6
ror   r3,r4                         ; 080E80F8
orr   r2,r3                         ; 080E80FA
mov   r3,r12                        ; 080E80FC
@@Code080E80FE:
lsr   r4,r1,0x2                     ; 080E80FE
cmp   r0,r4                         ; 080E8100
blo   @@Code080E8110                ; 080E8102
sub   r0,r0,r4                      ; 080E8104
mov   r12,r3                        ; 080E8106
mov   r4,0x2                        ; 080E8108
ror   r3,r4                         ; 080E810A
orr   r2,r3                         ; 080E810C
mov   r3,r12                        ; 080E810E
@@Code080E8110:
lsr   r4,r1,0x3                     ; 080E8110
cmp   r0,r4                         ; 080E8112
blo   @@Code080E8122                ; 080E8114
sub   r0,r0,r4                      ; 080E8116
mov   r12,r3                        ; 080E8118
mov   r4,0x3                        ; 080E811A
ror   r3,r4                         ; 080E811C
orr   r2,r3                         ; 080E811E
mov   r3,r12                        ; 080E8120
@@Code080E8122:
mov   r12,r3                        ; 080E8122
cmp   r0,0x0                        ; 080E8124
beq   @@Code080E8130                ; 080E8126
lsr   r3,r3,0x4                     ; 080E8128
beq   @@Code080E8130                ; 080E812A
lsr   r1,r1,0x4                     ; 080E812C
b     @@Code080E80E4                ; 080E812E
@@Code080E8130:
mov   r4,0xE                        ; 080E8130
lsl   r4,r4,0x1C                    ; 080E8132
and   r2,r4                         ; 080E8134
bne   @@Code080E813C                ; 080E8136
pop   {r4}                          ; 080E8138
mov   pc,lr                         ; 080E813A

@@Code080E813C:
mov   r3,r12                        ; 080E813C
mov   r4,0x3                        ; 080E813E
ror   r3,r4                         ; 080E8140
tst   r2,r3                         ; 080E8142
beq   @@Code080E814A                ; 080E8144
lsr   r4,r1,0x3                     ; 080E8146
add   r0,r0,r4                      ; 080E8148
@@Code080E814A:
mov   r3,r12                        ; 080E814A
mov   r4,0x2                        ; 080E814C
ror   r3,r4                         ; 080E814E
tst   r2,r3                         ; 080E8150
beq   @@Code080E8158                ; 080E8152
lsr   r4,r1,0x2                     ; 080E8154
add   r0,r0,r4                      ; 080E8156
@@Code080E8158:
mov   r3,r12                        ; 080E8158
mov   r4,0x1                        ; 080E815A
ror   r3,r4                         ; 080E815C
tst   r2,r3                         ; 080E815E
beq   @@Code080E8166                ; 080E8160
lsr   r4,r1,0x1                     ; 080E8162
add   r0,r0,r4                      ; 080E8164
@@Code080E8166:
pop   {r4}                          ; 080E8166
mov   pc,lr                         ; 080E8168

@@Code080E816A:
push  {lr}                          ; 080E816A
bl    Return080E7F24                ; 080E816C
mov   r0,0x0                        ; 080E8170
pop   {pc}                          ; 080E8172

Sub080E8174:
push  {r4-r7,lr}                    ; 080E8174
add   sp,-0x8                       ; 080E8176
mov   r1,r0                         ; 080E8178
ldr   r4,[r1,0xC]                   ; 080E817A
ldr   r5,[r1,0x10]                  ; 080E817C
ldr   r7,[r1,0x4]                   ; 080E817E
mov   r6,0x0                        ; 080E8180
mov   r2,0x0                        ; 080E8182
ldr   r0,[r1]                       ; 080E8184
cmp   r0,0x1                        ; 080E8186
bhi   @@Code080E818C                ; 080E8188
mov   r2,0x1                        ; 080E818A
@@Code080E818C:
cmp   r2,0x0                        ; 080E818C
beq   @@Code080E81AC                ; 080E818E
ldr   r6,=0x07FF                    ; 080E8190
ldr   r2,=0x0                       ; 080E8192
ldr   r3,=0x00080000                ; 080E8194
mov   r0,r4                         ; 080E8196
mov   r1,r5                         ; 080E8198
orr   r1,r3                         ; 080E819A
b     @@Code080E8264                ; 080E819C
.pool                               ; 080E819E

@@Code080E81AC:
mov   r2,0x0                        ; 080E81AC
cmp   r0,0x4                        ; 080E81AE
bne   @@Code080E81B4                ; 080E81B0
mov   r2,0x1                        ; 080E81B2
@@Code080E81B4:
cmp   r2,0x0                        ; 080E81B4
bne   @@Code080E8200                ; 080E81B6
mov   r2,0x0                        ; 080E81B8
cmp   r0,0x2                        ; 080E81BA
bne   @@Code080E81C0                ; 080E81BC
mov   r2,0x1                        ; 080E81BE
@@Code080E81C0:
cmp   r2,0x0                        ; 080E81C0
beq   @@Code080E81CA                ; 080E81C2
mov   r4,0x0                        ; 080E81C4
mov   r5,0x0                        ; 080E81C6
b     @@Code080E8268                ; 080E81C8
@@Code080E81CA:
mov   r0,r5                         ; 080E81CA
orr   r0,r4                         ; 080E81CC
cmp   r0,0x0                        ; 080E81CE
beq   @@Code080E8268                ; 080E81D0
ldr   r2,[r1,0x8]                   ; 080E81D2
ldr   r0,=0xFFFFFC02                ; 080E81D4
cmp   r2,r0                         ; 080E81D6
bge   @@Code080E81FA                ; 080E81D8
sub   r2,r0,r2                      ; 080E81DA
cmp   r2,0x38                       ; 080E81DC
ble   @@Code080E81EC                ; 080E81DE
mov   r4,0x0                        ; 080E81E0
mov   r5,0x0                        ; 080E81E2
b     @@Code080E825A                ; 080E81E4
.pool                               ; 080E81E6

@@Code080E81EC:
mov   r1,r5                         ; 080E81EC
mov   r0,r4                         ; 080E81EE
bl    Sub080E985C                   ; 080E81F0
mov   r5,r1                         ; 080E81F4
mov   r4,r0                         ; 080E81F6
b     @@Code080E825A                ; 080E81F8
@@Code080E81FA:
ldr   r0,=0x03FF                    ; 080E81FA
cmp   r2,r0                         ; 080E81FC
ble   @@Code080E8210                ; 080E81FE
@@Code080E8200:
ldr   r6,=0x07FF                    ; 080E8200
mov   r4,0x0                        ; 080E8202
mov   r5,0x0                        ; 080E8204
b     @@Code080E8268                ; 080E8206
.pool                               ; 080E8208

@@Code080E8210:
ldr   r0,=0x03FF                    ; 080E8210
add   r6,r2,r0                      ; 080E8212
mov   r0,0xFF                       ; 080E8214
mov   r1,r4                         ; 080E8216
and   r1,r0                         ; 080E8218
mov   r2,0x0                        ; 080E821A
cmp   r1,0x80                       ; 080E821C
bne   @@Code080E823C                ; 080E821E
cmp   r2,0x0                        ; 080E8220
bne   @@Code080E823C                ; 080E8222
add   r0,0x1                        ; 080E8224
mov   r1,r4                         ; 080E8226
and   r1,r0                         ; 080E8228
mov   r0,r2                         ; 080E822A
orr   r0,r1                         ; 080E822C
cmp   r0,0x0                        ; 080E822E
beq   @@Code080E8244                ; 080E8230
mov   r0,0x80                       ; 080E8232
mov   r1,0x0                        ; 080E8234
b     @@Code080E8240                ; 080E8236
.pool                               ; 080E8238

@@Code080E823C:
mov   r0,0x7F                       ; 080E823C
mov   r1,0x0                        ; 080E823E
@@Code080E8240:
add   r4,r4,r0                      ; 080E8240
adc   r5,r1                         ; 080E8242
@@Code080E8244:
ldr   r0,=0x1FFFFFFF                ; 080E8244
cmp   r5,r0                         ; 080E8246
bls   @@Code080E825A                ; 080E8248
lsl   r3,r5,0x1F                    ; 080E824A
lsr   r2,r4,0x1                     ; 080E824C
mov   r0,r3                         ; 080E824E
orr   r0,r2                         ; 080E8250
lsr   r1,r5,0x1                     ; 080E8252
mov   r5,r1                         ; 080E8254
mov   r4,r0                         ; 080E8256
add   r6,0x1                        ; 080E8258
@@Code080E825A:
lsl   r3,r5,0x18                    ; 080E825A
lsr   r2,r4,0x8                     ; 080E825C
mov   r0,r3                         ; 080E825E
orr   r0,r2                         ; 080E8260
lsr   r1,r5,0x8                     ; 080E8262
@@Code080E8264:
mov   r5,r1                         ; 080E8264
mov   r4,r0                         ; 080E8266
@@Code080E8268:
str   r4,[sp]                       ; 080E8268
ldr   r2,=0x000FFFFF                ; 080E826A
and   r2,r5                         ; 080E826C
ldr   r0,[sp,0x4]                   ; 080E826E
ldr   r1,=0xFFF00000                ; 080E8270
and   r0,r1                         ; 080E8272
orr   r0,r2                         ; 080E8274
str   r0,[sp,0x4]                   ; 080E8276
mov   r2,sp                         ; 080E8278
ldr   r1,=0x07FF                    ; 080E827A
mov   r0,r1                         ; 080E827C
and   r6,r0                         ; 080E827E
lsl   r1,r6,0x4                     ; 080E8280
ldr   r0,=0xFFFF800F                ; 080E8282
ldrh  r3,[r2,0x6]                   ; 080E8284
and   r0,r3                         ; 080E8286
orr   r0,r1                         ; 080E8288
strh  r0,[r2,0x6]                   ; 080E828A
lsl   r1,r7,0x7                     ; 080E828C
mov   r0,0x7F                       ; 080E828E
ldrb  r3,[r2,0x7]                   ; 080E8290
and   r0,r3                         ; 080E8292
orr   r0,r1                         ; 080E8294
strb  r0,[r2,0x7]                   ; 080E8296
ldr   r1,[sp]                       ; 080E8298
ldr   r0,[sp,0x4]                   ; 080E829A
str   r0,[sp]                       ; 080E829C
str   r1,[sp,0x4]                   ; 080E829E
ldr   r0,[sp]                       ; 080E82A0
ldr   r1,[sp,0x4]                   ; 080E82A2
add   sp,0x8                        ; 080E82A4
pop   {r4-r7,pc}                    ; 080E82A6
.pool                               ; 080E82A8

Sub080E82BC:
push  {r4-r7,lr}                    ; 080E82BC
add   sp,-0x8                       ; 080E82BE
mov   r2,r0                         ; 080E82C0
mov   r6,r1                         ; 080E82C2
ldr   r1,[r2,0x4]                   ; 080E82C4
str   r1,[sp]                       ; 080E82C6
ldr   r0,[r2]                       ; 080E82C8
str   r0,[sp,0x4]                   ; 080E82CA
mov   r2,sp                         ; 080E82CC
mov   r4,r1                         ; 080E82CE
lsl   r0,r0,0xC                     ; 080E82D0
lsr   r5,r0,0xC                     ; 080E82D2
ldrh  r3,[r2,0x6]                   ; 080E82D4
lsl   r0,r3,0x11                    ; 080E82D6
lsr   r3,r0,0x15                    ; 080E82D8
ldrb  r2,[r2,0x7]                   ; 080E82DA
lsr   r0,r2,0x7                     ; 080E82DC
str   r0,[r6,0x4]                   ; 080E82DE
cmp   r3,0x0                        ; 080E82E0
bne   @@Code080E8330                ; 080E82E2
orr   r1,r5                         ; 080E82E4
cmp   r1,0x0                        ; 080E82E6
bne   @@Code080E82F0                ; 080E82E8
mov   r0,0x2                        ; 080E82EA
str   r0,[r6]                       ; 080E82EC
b     @@Code080E8384                ; 080E82EE
@@Code080E82F0:
ldr   r0,=0xFFFFFC02                ; 080E82F0
str   r0,[r6,0x8]                   ; 080E82F2
lsr   r3,r4,0x18                    ; 080E82F4
lsl   r2,r5,0x8                     ; 080E82F6
mov   r1,r3                         ; 080E82F8
orr   r1,r2                         ; 080E82FA
lsl   r0,r4,0x8                     ; 080E82FC
mov   r5,r1                         ; 080E82FE
mov   r4,r0                         ; 080E8300
mov   r0,0x3                        ; 080E8302
str   r0,[r6]                       ; 080E8304
ldr   r0,=0x0FFFFFFF                ; 080E8306
cmp   r5,r0                         ; 080E8308
bhi   @@Code080E8360                ; 080E830A
mov   r7,r0                         ; 080E830C
@@Code080E830E:
lsr   r3,r4,0x1F                    ; 080E830E
lsl   r2,r5,0x1                     ; 080E8310
mov   r1,r3                         ; 080E8312
orr   r1,r2                         ; 080E8314
lsl   r0,r4,0x1                     ; 080E8316
mov   r5,r1                         ; 080E8318
mov   r4,r0                         ; 080E831A
ldr   r0,[r6,0x8]                   ; 080E831C
sub   r0,0x1                        ; 080E831E
str   r0,[r6,0x8]                   ; 080E8320
cmp   r5,r7                         ; 080E8322
bls   @@Code080E830E                ; 080E8324
b     @@Code080E8360                ; 080E8326
.pool                               ; 080E8328

@@Code080E8330:
ldr   r0,=0x07FF                    ; 080E8330
cmp   r3,r0                         ; 080E8332
bne   @@Code080E8366                ; 080E8334
orr   r1,r5                         ; 080E8336
cmp   r1,0x0                        ; 080E8338
bne   @@Code080E8348                ; 080E833A
mov   r0,0x4                        ; 080E833C
str   r0,[r6]                       ; 080E833E
b     @@Code080E8384                ; 080E8340
.pool                               ; 080E8342

@@Code080E8348:
mov   r2,0x80                       ; 080E8348
lsl   r2,r2,0xC                     ; 080E834A
mov   r0,0x0                        ; 080E834C
mov   r1,r5                         ; 080E834E
and   r1,r2                         ; 080E8350
orr   r1,r0                         ; 080E8352
cmp   r1,0x0                        ; 080E8354
beq   @@Code080E835E                ; 080E8356
mov   r0,0x1                        ; 080E8358
str   r0,[r6]                       ; 080E835A
b     @@Code080E8360                ; 080E835C
@@Code080E835E:
str   r1,[r6]                       ; 080E835E
@@Code080E8360:
str   r4,[r6,0xC]                   ; 080E8360
str   r5,[r6,0x10]                  ; 080E8362
b     @@Code080E8384                ; 080E8364
@@Code080E8366:
ldr   r1,=0xFFFFFC01                ; 080E8366
add   r0,r3,r1                      ; 080E8368
str   r0,[r6,0x8]                   ; 080E836A
mov   r0,0x3                        ; 080E836C
str   r0,[r6]                       ; 080E836E
lsr   r3,r4,0x18                    ; 080E8370
lsl   r2,r5,0x8                     ; 080E8372
mov   r1,r3                         ; 080E8374
orr   r1,r2                         ; 080E8376
lsl   r0,r4,0x8                     ; 080E8378
ldr   r2,=0x0                       ; 080E837A
ldr   r3,=0x10000000                ; 080E837C
orr   r1,r3                         ; 080E837E
str   r0,[r6,0xC]                   ; 080E8380
str   r1,[r6,0x10]                  ; 080E8382
@@Code080E8384:
add   sp,0x8                        ; 080E8384
pop   {r4-r7,pc}                    ; 080E8386
.pool                               ; 080E8388

Sub080E8394:
push  {r4-r7,lr}                    ; 080E8394
mov   r7,r10                        ; 080E8396
mov   r6,r9                         ; 080E8398
mov   r5,r8                         ; 080E839A
push  {r5-r7}                       ; 080E839C
add   sp,-0xC                       ; 080E839E
mov   r3,r0                         ; 080E83A0
mov   r4,r1                         ; 080E83A2
mov   r10,r2                        ; 080E83A4
mov   r0,0x0                        ; 080E83A6
ldr   r2,[r3]                       ; 080E83A8
cmp   r2,0x1                        ; 080E83AA
bhi   @@Code080E83B0                ; 080E83AC
mov   r0,0x1                        ; 080E83AE
@@Code080E83B0:
cmp   r0,0x0                        ; 080E83B0
beq   @@Code080E83B8                ; 080E83B2
@@Code080E83B4:
mov   r0,r3                         ; 080E83B4
b     @@Code080E85F0                ; 080E83B6
@@Code080E83B8:
mov   r1,0x0                        ; 080E83B8
ldr   r0,[r4]                       ; 080E83BA
cmp   r0,0x1                        ; 080E83BC
bhi   @@Code080E83C2                ; 080E83BE
mov   r1,0x1                        ; 080E83C0
@@Code080E83C2:
cmp   r1,0x0                        ; 080E83C2
bne   @@Code080E843A                ; 080E83C4
mov   r1,0x0                        ; 080E83C6
cmp   r2,0x4                        ; 080E83C8
bne   @@Code080E83CE                ; 080E83CA
mov   r1,0x1                        ; 080E83CC
@@Code080E83CE:
cmp   r1,0x0                        ; 080E83CE
beq   @@Code080E83F0                ; 080E83D0
mov   r1,0x0                        ; 080E83D2
cmp   r0,0x4                        ; 080E83D4
bne   @@Code080E83DA                ; 080E83D6
mov   r1,0x1                        ; 080E83D8
@@Code080E83DA:
cmp   r1,0x0                        ; 080E83DA
beq   @@Code080E83B4                ; 080E83DC
ldr   r1,[r3,0x4]                   ; 080E83DE
ldr   r0,[r4,0x4]                   ; 080E83E0
cmp   r1,r0                         ; 080E83E2
beq   @@Code080E83B4                ; 080E83E4
ldr   r0,=0x03002210                ; 080E83E6
b     @@Code080E85F0                ; 080E83E8
.pool                               ; 080E83EA

@@Code080E83F0:
mov   r1,0x0                        ; 080E83F0
cmp   r0,0x4                        ; 080E83F2
bne   @@Code080E83F8                ; 080E83F4
mov   r1,0x1                        ; 080E83F6
@@Code080E83F8:
cmp   r1,0x0                        ; 080E83F8
bne   @@Code080E843A                ; 080E83FA
mov   r1,0x0                        ; 080E83FC
cmp   r0,0x2                        ; 080E83FE
bne   @@Code080E8404                ; 080E8400
mov   r1,0x1                        ; 080E8402
@@Code080E8404:
cmp   r1,0x0                        ; 080E8404
beq   @@Code080E842C                ; 080E8406
mov   r0,0x0                        ; 080E8408
cmp   r2,0x2                        ; 080E840A
bne   @@Code080E8410                ; 080E840C
mov   r0,0x1                        ; 080E840E
@@Code080E8410:
cmp   r0,0x0                        ; 080E8410
beq   @@Code080E83B4                ; 080E8412
mov   r1,r10                        ; 080E8414
mov   r0,r3                         ; 080E8416
ldmia r0!,{r2,r5-r6}                ; 080E8418
stmia r1!,{r2,r5-r6}                ; 080E841A
ldmia r0!,{r2,r5}                   ; 080E841C
stmia r1!,{r2,r5}                   ; 080E841E
ldr   r0,[r3,0x4]                   ; 080E8420
ldr   r1,[r4,0x4]                   ; 080E8422
and   r0,r1                         ; 080E8424
mov   r6,r10                        ; 080E8426
str   r0,[r6,0x4]                   ; 080E8428
b     @@Code080E85EE                ; 080E842A
@@Code080E842C:
mov   r1,0x0                        ; 080E842C
ldr   r0,[r3]                       ; 080E842E
cmp   r0,0x2                        ; 080E8430
bne   @@Code080E8436                ; 080E8432
mov   r1,0x1                        ; 080E8434
@@Code080E8436:
cmp   r1,0x0                        ; 080E8436
beq   @@Code080E843E                ; 080E8438
@@Code080E843A:
mov   r0,r4                         ; 080E843A
b     @@Code080E85F0                ; 080E843C
@@Code080E843E:
ldr   r0,[r3,0x8]                   ; 080E843E
mov   r9,r0                         ; 080E8440
ldr   r1,[r4,0x8]                   ; 080E8442
mov   r8,r1                         ; 080E8444
ldr   r6,[r3,0xC]                   ; 080E8446
ldr   r7,[r3,0x10]                  ; 080E8448
ldr   r0,[r4,0xC]                   ; 080E844A
ldr   r1,[r4,0x10]                  ; 080E844C
str   r0,[sp]                       ; 080E844E
str   r1,[sp,0x4]                   ; 080E8450
mov   r1,r9                         ; 080E8452
mov   r2,r8                         ; 080E8454
sub   r0,r1,r2                      ; 080E8456
cmp   r0,0x0                        ; 080E8458
bge   @@Code080E845E                ; 080E845A
neg   r0,r0                         ; 080E845C
@@Code080E845E:
cmp   r0,0x3F                       ; 080E845E
bgt   @@Code080E84DC                ; 080E8460
ldr   r3,[r3,0x4]                   ; 080E8462
mov   r12,r3                        ; 080E8464
ldr   r4,[r4,0x4]                   ; 080E8466
str   r4,[sp,0x8]                   ; 080E8468
cmp   r9,r8                         ; 080E846A
ble   @@Code080E84A8                ; 080E846C
mov   r3,r9                         ; 080E846E
mov   r4,r8                         ; 080E8470
sub   r3,r3,r4                      ; 080E8472
mov   r8,r3                         ; 080E8474
@@Code080E8476:
mov   r5,0x1                        ; 080E8476
neg   r5,r5                         ; 080E8478
add   r8,r5                         ; 080E847A
ldr   r2,[sp]                       ; 080E847C
mov   r0,0x1                        ; 080E847E
and   r2,r0                         ; 080E8480
mov   r3,0x0                        ; 080E8482
ldr   r1,[sp,0x4]                   ; 080E8484
lsl   r5,r1,0x1F                    ; 080E8486
ldr   r0,[sp]                       ; 080E8488
lsr   r4,r0,0x1                     ; 080E848A
mov   r0,r5                         ; 080E848C
orr   r0,r4                         ; 080E848E
mov   r4,r1                         ; 080E8490
lsr   r1,r4,0x1                     ; 080E8492
mov   r5,r2                         ; 080E8494
orr   r5,r0                         ; 080E8496
str   r5,[sp]                       ; 080E8498
mov   r4,r3                         ; 080E849A
orr   r4,r1                         ; 080E849C
str   r4,[sp,0x4]                   ; 080E849E
mov   r5,r8                         ; 080E84A0
cmp   r5,0x0                        ; 080E84A2
bne   @@Code080E8476                ; 080E84A4
mov   r8,r9                         ; 080E84A6
@@Code080E84A8:
cmp   r8,r9                         ; 080E84A8
ble   @@Code080E84F8                ; 080E84AA
mov   r0,r8                         ; 080E84AC
mov   r1,r9                         ; 080E84AE
sub   r0,r0,r1                      ; 080E84B0
mov   r9,r0                         ; 080E84B2
@@Code080E84B4:
mov   r2,0x1                        ; 080E84B4
neg   r2,r2                         ; 080E84B6
add   r9,r2                         ; 080E84B8
mov   r2,0x1                        ; 080E84BA
and   r2,r6                         ; 080E84BC
mov   r3,0x0                        ; 080E84BE
lsl   r5,r7,0x1F                    ; 080E84C0
lsr   r4,r6,0x1                     ; 080E84C2
mov   r0,r5                         ; 080E84C4
orr   r0,r4                         ; 080E84C6
lsr   r1,r7,0x1                     ; 080E84C8
mov   r6,r2                         ; 080E84CA
orr   r6,r0                         ; 080E84CC
mov   r7,r3                         ; 080E84CE
orr   r7,r1                         ; 080E84D0
mov   r3,r9                         ; 080E84D2
cmp   r3,0x0                        ; 080E84D4
bne   @@Code080E84B4                ; 080E84D6
mov   r9,r8                         ; 080E84D8
b     @@Code080E84F8                ; 080E84DA
@@Code080E84DC:
cmp   r9,r8                         ; 080E84DC
ble   @@Code080E84EA                ; 080E84DE
mov   r0,0x0                        ; 080E84E0
mov   r1,0x0                        ; 080E84E2
str   r0,[sp]                       ; 080E84E4
str   r1,[sp,0x4]                   ; 080E84E6
b     @@Code080E84F0                ; 080E84E8
@@Code080E84EA:
mov   r9,r8                         ; 080E84EA
mov   r6,0x0                        ; 080E84EC
mov   r7,0x0                        ; 080E84EE
@@Code080E84F0:
ldr   r3,[r3,0x4]                   ; 080E84F0
mov   r12,r3                        ; 080E84F2
ldr   r4,[r4,0x4]                   ; 080E84F4
str   r4,[sp,0x8]                   ; 080E84F6
@@Code080E84F8:
ldr   r1,[sp,0x8]                   ; 080E84F8
cmp   r12,r1                        ; 080E84FA
beq   @@Code080E85A0                ; 080E84FC
mov   r2,r12                        ; 080E84FE
cmp   r2,0x0                        ; 080E8500
beq   @@Code080E851A                ; 080E8502
mov   r1,r7                         ; 080E8504
mov   r0,r6                         ; 080E8506
bl    Sub080E9900                   ; 080E8508
mov   r3,r1                         ; 080E850C
mov   r2,r0                         ; 080E850E
ldr   r4,[sp]                       ; 080E8510
ldr   r5,[sp,0x4]                   ; 080E8512
add   r2,r2,r4                      ; 080E8514
adc   r3,r5                         ; 080E8516
b     @@Code080E8526                ; 080E8518
@@Code080E851A:
mov   r3,r7                         ; 080E851A
mov   r2,r6                         ; 080E851C
ldr   r0,[sp]                       ; 080E851E
ldr   r1,[sp,0x4]                   ; 080E8520
sub   r2,r2,r0                      ; 080E8522
sbc   r3,r1                         ; 080E8524
@@Code080E8526:
cmp   r3,0x0                        ; 080E8526
blt   @@Code080E853C                ; 080E8528
mov   r0,0x0                        ; 080E852A
mov   r1,r10                        ; 080E852C
str   r0,[r1,0x4]                   ; 080E852E
mov   r4,r9                         ; 080E8530
str   r4,[r1,0x8]                   ; 080E8532
mov   r5,r10                        ; 080E8534
str   r2,[r5,0xC]                   ; 080E8536
str   r3,[r5,0x10]                  ; 080E8538
b     @@Code080E8554                ; 080E853A
@@Code080E853C:
mov   r0,0x1                        ; 080E853C
mov   r6,r10                        ; 080E853E
str   r0,[r6,0x4]                   ; 080E8540
mov   r0,r9                         ; 080E8542
str   r0,[r6,0x8]                   ; 080E8544
mov   r1,r3                         ; 080E8546
mov   r0,r2                         ; 080E8548
bl    Sub080E9900                   ; 080E854A
mov   r2,r10                        ; 080E854E
str   r0,[r2,0xC]                   ; 080E8550
str   r1,[r2,0x10]                  ; 080E8552
@@Code080E8554:
mov   r4,r10                        ; 080E8554
ldr   r2,[r4,0xC]                   ; 080E8556
ldr   r3,[r4,0x10]                  ; 080E8558
mov   r0,0x1                        ; 080E855A
neg   r0,r0                         ; 080E855C
asr   r1,r0,0x1F                    ; 080E855E
@@Code080E8560:
add   r2,r2,r0                      ; 080E8560
adc   r3,r1                         ; 080E8562
ldr   r0,=0x0FFFFFFF                ; 080E8564
cmp   r3,r0                         ; 080E8566
bhi   @@Code080E85B8                ; 080E8568
cmp   r3,r0                         ; 080E856A
bne   @@Code080E8576                ; 080E856C
mov   r0,0x2                        ; 080E856E
neg   r0,r0                         ; 080E8570
cmp   r2,r0                         ; 080E8572
bhi   @@Code080E85B8                ; 080E8574
@@Code080E8576:
mov   r5,r10                        ; 080E8576
ldr   r0,[r5,0xC]                   ; 080E8578
ldr   r1,[r5,0x10]                  ; 080E857A
lsr   r3,r0,0x1F                    ; 080E857C
lsl   r2,r1,0x1                     ; 080E857E
mov   r1,r3                         ; 080E8580
orr   r1,r2                         ; 080E8582
lsl   r0,r0,0x1                     ; 080E8584
mov   r6,r10                        ; 080E8586
str   r0,[r6,0xC]                   ; 080E8588
str   r1,[r6,0x10]                  ; 080E858A
ldr   r2,[r6,0x8]                   ; 080E858C
sub   r2,0x1                        ; 080E858E
str   r2,[r6,0x8]                   ; 080E8590
mov   r2,0x1                        ; 080E8592
neg   r2,r2                         ; 080E8594
asr   r3,r2,0x1F                    ; 080E8596
b     @@Code080E8560                ; 080E8598
.pool                               ; 080E859A

@@Code080E85A0:
mov   r0,r12                        ; 080E85A0
mov   r1,r10                        ; 080E85A2
str   r0,[r1,0x4]                   ; 080E85A4
mov   r2,r9                         ; 080E85A6
str   r2,[r1,0x8]                   ; 080E85A8
ldr   r3,[sp]                       ; 080E85AA
ldr   r4,[sp,0x4]                   ; 080E85AC
add   r6,r6,r3                      ; 080E85AE
adc   r7,r4                         ; 080E85B0
mov   r4,r10                        ; 080E85B2
str   r6,[r4,0xC]                   ; 080E85B4
str   r7,[r4,0x10]                  ; 080E85B6
@@Code080E85B8:
mov   r0,0x3                        ; 080E85B8
mov   r5,r10                        ; 080E85BA
str   r0,[r5]                       ; 080E85BC
ldr   r1,[r5,0x10]                  ; 080E85BE
ldr   r0,=0x1FFFFFFF                ; 080E85C0
cmp   r1,r0                         ; 080E85C2
bls   @@Code080E85EE                ; 080E85C4
ldr   r4,[r5,0xC]                   ; 080E85C6
ldr   r5,[r5,0x10]                  ; 080E85C8
mov   r2,0x1                        ; 080E85CA
mov   r0,r4                         ; 080E85CC
and   r0,r2                         ; 080E85CE
mov   r1,0x0                        ; 080E85D0
lsl   r6,r5,0x1F                    ; 080E85D2
mov   r8,r6                         ; 080E85D4
lsr   r6,r4,0x1                     ; 080E85D6
mov   r2,r8                         ; 080E85D8
orr   r2,r6                         ; 080E85DA
lsr   r3,r5,0x1                     ; 080E85DC
orr   r0,r2                         ; 080E85DE
orr   r1,r3                         ; 080E85E0
mov   r2,r10                        ; 080E85E2
str   r0,[r2,0xC]                   ; 080E85E4
str   r1,[r2,0x10]                  ; 080E85E6
ldr   r0,[r2,0x8]                   ; 080E85E8
add   r0,0x1                        ; 080E85EA
str   r0,[r2,0x8]                   ; 080E85EC
@@Code080E85EE:
mov   r0,r10                        ; 080E85EE
@@Code080E85F0:
add   sp,0xC                        ; 080E85F0
pop   {r3-r5}                       ; 080E85F2
mov   r8,r3                         ; 080E85F4
mov   r9,r4                         ; 080E85F6
mov   r10,r5                        ; 080E85F8
pop   {r4-r7,pc}                    ; 080E85FA
.pool                               ; 080E85FC

Sub080E8600:
push  {r4,lr}                       ; 080E8600
add   sp,-0x4C                      ; 080E8602
str   r0,[sp,0x3C]                  ; 080E8604
str   r1,[sp,0x40]                  ; 080E8606
str   r2,[sp,0x44]                  ; 080E8608
str   r3,[sp,0x48]                  ; 080E860A
add   r0,sp,0x3C                    ; 080E860C
mov   r1,sp                         ; 080E860E
bl    Sub080E82BC                   ; 080E8610
add   r0,sp,0x44                    ; 080E8614
add   r4,sp,0x14                    ; 080E8616
mov   r1,r4                         ; 080E8618
bl    Sub080E82BC                   ; 080E861A
add   r2,sp,0x28                    ; 080E861E
mov   r0,sp                         ; 080E8620
mov   r1,r4                         ; 080E8622
bl    Sub080E8394                   ; 080E8624
bl    Sub080E8174                   ; 080E8628
add   sp,0x4C                       ; 080E862C
pop   {r4,pc}                       ; 080E862E

push  {r4,lr}                       ; 080E8630
add   sp,-0x4C                      ; 080E8632
str   r0,[sp,0x3C]                  ; 080E8634
str   r1,[sp,0x40]                  ; 080E8636
str   r2,[sp,0x44]                  ; 080E8638
str   r3,[sp,0x48]                  ; 080E863A
add   r0,sp,0x3C                    ; 080E863C
mov   r1,sp                         ; 080E863E
bl    Sub080E82BC                   ; 080E8640
add   r0,sp,0x44                    ; 080E8644
add   r4,sp,0x14                    ; 080E8646
mov   r1,r4                         ; 080E8648
bl    Sub080E82BC                   ; 080E864A
ldr   r0,[r4,0x4]                   ; 080E864E
mov   r1,0x1                        ; 080E8650
eor   r0,r1                         ; 080E8652
str   r0,[r4,0x4]                   ; 080E8654
add   r2,sp,0x28                    ; 080E8656
mov   r0,sp                         ; 080E8658
mov   r1,r4                         ; 080E865A
bl    Sub080E8394                   ; 080E865C
bl    Sub080E8174                   ; 080E8660
add   sp,0x4C                       ; 080E8664
pop   {r4,pc}                       ; 080E8666

push  {r4-r7,lr}                    ; 080E8668
mov   r7,r10                        ; 080E866A
mov   r6,r9                         ; 080E866C
mov   r5,r8                         ; 080E866E
push  {r5-r7}                       ; 080E8670
add   sp,-0x74                      ; 080E8672
str   r0,[sp,0x3C]                  ; 080E8674
str   r1,[sp,0x40]                  ; 080E8676
str   r2,[sp,0x44]                  ; 080E8678
str   r3,[sp,0x48]                  ; 080E867A
add   r0,sp,0x3C                    ; 080E867C
mov   r1,sp                         ; 080E867E
bl    Sub080E82BC                   ; 080E8680
add   r0,sp,0x44                    ; 080E8684
add   r4,sp,0x14                    ; 080E8686
mov   r1,r4                         ; 080E8688
bl    Sub080E82BC                   ; 080E868A
mov   r8,sp                         ; 080E868E
add   r0,sp,0x28                    ; 080E8690
mov   r10,r0                        ; 080E8692
mov   r0,0x0                        ; 080E8694
ldr   r1,[sp]                       ; 080E8696
cmp   r1,0x1                        ; 080E8698
bhi   @@Code080E869E                ; 080E869A
mov   r0,0x1                        ; 080E869C
@@Code080E869E:
cmp   r0,0x0                        ; 080E869E
bne   @@Code080E8702                ; 080E86A0
mov   r2,0x0                        ; 080E86A2
ldr   r0,[sp,0x14]                  ; 080E86A4
cmp   r0,0x1                        ; 080E86A6
bhi   @@Code080E86AC                ; 080E86A8
mov   r2,0x1                        ; 080E86AA
@@Code080E86AC:
cmp   r2,0x0                        ; 080E86AC
beq   @@Code080E86B4                ; 080E86AE
ldr   r0,[sp,0x4]                   ; 080E86B0
b     @@Code080E8724                ; 080E86B2
@@Code080E86B4:
mov   r2,0x0                        ; 080E86B4
cmp   r1,0x4                        ; 080E86B6
bne   @@Code080E86BC                ; 080E86B8
mov   r2,0x1                        ; 080E86BA
@@Code080E86BC:
cmp   r2,0x0                        ; 080E86BC
beq   @@Code080E86CE                ; 080E86BE
mov   r1,0x0                        ; 080E86C0
cmp   r0,0x2                        ; 080E86C2
bne   @@Code080E86C8                ; 080E86C4
mov   r1,0x1                        ; 080E86C6
@@Code080E86C8:
cmp   r1,0x0                        ; 080E86C8
bne   @@Code080E86E6                ; 080E86CA
b     @@Code080E8702                ; 080E86CC
@@Code080E86CE:
mov   r2,0x0                        ; 080E86CE
cmp   r0,0x4                        ; 080E86D0
bne   @@Code080E86D6                ; 080E86D2
mov   r2,0x1                        ; 080E86D4
@@Code080E86D6:
cmp   r2,0x0                        ; 080E86D6
beq   @@Code080E86F6                ; 080E86D8
mov   r0,0x0                        ; 080E86DA
cmp   r1,0x2                        ; 080E86DC
bne   @@Code080E86E2                ; 080E86DE
mov   r0,0x1                        ; 080E86E0
@@Code080E86E2:
cmp   r0,0x0                        ; 080E86E2
beq   @@Code080E86F0                ; 080E86E4
@@Code080E86E6:
ldr   r0,=0x03002210                ; 080E86E6
b     @@Code080E88EE                ; 080E86E8
.pool                               ; 080E86EA

@@Code080E86F0:
mov   r1,r8                         ; 080E86F0
ldr   r0,[r1,0x4]                   ; 080E86F2
b     @@Code080E8724                ; 080E86F4
@@Code080E86F6:
mov   r2,0x0                        ; 080E86F6
cmp   r1,0x2                        ; 080E86F8
bne   @@Code080E86FE                ; 080E86FA
mov   r2,0x1                        ; 080E86FC
@@Code080E86FE:
cmp   r2,0x0                        ; 080E86FE
beq   @@Code080E8714                ; 080E8700
@@Code080E8702:
ldr   r0,[sp,0x4]                   ; 080E8702
ldr   r1,[sp,0x18]                  ; 080E8704
eor   r0,r1                         ; 080E8706
neg   r1,r0                         ; 080E8708
orr   r1,r0                         ; 080E870A
lsr   r1,r1,0x1F                    ; 080E870C
str   r1,[sp,0x4]                   ; 080E870E
mov   r0,sp                         ; 080E8710
b     @@Code080E88EE                ; 080E8712
@@Code080E8714:
mov   r1,0x0                        ; 080E8714
cmp   r0,0x2                        ; 080E8716
bne   @@Code080E871C                ; 080E8718
mov   r1,0x1                        ; 080E871A
@@Code080E871C:
cmp   r1,0x0                        ; 080E871C
beq   @@Code080E8734                ; 080E871E
mov   r2,r8                         ; 080E8720
ldr   r0,[r2,0x4]                   ; 080E8722
@@Code080E8724:
ldr   r1,[sp,0x18]                  ; 080E8724
eor   r0,r1                         ; 080E8726
neg   r1,r0                         ; 080E8728
orr   r1,r0                         ; 080E872A
lsr   r1,r1,0x1F                    ; 080E872C
str   r1,[sp,0x18]                  ; 080E872E
mov   r0,r4                         ; 080E8730
b     @@Code080E88EE                ; 080E8732
@@Code080E8734:
mov   r4,r8                         ; 080E8734
ldr   r0,[r4,0xC]                   ; 080E8736
ldr   r1,[r4,0x10]                  ; 080E8738
mov   r6,r0                         ; 080E873A
mov   r7,0x0                        ; 080E873C
str   r1,[sp,0x4C]                  ; 080E873E
mov   r5,0x0                        ; 080E8740
str   r5,[sp,0x50]                  ; 080E8742
ldr   r0,[sp,0x20]                  ; 080E8744
ldr   r1,[sp,0x24]                  ; 080E8746
mov   r4,r0                         ; 080E8748
str   r1,[sp,0x54]                  ; 080E874A
mov   r0,0x0                        ; 080E874C
str   r0,[sp,0x58]                  ; 080E874E
mov   r1,r5                         ; 080E8750
mov   r0,r4                         ; 080E8752
mov   r3,r7                         ; 080E8754
mov   r2,r6                         ; 080E8756
bl    Sub080E9890                   ; 080E8758
str   r0,[sp,0x5C]                  ; 080E875C
str   r1,[sp,0x60]                  ; 080E875E
ldr   r0,[sp,0x54]                  ; 080E8760
ldr   r1,[sp,0x58]                  ; 080E8762
mov   r3,r7                         ; 080E8764
mov   r2,r6                         ; 080E8766
bl    Sub080E9890                   ; 080E8768
mov   r7,r1                         ; 080E876C
mov   r6,r0                         ; 080E876E
mov   r1,r5                         ; 080E8770
mov   r0,r4                         ; 080E8772
ldr   r2,[sp,0x4C]                  ; 080E8774
ldr   r3,[sp,0x50]                  ; 080E8776
bl    Sub080E9890                   ; 080E8778
mov   r5,r1                         ; 080E877C
mov   r4,r0                         ; 080E877E
ldr   r0,[sp,0x54]                  ; 080E8780
ldr   r1,[sp,0x58]                  ; 080E8782
ldr   r2,[sp,0x4C]                  ; 080E8784
ldr   r3,[sp,0x50]                  ; 080E8786
bl    Sub080E9890                   ; 080E8788
str   r0,[sp,0x64]                  ; 080E878C
str   r1,[sp,0x68]                  ; 080E878E
mov   r1,0x0                        ; 080E8790
mov   r2,0x0                        ; 080E8792
str   r1,[sp,0x6C]                  ; 080E8794
str   r2,[sp,0x70]                  ; 080E8796
mov   r3,r7                         ; 080E8798
mov   r2,r6                         ; 080E879A
add   r2,r2,r4                      ; 080E879C
adc   r3,r5                         ; 080E879E
cmp   r7,r3                         ; 080E87A0
bhi   @@Code080E87AC                ; 080E87A2
cmp   r7,r3                         ; 080E87A4
bne   @@Code080E87B4                ; 080E87A6
cmp   r6,r2                         ; 080E87A8
bls   @@Code080E87B4                ; 080E87AA
@@Code080E87AC:
ldr   r5,=0x1                       ; 080E87AC
ldr   r4,[@@_0a]                    ; 080E87AE
str   r4,[sp,0x6C]                  ; 080E87B0
str   r5,[sp,0x70]                  ; 080E87B2
@@Code080E87B4:
mov   r1,r2                         ; 080E87B4
mov   r6,0x0                        ; 080E87B6
mov   r7,r1                         ; 080E87B8
ldr   r0,[sp,0x5C]                  ; 080E87BA
ldr   r1,[sp,0x60]                  ; 080E87BC
add   r6,r6,r0                      ; 080E87BE
adc   r7,r1                         ; 080E87C0
cmp   r1,r7                         ; 080E87C2
bhi   @@Code080E87D0                ; 080E87C4
ldr   r1,[sp,0x60]                  ; 080E87C6
cmp   r1,r7                         ; 080E87C8
bne   @@Code080E87E0                ; 080E87CA
cmp   r0,r6                         ; 080E87CC
bls   @@Code080E87E0                ; 080E87CE
@@Code080E87D0:
mov   r0,0x1                        ; 080E87D0
mov   r1,0x0                        ; 080E87D2
ldr   r4,[sp,0x6C]                  ; 080E87D4
ldr   r5,[sp,0x70]                  ; 080E87D6
add   r4,r4,r0                      ; 080E87D8
adc   r5,r1                         ; 080E87DA
str   r4,[sp,0x6C]                  ; 080E87DC
str   r5,[sp,0x70]                  ; 080E87DE
@@Code080E87E0:
mov   r0,r3                         ; 080E87E0
mov   r2,r0                         ; 080E87E2
mov   r3,0x0                        ; 080E87E4
mov   r5,r3                         ; 080E87E6
mov   r4,r2                         ; 080E87E8
ldr   r0,[sp,0x64]                  ; 080E87EA
ldr   r1,[sp,0x68]                  ; 080E87EC
add   r4,r4,r0                      ; 080E87EE
adc   r5,r1                         ; 080E87F0
ldr   r1,[sp,0x6C]                  ; 080E87F2
ldr   r2,[sp,0x70]                  ; 080E87F4
add   r4,r4,r1                      ; 080E87F6
adc   r5,r2                         ; 080E87F8
mov   r0,r8                         ; 080E87FA
ldr   r2,[r0,0x8]                   ; 080E87FC
ldr   r0,[sp,0x1C]                  ; 080E87FE
add   r2,r2,r0                      ; 080E8800
str   r2,[sp,0x30]                  ; 080E8802
mov   r0,r8                         ; 080E8804
ldr   r1,[r0,0x4]                   ; 080E8806
ldr   r0,[sp,0x18]                  ; 080E8808
eor   r1,r0                         ; 080E880A
neg   r0,r1                         ; 080E880C
orr   r0,r1                         ; 080E880E
lsr   r0,r0,0x1F                    ; 080E8810
str   r0,[sp,0x2C]                  ; 080E8812
add   r2,0x4                        ; 080E8814
str   r2,[sp,0x30]                  ; 080E8816
ldr   r0,=0x1FFFFFFF                ; 080E8818
cmp   r5,r0                         ; 080E881A
bls   @@Code080E8862                ; 080E881C
mov   r1,0x1                        ; 080E881E
mov   r9,r1                         ; 080E8820
mov   r8,r0                         ; 080E8822
mov   r12,r2                        ; 080E8824
@@Code080E8826:
mov   r2,0x1                        ; 080E8826
add   r12,r2                        ; 080E8828
mov   r0,r9                         ; 080E882A
and   r0,r4                         ; 080E882C
cmp   r0,0x0                        ; 080E882E
beq   @@Code080E884C                ; 080E8830
lsl   r3,r7,0x1F                    ; 080E8832
lsr   r2,r6,0x1                     ; 080E8834
mov   r0,r3                         ; 080E8836
orr   r0,r2                         ; 080E8838
lsr   r1,r7,0x1                     ; 080E883A
mov   r7,r1                         ; 080E883C
mov   r6,r0                         ; 080E883E
mov   r0,r6                         ; 080E8840
mov   r1,0x80                       ; 080E8842
lsl   r1,r1,0x18                    ; 080E8844
orr   r1,r7                         ; 080E8846
mov   r7,r1                         ; 080E8848
mov   r6,r0                         ; 080E884A
@@Code080E884C:
lsl   r3,r5,0x1F                    ; 080E884C
lsr   r2,r4,0x1                     ; 080E884E
mov   r0,r3                         ; 080E8850
orr   r0,r2                         ; 080E8852
lsr   r1,r5,0x1                     ; 080E8854
mov   r5,r1                         ; 080E8856
mov   r4,r0                         ; 080E8858
cmp   r5,r8                         ; 080E885A
bhi   @@Code080E8826                ; 080E885C
mov   r0,r12                        ; 080E885E
str   r0,[sp,0x30]                  ; 080E8860
@@Code080E8862:
ldr   r0,=0x0FFFFFFF                ; 080E8862
cmp   r5,r0                         ; 080E8864
bhi   @@Code080E88B4                ; 080E8866
mov   r1,0x80                       ; 080E8868
lsl   r1,r1,0x18                    ; 080E886A
mov   r9,r1                         ; 080E886C
mov   r8,r0                         ; 080E886E
ldr   r2,[sp,0x30]                  ; 080E8870
mov   r12,r2                        ; 080E8872
@@Code080E8874:
mov   r0,0x1                        ; 080E8874
neg   r0,r0                         ; 080E8876
add   r12,r0                        ; 080E8878
lsr   r3,r4,0x1F                    ; 080E887A
lsl   r2,r5,0x1                     ; 080E887C
mov   r1,r3                         ; 080E887E
orr   r1,r2                         ; 080E8880
lsl   r0,r4,0x1                     ; 080E8882
mov   r5,r1                         ; 080E8884
mov   r4,r0                         ; 080E8886
mov   r0,0x0                        ; 080E8888
mov   r1,r9                         ; 080E888A
and   r1,r7                         ; 080E888C
orr   r0,r1                         ; 080E888E
cmp   r0,0x0                        ; 080E8890
beq   @@Code080E889E                ; 080E8892
mov   r0,0x1                        ; 080E8894
orr   r0,r4                         ; 080E8896
mov   r1,r5                         ; 080E8898
mov   r5,r1                         ; 080E889A
mov   r4,r0                         ; 080E889C
@@Code080E889E:
lsr   r3,r6,0x1F                    ; 080E889E
lsl   r2,r7,0x1                     ; 080E88A0
mov   r1,r3                         ; 080E88A2
orr   r1,r2                         ; 080E88A4
lsl   r0,r6,0x1                     ; 080E88A6
mov   r7,r1                         ; 080E88A8
mov   r6,r0                         ; 080E88AA
cmp   r5,r8                         ; 080E88AC
bls   @@Code080E8874                ; 080E88AE
mov   r1,r12                        ; 080E88B0
str   r1,[sp,0x30]                  ; 080E88B2
@@Code080E88B4:
mov   r0,0xFF                       ; 080E88B4
mov   r1,r4                         ; 080E88B6
and   r1,r0                         ; 080E88B8
mov   r2,0x0                        ; 080E88BA
cmp   r1,0x80                       ; 080E88BC
bne   @@Code080E88E2                ; 080E88BE
cmp   r2,0x0                        ; 080E88C0
bne   @@Code080E88E2                ; 080E88C2
add   r0,0x1                        ; 080E88C4
mov   r1,r4                         ; 080E88C6
and   r1,r0                         ; 080E88C8
mov   r0,r2                         ; 080E88CA
orr   r0,r1                         ; 080E88CC
cmp   r0,0x0                        ; 080E88CE
bne   @@Code080E88DA                ; 080E88D0
mov   r0,r7                         ; 080E88D2
orr   r0,r6                         ; 080E88D4
cmp   r0,0x0                        ; 080E88D6
beq   @@Code080E88E2                ; 080E88D8
@@Code080E88DA:
mov   r0,0x80                       ; 080E88DA
mov   r1,0x0                        ; 080E88DC
add   r4,r4,r0                      ; 080E88DE
adc   r5,r1                         ; 080E88E0
@@Code080E88E2:
str   r4,[sp,0x34]                  ; 080E88E2
str   r5,[sp,0x38]                  ; 080E88E4
mov   r0,0x3                        ; 080E88E6
mov   r2,r10                        ; 080E88E8
str   r0,[r2]                       ; 080E88EA
add   r0,sp,0x28                    ; 080E88EC
@@Code080E88EE:
bl    Sub080E8174                   ; 080E88EE
add   sp,0x74                       ; 080E88F2
pop   {r3-r5}                       ; 080E88F4
mov   r8,r3                         ; 080E88F6
mov   r9,r4                         ; 080E88F8
mov   r10,r5                        ; 080E88FA
pop   {r4-r7,pc}                    ; 080E88FC
.align 4
@@_0a: .d32 0x0                     ; 080E8800
.pool                               ; 080E8804

push  {r4-r7,lr}                    ; 080E8910
add   sp,-0x48                      ; 080E8912
str   r0,[sp,0x28]                  ; 080E8914
str   r1,[sp,0x2C]                  ; 080E8916
str   r2,[sp,0x30]                  ; 080E8918
str   r3,[sp,0x34]                  ; 080E891A
add   r0,sp,0x28                    ; 080E891C
mov   r1,sp                         ; 080E891E
bl    Sub080E82BC                   ; 080E8920
add   r0,sp,0x30                    ; 080E8924
add   r4,sp,0x14                    ; 080E8926
mov   r1,r4                         ; 080E8928
bl    Sub080E82BC                   ; 080E892A
mov   r12,sp                        ; 080E892E
mov   r0,0x0                        ; 080E8930
ldr   r3,[sp]                       ; 080E8932
cmp   r3,0x1                        ; 080E8934
bhi   @@Code080E893A                ; 080E8936
mov   r0,0x1                        ; 080E8938
@@Code080E893A:
cmp   r0,0x0                        ; 080E893A
beq   @@Code080E8942                ; 080E893C
mov   r1,sp                         ; 080E893E
b     @@Code080E8A84                ; 080E8940
@@Code080E8942:
mov   r0,0x0                        ; 080E8942
ldr   r2,[sp,0x14]                  ; 080E8944
mov   r5,r2                         ; 080E8946
cmp   r2,0x1                        ; 080E8948
bhi   @@Code080E894E                ; 080E894A
mov   r0,0x1                        ; 080E894C
@@Code080E894E:
cmp   r0,0x0                        ; 080E894E
beq   @@Code080E8956                ; 080E8950
mov   r1,r4                         ; 080E8952
b     @@Code080E8A84                ; 080E8954
@@Code080E8956:
ldr   r0,[sp,0x4]                   ; 080E8956
ldr   r1,[sp,0x18]                  ; 080E8958
eor   r0,r1                         ; 080E895A
str   r0,[sp,0x4]                   ; 080E895C
mov   r0,0x0                        ; 080E895E
cmp   r3,0x4                        ; 080E8960
bne   @@Code080E8966                ; 080E8962
mov   r0,0x1                        ; 080E8964
@@Code080E8966:
cmp   r0,0x0                        ; 080E8966
bne   @@Code080E8976                ; 080E8968
mov   r4,0x0                        ; 080E896A
cmp   r3,0x2                        ; 080E896C
bne   @@Code080E8972                ; 080E896E
mov   r4,0x1                        ; 080E8970
@@Code080E8972:
cmp   r4,0x0                        ; 080E8972
beq   @@Code080E8988                ; 080E8974
@@Code080E8976:
mov   r1,r12                        ; 080E8976
ldr   r0,[r1]                       ; 080E8978
cmp   r0,r5                         ; 080E897A
beq   @@Code080E8980                ; 080E897C
b     @@Code080E8A84                ; 080E897E
@@Code080E8980:
ldr   r1,=0x03002210                ; 080E8980
b     @@Code080E8A84                ; 080E8982
.pool                               ; 080E8984

@@Code080E8988:
mov   r0,0x0                        ; 080E8988
cmp   r2,0x4                        ; 080E898A
bne   @@Code080E8990                ; 080E898C
mov   r0,0x1                        ; 080E898E
@@Code080E8990:
cmp   r0,0x0                        ; 080E8990
beq   @@Code080E89A2                ; 080E8992
mov   r0,0x0                        ; 080E8994
mov   r1,0x0                        ; 080E8996
str   r0,[sp,0xC]                   ; 080E8998
str   r1,[sp,0x10]                  ; 080E899A
str   r4,[sp,0x8]                   ; 080E899C
mov   r1,sp                         ; 080E899E
b     @@Code080E8A84                ; 080E89A0
@@Code080E89A2:
mov   r0,0x0                        ; 080E89A2
cmp   r2,0x2                        ; 080E89A4
bne   @@Code080E89AA                ; 080E89A6
mov   r0,0x1                        ; 080E89A8
@@Code080E89AA:
cmp   r0,0x0                        ; 080E89AA
beq   @@Code080E89B6                ; 080E89AC
mov   r0,0x4                        ; 080E89AE
mov   r2,r12                        ; 080E89B0
str   r0,[r2]                       ; 080E89B2
b     @@Code080E8A82                ; 080E89B4
@@Code080E89B6:
mov   r3,r12                        ; 080E89B6
ldr   r1,[r3,0x8]                   ; 080E89B8
ldr   r0,[sp,0x1C]                  ; 080E89BA
sub   r6,r1,r0                      ; 080E89BC
str   r6,[r3,0x8]                   ; 080E89BE
ldr   r4,[r3,0xC]                   ; 080E89C0
ldr   r5,[r3,0x10]                  ; 080E89C2
ldr   r0,[sp,0x20]                  ; 080E89C4
ldr   r1,[sp,0x24]                  ; 080E89C6
str   r0,[sp,0x38]                  ; 080E89C8
str   r1,[sp,0x3C]                  ; 080E89CA
cmp   r1,r5                         ; 080E89CC
bhi   @@Code080E89DA                ; 080E89CE
ldr   r1,[sp,0x3C]                  ; 080E89D0
cmp   r1,r5                         ; 080E89D2
bne   @@Code080E89EE                ; 080E89D4
cmp   r0,r4                         ; 080E89D6
bls   @@Code080E89EE                ; 080E89D8
@@Code080E89DA:
lsr   r3,r4,0x1F                    ; 080E89DA
lsl   r2,r5,0x1                     ; 080E89DC
mov   r1,r3                         ; 080E89DE
orr   r1,r2                         ; 080E89E0
lsl   r0,r4,0x1                     ; 080E89E2
mov   r5,r1                         ; 080E89E4
mov   r4,r0                         ; 080E89E6
sub   r0,r6,0x1                     ; 080E89E8
mov   r2,r12                        ; 080E89EA
str   r0,[r2,0x8]                   ; 080E89EC
@@Code080E89EE:
ldr   r7,=0x10000000                ; 080E89EE
ldr   r6,[@@_0b]                    ; 080E89F0
mov   r0,0x0                        ; 080E89F2
mov   r1,0x0                        ; 080E89F4
str   r0,[sp,0x40]                  ; 080E89F6
str   r1,[sp,0x44]                  ; 080E89F8
@@Code080E89FA:
ldr   r1,[sp,0x3C]                  ; 080E89FA
cmp   r1,r5                         ; 080E89FC
bhi   @@Code080E8A1E                ; 080E89FE
cmp   r1,r5                         ; 080E8A00
bne   @@Code080E8A0A                ; 080E8A02
ldr   r2,[sp,0x38]                  ; 080E8A04
cmp   r2,r4                         ; 080E8A06
bhi   @@Code080E8A1E                ; 080E8A08
@@Code080E8A0A:
ldr   r0,[sp,0x40]                  ; 080E8A0A
orr   r0,r6                         ; 080E8A0C
ldr   r1,[sp,0x44]                  ; 080E8A0E
orr   r1,r7                         ; 080E8A10
str   r0,[sp,0x40]                  ; 080E8A12
str   r1,[sp,0x44]                  ; 080E8A14
ldr   r0,[sp,0x38]                  ; 080E8A16
ldr   r1,[sp,0x3C]                  ; 080E8A18
sub   r4,r4,r0                      ; 080E8A1A
sbc   r5,r1                         ; 080E8A1C
@@Code080E8A1E:
lsl   r3,r7,0x1F                    ; 080E8A1E
lsr   r2,r6,0x1                     ; 080E8A20
mov   r0,r3                         ; 080E8A22
orr   r0,r2                         ; 080E8A24
lsr   r1,r7,0x1                     ; 080E8A26
mov   r7,r1                         ; 080E8A28
mov   r6,r0                         ; 080E8A2A
lsr   r3,r4,0x1F                    ; 080E8A2C
lsl   r2,r5,0x1                     ; 080E8A2E
mov   r1,r3                         ; 080E8A30
orr   r1,r2                         ; 080E8A32
lsl   r0,r4,0x1                     ; 080E8A34
mov   r5,r1                         ; 080E8A36
mov   r4,r0                         ; 080E8A38
mov   r0,r7                         ; 080E8A3A
orr   r0,r6                         ; 080E8A3C
cmp   r0,0x0                        ; 080E8A3E
bne   @@Code080E89FA                ; 080E8A40
mov   r0,0xFF                       ; 080E8A42
ldr   r1,[sp,0x40]                  ; 080E8A44
and   r1,r0                         ; 080E8A46
mov   r2,0x0                        ; 080E8A48
cmp   r1,0x80                       ; 080E8A4A
bne   @@Code080E8A78                ; 080E8A4C
cmp   r2,0x0                        ; 080E8A4E
bne   @@Code080E8A78                ; 080E8A50
add   r0,0x1                        ; 080E8A52
ldr   r1,[sp,0x40]                  ; 080E8A54
and   r1,r0                         ; 080E8A56
mov   r0,r2                         ; 080E8A58
orr   r0,r1                         ; 080E8A5A
cmp   r0,0x0                        ; 080E8A5C
bne   @@Code080E8A68                ; 080E8A5E
mov   r0,r5                         ; 080E8A60
orr   r0,r4                         ; 080E8A62
cmp   r0,0x0                        ; 080E8A64
beq   @@Code080E8A78                ; 080E8A66
@@Code080E8A68:
mov   r0,0x80                       ; 080E8A68
mov   r1,0x0                        ; 080E8A6A
ldr   r2,[sp,0x40]                  ; 080E8A6C
ldr   r3,[sp,0x44]                  ; 080E8A6E
add   r2,r2,r0                      ; 080E8A70
adc   r3,r1                         ; 080E8A72
str   r2,[sp,0x40]                  ; 080E8A74
str   r3,[sp,0x44]                  ; 080E8A76
@@Code080E8A78:
ldr   r0,[sp,0x40]                  ; 080E8A78
ldr   r1,[sp,0x44]                  ; 080E8A7A
mov   r2,r12                        ; 080E8A7C
str   r0,[r2,0xC]                   ; 080E8A7E
str   r1,[r2,0x10]                  ; 080E8A80
@@Code080E8A82:
mov   r1,r12                        ; 080E8A82
@@Code080E8A84:
mov   r0,r1                         ; 080E8A84
bl    Sub080E8174                   ; 080E8A86
add   sp,0x48                       ; 080E8A8A
pop   {r4-r7,pc}                    ; 080E8A8C
.align 4
@@_0b: .d32 0x0                     ; 080E8A90
.pool                               ; 080E8A94

Sub080E8A98:
push  {r4-r6,lr}                    ; 080E8A98
mov   r5,r0                         ; 080E8A9A
mov   r6,r1                         ; 080E8A9C
mov   r0,0x0                        ; 080E8A9E
ldr   r1,[r5]                       ; 080E8AA0
cmp   r1,0x1                        ; 080E8AA2
bhi   @@Code080E8AA8                ; 080E8AA4
mov   r0,0x1                        ; 080E8AA6
@@Code080E8AA8:
cmp   r0,0x0                        ; 080E8AA8
bne   @@Code080E8ABA                ; 080E8AAA
mov   r0,0x0                        ; 080E8AAC
ldr   r2,[r6]                       ; 080E8AAE
cmp   r2,0x1                        ; 080E8AB0
bhi   @@Code080E8AB6                ; 080E8AB2
mov   r0,0x1                        ; 080E8AB4
@@Code080E8AB6:
cmp   r0,0x0                        ; 080E8AB6
beq   @@Code080E8ABE                ; 080E8AB8
@@Code080E8ABA:
mov   r0,0x1                        ; 080E8ABA
b     @@Code080E8B94                ; 080E8ABC
@@Code080E8ABE:
mov   r0,0x0                        ; 080E8ABE
cmp   r1,0x4                        ; 080E8AC0
bne   @@Code080E8AC6                ; 080E8AC2
mov   r0,0x1                        ; 080E8AC4
@@Code080E8AC6:
cmp   r0,0x0                        ; 080E8AC6
beq   @@Code080E8ADE                ; 080E8AC8
mov   r0,0x0                        ; 080E8ACA
cmp   r2,0x4                        ; 080E8ACC
bne   @@Code080E8AD2                ; 080E8ACE
mov   r0,0x1                        ; 080E8AD0
@@Code080E8AD2:
cmp   r0,0x0                        ; 080E8AD2
beq   @@Code080E8ADE                ; 080E8AD4
ldr   r0,[r6,0x4]                   ; 080E8AD6
ldr   r1,[r5,0x4]                   ; 080E8AD8
sub   r0,r0,r1                      ; 080E8ADA
b     @@Code080E8B94                ; 080E8ADC
@@Code080E8ADE:
mov   r1,0x0                        ; 080E8ADE
ldr   r0,[r5]                       ; 080E8AE0
cmp   r0,0x4                        ; 080E8AE2
bne   @@Code080E8AE8                ; 080E8AE4
mov   r1,0x1                        ; 080E8AE6
@@Code080E8AE8:
cmp   r1,0x0                        ; 080E8AE8
bne   @@Code080E8B36                ; 080E8AEA
mov   r1,0x0                        ; 080E8AEC
cmp   r2,0x4                        ; 080E8AEE
bne   @@Code080E8AF4                ; 080E8AF0
mov   r1,0x1                        ; 080E8AF2
@@Code080E8AF4:
cmp   r1,0x0                        ; 080E8AF4
beq   @@Code080E8B06                ; 080E8AF6
@@Code080E8AF8:
ldr   r0,[r6,0x4]                   ; 080E8AF8
mov   r1,0x1                        ; 080E8AFA
neg   r1,r1                         ; 080E8AFC
cmp   r0,0x0                        ; 080E8AFE
beq   @@Code080E8B40                ; 080E8B00
mov   r1,0x1                        ; 080E8B02
b     @@Code080E8B40                ; 080E8B04
@@Code080E8B06:
mov   r1,0x0                        ; 080E8B06
cmp   r0,0x2                        ; 080E8B08
bne   @@Code080E8B0E                ; 080E8B0A
mov   r1,0x1                        ; 080E8B0C
@@Code080E8B0E:
cmp   r1,0x0                        ; 080E8B0E
beq   @@Code080E8B1E                ; 080E8B10
mov   r1,0x0                        ; 080E8B12
cmp   r2,0x2                        ; 080E8B14
bne   @@Code080E8B1A                ; 080E8B16
mov   r1,0x1                        ; 080E8B18
@@Code080E8B1A:
cmp   r1,0x0                        ; 080E8B1A
bne   @@Code080E8B92                ; 080E8B1C
@@Code080E8B1E:
mov   r1,0x0                        ; 080E8B1E
cmp   r0,0x2                        ; 080E8B20
bne   @@Code080E8B26                ; 080E8B22
mov   r1,0x1                        ; 080E8B24
@@Code080E8B26:
cmp   r1,0x0                        ; 080E8B26
bne   @@Code080E8AF8                ; 080E8B28
mov   r0,0x0                        ; 080E8B2A
cmp   r2,0x2                        ; 080E8B2C
bne   @@Code080E8B32                ; 080E8B2E
mov   r0,0x1                        ; 080E8B30
@@Code080E8B32:
cmp   r0,0x0                        ; 080E8B32
beq   @@Code080E8B44                ; 080E8B34
@@Code080E8B36:
ldr   r0,[r5,0x4]                   ; 080E8B36
mov   r1,0x1                        ; 080E8B38
cmp   r0,0x0                        ; 080E8B3A
beq   @@Code080E8B40                ; 080E8B3C
sub   r1,0x2                        ; 080E8B3E
@@Code080E8B40:
mov   r0,r1                         ; 080E8B40
b     @@Code080E8B94                ; 080E8B42
@@Code080E8B44:
ldr   r0,[r6,0x4]                   ; 080E8B44
ldr   r4,[r5,0x4]                   ; 080E8B46
cmp   r4,r0                         ; 080E8B48
beq   @@Code080E8B56                ; 080E8B4A
@@Code080E8B4C:
mov   r0,0x1                        ; 080E8B4C
cmp   r4,0x0                        ; 080E8B4E
beq   @@Code080E8B94                ; 080E8B50
sub   r0,0x2                        ; 080E8B52
b     @@Code080E8B94                ; 080E8B54
@@Code080E8B56:
ldr   r1,[r5,0x8]                   ; 080E8B56
ldr   r0,[r6,0x8]                   ; 080E8B58
cmp   r1,r0                         ; 080E8B5A
bgt   @@Code080E8B4C                ; 080E8B5C
cmp   r1,r0                         ; 080E8B5E
bge   @@Code080E8B6E                ; 080E8B60
@@Code080E8B62:
mov   r0,0x1                        ; 080E8B62
neg   r0,r0                         ; 080E8B64
cmp   r4,0x0                        ; 080E8B66
beq   @@Code080E8B94                ; 080E8B68
mov   r0,0x1                        ; 080E8B6A
b     @@Code080E8B94                ; 080E8B6C
@@Code080E8B6E:
ldr   r3,[r5,0x10]                  ; 080E8B6E
ldr   r2,[r6,0x10]                  ; 080E8B70
cmp   r3,r2                         ; 080E8B72
bhi   @@Code080E8B4C                ; 080E8B74
cmp   r3,r2                         ; 080E8B76
bne   @@Code080E8B82                ; 080E8B78
ldr   r1,[r5,0xC]                   ; 080E8B7A
ldr   r0,[r6,0xC]                   ; 080E8B7C
cmp   r1,r0                         ; 080E8B7E
bhi   @@Code080E8B4C                ; 080E8B80
@@Code080E8B82:
cmp   r2,r3                         ; 080E8B82
bhi   @@Code080E8B62                ; 080E8B84
cmp   r2,r3                         ; 080E8B86
bne   @@Code080E8B92                ; 080E8B88
ldr   r1,[r6,0xC]                   ; 080E8B8A
ldr   r0,[r5,0xC]                   ; 080E8B8C
cmp   r1,r0                         ; 080E8B8E
bhi   @@Code080E8B62                ; 080E8B90
@@Code080E8B92:
mov   r0,0x0                        ; 080E8B92
@@Code080E8B94:
pop   {r4-r6,pc}                    ; 080E8B94
.pool                               ; 080E8B96

push  {r4,lr}                       ; 080E8B98
add   sp,-0x38                      ; 080E8B9A
str   r0,[sp,0x28]                  ; 080E8B9C
str   r1,[sp,0x2C]                  ; 080E8B9E
str   r2,[sp,0x30]                  ; 080E8BA0
str   r3,[sp,0x34]                  ; 080E8BA2
add   r0,sp,0x28                    ; 080E8BA4
mov   r1,sp                         ; 080E8BA6
bl    Sub080E82BC                   ; 080E8BA8
add   r0,sp,0x30                    ; 080E8BAC
add   r4,sp,0x14                    ; 080E8BAE
mov   r1,r4                         ; 080E8BB0
bl    Sub080E82BC                   ; 080E8BB2
mov   r0,sp                         ; 080E8BB6
mov   r1,r4                         ; 080E8BB8
bl    Sub080E8A98                   ; 080E8BBA
add   sp,0x38                       ; 080E8BBE
pop   {r4,pc}                       ; 080E8BC0
.pool                               ; 080E8BC2

push  {r4,lr}                       ; 080E8BC4
add   sp,-0x38                      ; 080E8BC6
str   r0,[sp,0x28]                  ; 080E8BC8
str   r1,[sp,0x2C]                  ; 080E8BCA
str   r2,[sp,0x30]                  ; 080E8BCC
str   r3,[sp,0x34]                  ; 080E8BCE
add   r0,sp,0x28                    ; 080E8BD0
mov   r1,sp                         ; 080E8BD2
bl    Sub080E82BC                   ; 080E8BD4
add   r0,sp,0x30                    ; 080E8BD8
add   r4,sp,0x14                    ; 080E8BDA
mov   r1,r4                         ; 080E8BDC
bl    Sub080E82BC                   ; 080E8BDE
mov   r1,0x0                        ; 080E8BE2
ldr   r0,[sp]                       ; 080E8BE4
cmp   r0,0x1                        ; 080E8BE6
bhi   @@Code080E8BEC                ; 080E8BE8
mov   r1,0x1                        ; 080E8BEA
@@Code080E8BEC:
cmp   r1,0x0                        ; 080E8BEC
bne   @@Code080E8BFE                ; 080E8BEE
mov   r1,0x0                        ; 080E8BF0
ldr   r0,[sp,0x14]                  ; 080E8BF2
cmp   r0,0x1                        ; 080E8BF4
bhi   @@Code080E8BFA                ; 080E8BF6
mov   r1,0x1                        ; 080E8BF8
@@Code080E8BFA:
cmp   r1,0x0                        ; 080E8BFA
beq   @@Code080E8C02                ; 080E8BFC
@@Code080E8BFE:
mov   r0,0x1                        ; 080E8BFE
b     @@Code080E8C0A                ; 080E8C00
@@Code080E8C02:
mov   r0,sp                         ; 080E8C02
mov   r1,r4                         ; 080E8C04
bl    Sub080E8A98                   ; 080E8C06
@@Code080E8C0A:
add   sp,0x38                       ; 080E8C0A
pop   {r4,pc}                       ; 080E8C0C
.pool                               ; 080E8C0E

push  {r4,lr}                       ; 080E8C10
add   sp,-0x38                      ; 080E8C12
str   r0,[sp,0x28]                  ; 080E8C14
str   r1,[sp,0x2C]                  ; 080E8C16
str   r2,[sp,0x30]                  ; 080E8C18
str   r3,[sp,0x34]                  ; 080E8C1A
add   r0,sp,0x28                    ; 080E8C1C
mov   r1,sp                         ; 080E8C1E
bl    Sub080E82BC                   ; 080E8C20
add   r0,sp,0x30                    ; 080E8C24
add   r4,sp,0x14                    ; 080E8C26
mov   r1,r4                         ; 080E8C28
bl    Sub080E82BC                   ; 080E8C2A
mov   r1,0x0                        ; 080E8C2E
ldr   r0,[sp]                       ; 080E8C30
cmp   r0,0x1                        ; 080E8C32
bhi   @@Code080E8C38                ; 080E8C34
mov   r1,0x1                        ; 080E8C36
@@Code080E8C38:
cmp   r1,0x0                        ; 080E8C38
bne   @@Code080E8C4A                ; 080E8C3A
mov   r1,0x0                        ; 080E8C3C
ldr   r0,[sp,0x14]                  ; 080E8C3E
cmp   r0,0x1                        ; 080E8C40
bhi   @@Code080E8C46                ; 080E8C42
mov   r1,0x1                        ; 080E8C44
@@Code080E8C46:
cmp   r1,0x0                        ; 080E8C46
beq   @@Code080E8C4E                ; 080E8C48
@@Code080E8C4A:
mov   r0,0x1                        ; 080E8C4A
b     @@Code080E8C56                ; 080E8C4C
@@Code080E8C4E:
mov   r0,sp                         ; 080E8C4E
mov   r1,r4                         ; 080E8C50
bl    Sub080E8A98                   ; 080E8C52
@@Code080E8C56:
add   sp,0x38                       ; 080E8C56
pop   {r4,pc}                       ; 080E8C58
.pool                               ; 080E8C5A

push  {r4,lr}                       ; 080E8C5C
add   sp,-0x38                      ; 080E8C5E
str   r0,[sp,0x28]                  ; 080E8C60
str   r1,[sp,0x2C]                  ; 080E8C62
str   r2,[sp,0x30]                  ; 080E8C64
str   r3,[sp,0x34]                  ; 080E8C66
add   r0,sp,0x28                    ; 080E8C68
mov   r1,sp                         ; 080E8C6A
bl    Sub080E82BC                   ; 080E8C6C
add   r0,sp,0x30                    ; 080E8C70
add   r4,sp,0x14                    ; 080E8C72
mov   r1,r4                         ; 080E8C74
bl    Sub080E82BC                   ; 080E8C76
mov   r1,0x0                        ; 080E8C7A
ldr   r0,[sp]                       ; 080E8C7C
cmp   r0,0x1                        ; 080E8C7E
bhi   @@Code080E8C84                ; 080E8C80
mov   r1,0x1                        ; 080E8C82
@@Code080E8C84:
cmp   r1,0x0                        ; 080E8C84
bne   @@Code080E8C96                ; 080E8C86
mov   r1,0x0                        ; 080E8C88
ldr   r0,[sp,0x14]                  ; 080E8C8A
cmp   r0,0x1                        ; 080E8C8C
bhi   @@Code080E8C92                ; 080E8C8E
mov   r1,0x1                        ; 080E8C90
@@Code080E8C92:
cmp   r1,0x0                        ; 080E8C92
beq   @@Code080E8C9C                ; 080E8C94
@@Code080E8C96:
mov   r0,0x1                        ; 080E8C96
neg   r0,r0                         ; 080E8C98
b     @@Code080E8CA4                ; 080E8C9A
@@Code080E8C9C:
mov   r0,sp                         ; 080E8C9C
mov   r1,r4                         ; 080E8C9E
bl    Sub080E8A98                   ; 080E8CA0
@@Code080E8CA4:
add   sp,0x38                       ; 080E8CA4
pop   {r4,pc}                       ; 080E8CA6

Sub080E8CA8:
push  {r4,lr}                       ; 080E8CA8
add   sp,-0x38                      ; 080E8CAA
str   r0,[sp,0x28]                  ; 080E8CAC
str   r1,[sp,0x2C]                  ; 080E8CAE
str   r2,[sp,0x30]                  ; 080E8CB0
str   r3,[sp,0x34]                  ; 080E8CB2
add   r0,sp,0x28                    ; 080E8CB4
mov   r1,sp                         ; 080E8CB6
bl    Sub080E82BC                   ; 080E8CB8
add   r0,sp,0x30                    ; 080E8CBC
add   r4,sp,0x14                    ; 080E8CBE
mov   r1,r4                         ; 080E8CC0
bl    Sub080E82BC                   ; 080E8CC2
mov   r1,0x0                        ; 080E8CC6
ldr   r0,[sp]                       ; 080E8CC8
cmp   r0,0x1                        ; 080E8CCA
bhi   @@Code080E8CD0                ; 080E8CCC
mov   r1,0x1                        ; 080E8CCE
@@Code080E8CD0:
cmp   r1,0x0                        ; 080E8CD0
bne   @@Code080E8CE2                ; 080E8CD2
mov   r1,0x0                        ; 080E8CD4
ldr   r0,[sp,0x14]                  ; 080E8CD6
cmp   r0,0x1                        ; 080E8CD8
bhi   @@Code080E8CDE                ; 080E8CDA
mov   r1,0x1                        ; 080E8CDC
@@Code080E8CDE:
cmp   r1,0x0                        ; 080E8CDE
beq   @@Code080E8CE8                ; 080E8CE0
@@Code080E8CE2:
mov   r0,0x1                        ; 080E8CE2
neg   r0,r0                         ; 080E8CE4
b     @@Code080E8CF0                ; 080E8CE6
@@Code080E8CE8:
mov   r0,sp                         ; 080E8CE8
mov   r1,r4                         ; 080E8CEA
bl    Sub080E8A98                   ; 080E8CEC
@@Code080E8CF0:
add   sp,0x38                       ; 080E8CF0
pop   {r4,pc}                       ; 080E8CF2

push  {r4,lr}                       ; 080E8CF4
add   sp,-0x38                      ; 080E8CF6
str   r0,[sp,0x28]                  ; 080E8CF8
str   r1,[sp,0x2C]                  ; 080E8CFA
str   r2,[sp,0x30]                  ; 080E8CFC
str   r3,[sp,0x34]                  ; 080E8CFE
add   r0,sp,0x28                    ; 080E8D00
mov   r1,sp                         ; 080E8D02
bl    Sub080E82BC                   ; 080E8D04
add   r0,sp,0x30                    ; 080E8D08
add   r4,sp,0x14                    ; 080E8D0A
mov   r1,r4                         ; 080E8D0C
bl    Sub080E82BC                   ; 080E8D0E
mov   r1,0x0                        ; 080E8D12
ldr   r0,[sp]                       ; 080E8D14
cmp   r0,0x1                        ; 080E8D16
bhi   @@Code080E8D1C                ; 080E8D18
mov   r1,0x1                        ; 080E8D1A
@@Code080E8D1C:
cmp   r1,0x0                        ; 080E8D1C
bne   @@Code080E8D2E                ; 080E8D1E
mov   r1,0x0                        ; 080E8D20
ldr   r0,[sp,0x14]                  ; 080E8D22
cmp   r0,0x1                        ; 080E8D24
bhi   @@Code080E8D2A                ; 080E8D26
mov   r1,0x1                        ; 080E8D28
@@Code080E8D2A:
cmp   r1,0x0                        ; 080E8D2A
beq   @@Code080E8D32                ; 080E8D2C
@@Code080E8D2E:
mov   r0,0x1                        ; 080E8D2E
b     @@Code080E8D3A                ; 080E8D30
@@Code080E8D32:
mov   r0,sp                         ; 080E8D32
mov   r1,r4                         ; 080E8D34
bl    Sub080E8A98                   ; 080E8D36
@@Code080E8D3A:
add   sp,0x38                       ; 080E8D3A
pop   {r4,pc}                       ; 080E8D3C
.pool                               ; 080E8D3E

push  {r4,lr}                       ; 080E8D40
add   sp,-0x38                      ; 080E8D42
str   r0,[sp,0x28]                  ; 080E8D44
str   r1,[sp,0x2C]                  ; 080E8D46
str   r2,[sp,0x30]                  ; 080E8D48
str   r3,[sp,0x34]                  ; 080E8D4A
add   r0,sp,0x28                    ; 080E8D4C
mov   r1,sp                         ; 080E8D4E
bl    Sub080E82BC                   ; 080E8D50
add   r0,sp,0x30                    ; 080E8D54
add   r4,sp,0x14                    ; 080E8D56
mov   r1,r4                         ; 080E8D58
bl    Sub080E82BC                   ; 080E8D5A
mov   r1,0x0                        ; 080E8D5E
ldr   r0,[sp]                       ; 080E8D60
cmp   r0,0x1                        ; 080E8D62
bhi   @@Code080E8D68                ; 080E8D64
mov   r1,0x1                        ; 080E8D66
@@Code080E8D68:
cmp   r1,0x0                        ; 080E8D68
bne   @@Code080E8D7A                ; 080E8D6A
mov   r1,0x0                        ; 080E8D6C
ldr   r0,[sp,0x14]                  ; 080E8D6E
cmp   r0,0x1                        ; 080E8D70
bhi   @@Code080E8D76                ; 080E8D72
mov   r1,0x1                        ; 080E8D74
@@Code080E8D76:
cmp   r1,0x0                        ; 080E8D76
beq   @@Code080E8D7E                ; 080E8D78
@@Code080E8D7A:
mov   r0,0x1                        ; 080E8D7A
b     @@Code080E8D86                ; 080E8D7C
@@Code080E8D7E:
mov   r0,sp                         ; 080E8D7E
mov   r1,r4                         ; 080E8D80
bl    Sub080E8A98                   ; 080E8D82
@@Code080E8D86:
add   sp,0x38                       ; 080E8D86
pop   {r4,pc}                       ; 080E8D88
.pool                               ; 080E8D8A

Sub080E8D8C:
push  {r4-r5,lr}                    ; 080E8D8C
add   sp,-0x14                      ; 080E8D8E
mov   r2,r0                         ; 080E8D90
mov   r0,0x3                        ; 080E8D92
str   r0,[sp]                       ; 080E8D94
lsr   r1,r2,0x1F                    ; 080E8D96
str   r1,[sp,0x4]                   ; 080E8D98
cmp   r2,0x0                        ; 080E8D9A
bne   @@Code080E8DA4                ; 080E8D9C
mov   r0,0x2                        ; 080E8D9E
str   r0,[sp]                       ; 080E8DA0
b     @@Code080E8DFA                ; 080E8DA2
@@Code080E8DA4:
mov   r0,0x3C                       ; 080E8DA4
str   r0,[sp,0x8]                   ; 080E8DA6
cmp   r1,0x0                        ; 080E8DA8
beq   @@Code080E8DCA                ; 080E8DAA
mov   r0,0x80                       ; 080E8DAC
lsl   r0,r0,0x18                    ; 080E8DAE
cmp   r2,r0                         ; 080E8DB0
bne   @@Code080E8DC4                ; 080E8DB2
ldr   r1,[@@_0]                     ; 080E8DB4
ldr   r0,=0xC1E00000                ; 080E8DB6
b     @@Code080E8E00                ; 080E8DB8
.pool                               ; 080E8DBA
@@_0: .d32 0x0                      ; 080E8DC0

@@Code080E8DC4:
neg   r0,r2                         ; 080E8DC4
asr   r1,r0,0x1F                    ; 080E8DC6
b     @@Code080E8DCE                ; 080E8DC8
@@Code080E8DCA:
mov   r0,r2                         ; 080E8DCA
asr   r1,r2,0x1F                    ; 080E8DCC
@@Code080E8DCE:
str   r0,[sp,0xC]                   ; 080E8DCE
str   r1,[sp,0x10]                  ; 080E8DD0
ldr   r0,[sp,0x10]                  ; 080E8DD2
ldr   r1,=0x0FFFFFFF                ; 080E8DD4
cmp   r0,r1                         ; 080E8DD6
bhi   @@Code080E8DFA                ; 080E8DD8
mov   r5,r1                         ; 080E8DDA
ldr   r4,[sp,0x8]                   ; 080E8DDC
@@Code080E8DDE:
ldr   r0,[sp,0xC]                   ; 080E8DDE
ldr   r1,[sp,0x10]                  ; 080E8DE0
lsr   r3,r0,0x1F                    ; 080E8DE2
lsl   r2,r1,0x1                     ; 080E8DE4
mov   r1,r3                         ; 080E8DE6
orr   r1,r2                         ; 080E8DE8
lsl   r0,r0,0x1                     ; 080E8DEA
str   r0,[sp,0xC]                   ; 080E8DEC
str   r1,[sp,0x10]                  ; 080E8DEE
sub   r4,0x1                        ; 080E8DF0
ldr   r0,[sp,0x10]                  ; 080E8DF2
cmp   r0,r5                         ; 080E8DF4
bls   @@Code080E8DDE                ; 080E8DF6
str   r4,[sp,0x8]                   ; 080E8DF8
@@Code080E8DFA:
mov   r0,sp                         ; 080E8DFA
bl    Sub080E8174                   ; 080E8DFC
@@Code080E8E00:
add   sp,0x14                       ; 080E8E00
pop   {r4-r5,pc}                    ; 080E8E02
.pool                               ; 080E8E04

Sub080E8E08:
push  {lr}                          ; 080E8E08
add   sp,-0x1C                      ; 080E8E0A
str   r0,[sp,0x14]                  ; 080E8E0C
str   r1,[sp,0x18]                  ; 080E8E0E
add   r0,sp,0x14                    ; 080E8E10
mov   r1,sp                         ; 080E8E12
bl    Sub080E82BC                   ; 080E8E14
mov   r1,0x0                        ; 080E8E18
ldr   r0,[sp]                       ; 080E8E1A
cmp   r0,0x2                        ; 080E8E1C
bne   @@Code080E8E22                ; 080E8E1E
mov   r1,0x1                        ; 080E8E20
@@Code080E8E22:
cmp   r1,0x0                        ; 080E8E22
bne   @@Code080E8E56                ; 080E8E24
mov   r1,0x0                        ; 080E8E26
cmp   r0,0x1                        ; 080E8E28
bhi   @@Code080E8E2E                ; 080E8E2A
mov   r1,0x1                        ; 080E8E2C
@@Code080E8E2E:
cmp   r1,0x0                        ; 080E8E2E
bne   @@Code080E8E56                ; 080E8E30
mov   r1,0x0                        ; 080E8E32
cmp   r0,0x4                        ; 080E8E34
bne   @@Code080E8E3A                ; 080E8E36
mov   r1,0x1                        ; 080E8E38
@@Code080E8E3A:
cmp   r1,0x0                        ; 080E8E3A
beq   @@Code080E8E50                ; 080E8E3C
@@Code080E8E3E:
ldr   r0,[sp,0x4]                   ; 080E8E3E
ldr   r1,=0x7FFFFFFF                ; 080E8E40
cmp   r0,0x0                        ; 080E8E42
beq   @@Code080E8E74                ; 080E8E44
add   r1,0x1                        ; 080E8E46
b     @@Code080E8E74                ; 080E8E48
.pool                               ; 080E8E4A

@@Code080E8E50:
ldr   r0,[sp,0x8]                   ; 080E8E50
cmp   r0,0x0                        ; 080E8E52
bge   @@Code080E8E5A                ; 080E8E54
@@Code080E8E56:
mov   r0,0x0                        ; 080E8E56
b     @@Code080E8E76                ; 080E8E58
@@Code080E8E5A:
cmp   r0,0x1E                       ; 080E8E5A
bgt   @@Code080E8E3E                ; 080E8E5C
mov   r2,0x3C                       ; 080E8E5E
sub   r2,r2,r0                      ; 080E8E60
ldr   r0,[sp,0xC]                   ; 080E8E62
ldr   r1,[sp,0x10]                  ; 080E8E64
bl    Sub080E985C                   ; 080E8E66
mov   r1,r0                         ; 080E8E6A
ldr   r0,[sp,0x4]                   ; 080E8E6C
cmp   r0,0x0                        ; 080E8E6E
beq   @@Code080E8E74                ; 080E8E70
neg   r1,r1                         ; 080E8E72
@@Code080E8E74:
mov   r0,r1                         ; 080E8E74
@@Code080E8E76:
add   sp,0x1C                       ; 080E8E76
pop   {pc}                          ; 080E8E78
.pool                               ; 080E8E7A

push  {lr}                          ; 080E8E7C
add   sp,-0x1C                      ; 080E8E7E
str   r0,[sp,0x14]                  ; 080E8E80
str   r1,[sp,0x18]                  ; 080E8E82
add   r0,sp,0x14                    ; 080E8E84
mov   r1,sp                         ; 080E8E86
bl    Sub080E82BC                   ; 080E8E88
mov   r1,0x0                        ; 080E8E8C
ldr   r0,[sp,0x4]                   ; 080E8E8E
cmp   r0,0x0                        ; 080E8E90
bne   @@Code080E8E96                ; 080E8E92
mov   r1,0x1                        ; 080E8E94
@@Code080E8E96:
str   r1,[sp,0x4]                   ; 080E8E96
mov   r0,sp                         ; 080E8E98
bl    Sub080E8174                   ; 080E8E9A
add   sp,0x1C                       ; 080E8E9E
pop   {pc}                          ; 080E8EA0
.pool                               ; 080E8EA2

Sub080E8EA4:
add   sp,-0x4                       ; 080E8EA4
push  {r4,lr}                       ; 080E8EA6
add   sp,-0x14                      ; 080E8EA8
str   r3,[sp,0x1C]                  ; 080E8EAA
ldr   r3,[sp,0x1C]                  ; 080E8EAC
ldr   r4,[sp,0x20]                  ; 080E8EAE
str   r0,[sp]                       ; 080E8EB0
str   r1,[sp,0x4]                   ; 080E8EB2
str   r2,[sp,0x8]                   ; 080E8EB4
str   r3,[sp,0xC]                   ; 080E8EB6
str   r4,[sp,0x10]                  ; 080E8EB8
mov   r0,sp                         ; 080E8EBA
bl    Sub080E8174                   ; 080E8EBC
add   sp,0x14                       ; 080E8EC0
pop   {r4}                          ; 080E8EC2
pop   {r3}                          ; 080E8EC4
add   sp,0x4                        ; 080E8EC6
bx    r3                            ; 080E8EC8
.pool                               ; 080E8ECA

push  {r4-r5,lr}                    ; 080E8ECC
add   sp,-0x1C                      ; 080E8ECE
str   r0,[sp,0x14]                  ; 080E8ED0
str   r1,[sp,0x18]                  ; 080E8ED2
add   r0,sp,0x14                    ; 080E8ED4
mov   r1,sp                         ; 080E8ED6
bl    Sub080E82BC                   ; 080E8ED8
ldr   r2,[sp,0xC]                   ; 080E8EDC
ldr   r3,[sp,0x10]                  ; 080E8EDE
lsl   r5,r3,0x2                     ; 080E8EE0
lsr   r4,r2,0x1E                    ; 080E8EE2
mov   r0,r5                         ; 080E8EE4
orr   r0,r4                         ; 080E8EE6
mov   r5,r0                         ; 080E8EE8
ldr   r4,=0x3FFFFFFF                ; 080E8EEA
mov   r0,r2                         ; 080E8EEC
and   r0,r4                         ; 080E8EEE
mov   r1,0x0                        ; 080E8EF0
orr   r0,r1                         ; 080E8EF2
cmp   r0,0x0                        ; 080E8EF4
beq   @@Code080E8EFC                ; 080E8EF6
mov   r0,0x1                        ; 080E8EF8
orr   r5,r0                         ; 080E8EFA
@@Code080E8EFC:
ldr   r0,[sp]                       ; 080E8EFC
ldr   r1,[sp,0x4]                   ; 080E8EFE
ldr   r2,[sp,0x8]                   ; 080E8F00
mov   r3,r5                         ; 080E8F02
bl    Sub080E9818                   ; 080E8F04
add   sp,0x1C                       ; 080E8F08
pop   {r4-r5,pc}                    ; 080E8F0A
.pool                               ; 080E8F0C

Sub080E8F10:
push  {r4-r6,lr}                    ; 080E8F10
ldr   r2,[r0,0xC]                   ; 080E8F12
ldr   r6,[r0,0x4]                   ; 080E8F14
mov   r5,0x0                        ; 080E8F16
mov   r1,0x0                        ; 080E8F18
ldr   r3,[r0]                       ; 080E8F1A
cmp   r3,0x1                        ; 080E8F1C
bhi   @@Code080E8F22                ; 080E8F1E
mov   r1,0x1                        ; 080E8F20
@@Code080E8F22:
cmp   r1,0x0                        ; 080E8F22
beq   @@Code080E8F30                ; 080E8F24
mov   r5,0xFF                       ; 080E8F26
mov   r0,0x80                       ; 080E8F28
lsl   r0,r0,0xD                     ; 080E8F2A
orr   r2,r0                         ; 080E8F2C
b     @@Code080E8F96                ; 080E8F2E
@@Code080E8F30:
mov   r1,0x0                        ; 080E8F30
cmp   r3,0x4                        ; 080E8F32
bne   @@Code080E8F38                ; 080E8F34
mov   r1,0x1                        ; 080E8F36
@@Code080E8F38:
cmp   r1,0x0                        ; 080E8F38
bne   @@Code080E8F6C                ; 080E8F3A
mov   r1,0x0                        ; 080E8F3C
cmp   r3,0x2                        ; 080E8F3E
bne   @@Code080E8F44                ; 080E8F40
mov   r1,0x1                        ; 080E8F42
@@Code080E8F44:
cmp   r1,0x0                        ; 080E8F44
beq   @@Code080E8F4C                ; 080E8F46
mov   r2,0x0                        ; 080E8F48
b     @@Code080E8F96                ; 080E8F4A
@@Code080E8F4C:
cmp   r2,0x0                        ; 080E8F4C
beq   @@Code080E8F96                ; 080E8F4E
ldr   r0,[r0,0x8]                   ; 080E8F50
mov   r3,0x7E                       ; 080E8F52
neg   r3,r3                         ; 080E8F54
cmp   r0,r3                         ; 080E8F56
bge   @@Code080E8F68                ; 080E8F58
sub   r0,r3,r0                      ; 080E8F5A
cmp   r0,0x19                       ; 080E8F5C
ble   @@Code080E8F64                ; 080E8F5E
mov   r2,0x0                        ; 080E8F60
b     @@Code080E8F94                ; 080E8F62
@@Code080E8F64:
lsr   r2,r0                         ; 080E8F64
b     @@Code080E8F94                ; 080E8F66
@@Code080E8F68:
cmp   r0,0x7F                       ; 080E8F68
ble   @@Code080E8F72                ; 080E8F6A
@@Code080E8F6C:
mov   r5,0xFF                       ; 080E8F6C
mov   r2,0x0                        ; 080E8F6E
b     @@Code080E8F96                ; 080E8F70
@@Code080E8F72:
mov   r5,r0                         ; 080E8F72
add   r5,0x7F                       ; 080E8F74
mov   r0,0x7F                       ; 080E8F76
and   r0,r2                         ; 080E8F78
cmp   r0,0x40                       ; 080E8F7A
bne   @@Code080E8F8A                ; 080E8F7C
mov   r0,0x80                       ; 080E8F7E
and   r0,r2                         ; 080E8F80
cmp   r0,0x0                        ; 080E8F82
beq   @@Code080E8F8C                ; 080E8F84
add   r2,0x40                       ; 080E8F86
b     @@Code080E8F8C                ; 080E8F88
@@Code080E8F8A:
add   r2,0x3F                       ; 080E8F8A
@@Code080E8F8C:
cmp   r2,0x0                        ; 080E8F8C
bge   @@Code080E8F94                ; 080E8F8E
lsr   r2,r2,0x1                     ; 080E8F90
add   r5,0x1                        ; 080E8F92
@@Code080E8F94:
lsr   r2,r2,0x7                     ; 080E8F94
@@Code080E8F96:
ldr   r0,=0x007FFFFF                ; 080E8F96
and   r2,r0                         ; 080E8F98
ldr   r0,=0xFF800000                ; 080E8F9A
and   r4,r0                         ; 080E8F9C
orr   r4,r2                         ; 080E8F9E
mov   r0,0xFF                       ; 080E8FA0
and   r5,r0                         ; 080E8FA2
lsl   r1,r5,0x17                    ; 080E8FA4
ldr   r0,=0x807FFFFF                ; 080E8FA6
and   r4,r0                         ; 080E8FA8
orr   r4,r1                         ; 080E8FAA
lsl   r1,r6,0x1F                    ; 080E8FAC
ldr   r0,=0x7FFFFFFF                ; 080E8FAE
and   r4,r0                         ; 080E8FB0
orr   r4,r1                         ; 080E8FB2
mov   r0,r4                         ; 080E8FB4
pop   {r4-r6,pc}                    ; 080E8FB6
.pool                               ; 080E8FB8

Sub080E8FC8:
push  {r4,lr}                       ; 080E8FC8
mov   r3,r1                         ; 080E8FCA
ldr   r0,[r0]                       ; 080E8FCC
lsl   r1,r0,0x9                     ; 080E8FCE
lsr   r2,r1,0x9                     ; 080E8FD0
lsl   r1,r0,0x1                     ; 080E8FD2
lsr   r1,r1,0x18                    ; 080E8FD4
lsr   r0,r0,0x1F                    ; 080E8FD6
str   r0,[r3,0x4]                   ; 080E8FD8
cmp   r1,0x0                        ; 080E8FDA
bne   @@Code080E900C                ; 080E8FDC
cmp   r2,0x0                        ; 080E8FDE
bne   @@Code080E8FE8                ; 080E8FE0
mov   r0,0x2                        ; 080E8FE2
str   r0,[r3]                       ; 080E8FE4
b     @@Code080E9040                ; 080E8FE6
@@Code080E8FE8:
mov   r4,r1                         ; 080E8FE8
sub   r4,0x7E                       ; 080E8FEA
str   r4,[r3,0x8]                   ; 080E8FEC
lsl   r2,r2,0x7                     ; 080E8FEE
mov   r0,0x3                        ; 080E8FF0
str   r0,[r3]                       ; 080E8FF2
ldr   r1,=0x3FFFFFFF                ; 080E8FF4
cmp   r2,r1                         ; 080E8FF6
bhi   @@Code080E9028                ; 080E8FF8
mov   r0,r4                         ; 080E8FFA
@@Code080E8FFC:
lsl   r2,r2,0x1                     ; 080E8FFC
sub   r0,0x1                        ; 080E8FFE
cmp   r2,r1                         ; 080E9000
bls   @@Code080E8FFC                ; 080E9002
str   r0,[r3,0x8]                   ; 080E9004
b     @@Code080E9028                ; 080E9006
.pool                               ; 080E9008

@@Code080E900C:
cmp   r1,0xFF                       ; 080E900C
bne   @@Code080E902C                ; 080E900E
cmp   r2,0x0                        ; 080E9010
bne   @@Code080E901A                ; 080E9012
mov   r0,0x4                        ; 080E9014
str   r0,[r3]                       ; 080E9016
b     @@Code080E9040                ; 080E9018
@@Code080E901A:
mov   r0,0x80                       ; 080E901A
lsl   r0,r0,0xD                     ; 080E901C
and   r0,r2                         ; 080E901E
cmp   r0,0x0                        ; 080E9020
beq   @@Code080E9026                ; 080E9022
mov   r0,0x1                        ; 080E9024
@@Code080E9026:
str   r0,[r3]                       ; 080E9026
@@Code080E9028:
str   r2,[r3,0xC]                   ; 080E9028
b     @@Code080E9040                ; 080E902A
@@Code080E902C:
mov   r0,r1                         ; 080E902C
sub   r0,0x7F                       ; 080E902E
str   r0,[r3,0x8]                   ; 080E9030
mov   r0,0x3                        ; 080E9032
str   r0,[r3]                       ; 080E9034
lsl   r0,r2,0x7                     ; 080E9036
mov   r1,0x80                       ; 080E9038
lsl   r1,r1,0x17                    ; 080E903A
orr   r0,r1                         ; 080E903C
str   r0,[r3,0xC]                   ; 080E903E
@@Code080E9040:
pop   {r4,pc}                       ; 080E9040
.pool                               ; 080E9042

Sub080E9044:
push  {r4-r7,lr}                    ; 080E9044
mov   r7,r8                         ; 080E9046
push  {r7}                          ; 080E9048
mov   r6,r0                         ; 080E904A
mov   r7,r1                         ; 080E904C
mov   r5,r2                         ; 080E904E
mov   r0,0x0                        ; 080E9050
ldr   r2,[r6]                       ; 080E9052
cmp   r2,0x1                        ; 080E9054
bhi   @@Code080E905A                ; 080E9056
mov   r0,0x1                        ; 080E9058
@@Code080E905A:
cmp   r0,0x0                        ; 080E905A
beq   @@Code080E9062                ; 080E905C
@@Code080E905E:
mov   r0,r6                         ; 080E905E
b     @@Code080E91B8                ; 080E9060
@@Code080E9062:
mov   r1,0x0                        ; 080E9062
ldr   r0,[r7]                       ; 080E9064
cmp   r0,0x1                        ; 080E9066
bhi   @@Code080E906C                ; 080E9068
mov   r1,0x1                        ; 080E906A
@@Code080E906C:
cmp   r1,0x0                        ; 080E906C
bne   @@Code080E90E0                ; 080E906E
mov   r1,0x0                        ; 080E9070
cmp   r2,0x4                        ; 080E9072
bne   @@Code080E9078                ; 080E9074
mov   r1,0x1                        ; 080E9076
@@Code080E9078:
cmp   r1,0x0                        ; 080E9078
beq   @@Code080E9098                ; 080E907A
mov   r1,0x0                        ; 080E907C
cmp   r0,0x4                        ; 080E907E
bne   @@Code080E9084                ; 080E9080
mov   r1,0x1                        ; 080E9082
@@Code080E9084:
cmp   r1,0x0                        ; 080E9084
beq   @@Code080E905E                ; 080E9086
ldr   r1,[r6,0x4]                   ; 080E9088
ldr   r0,[r7,0x4]                   ; 080E908A
cmp   r1,r0                         ; 080E908C
beq   @@Code080E905E                ; 080E908E
ldr   r0,=0x03002228                ; 080E9090
b     @@Code080E91B8                ; 080E9092
.pool                               ; 080E9094

@@Code080E9098:
mov   r1,0x0                        ; 080E9098
cmp   r0,0x4                        ; 080E909A
bne   @@Code080E90A0                ; 080E909C
mov   r1,0x1                        ; 080E909E
@@Code080E90A0:
cmp   r1,0x0                        ; 080E90A0
bne   @@Code080E90E0                ; 080E90A2
mov   r1,0x0                        ; 080E90A4
cmp   r0,0x2                        ; 080E90A6
bne   @@Code080E90AC                ; 080E90A8
mov   r1,0x1                        ; 080E90AA
@@Code080E90AC:
cmp   r1,0x0                        ; 080E90AC
beq   @@Code080E90D2                ; 080E90AE
mov   r0,0x0                        ; 080E90B0
cmp   r2,0x2                        ; 080E90B2
bne   @@Code080E90B8                ; 080E90B4
mov   r0,0x1                        ; 080E90B6
@@Code080E90B8:
cmp   r0,0x0                        ; 080E90B8
beq   @@Code080E905E                ; 080E90BA
mov   r1,r5                         ; 080E90BC
mov   r0,r6                         ; 080E90BE
ldmia r0!,{r2-r4}                   ; 080E90C0
stmia r1!,{r2-r4}                   ; 080E90C2
ldr   r0,[r0]                       ; 080E90C4
str   r0,[r1]                       ; 080E90C6
ldr   r0,[r6,0x4]                   ; 080E90C8
ldr   r1,[r7,0x4]                   ; 080E90CA
and   r0,r1                         ; 080E90CC
str   r0,[r5,0x4]                   ; 080E90CE
b     @@Code080E91B6                ; 080E90D0
@@Code080E90D2:
mov   r1,0x0                        ; 080E90D2
ldr   r0,[r6]                       ; 080E90D4
cmp   r0,0x2                        ; 080E90D6
bne   @@Code080E90DC                ; 080E90D8
mov   r1,0x1                        ; 080E90DA
@@Code080E90DC:
cmp   r1,0x0                        ; 080E90DC
beq   @@Code080E90E4                ; 080E90DE
@@Code080E90E0:
mov   r0,r7                         ; 080E90E0
b     @@Code080E91B8                ; 080E90E2
@@Code080E90E4:
ldr   r1,[r6,0x8]                   ; 080E90E4
ldr   r3,[r7,0x8]                   ; 080E90E6
ldr   r2,[r6,0xC]                   ; 080E90E8
ldr   r4,[r7,0xC]                   ; 080E90EA
sub   r0,r1,r3                      ; 080E90EC
cmp   r0,0x0                        ; 080E90EE
bge   @@Code080E90F4                ; 080E90F0
neg   r0,r0                         ; 080E90F2
@@Code080E90F4:
cmp   r0,0x1F                       ; 080E90F4
bgt   @@Code080E9138                ; 080E90F6
ldr   r6,[r6,0x4]                   ; 080E90F8
ldr   r7,[r7,0x4]                   ; 080E90FA
mov   r8,r7                         ; 080E90FC
cmp   r1,r3                         ; 080E90FE
ble   @@Code080E911A                ; 080E9100
mov   r7,0x1                        ; 080E9102
mov   r12,r7                        ; 080E9104
sub   r3,r1,r3                      ; 080E9106
@@Code080E9108:
sub   r3,0x1                        ; 080E9108
mov   r0,r4                         ; 080E910A
mov   r7,r12                        ; 080E910C
and   r0,r7                         ; 080E910E
lsr   r4,r4,0x1                     ; 080E9110
orr   r4,r0                         ; 080E9112
cmp   r3,0x0                        ; 080E9114
bne   @@Code080E9108                ; 080E9116
mov   r3,r1                         ; 080E9118
@@Code080E911A:
cmp   r3,r1                         ; 080E911A
ble   @@Code080E914A                ; 080E911C
mov   r0,0x1                        ; 080E911E
mov   r12,r0                        ; 080E9120
sub   r1,r3,r1                      ; 080E9122
@@Code080E9124:
sub   r1,0x1                        ; 080E9124
mov   r0,r2                         ; 080E9126
mov   r7,r12                        ; 080E9128
and   r0,r7                         ; 080E912A
lsr   r2,r2,0x1                     ; 080E912C
orr   r2,r0                         ; 080E912E
cmp   r1,0x0                        ; 080E9130
bne   @@Code080E9124                ; 080E9132
mov   r1,r3                         ; 080E9134
b     @@Code080E914A                ; 080E9136
@@Code080E9138:
cmp   r1,r3                         ; 080E9138
ble   @@Code080E9140                ; 080E913A
mov   r4,0x0                        ; 080E913C
b     @@Code080E9144                ; 080E913E
@@Code080E9140:
mov   r1,r3                         ; 080E9140
mov   r2,0x0                        ; 080E9142
@@Code080E9144:
ldr   r6,[r6,0x4]                   ; 080E9144
ldr   r7,[r7,0x4]                   ; 080E9146
mov   r8,r7                         ; 080E9148
@@Code080E914A:
cmp   r6,r8                         ; 080E914A
beq   @@Code080E9194                ; 080E914C
cmp   r6,0x0                        ; 080E914E
beq   @@Code080E9156                ; 080E9150
sub   r3,r4,r2                      ; 080E9152
b     @@Code080E9158                ; 080E9154
@@Code080E9156:
sub   r3,r2,r4                      ; 080E9156
@@Code080E9158:
cmp   r3,0x0                        ; 080E9158
blt   @@Code080E9166                ; 080E915A
mov   r0,0x0                        ; 080E915C
str   r0,[r5,0x4]                   ; 080E915E
str   r1,[r5,0x8]                   ; 080E9160
str   r3,[r5,0xC]                   ; 080E9162
b     @@Code080E9170                ; 080E9164
@@Code080E9166:
mov   r0,0x1                        ; 080E9166
str   r0,[r5,0x4]                   ; 080E9168
str   r1,[r5,0x8]                   ; 080E916A
neg   r0,r3                         ; 080E916C
str   r0,[r5,0xC]                   ; 080E916E
@@Code080E9170:
ldr   r1,[r5,0xC]                   ; 080E9170
sub   r0,r1,0x1                     ; 080E9172
ldr   r2,=0x3FFFFFFE                ; 080E9174
cmp   r0,r2                         ; 080E9176
bhi   @@Code080E919C                ; 080E9178
@@Code080E917A:
lsl   r0,r1,0x1                     ; 080E917A
str   r0,[r5,0xC]                   ; 080E917C
ldr   r1,[r5,0x8]                   ; 080E917E
sub   r1,0x1                        ; 080E9180
str   r1,[r5,0x8]                   ; 080E9182
mov   r1,r0                         ; 080E9184
sub   r0,r1,0x1                     ; 080E9186
cmp   r0,r2                         ; 080E9188
bls   @@Code080E917A                ; 080E918A
b     @@Code080E919C                ; 080E918C
.pool                               ; 080E918E

@@Code080E9194:
str   r6,[r5,0x4]                   ; 080E9194
str   r1,[r5,0x8]                   ; 080E9196
add   r0,r2,r4                      ; 080E9198
str   r0,[r5,0xC]                   ; 080E919A
@@Code080E919C:
mov   r0,0x3                        ; 080E919C
str   r0,[r5]                       ; 080E919E
ldr   r1,[r5,0xC]                   ; 080E91A0
cmp   r1,0x0                        ; 080E91A2
bge   @@Code080E91B6                ; 080E91A4
mov   r0,0x1                        ; 080E91A6
and   r0,r1                         ; 080E91A8
lsr   r1,r1,0x1                     ; 080E91AA
orr   r0,r1                         ; 080E91AC
str   r0,[r5,0xC]                   ; 080E91AE
ldr   r0,[r5,0x8]                   ; 080E91B0
add   r0,0x1                        ; 080E91B2
str   r0,[r5,0x8]                   ; 080E91B4
@@Code080E91B6:
mov   r0,r5                         ; 080E91B6
@@Code080E91B8:
pop   {r3}                          ; 080E91B8
mov   r8,r3                         ; 080E91BA
pop   {r4-r7,pc}                    ; 080E91BC
.pool                               ; 080E91BE

push  {r4,lr}                       ; 080E91C0
add   sp,-0x38                      ; 080E91C2
str   r0,[sp,0x30]                  ; 080E91C4
str   r1,[sp,0x34]                  ; 080E91C6
add   r0,sp,0x30                    ; 080E91C8
mov   r1,sp                         ; 080E91CA
bl    Sub080E8FC8                   ; 080E91CC
add   r0,sp,0x34                    ; 080E91D0
add   r4,sp,0x10                    ; 080E91D2
mov   r1,r4                         ; 080E91D4
bl    Sub080E8FC8                   ; 080E91D6
add   r2,sp,0x20                    ; 080E91DA
mov   r0,sp                         ; 080E91DC
mov   r1,r4                         ; 080E91DE
bl    Sub080E9044                   ; 080E91E0
bl    Sub080E8F10                   ; 080E91E4
add   sp,0x38                       ; 080E91E8
pop   {r4,pc}                       ; 080E91EA

push  {r4,lr}                       ; 080E91EC
add   sp,-0x38                      ; 080E91EE
str   r0,[sp,0x30]                  ; 080E91F0
str   r1,[sp,0x34]                  ; 080E91F2
add   r0,sp,0x30                    ; 080E91F4
mov   r1,sp                         ; 080E91F6
bl    Sub080E8FC8                   ; 080E91F8
add   r0,sp,0x34                    ; 080E91FC
add   r4,sp,0x10                    ; 080E91FE
mov   r1,r4                         ; 080E9200
bl    Sub080E8FC8                   ; 080E9202
ldr   r0,[r4,0x4]                   ; 080E9206
mov   r1,0x1                        ; 080E9208
eor   r0,r1                         ; 080E920A
str   r0,[r4,0x4]                   ; 080E920C
add   r2,sp,0x20                    ; 080E920E
mov   r0,sp                         ; 080E9210
mov   r1,r4                         ; 080E9212
bl    Sub080E9044                   ; 080E9214
bl    Sub080E8F10                   ; 080E9218
add   sp,0x38                       ; 080E921C
pop   {r4,pc}                       ; 080E921E

push  {r4-r7,lr}                    ; 080E9220
mov   r7,r9                         ; 080E9222
mov   r6,r8                         ; 080E9224
push  {r6-r7}                       ; 080E9226
add   sp,-0x38                      ; 080E9228
str   r0,[sp,0x30]                  ; 080E922A
str   r1,[sp,0x34]                  ; 080E922C
add   r0,sp,0x30                    ; 080E922E
mov   r1,sp                         ; 080E9230
bl    Sub080E8FC8                   ; 080E9232
add   r0,sp,0x34                    ; 080E9236
add   r4,sp,0x10                    ; 080E9238
mov   r1,r4                         ; 080E923A
bl    Sub080E8FC8                   ; 080E923C
mov   r7,sp                         ; 080E9240
add   r0,sp,0x20                    ; 080E9242
mov   r8,r0                         ; 080E9244
mov   r0,0x0                        ; 080E9246
ldr   r1,[sp]                       ; 080E9248
mov   r9,r8                         ; 080E924A
cmp   r1,0x1                        ; 080E924C
bhi   @@Code080E9252                ; 080E924E
mov   r0,0x1                        ; 080E9250
@@Code080E9252:
cmp   r0,0x0                        ; 080E9252
bne   @@Code080E92B0                ; 080E9254
mov   r2,0x0                        ; 080E9256
ldr   r0,[sp,0x10]                  ; 080E9258
cmp   r0,0x1                        ; 080E925A
bhi   @@Code080E9260                ; 080E925C
mov   r2,0x1                        ; 080E925E
@@Code080E9260:
cmp   r2,0x0                        ; 080E9260
beq   @@Code080E9268                ; 080E9262
ldr   r0,[sp,0x4]                   ; 080E9264
b     @@Code080E92D0                ; 080E9266
@@Code080E9268:
mov   r2,0x0                        ; 080E9268
cmp   r1,0x4                        ; 080E926A
bne   @@Code080E9270                ; 080E926C
mov   r2,0x1                        ; 080E926E
@@Code080E9270:
cmp   r2,0x0                        ; 080E9270
beq   @@Code080E9282                ; 080E9272
mov   r1,0x0                        ; 080E9274
cmp   r0,0x2                        ; 080E9276
bne   @@Code080E927C                ; 080E9278
mov   r1,0x1                        ; 080E927A
@@Code080E927C:
cmp   r1,0x0                        ; 080E927C
bne   @@Code080E929A                ; 080E927E
b     @@Code080E92B0                ; 080E9280
@@Code080E9282:
mov   r2,0x0                        ; 080E9282
cmp   r0,0x4                        ; 080E9284
bne   @@Code080E928A                ; 080E9286
mov   r2,0x1                        ; 080E9288
@@Code080E928A:
cmp   r2,0x0                        ; 080E928A
beq   @@Code080E92A4                ; 080E928C
mov   r0,0x0                        ; 080E928E
cmp   r1,0x2                        ; 080E9290
bne   @@Code080E9296                ; 080E9292
mov   r0,0x1                        ; 080E9294
@@Code080E9296:
cmp   r0,0x0                        ; 080E9296
beq   @@Code080E92CE                ; 080E9298
@@Code080E929A:
ldr   r0,=0x03002228                ; 080E929A
b     @@Code080E9372                ; 080E929C
.pool                               ; 080E929E

@@Code080E92A4:
mov   r2,0x0                        ; 080E92A4
cmp   r1,0x2                        ; 080E92A6
bne   @@Code080E92AC                ; 080E92A8
mov   r2,0x1                        ; 080E92AA
@@Code080E92AC:
cmp   r2,0x0                        ; 080E92AC
beq   @@Code080E92C2                ; 080E92AE
@@Code080E92B0:
ldr   r0,[sp,0x4]                   ; 080E92B0
ldr   r1,[sp,0x14]                  ; 080E92B2
eor   r0,r1                         ; 080E92B4
neg   r1,r0                         ; 080E92B6
orr   r1,r0                         ; 080E92B8
lsr   r1,r1,0x1F                    ; 080E92BA
str   r1,[sp,0x4]                   ; 080E92BC
mov   r0,sp                         ; 080E92BE
b     @@Code080E9372                ; 080E92C0
@@Code080E92C2:
mov   r1,0x0                        ; 080E92C2
cmp   r0,0x2                        ; 080E92C4
bne   @@Code080E92CA                ; 080E92C6
mov   r1,0x1                        ; 080E92C8
@@Code080E92CA:
cmp   r1,0x0                        ; 080E92CA
beq   @@Code080E92E0                ; 080E92CC
@@Code080E92CE:
ldr   r0,[r7,0x4]                   ; 080E92CE
@@Code080E92D0:
ldr   r1,[sp,0x14]                  ; 080E92D0
eor   r0,r1                         ; 080E92D2
neg   r1,r0                         ; 080E92D4
orr   r1,r0                         ; 080E92D6
lsr   r1,r1,0x1F                    ; 080E92D8
str   r1,[sp,0x14]                  ; 080E92DA
mov   r0,r4                         ; 080E92DC
b     @@Code080E9372                ; 080E92DE
@@Code080E92E0:
ldr   r0,[r7,0xC]                   ; 080E92E0
mov   r1,0x0                        ; 080E92E2
ldr   r2,[sp,0x1C]                  ; 080E92E4
mov   r3,0x0                        ; 080E92E6
bl    Sub080E9890                   ; 080E92E8
mov   r2,r1                         ; 080E92EC
mov   r5,r2                         ; 080E92EE
mov   r6,r0                         ; 080E92F0
ldr   r4,[r7,0x8]                   ; 080E92F2
ldr   r0,[sp,0x18]                  ; 080E92F4
add   r4,r4,r0                      ; 080E92F6
str   r4,[sp,0x28]                  ; 080E92F8
ldr   r1,[r7,0x4]                   ; 080E92FA
ldr   r0,[sp,0x14]                  ; 080E92FC
eor   r1,r0                         ; 080E92FE
neg   r0,r1                         ; 080E9300
orr   r0,r1                         ; 080E9302
lsr   r0,r0,0x1F                    ; 080E9304
str   r0,[sp,0x24]                  ; 080E9306
add   r4,0x2                        ; 080E9308
str   r4,[sp,0x28]                  ; 080E930A
cmp   r2,0x0                        ; 080E930C
bge   @@Code080E932C                ; 080E930E
mov   r2,0x1                        ; 080E9310
mov   r1,0x80                       ; 080E9312
lsl   r1,r1,0x18                    ; 080E9314
@@Code080E9316:
add   r4,0x1                        ; 080E9316
mov   r0,r5                         ; 080E9318
and   r0,r2                         ; 080E931A
cmp   r0,0x0                        ; 080E931C
beq   @@Code080E9324                ; 080E931E
lsr   r6,r6,0x1                     ; 080E9320
orr   r6,r1                         ; 080E9322
@@Code080E9324:
lsr   r5,r5,0x1                     ; 080E9324
cmp   r5,0x0                        ; 080E9326
blt   @@Code080E9316                ; 080E9328
str   r4,[sp,0x28]                  ; 080E932A
@@Code080E932C:
ldr   r0,=0x3FFFFFFF                ; 080E932C
cmp   r5,r0                         ; 080E932E
bhi   @@Code080E9352                ; 080E9330
mov   r4,0x80                       ; 080E9332
lsl   r4,r4,0x18                    ; 080E9334
mov   r3,0x1                        ; 080E9336
mov   r2,r0                         ; 080E9338
ldr   r1,[sp,0x28]                  ; 080E933A
@@Code080E933C:
sub   r1,0x1                        ; 080E933C
lsl   r5,r5,0x1                     ; 080E933E
mov   r0,r6                         ; 080E9340
and   r0,r4                         ; 080E9342
cmp   r0,0x0                        ; 080E9344
beq   @@Code080E934A                ; 080E9346
orr   r5,r3                         ; 080E9348
@@Code080E934A:
lsl   r6,r6,0x1                     ; 080E934A
cmp   r5,r2                         ; 080E934C
bls   @@Code080E933C                ; 080E934E
str   r1,[sp,0x28]                  ; 080E9350
@@Code080E9352:
mov   r0,0x7F                       ; 080E9352
and   r0,r5                         ; 080E9354
cmp   r0,0x40                       ; 080E9356
bne   @@Code080E9368                ; 080E9358
mov   r0,0x80                       ; 080E935A
and   r0,r5                         ; 080E935C
cmp   r0,0x0                        ; 080E935E
bne   @@Code080E9366                ; 080E9360
cmp   r6,0x0                        ; 080E9362
beq   @@Code080E9368                ; 080E9364
@@Code080E9366:
add   r5,0x40                       ; 080E9366
@@Code080E9368:
str   r5,[sp,0x2C]                  ; 080E9368
mov   r0,0x3                        ; 080E936A
mov   r1,r8                         ; 080E936C
str   r0,[r1]                       ; 080E936E
mov   r0,r9                         ; 080E9370
@@Code080E9372:
bl    Sub080E8F10                   ; 080E9372
add   sp,0x38                       ; 080E9376
pop   {r3-r4}                       ; 080E9378
mov   r8,r3                         ; 080E937A
mov   r9,r4                         ; 080E937C
pop   {r4-r7,pc}                    ; 080E937E
.pool                               ; 080E9380

push  {r4-r6,lr}                    ; 080E9384
add   sp,-0x28                      ; 080E9386
str   r0,[sp,0x20]                  ; 080E9388
str   r1,[sp,0x24]                  ; 080E938A
add   r0,sp,0x20                    ; 080E938C
mov   r1,sp                         ; 080E938E
bl    Sub080E8FC8                   ; 080E9390
add   r0,sp,0x24                    ; 080E9394
add   r5,sp,0x10                    ; 080E9396
mov   r1,r5                         ; 080E9398
bl    Sub080E8FC8                   ; 080E939A
mov   r4,sp                         ; 080E939E
mov   r0,0x0                        ; 080E93A0
ldr   r3,[sp]                       ; 080E93A2
cmp   r3,0x1                        ; 080E93A4
bhi   @@Code080E93AA                ; 080E93A6
mov   r0,0x1                        ; 080E93A8
@@Code080E93AA:
cmp   r0,0x0                        ; 080E93AA
beq   @@Code080E93B2                ; 080E93AC
mov   r1,sp                         ; 080E93AE
b     @@Code080E9464                ; 080E93B0
@@Code080E93B2:
mov   r0,0x0                        ; 080E93B2
ldr   r2,[sp,0x10]                  ; 080E93B4
mov   r6,r2                         ; 080E93B6
cmp   r2,0x1                        ; 080E93B8
bhi   @@Code080E93BE                ; 080E93BA
mov   r0,0x1                        ; 080E93BC
@@Code080E93BE:
cmp   r0,0x0                        ; 080E93BE
beq   @@Code080E93C6                ; 080E93C0
mov   r1,r5                         ; 080E93C2
b     @@Code080E9464                ; 080E93C4
@@Code080E93C6:
ldr   r0,[sp,0x4]                   ; 080E93C6
ldr   r1,[sp,0x14]                  ; 080E93C8
eor   r0,r1                         ; 080E93CA
str   r0,[sp,0x4]                   ; 080E93CC
mov   r0,0x0                        ; 080E93CE
cmp   r3,0x4                        ; 080E93D0
bne   @@Code080E93D6                ; 080E93D2
mov   r0,0x1                        ; 080E93D4
@@Code080E93D6:
cmp   r0,0x0                        ; 080E93D6
bne   @@Code080E93E6                ; 080E93D8
mov   r0,0x0                        ; 080E93DA
cmp   r3,0x2                        ; 080E93DC
bne   @@Code080E93E2                ; 080E93DE
mov   r0,0x1                        ; 080E93E0
@@Code080E93E2:
cmp   r0,0x0                        ; 080E93E2
beq   @@Code080E93F8                ; 080E93E4
@@Code080E93E6:
ldr   r0,[r4]                       ; 080E93E6
mov   r1,r4                         ; 080E93E8
cmp   r0,r6                         ; 080E93EA
bne   @@Code080E9464                ; 080E93EC
ldr   r1,=0x03002228                ; 080E93EE
b     @@Code080E9464                ; 080E93F0
.pool                               ; 080E93F2

@@Code080E93F8:
mov   r1,0x0                        ; 080E93F8
cmp   r2,0x4                        ; 080E93FA
bne   @@Code080E9400                ; 080E93FC
mov   r1,0x1                        ; 080E93FE
@@Code080E9400:
cmp   r1,0x0                        ; 080E9400
beq   @@Code080E940C                ; 080E9402
str   r0,[sp,0xC]                   ; 080E9404
str   r0,[sp,0x8]                   ; 080E9406
mov   r1,sp                         ; 080E9408
b     @@Code080E9464                ; 080E940A
@@Code080E940C:
mov   r0,0x0                        ; 080E940C
cmp   r2,0x2                        ; 080E940E
bne   @@Code080E9414                ; 080E9410
mov   r0,0x1                        ; 080E9412
@@Code080E9414:
cmp   r0,0x0                        ; 080E9414
beq   @@Code080E941E                ; 080E9416
mov   r0,0x4                        ; 080E9418
str   r0,[r4]                       ; 080E941A
b     @@Code080E9462                ; 080E941C
@@Code080E941E:
ldr   r1,[r4,0x8]                   ; 080E941E
ldr   r0,[sp,0x18]                  ; 080E9420
sub   r0,r1,r0                      ; 080E9422
str   r0,[r4,0x8]                   ; 080E9424
ldr   r2,[r4,0xC]                   ; 080E9426
ldr   r3,[sp,0x1C]                  ; 080E9428
cmp   r2,r3                         ; 080E942A
bhs   @@Code080E9434                ; 080E942C
lsl   r2,r2,0x1                     ; 080E942E
sub   r0,0x1                        ; 080E9430
str   r0,[r4,0x8]                   ; 080E9432
@@Code080E9434:
mov   r0,0x80                       ; 080E9434
lsl   r0,r0,0x17                    ; 080E9436
mov   r1,0x0                        ; 080E9438
@@Code080E943A:
cmp   r2,r3                         ; 080E943A
blo   @@Code080E9442                ; 080E943C
orr   r1,r0                         ; 080E943E
sub   r2,r2,r3                      ; 080E9440
@@Code080E9442:
lsr   r0,r0,0x1                     ; 080E9442
lsl   r2,r2,0x1                     ; 080E9444
cmp   r0,0x0                        ; 080E9446
bne   @@Code080E943A                ; 080E9448
mov   r0,0x7F                       ; 080E944A
and   r0,r1                         ; 080E944C
cmp   r0,0x40                       ; 080E944E
bne   @@Code080E9460                ; 080E9450
mov   r0,0x80                       ; 080E9452
and   r0,r1                         ; 080E9454
cmp   r0,0x0                        ; 080E9456
bne   @@Code080E945E                ; 080E9458
cmp   r2,0x0                        ; 080E945A
beq   @@Code080E9460                ; 080E945C
@@Code080E945E:
add   r1,0x40                       ; 080E945E
@@Code080E9460:
str   r1,[r4,0xC]                   ; 080E9460
@@Code080E9462:
mov   r1,r4                         ; 080E9462
@@Code080E9464:
mov   r0,r1                         ; 080E9464
bl    Sub080E8F10                   ; 080E9466
add   sp,0x28                       ; 080E946A
pop   {r4-r6,pc}                    ; 080E946C
.pool                               ; 080E946E

Sub080E9470:
push  {r4,lr}                       ; 080E9470
mov   r4,r0                         ; 080E9472
mov   r0,0x0                        ; 080E9474
ldr   r2,[r4]                       ; 080E9476
cmp   r2,0x1                        ; 080E9478
bhi   @@Code080E947E                ; 080E947A
mov   r0,0x1                        ; 080E947C
@@Code080E947E:
cmp   r0,0x0                        ; 080E947E
bne   @@Code080E9490                ; 080E9480
mov   r0,0x0                        ; 080E9482
ldr   r3,[r1]                       ; 080E9484
cmp   r3,0x1                        ; 080E9486
bhi   @@Code080E948C                ; 080E9488
mov   r0,0x1                        ; 080E948A
@@Code080E948C:
cmp   r0,0x0                        ; 080E948C
beq   @@Code080E9494                ; 080E948E
@@Code080E9490:
mov   r0,0x1                        ; 080E9490
b     @@Code080E9552                ; 080E9492
@@Code080E9494:
mov   r0,0x0                        ; 080E9494
cmp   r2,0x4                        ; 080E9496
bne   @@Code080E949C                ; 080E9498
mov   r0,0x1                        ; 080E949A
@@Code080E949C:
cmp   r0,0x0                        ; 080E949C
beq   @@Code080E94B4                ; 080E949E
mov   r0,0x0                        ; 080E94A0
cmp   r3,0x4                        ; 080E94A2
bne   @@Code080E94A8                ; 080E94A4
mov   r0,0x1                        ; 080E94A6
@@Code080E94A8:
cmp   r0,0x0                        ; 080E94A8
beq   @@Code080E94B4                ; 080E94AA
ldr   r0,[r1,0x4]                   ; 080E94AC
ldr   r1,[r4,0x4]                   ; 080E94AE
sub   r0,r0,r1                      ; 080E94B0
b     @@Code080E9552                ; 080E94B2
@@Code080E94B4:
mov   r2,0x0                        ; 080E94B4
ldr   r0,[r4]                       ; 080E94B6
cmp   r0,0x4                        ; 080E94B8
bne   @@Code080E94BE                ; 080E94BA
mov   r2,0x1                        ; 080E94BC
@@Code080E94BE:
cmp   r2,0x0                        ; 080E94BE
bne   @@Code080E950C                ; 080E94C0
mov   r2,0x0                        ; 080E94C2
cmp   r3,0x4                        ; 080E94C4
bne   @@Code080E94CA                ; 080E94C6
mov   r2,0x1                        ; 080E94C8
@@Code080E94CA:
cmp   r2,0x0                        ; 080E94CA
beq   @@Code080E94DC                ; 080E94CC
@@Code080E94CE:
ldr   r0,[r1,0x4]                   ; 080E94CE
mov   r1,0x1                        ; 080E94D0
neg   r1,r1                         ; 080E94D2
cmp   r0,0x0                        ; 080E94D4
beq   @@Code080E9516                ; 080E94D6
mov   r1,0x1                        ; 080E94D8
b     @@Code080E9516                ; 080E94DA
@@Code080E94DC:
mov   r2,0x0                        ; 080E94DC
cmp   r0,0x2                        ; 080E94DE
bne   @@Code080E94E4                ; 080E94E0
mov   r2,0x1                        ; 080E94E2
@@Code080E94E4:
cmp   r2,0x0                        ; 080E94E4
beq   @@Code080E94F4                ; 080E94E6
mov   r2,0x0                        ; 080E94E8
cmp   r3,0x2                        ; 080E94EA
bne   @@Code080E94F0                ; 080E94EC
mov   r2,0x1                        ; 080E94EE
@@Code080E94F0:
cmp   r2,0x0                        ; 080E94F0
bne   @@Code080E9550                ; 080E94F2
@@Code080E94F4:
mov   r2,0x0                        ; 080E94F4
cmp   r0,0x2                        ; 080E94F6
bne   @@Code080E94FC                ; 080E94F8
mov   r2,0x1                        ; 080E94FA
@@Code080E94FC:
cmp   r2,0x0                        ; 080E94FC
bne   @@Code080E94CE                ; 080E94FE
mov   r0,0x0                        ; 080E9500
cmp   r3,0x2                        ; 080E9502
bne   @@Code080E9508                ; 080E9504
mov   r0,0x1                        ; 080E9506
@@Code080E9508:
cmp   r0,0x0                        ; 080E9508
beq   @@Code080E951A                ; 080E950A
@@Code080E950C:
ldr   r0,[r4,0x4]                   ; 080E950C
mov   r1,0x1                        ; 080E950E
cmp   r0,0x0                        ; 080E9510
beq   @@Code080E9516                ; 080E9512
sub   r1,0x2                        ; 080E9514
@@Code080E9516:
mov   r0,r1                         ; 080E9516
b     @@Code080E9552                ; 080E9518
@@Code080E951A:
ldr   r3,[r4,0x4]                   ; 080E951A
ldr   r0,[r1,0x4]                   ; 080E951C
cmp   r3,r0                         ; 080E951E
beq   @@Code080E952C                ; 080E9520
@@Code080E9522:
mov   r0,0x1                        ; 080E9522
cmp   r3,0x0                        ; 080E9524
beq   @@Code080E9552                ; 080E9526
sub   r0,0x2                        ; 080E9528
b     @@Code080E9552                ; 080E952A
@@Code080E952C:
ldr   r2,[r4,0x8]                   ; 080E952C
ldr   r0,[r1,0x8]                   ; 080E952E
cmp   r2,r0                         ; 080E9530
bgt   @@Code080E9522                ; 080E9532
cmp   r2,r0                         ; 080E9534
bge   @@Code080E9544                ; 080E9536
@@Code080E9538:
mov   r0,0x1                        ; 080E9538
neg   r0,r0                         ; 080E953A
cmp   r3,0x0                        ; 080E953C
beq   @@Code080E9552                ; 080E953E
mov   r0,0x1                        ; 080E9540
b     @@Code080E9552                ; 080E9542
@@Code080E9544:
ldr   r0,[r4,0xC]                   ; 080E9544
ldr   r1,[r1,0xC]                   ; 080E9546
cmp   r0,r1                         ; 080E9548
bhi   @@Code080E9522                ; 080E954A
cmp   r0,r1                         ; 080E954C
blo   @@Code080E9538                ; 080E954E
@@Code080E9550:
mov   r0,0x0                        ; 080E9550
@@Code080E9552:
pop   {r4,pc}                       ; 080E9552

push  {r4,lr}                       ; 080E9554
add   sp,-0x28                      ; 080E9556
str   r0,[sp,0x20]                  ; 080E9558
str   r1,[sp,0x24]                  ; 080E955A
add   r0,sp,0x20                    ; 080E955C
mov   r1,sp                         ; 080E955E
bl    Sub080E8FC8                   ; 080E9560
add   r0,sp,0x24                    ; 080E9564
add   r4,sp,0x10                    ; 080E9566
mov   r1,r4                         ; 080E9568
bl    Sub080E8FC8                   ; 080E956A
mov   r0,sp                         ; 080E956E
mov   r1,r4                         ; 080E9570
bl    Sub080E9470                   ; 080E9572
add   sp,0x28                       ; 080E9576
pop   {r4,pc}                       ; 080E9578
.pool                               ; 080E957A

push  {r4,lr}                       ; 080E957C
add   sp,-0x28                      ; 080E957E
str   r0,[sp,0x20]                  ; 080E9580
str   r1,[sp,0x24]                  ; 080E9582
add   r0,sp,0x20                    ; 080E9584
mov   r1,sp                         ; 080E9586
bl    Sub080E8FC8                   ; 080E9588
add   r0,sp,0x24                    ; 080E958C
add   r4,sp,0x10                    ; 080E958E
mov   r1,r4                         ; 080E9590
bl    Sub080E8FC8                   ; 080E9592
mov   r1,0x0                        ; 080E9596
ldr   r0,[sp]                       ; 080E9598
cmp   r0,0x1                        ; 080E959A
bhi   @@Code080E95A0                ; 080E959C
mov   r1,0x1                        ; 080E959E
@@Code080E95A0:
cmp   r1,0x0                        ; 080E95A0
bne   @@Code080E95B2                ; 080E95A2
mov   r1,0x0                        ; 080E95A4
ldr   r0,[sp,0x10]                  ; 080E95A6
cmp   r0,0x1                        ; 080E95A8
bhi   @@Code080E95AE                ; 080E95AA
mov   r1,0x1                        ; 080E95AC
@@Code080E95AE:
cmp   r1,0x0                        ; 080E95AE
beq   @@Code080E95B6                ; 080E95B0
@@Code080E95B2:
mov   r0,0x1                        ; 080E95B2
b     @@Code080E95BE                ; 080E95B4
@@Code080E95B6:
mov   r0,sp                         ; 080E95B6
mov   r1,r4                         ; 080E95B8
bl    Sub080E9470                   ; 080E95BA
@@Code080E95BE:
add   sp,0x28                       ; 080E95BE
pop   {r4,pc}                       ; 080E95C0
.pool                               ; 080E95C2

push  {r4,lr}                       ; 080E95C4
add   sp,-0x28                      ; 080E95C6
str   r0,[sp,0x20]                  ; 080E95C8
str   r1,[sp,0x24]                  ; 080E95CA
add   r0,sp,0x20                    ; 080E95CC
mov   r1,sp                         ; 080E95CE
bl    Sub080E8FC8                   ; 080E95D0
add   r0,sp,0x24                    ; 080E95D4
add   r4,sp,0x10                    ; 080E95D6
mov   r1,r4                         ; 080E95D8
bl    Sub080E8FC8                   ; 080E95DA
mov   r1,0x0                        ; 080E95DE
ldr   r0,[sp]                       ; 080E95E0
cmp   r0,0x1                        ; 080E95E2
bhi   @@Code080E95E8                ; 080E95E4
mov   r1,0x1                        ; 080E95E6
@@Code080E95E8:
cmp   r1,0x0                        ; 080E95E8
bne   @@Code080E95FA                ; 080E95EA
mov   r1,0x0                        ; 080E95EC
ldr   r0,[sp,0x10]                  ; 080E95EE
cmp   r0,0x1                        ; 080E95F0
bhi   @@Code080E95F6                ; 080E95F2
mov   r1,0x1                        ; 080E95F4
@@Code080E95F6:
cmp   r1,0x0                        ; 080E95F6
beq   @@Code080E95FE                ; 080E95F8
@@Code080E95FA:
mov   r0,0x1                        ; 080E95FA
b     @@Code080E9606                ; 080E95FC
@@Code080E95FE:
mov   r0,sp                         ; 080E95FE
mov   r1,r4                         ; 080E9600
bl    Sub080E9470                   ; 080E9602
@@Code080E9606:
add   sp,0x28                       ; 080E9606
pop   {r4,pc}                       ; 080E9608
.pool                               ; 080E960A

push  {r4,lr}                       ; 080E960C
add   sp,-0x28                      ; 080E960E
str   r0,[sp,0x20]                  ; 080E9610
str   r1,[sp,0x24]                  ; 080E9612
add   r0,sp,0x20                    ; 080E9614
mov   r1,sp                         ; 080E9616
bl    Sub080E8FC8                   ; 080E9618
add   r0,sp,0x24                    ; 080E961C
add   r4,sp,0x10                    ; 080E961E
mov   r1,r4                         ; 080E9620
bl    Sub080E8FC8                   ; 080E9622
mov   r1,0x0                        ; 080E9626
ldr   r0,[sp]                       ; 080E9628
cmp   r0,0x1                        ; 080E962A
bhi   @@Code080E9630                ; 080E962C
mov   r1,0x1                        ; 080E962E
@@Code080E9630:
cmp   r1,0x0                        ; 080E9630
bne   @@Code080E9642                ; 080E9632
mov   r1,0x0                        ; 080E9634
ldr   r0,[sp,0x10]                  ; 080E9636
cmp   r0,0x1                        ; 080E9638
bhi   @@Code080E963E                ; 080E963A
mov   r1,0x1                        ; 080E963C
@@Code080E963E:
cmp   r1,0x0                        ; 080E963E
beq   @@Code080E9648                ; 080E9640
@@Code080E9642:
mov   r0,0x1                        ; 080E9642
neg   r0,r0                         ; 080E9644
b     @@Code080E9650                ; 080E9646
@@Code080E9648:
mov   r0,sp                         ; 080E9648
mov   r1,r4                         ; 080E964A
bl    Sub080E9470                   ; 080E964C
@@Code080E9650:
add   sp,0x28                       ; 080E9650
pop   {r4,pc}                       ; 080E9652

push  {r4,lr}                       ; 080E9654
add   sp,-0x28                      ; 080E9656
str   r0,[sp,0x20]                  ; 080E9658
str   r1,[sp,0x24]                  ; 080E965A
add   r0,sp,0x20                    ; 080E965C
mov   r1,sp                         ; 080E965E
bl    Sub080E8FC8                   ; 080E9660
add   r0,sp,0x24                    ; 080E9664
add   r4,sp,0x10                    ; 080E9666
mov   r1,r4                         ; 080E9668
bl    Sub080E8FC8                   ; 080E966A
mov   r1,0x0                        ; 080E966E
ldr   r0,[sp]                       ; 080E9670
cmp   r0,0x1                        ; 080E9672
bhi   @@Code080E9678                ; 080E9674
mov   r1,0x1                        ; 080E9676
@@Code080E9678:
cmp   r1,0x0                        ; 080E9678
bne   @@Code080E968A                ; 080E967A
mov   r1,0x0                        ; 080E967C
ldr   r0,[sp,0x10]                  ; 080E967E
cmp   r0,0x1                        ; 080E9680
bhi   @@Code080E9686                ; 080E9682
mov   r1,0x1                        ; 080E9684
@@Code080E9686:
cmp   r1,0x0                        ; 080E9686
beq   @@Code080E9690                ; 080E9688
@@Code080E968A:
mov   r0,0x1                        ; 080E968A
neg   r0,r0                         ; 080E968C
b     @@Code080E9698                ; 080E968E
@@Code080E9690:
mov   r0,sp                         ; 080E9690
mov   r1,r4                         ; 080E9692
bl    Sub080E9470                   ; 080E9694
@@Code080E9698:
add   sp,0x28                       ; 080E9698
pop   {r4,pc}                       ; 080E969A

push  {r4,lr}                       ; 080E969C
add   sp,-0x28                      ; 080E969E
str   r0,[sp,0x20]                  ; 080E96A0
str   r1,[sp,0x24]                  ; 080E96A2
add   r0,sp,0x20                    ; 080E96A4
mov   r1,sp                         ; 080E96A6
bl    Sub080E8FC8                   ; 080E96A8
add   r0,sp,0x24                    ; 080E96AC
add   r4,sp,0x10                    ; 080E96AE
mov   r1,r4                         ; 080E96B0
bl    Sub080E8FC8                   ; 080E96B2
mov   r1,0x0                        ; 080E96B6
ldr   r0,[sp]                       ; 080E96B8
cmp   r0,0x1                        ; 080E96BA
bhi   @@Code080E96C0                ; 080E96BC
mov   r1,0x1                        ; 080E96BE
@@Code080E96C0:
cmp   r1,0x0                        ; 080E96C0
bne   @@Code080E96D2                ; 080E96C2
mov   r1,0x0                        ; 080E96C4
ldr   r0,[sp,0x10]                  ; 080E96C6
cmp   r0,0x1                        ; 080E96C8
bhi   @@Code080E96CE                ; 080E96CA
mov   r1,0x1                        ; 080E96CC
@@Code080E96CE:
cmp   r1,0x0                        ; 080E96CE
beq   @@Code080E96D6                ; 080E96D0
@@Code080E96D2:
mov   r0,0x1                        ; 080E96D2
b     @@Code080E96DE                ; 080E96D4
@@Code080E96D6:
mov   r0,sp                         ; 080E96D6
mov   r1,r4                         ; 080E96D8
bl    Sub080E9470                   ; 080E96DA
@@Code080E96DE:
add   sp,0x28                       ; 080E96DE
pop   {r4,pc}                       ; 080E96E0
.pool                               ; 080E96E2

push  {r4,lr}                       ; 080E96E4
add   sp,-0x28                      ; 080E96E6
str   r0,[sp,0x20]                  ; 080E96E8
str   r1,[sp,0x24]                  ; 080E96EA
add   r0,sp,0x20                    ; 080E96EC
mov   r1,sp                         ; 080E96EE
bl    Sub080E8FC8                   ; 080E96F0
add   r0,sp,0x24                    ; 080E96F4
add   r4,sp,0x10                    ; 080E96F6
mov   r1,r4                         ; 080E96F8
bl    Sub080E8FC8                   ; 080E96FA
mov   r1,0x0                        ; 080E96FE
ldr   r0,[sp]                       ; 080E9700
cmp   r0,0x1                        ; 080E9702
bhi   @@Code080E9708                ; 080E9704
mov   r1,0x1                        ; 080E9706
@@Code080E9708:
cmp   r1,0x0                        ; 080E9708
bne   @@Code080E971A                ; 080E970A
mov   r1,0x0                        ; 080E970C
ldr   r0,[sp,0x10]                  ; 080E970E
cmp   r0,0x1                        ; 080E9710
bhi   @@Code080E9716                ; 080E9712
mov   r1,0x1                        ; 080E9714
@@Code080E9716:
cmp   r1,0x0                        ; 080E9716
beq   @@Code080E971E                ; 080E9718
@@Code080E971A:
mov   r0,0x1                        ; 080E971A
b     @@Code080E9726                ; 080E971C
@@Code080E971E:
mov   r0,sp                         ; 080E971E
mov   r1,r4                         ; 080E9720
bl    Sub080E9470                   ; 080E9722
@@Code080E9726:
add   sp,0x28                       ; 080E9726
pop   {r4,pc}                       ; 080E9728
.pool                               ; 080E972A

push  {lr}                          ; 080E972C
add   sp,-0x10                      ; 080E972E
mov   r1,r0                         ; 080E9730
mov   r0,0x3                        ; 080E9732
str   r0,[sp]                       ; 080E9734
lsr   r2,r1,0x1F                    ; 080E9736
str   r2,[sp,0x4]                   ; 080E9738
cmp   r1,0x0                        ; 080E973A
bne   @@Code080E9744                ; 080E973C
mov   r0,0x2                        ; 080E973E
str   r0,[sp]                       ; 080E9740
b     @@Code080E977C                ; 080E9742
@@Code080E9744:
mov   r0,0x1E                       ; 080E9744
str   r0,[sp,0x8]                   ; 080E9746
cmp   r2,0x0                        ; 080E9748
beq   @@Code080E9762                ; 080E974A
mov   r0,0x80                       ; 080E974C
lsl   r0,r0,0x18                    ; 080E974E
cmp   r1,r0                         ; 080E9750
bne   @@Code080E975C                ; 080E9752
ldr   r0,=0xCF000000                ; 080E9754
b     @@Code080E9782                ; 080E9756
.pool                               ; 080E9758

@@Code080E975C:
neg   r0,r1                         ; 080E975C
str   r0,[sp,0xC]                   ; 080E975E
b     @@Code080E9764                ; 080E9760
@@Code080E9762:
str   r1,[sp,0xC]                   ; 080E9762
@@Code080E9764:
ldr   r2,[sp,0xC]                   ; 080E9764
ldr   r3,=0x3FFFFFFF                ; 080E9766
cmp   r2,r3                         ; 080E9768
bhi   @@Code080E977C                ; 080E976A
ldr   r1,[sp,0x8]                   ; 080E976C
@@Code080E976E:
lsl   r0,r2,0x1                     ; 080E976E
sub   r1,0x1                        ; 080E9770
mov   r2,r0                         ; 080E9772
cmp   r0,r3                         ; 080E9774
bls   @@Code080E976E                ; 080E9776
str   r1,[sp,0x8]                   ; 080E9778
str   r0,[sp,0xC]                   ; 080E977A
@@Code080E977C:
mov   r0,sp                         ; 080E977C
bl    Sub080E8F10                   ; 080E977E
@@Code080E9782:
add   sp,0x10                       ; 080E9782
pop   {pc}                          ; 080E9784
.pool                               ; 080E9786

push  {lr}                          ; 080E978C
add   sp,-0x14                      ; 080E978E
str   r0,[sp,0x10]                  ; 080E9790
add   r0,sp,0x10                    ; 080E9792
mov   r1,sp                         ; 080E9794
bl    Sub080E8FC8                   ; 080E9796
mov   r1,0x0                        ; 080E979A
ldr   r0,[sp]                       ; 080E979C
cmp   r0,0x2                        ; 080E979E
bne   @@Code080E97A4                ; 080E97A0
mov   r1,0x1                        ; 080E97A2
@@Code080E97A4:
cmp   r1,0x0                        ; 080E97A4
bne   @@Code080E97D6                ; 080E97A6
mov   r1,0x0                        ; 080E97A8
cmp   r0,0x1                        ; 080E97AA
bhi   @@Code080E97B0                ; 080E97AC
mov   r1,0x1                        ; 080E97AE
@@Code080E97B0:
cmp   r1,0x0                        ; 080E97B0
bne   @@Code080E97D6                ; 080E97B2
mov   r1,0x0                        ; 080E97B4
cmp   r0,0x4                        ; 080E97B6
bne   @@Code080E97BC                ; 080E97B8
mov   r1,0x1                        ; 080E97BA
@@Code080E97BC:
cmp   r1,0x0                        ; 080E97BC
beq   @@Code080E97D0                ; 080E97BE
@@Code080E97C0:
ldr   r0,[sp,0x4]                   ; 080E97C0
ldr   r1,=0x7FFFFFFF                ; 080E97C2
cmp   r0,0x0                        ; 080E97C4
beq   @@Code080E97EE                ; 080E97C6
add   r1,0x1                        ; 080E97C8
b     @@Code080E97EE                ; 080E97CA
.pool                               ; 080E97CC

@@Code080E97D0:
ldr   r1,[sp,0x8]                   ; 080E97D0
cmp   r1,0x0                        ; 080E97D2
bge   @@Code080E97DA                ; 080E97D4
@@Code080E97D6:
mov   r0,0x0                        ; 080E97D6
b     @@Code080E97F0                ; 080E97D8
@@Code080E97DA:
cmp   r1,0x1E                       ; 080E97DA
bgt   @@Code080E97C0                ; 080E97DC
mov   r0,0x1E                       ; 080E97DE
sub   r0,r0,r1                      ; 080E97E0
ldr   r1,[sp,0xC]                   ; 080E97E2
lsr   r1,r0                         ; 080E97E4
ldr   r0,[sp,0x4]                   ; 080E97E6
cmp   r0,0x0                        ; 080E97E8
beq   @@Code080E97EE                ; 080E97EA
neg   r1,r1                         ; 080E97EC
@@Code080E97EE:
mov   r0,r1                         ; 080E97EE
@@Code080E97F0:
add   sp,0x14                       ; 080E97F0
pop   {pc}                          ; 080E97F2

push  {lr}                          ; 080E97F4
add   sp,-0x14                      ; 080E97F6
str   r0,[sp,0x10]                  ; 080E97F8
add   r0,sp,0x10                    ; 080E97FA
mov   r1,sp                         ; 080E97FC
bl    Sub080E8FC8                   ; 080E97FE
mov   r1,0x0                        ; 080E9802
ldr   r0,[sp,0x4]                   ; 080E9804
cmp   r0,0x0                        ; 080E9806
bne   @@Code080E980C                ; 080E9808
mov   r1,0x1                        ; 080E980A
@@Code080E980C:
str   r1,[sp,0x4]                   ; 080E980C
mov   r0,sp                         ; 080E980E
bl    Sub080E8F10                   ; 080E9810
add   sp,0x14                       ; 080E9814
pop   {pc}                          ; 080E9816

Sub080E9818:
push  {lr}                          ; 080E9818
add   sp,-0x10                      ; 080E981A
str   r0,[sp]                       ; 080E981C
str   r1,[sp,0x4]                   ; 080E981E
str   r2,[sp,0x8]                   ; 080E9820
str   r3,[sp,0xC]                   ; 080E9822
mov   r0,sp                         ; 080E9824
bl    Sub080E8F10                   ; 080E9826
add   sp,0x10                       ; 080E982A
pop   {pc}                          ; 080E982C
.pool                               ; 080E982E

push  {r4-r6,lr}                    ; 080E9830
add   sp,-0x18                      ; 080E9832
str   r0,[sp,0x14]                  ; 080E9834
add   r0,sp,0x14                    ; 080E9836
add   r1,sp,0x4                     ; 080E9838
bl    Sub080E8FC8                   ; 080E983A
ldr   r0,[sp,0x4]                   ; 080E983E
ldr   r1,[sp,0x8]                   ; 080E9840
ldr   r2,[sp,0xC]                   ; 080E9842
ldr   r3,[sp,0x10]                  ; 080E9844
mov   r4,0x0                        ; 080E9846
lsr   r6,r3,0x2                     ; 080E9848
lsl   r5,r4,0x1E                    ; 080E984A
mov   r4,r6                         ; 080E984C
orr   r4,r5                         ; 080E984E
lsl   r3,r3,0x1E                    ; 080E9850
str   r4,[sp]                       ; 080E9852
bl    Sub080E8EA4                   ; 080E9854
add   sp,0x18                       ; 080E9858
pop   {r4-r6,pc}                    ; 080E985A

Sub080E985C:
push  {r4-r6,lr}                    ; 080E985C
mov   r6,r1                         ; 080E985E
mov   r5,r0                         ; 080E9860
cmp   r2,0x0                        ; 080E9862
beq   @@Code080E988C                ; 080E9864
mov   r0,0x20                       ; 080E9866
sub   r0,r0,r2                      ; 080E9868
cmp   r0,0x0                        ; 080E986A
bgt   @@Code080E9878                ; 080E986C
mov   r4,0x0                        ; 080E986E
neg   r0,r0                         ; 080E9870
mov   r3,r6                         ; 080E9872
lsr   r3,r0                         ; 080E9874
b     @@Code080E9888                ; 080E9876
@@Code080E9878:
mov   r1,r6                         ; 080E9878
lsl   r1,r0                         ; 080E987A
mov   r4,r6                         ; 080E987C
lsr   r4,r2                         ; 080E987E
mov   r0,r5                         ; 080E9880
lsr   r0,r2                         ; 080E9882
mov   r3,r0                         ; 080E9884
orr   r3,r1                         ; 080E9886
@@Code080E9888:
mov   r1,r4                         ; 080E9888
mov   r0,r3                         ; 080E988A
@@Code080E988C:
pop   {r4-r6,pc}                    ; 080E988C
.pool                               ; 080E988E

Sub080E9890:
push  {r4-r7,lr}                    ; 080E9890
add   sp,-0x10                      ; 080E9892
str   r0,[sp]                       ; 080E9894
str   r1,[sp,0x4]                   ; 080E9896
str   r2,[sp,0x8]                   ; 080E9898
str   r3,[sp,0xC]                   ; 080E989A
ldr   r3,[sp]                       ; 080E989C
ldr   r0,=0xFFFF                    ; 080E989E
mov   r12,r0                        ; 080E98A0
mov   r2,r3                         ; 080E98A2
and   r2,r0                         ; 080E98A4
lsr   r3,r3,0x10                    ; 080E98A6
ldr   r1,[sp,0x8]                   ; 080E98A8
mov   r0,r1                         ; 080E98AA
mov   r4,r12                        ; 080E98AC
and   r0,r4                         ; 080E98AE
lsr   r1,r1,0x10                    ; 080E98B0
mov   r5,r2                         ; 080E98B2
mul   r5,r0                         ; 080E98B4
mov   r4,r2                         ; 080E98B6
mul   r4,r1                         ; 080E98B8
mov   r2,r3                         ; 080E98BA
mul   r2,r0                         ; 080E98BC
mul   r3,r1                         ; 080E98BE
lsr   r0,r5,0x10                    ; 080E98C0
add   r4,r4,r0                      ; 080E98C2
add   r4,r4,r2                      ; 080E98C4
cmp   r4,r2                         ; 080E98C6
bhs   @@Code080E98D0                ; 080E98C8
mov   r0,0x80                       ; 080E98CA
lsl   r0,r0,0x9                     ; 080E98CC
add   r3,r3,r0                      ; 080E98CE
@@Code080E98D0:
lsr   r0,r4,0x10                    ; 080E98D0
add   r7,r3,r0                      ; 080E98D2
mov   r1,r12                        ; 080E98D4
and   r4,r1                         ; 080E98D6
lsl   r0,r4,0x10                    ; 080E98D8
and   r5,r1                         ; 080E98DA
mov   r6,r0                         ; 080E98DC
orr   r6,r5                         ; 080E98DE
mov   r1,r7                         ; 080E98E0
mov   r0,r6                         ; 080E98E2
ldr   r3,[sp]                       ; 080E98E4
ldr   r4,[sp,0xC]                   ; 080E98E6
mov   r2,r3                         ; 080E98E8
mul   r2,r4                         ; 080E98EA
ldr   r5,[sp,0x4]                   ; 080E98EC
ldr   r4,[sp,0x8]                   ; 080E98EE
mov   r3,r5                         ; 080E98F0
mul   r3,r4                         ; 080E98F2
add   r2,r2,r3                      ; 080E98F4
add   r1,r7,r2                      ; 080E98F6
add   sp,0x10                       ; 080E98F8
pop   {r4-r7,pc}                    ; 080E98FA
.pool                               ; 080E98FC

Sub080E9900:
push  {r4,lr}                       ; 080E9900
neg   r2,r0                         ; 080E9902
mov   r3,r2                         ; 080E9904
neg   r1,r1                         ; 080E9906
cmp   r2,0x0                        ; 080E9908
beq   @@Code080E990E                ; 080E990A
sub   r1,0x1                        ; 080E990C
@@Code080E990E:
mov   r4,r1                         ; 080E990E
mov   r1,r4                         ; 080E9910
mov   r0,r3                         ; 080E9912
pop   {r4,pc}                       ; 080E9914
.pool                               ; 080E9916

Sub080E9918:
push  {r4-r5,lr}                    ; 080E9918
mov   r5,r0                         ; 080E991A
mov   r4,r5                         ; 080E991C
mov   r3,r1                         ; 080E991E
cmp   r2,0xF                        ; 080E9920
bls   @@Code080E9958                ; 080E9922
mov   r0,r3                         ; 080E9924
orr   r0,r5                         ; 080E9926
mov   r1,0x3                        ; 080E9928
and   r0,r1                         ; 080E992A
cmp   r0,0x0                        ; 080E992C
bne   @@Code080E9958                ; 080E992E
mov   r1,r5                         ; 080E9930
@@Code080E9932:
ldmia r3!,{r0}                      ; 080E9932
stmia r1!,{r0}                      ; 080E9934
ldmia r3!,{r0}                      ; 080E9936
stmia r1!,{r0}                      ; 080E9938
ldmia r3!,{r0}                      ; 080E993A
stmia r1!,{r0}                      ; 080E993C
ldmia r3!,{r0}                      ; 080E993E
stmia r1!,{r0}                      ; 080E9940
sub   r2,0x10                       ; 080E9942
cmp   r2,0xF                        ; 080E9944
bhi   @@Code080E9932                ; 080E9946
cmp   r2,0x3                        ; 080E9948
bls   @@Code080E9956                ; 080E994A
@@Code080E994C:
ldmia r3!,{r0}                      ; 080E994C
stmia r1!,{r0}                      ; 080E994E
sub   r2,0x4                        ; 080E9950
cmp   r2,0x3                        ; 080E9952
bhi   @@Code080E994C                ; 080E9954
@@Code080E9956:
mov   r4,r1                         ; 080E9956
@@Code080E9958:
sub   r2,0x1                        ; 080E9958
mov   r0,0x1                        ; 080E995A
neg   r0,r0                         ; 080E995C
cmp   r2,r0                         ; 080E995E
beq   @@Code080E9972                ; 080E9960
mov   r1,r0                         ; 080E9962
@@Code080E9964:
ldrb  r0,[r3]                       ; 080E9964
strb  r0,[r4]                       ; 080E9966
add   r3,0x1                        ; 080E9968
add   r4,0x1                        ; 080E996A
sub   r2,0x1                        ; 080E996C
cmp   r2,r1                         ; 080E996E
bne   @@Code080E9964                ; 080E9970
@@Code080E9972:
mov   r0,r5                         ; 080E9972
pop   {r4-r5,pc}                    ; 080E9974
.pool                               ; 080E9976
