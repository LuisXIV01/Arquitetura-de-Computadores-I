section .data
mens1 db "Digite um numero de ate 9 algariso",10
tam equ $ - mens1


segment .bss
buffer resb 10
qde resd 1 ; tamanho do buffer apos a leitura

segment .text
global _start

_start:

readNumbers: ; leitura numeros
mov edx,tam ; imprime a mens1
mov ecx,mens1
call print

mov ecx, buffer
mov edx, 10
int 80h
call read
mov[qde], eax

fim: mov eax,1
int 80h

print:
mov ebx,1
mov eax,4
int 80h
ret

read:
mov eax,3
mov ebx,0
int 80h
ret
