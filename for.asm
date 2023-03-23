section .data			; dados inicializados
mens db "Digite uma String",10
tam equ $ - mens

segment .bss
buffer1 resb 50
qde resd 1
buffer2 resb 50

segment .text
global _start			; ld vai requerer

_start:					; ponto de entrada

mov edx,tam		; quantidade de bytes
mov ecx,mens		; ponteiro da string
mov ebx,1			; tela (FD)
mov eax,4			; serviço print
int 80h
	 
mov eax, 3 ;read
mov ebx, 0
mov ecx, buffer1
mov edx, 50
int 80h
mov[qde], eax

iniloop: ;inicio do loop
mov al, [buffer1 + esi] ;caracter atual
mov [buffer2 + esi], al ;transferindo para buffer2

inc esi
cmp esi, [qde]
je sai
jmp iniloop

sai:
mov edx,esi		; quantidade de bytes
mov ecx,buffer2		; ponteiro da string
mov ebx,1			; tela (FD)
mov eax,4			; serviço print
int 80h

fim: mov eax,1			; serviço EXIT
	 int 80h			; system call

