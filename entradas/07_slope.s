/*

    Imprime una division (y2-y1)/(x2-x1)

*/

.global _start

_start:
    mov x0, 1           // x1
    mov x1, 2           // y1
    mov x3, 3           // x2
    mov x4, 4           // y2

    sub x5, x4, x1      // y2 - y1
    sub x6, x3, x0      // x2 - x1

    sdiv x0, 4, x6     // slope (y2-y1)/(x2-x1)

    mov x8, 93          // exit
    svc 0               // syscall
