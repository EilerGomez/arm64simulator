/*

    Imprimir a-z

*/

.global _start

.data
out: .ascii " "

.text
_start:
	mov w3, 97
	mov x3, 0//contador
	b imprimir
	
loop:
	cmp x3, 25
	beq fin
	add w3, w3, 1
	add x3, x3, 1
imprimir:
	ldr x1, =out
	strb w3, [x1]
    mov x0, 1           // stdout
    mov x2, 8           // size
    mov x8, 64          // write
    svc 0               // syscall
	b loop
fin:
    mov x0, x1          // return value
    mov x8, 93          // exit
    svc 0               // syscall
