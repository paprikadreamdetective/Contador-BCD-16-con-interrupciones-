.include "gpio.inc"  // Includes definitions from gpio.inc file
.thumb              // Assembles using thumb mode
.cpu cortex-m3      // Generates Cortex-M3 instructions
.syntax unified

.include "nvic.inc"

/**
 * seg a = B15
 * seg b = B14
 * seg c = B13
 * seg d = B12
 * seg e = B11
 * seg f = B10
 * seg g = B9
 */

delay:
        // Prologue
        push    {r7, lr} @ backs r7 up
        sub     sp, sp, #28 @ reserves a 32-byte function frame
        add     r7, sp, #0 @ updates r7
        str     r0, [r7] @ backs ms up
        // Body function
        //ldr     r0, =2666667
        mov     r0, #1000 @ ticks = 255, adjust to achieve 1 ms delay
        str     r0, [r7, #16]
// for (i = 0; i < ms; i++)
        mov     r0, #0 @ i = 0;
        str     r0, [r7, #8]
        b       F3
// for (j = 0; j < tick; j++)
F4:     mov     r0, #0 @ j = 0;
        str     r0, [r7, #12]
        b       F5
F6:     ldr     r0, [r7, #12] @ j++;
        add     r0, #1
        str     r0, [r7, #12]
F5:     ldr     r0, [r7, #12] @ j < ticks;
        ldr     r1, [r7, #16]
        cmp     r0, r1
        blt     F6
        ldr     r0, [r7, #8] @ i++;
        add     r0, #1
        str     r0, [r7, #8]
F3:     ldr     r0, [r7, #8] @ i < ms
        ldr     r1, [r7]
        cmp     r0, r1
        blt     F4
        // Epilogue
        adds    r7, r7, #28
        mov	    sp, r7
        pop	    {r7, lr}
        bx	    lr
.size	delay, .-delay

/**
 * @ function void h_0();
 * @ frame size: 8-byte
 * @ Write 0_h in 7 seg
*/
h_0:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 14, 13, 12, 11, 10, HIGH);
        mov     r3, 0xfc00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	    sp, r7
        pop	    {r7}
        bx	    lr
.size	h_0, .-h_0

/**
 * @ function void h_1();
 * @ frame size: 8-byte
 * @ Write 1_h in 7 seg
*/
h_1:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(14, 13, HIGH);
        mov     r3, 0x6000
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	    sp, r7
        pop	    {r7}
        bx	    lr
.size	h_1, .-h_1

/**
 * @ function void h_2();
 * @ frame size: 8-byte
 * @ Write 2_h in 7 seg
*/
h_2:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // dig italWrite(15, 14, 12, 11, 9, HIGH);
        mov     r3, 0xda00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	    sp, r7
        pop	    {r7}
        bx	    lr
.size	h_2, .-h_2

/**
 * @ function void h_3();
 * @ frame size: 8-byte
 * @ Write 3_h in 7 seg
*/
h_3:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 14, 13, 12, 9, HIGH);
        mov     r3, 0xf200
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	    sp, r7
        pop	    {r7}
        bx	    lr
.size	h_3, .-h_3

/**
 * @ function void h_4();
 * @ frame size: 8-byte
 * @ Write 4_h in 7 seg
*/
h_4:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(14, 13, 10, 9, HIGH);
        mov     r3, 0x6600
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	    sp, r7
        pop	    {r7}
        bx	    lr
.size	h_4, .-h_4

/**
 * @ function void h_5();
 * @ frame size: 8-byte
 * @ Write 5_h in 7 seg
*/
h_5:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 13, 12, 10,  9, HIGH);
        mov     r3, 0xb600
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	    sp, r7
        pop	    {r7}
        bx	    lr
.size	h_5, .-h_5

/**
 * @ function void h_6();
 * @ frame size: 8-byte
 * @ Write 6_h in 7 seg
*/
h_6:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 13, 12, 11, 10,  9, HIGH);
        mov     r3, 0xbe00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_6, .-h_6

/**
 * @ function void h_7();
 * @ frame size: 8-byte
 * @ Write 7_h in 7 seg
*/
h_7:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 14, 13,  9, HIGH);
        mov     r3, 0xe200
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_7, .-h_7

/**
 * @ function void h_8();
 * @ frame size: 8-byte
 * @ Write 8_h in 7 seg
*/
h_8:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 14, 13,  9, HIGH);
        mov     r3, 0xfe00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_8, .-h_8

/**
 * @ function void h_9();
 * @ frame size: 8-byte
 * @ Write 9_h in 7 seg
*/
h_9:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 14, 13, 12, 10,  9, HIGH);
        mov     r3, 0xf600
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_9, .-h_9

/**
 * @ function void h_a();
 * @ frame size: 8-byte
 * @ Write a_h in 7 seg
*/
h_a:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 14, 13, 11, 10,  9, HIGH);
        mov     r3, 0xee00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_a, .-h_a

/**
 * @ function void h_b();
 * @ frame size: 8-byte
 * @ Write b_h in 7 seg
*/
h_b:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(13, 12, 11, 10,  9, HIGH);
        mov     r3, 0x3e00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_b, .-h_b

/**
 * @ function void h_c();
 * @ frame size: 8-byte
 * @ Write c_h in 7 seg
*/
h_c:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 12, 11, 10, HIGH);
        mov     r3, 0x9c00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_c, .-h_c

/**
 * @ function void h_d();
 * @ frame size: 8-byte
 * @ Write d_h in 7 seg
*/
h_d:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(14, 13, 12, 11,  9, HIGH);
        mov     r3, 0x7a00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_d, .-h_d

/**
 * @ function void h_e();
 * @ frame size: 8-byte
 * @ Write e_h in 7 seg
*/
h_e:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 12, 11, 10,  9, HIGH);
        mov     r3, 0x9e00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_e, .-h_e

/**
 * @ function void h_f();
 * @ frame size: 8-byte
 * @ Write f_h in 7 seg
*/
h_f:
        // Prologue
        push    {r7}
        sub     sp, sp, #4
        add     r7, sp, #0
        // digitalWrite(15, 11, 10,  9, HIGH);
        mov     r3, 0x8e00
        ldr     r0, =GPIOB_ODR
        str     r3, [r0]
        // Epilogue
        adds    r7, r7, #4
        mov	sp, r7
        pop     {r7}
        bx      lr
.size	h_f, .-h_f

/**
 * @ function void hex7Seg(int x);
 * @ frame size: 12-byte
 * @ Write hex number in 7 seg
 * @ param int x
*/
hex7Seg:
         // Prologue
        push    {r7, lr}
        sub     sp, sp, #12
        add     r7, sp, #0
        /*Se respalda el argumento de la funcion*/
        str     r0, [r7]
        /*switch (x)*/
        // if (i == 0)
        ldr     r3, [r7]
        cmp     r3, #0
        bne     L1
        bl      h_0
        b       break
L1:
        // if (i == 1)
        ldr     r3, [r7]
        cmp     r3, #1
        bne     L2
        bl      h_1
        b       break
L2:
        // if (i == 2)
        ldr     r3, [r7]
        cmp     r3, #2
        bne     L3
        bl      h_2
        b       break
L3:
        // if (i == 3)
        ldr     r3, [r7]
        cmp     r3, #3
        bne     L4
        bl      h_3
        b       break
L4:
        // if (i == 4)
        ldr     r3, [r7]
        cmp     r3, #4
        bne     L5
        bl      h_4
        b       break
L5:
        // if (i == 5)
        ldr     r3, [r7]
        cmp     r3, #5
        bne     L6
        bl      h_5
        b       break
L6:
        // if (i == 6)
        ldr     r3, [r7]
        cmp     r3, #6
        bne     L7
        bl      h_6
        b       break
L7:
        // if (i == 7)
        ldr     r3, [r7]
        cmp     r3, #7
        bne     L8
        bl      h_7
        b       break
L8:
        // if (i == 8)
        ldr     r3, [r7]
        cmp     r3, #8
        bne     L9
        bl      h_8
        b       break
L9:
        // if (i == 9)
        ldr     r3, [r7]
        cmp     r3, #9
        bne     La
        bl      h_9
        b       break
La:
        // if (i == 10)
        ldr     r3, [r7]
        cmp     r3, #10
        bne     Lb
        bl      h_a
        b       break
Lb:
        // if (i == 11)
        ldr     r3, [r7]
        cmp     r3, #11
        bne     Lc
        bl      h_b
        b       break
Lc:
        // if (i == 12)
        ldr     r3, [r7]
        cmp     r3, #12
        bne     Ld
        bl      h_c
        b       break
Ld:
        // if (i == 13)
        ldr     r3, [r7]
        cmp     r3, #13
        bne     Le
        bl      h_d
        b       break
Le:
        // if (i == 14)
        ldr     r3, [r7]
        cmp     r3, #14
        bne     Lf
        bl      h_e
        b       break
Lf:
        // if (i == 15)
        ldr     r3, [r7]
        cmp     r3, #15
        bne     break
        bl      h_f
break:

        // Epilogue
        adds    r7, r7, #12
        mov	    sp, r7
        pop	    {r7, lr}
        bx	    lr
.size	hex7Seg, .-hex7Seg

setup:
        /*Prologue*/
        push    {r7, lr}
        sub     sp, sp, #20
        add     r7, sp, #0
        // Habilitar señal de reloj para los puertos B.
        ldr     r0, =RCC_APB2ENR
        ldr     r3, =0x00000008
        str     r3, [r0]

        // Inicializar las salidas
        ldr     r3, =0x33333334
        ldr     r0, =GPIOB_CRH
        str     r3, [r0]
        // int i = 0;
        mov    r3, #0
        str    r3, [r7, #16]

loop:
        // if (i >= 16)
        ldr     r3, [r7, #16]
        cmp     r3, 0x10
        blt     K0
        // i = 0;
        mov     r3, #0
        str     r3, [r7, #16]
K0:
        // hex7Seg(i);
        ldr     r3, [r7, #16]
        mov     r0, r3
        bl      hex7Seg
        // delay(500);
        mov     r0, #500
        bl      delay
        // i++;
        ldr     r3, [r7, #16]
        adds    r3, r3, #1
        str     r3, [r7, #16]

        b       loop

