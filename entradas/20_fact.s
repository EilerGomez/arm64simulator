/* 
    caclular el factorial de un numero
*/

.global factorial

factorial:
    // initialization
    mov x0, 3
	mov x9, x0          // number
    mov x10, 1          // neutral value


    // iterative multiplication
loop: 
    cmp x9, 1    // if num <= 1
    ble end_loop
    mul x10, x10, x9    // 2i num *= (num-1)
    add x9, x9, -1      // num--
    b loop

end_loop:
    mov x0, 0            // Código de retorno 0 (salida exitosa)
    mov x8, 93           // Número de la llamada al sistema para exit
    svc 0                // Llamar al sistema para salir
