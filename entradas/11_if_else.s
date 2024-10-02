/* 
    Imprime un numero par o impar
*/

.global _start

.data
odd: .ascii "El numero es impar\n"
even: .ascii "El numero es par\n"

.text
_start:
    mov x0, 16      // number to test

if:                 
    ands x0, x0, 1       
    beq else        // b to else if even

    mov x0, 1       // print odd msg
    ldr x1, =odd
    mov x2, 18
    mov x8, 64
    svc 0
    b endif

else:
    mov x0, 1       // print even msg
    ldr x1, =even
    mov x2, 19
    mov x8, 64
    svc 0

endif:
    mov x0, 0       // exit
    mov x8, 93
    svc 0
