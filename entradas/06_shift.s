/*

    Test asr, lsr, lsl, ror

*/

.global _start

.data
out: .ascii " - - - \n"
.text
_start:
    ldr x1, =out        // load output

    mov w0, 0b1001      // 9 = 1001
    asr w0, w0, 2       // w0 >> 2
    add w0, w0, 48      // adjust ascii
    strb w0, [x1]       // store 2 = 0010

    mov w0, 0b10000     // 16 = 10000
    lsr w0, w0, 1       // w0 >> 1
    add w0, w0, 48      // adjust ascii
    strb w0, [x1, 2]    // store 8 = 01000

    mov w0, 0b010       // 2 = 010
    lsl w0, w0, 1       // w0 << 1
    add w0, w0, 48      // adjust ascii
    strb w0, [x1, 4]    // store 4 = 100

    mov w0, 0b0001      // 1
    ror w0, w0, 61      // ror 61
    add w0, w0, 48      // adjust ascii
    strb w0, [x1, 6]    // store 8 = 1000 

    // Imprimir el resultado
    mov x0, 1           // stdout
    ldr x1, =out        // cargar dirección de salida nuevamente
    mov x2, 12          // tamaño (10 para caracteres, 2 para el salto de línea)
    mov x8, 64          // syscall: write
    svc 0               // llamada al sistema

    mov x0, 0           // return value
    mov x8, 93          // syscall: exit
    svc 0               // llamada al sistema
