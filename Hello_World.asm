section .data			; dados inicializados
mens db "Bom dia!",10
tam equ $ - mens

segment .text
global _start			; ld vai requerer
_start:					; ponto de entrada




	 mov edx,tam			; quantidade de bytes
	 mov ecx,mens		; ponteiro da string
	 mov ebx,1			; tela (FD)
	 mov eax,4			; serviço print
	 int 80h
fim: mov eax,1			; serviço EXIT
	 int 80h			; system call
