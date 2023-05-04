section .data			; dados inicializados
mens db 10

segment .text
global _start			; ld vai requerer

print:
	mov ebx,1			; tela (FD)
	mov eax,4			; serviço print
	int 80h
	ret

_start:					; ponto de entrada

	 mov edx,1		; quantidade de bytes
	 mov ecx,mens		; ponteiro da string
	 call print
	 
fim: 
	 mov eax,1			; serviço EXIT
	 int 80h			; system call
