/*
	comprobacion de un numero

*/

.global _start
.section .data
    valor: .word 15 // Definición de variable con el valor 10
    mayor_mensaje: .ascii "El resultado es mayor que 20\n"
    igual_mensaje: .ascii "El resultado es igual a 20\n"
    menor_mensaje: .ascii "El resultado es menor que 20\n"
.section .text
_start:
// Cargar la dirección de la variable 'valor' en el registro x0
    LDR x0, =valor
    // Cargar el valor almacenado en 'valor' en el registro x1
    MOV x1, x0
    // Sumar 5 al valor almacenado en x1
    ADD x1, x1, 5
    // Comparar el valor resultante con 20
    CMP x1, 20
    // Saltar a etiqueta 'es_mayor' si x1 es mayor que 20
    BGT es_mayor
    // Saltar a etiqueta 'es_igual' si x1 es igual a 20
    BEQ es_igual
    // Saltar a etiqueta 'es_menor' si x1 es menor que 20
    BLT es_menor
es_mayor:
    // Código a ejecutar si x1 es mayor que 20
    // Por ejemplo, imprimir un mensaje
    MOV x8, 64 // syscall number para sys_write
    MOV x0, 1 // file descriptor: stdout
    LDR x1, =mayor_mensaje // dirección del mensaje
    MOV x2, 30 // longitud del mensaje
    SVC 0 // syscall para escribir en stdout
    B fin // Saltar al final del programa
es_igual:
    // Código a ejecutar si x1 es igual a 20
    // Por ejemplo, imprimir un mensaje
    MOV x8, 64
    MOV x0, 1 // file descriptor: stdout
    LDR x1, =igual_mensaje // dirección del mensaje
    MOV x2, 30 // longitud del mensaje
    SVC 0 // syscall para escribir en stdout
    B fin // Saltar al final del programa
es_menor:
    // Código a ejecutar si x1 es menor que 20
    // Por ejemplo, imprimir un mensaje
    MOV x8, 64 // syscall number para sys_write
    MOV x0, 1 // file descriptor: stdout
    LDR x1, =menor_mensaje // dirección del mensaje
    MOV x2, 30 // longitud del mensaje
    SVC 0 // syscall para escribir en stdout
fin:
    // Finalizar el programa y salir
    mov x8, 93 // syscall number para exit
    MOV x0, 0 // código de salida
    SVC 0 // realizar llamada al sistema para salir

