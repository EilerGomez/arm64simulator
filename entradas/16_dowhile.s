/* 
    Sale del while hasta que x1=0

*/

.global _start

_start:
// do while x1 != 0
do:
    mov x0, 0
    ldr x1, =buffer
    mov x2, 2
    mov x8, 63
    svc 0
    
    mov x0, 1       // set stdout
    ldr x1, =buffer    // load buffer
    mov x8, 64      // write syscall_num
    svc 0           // generic syscall
    
while:
    cmp x1, 0
    bne do
end:
    mov x8, 93
    svc 0

.data
buffer: .space 2
