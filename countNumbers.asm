section .data
	; mensagens 
	inputMens db 'Digite um numero de ate 9 digitos',10
	sizeInput equ $ - inputMens
	
	errorMens db 'Numero invalido! Tente novamente',10
	sizeError equ $ - errorMens
	
	resultMens db 'O resultado da soma é: '
	sizeResult equ $ - resultMens
	
	rerunProgramMens db 10,'Deseja repetir o programa? Se sim, digite S, se não, digite N',10
	sizeRerun equ $ - rerunProgramMens

section .bss
	buffer resb 10
	qde resd 1 ; tamanho do buffer apos a leitura

section .text
global _start

_start:
	mov edx,sizeInput ; imprime inputMens
	mov ecx,inputMens
	call print

	mov ecx, buffer
	mov edx, 10
	call read
	mov[qde], eax
	
	call check
	
;~ readNumber2:

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

check:
	; Verificações
	cmp byte[qde],1 ; compara pra ver se qde é igual a 1
	je readNumber ; se for igual repete
	jmp loopCheck ; senão sai
	
	loopCheck:
		mov al, [buffer + esi]
		cmp al,10 ; compara o byte com 10
		je exit ; se for igual sai
		cmp al, '0' ; 0 em ascii é 48
		jl notNumber ; é menor que 48, logo não é número
		cmp al, '9' ; 9 em ascii é 57
		jg notNumber ; é maior que 57, logo não é número
		sub al,48
		mov [buffer + esi], al
		inc esi ; incrementa esi
		jmp loopCheck ; senão continua no loop
	
		
notNumber:
	mov edx,sizeError ; imprime errorMens
	mov ecx,errorMens
	call print
	
readNumber:
	mov edx,sizeInput ; imprime inputMens
	mov ecx,inputMens
	call print
	mov ecx, buffer
	mov edx, 10
	call read
	mov[qde], eax
	call check
exit:
	ret

convert2num:
	
