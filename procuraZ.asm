	section .data ; dados inicializados
	mens db "Digite uma String",10
	tam equ $ - mens

	segment .bss
	buffer1 resb 50
	qde resd 1
	buffer2 resb 50

	segment .text
	global _start ; ld vai requerer

_start:	; ponto de entrada

	mov edx,tam	; quantidade de bytes
	mov ecx,mens ; ponteiro da string
	mov ebx,1 ; tela (FD)
	mov eax,4 ; serviço print
	int 80h
	 
	mov eax, 3 ;read
	mov ebx, 0
	mov ecx, buffer1
	mov edx, 50
	int 80h
	mov[qde], eax
	mov esi,0

iniloop: ;inicio do loop
	cmp byte[buffer1 + esi],"z" ;atual
	jne pula
	inc byte[cont]
pula:

	inc esi
	cmp esi, [qde]
	je sai
	jmp iniloop

sai:
	saltalinha db 10
	mov edx,1	; quantidade de bytes
	mov ecx,saltalinha ; ponteiro da string
	mov ebx,1 ; tela (FD)
	mov eax,4 ; serviço print
	int 80h
	
	mov edx,1	; quantidade de bytes
	mov edx,1
	mov ecx,byte ; ponteiro da string
	mov ebx,1 ; tela (FD)
	mov eax,4 ; serviço print
	int 80h

fim: mov eax,1 ; serviço EXIT
	 int 80h ; system call
