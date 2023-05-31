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

	call read
	
;~ readNumber2:

fim: mov eax,1
int 80h

print:
	mov ebx,1
	mov eax,4
	int 80h
	ret

read:
	readNumber:
		mov edx,sizeInput ; imprime inputMens
		mov ecx,inputMens
		call print
		
		mov ecx, buffer
		mov edx, 10
		int 80h
		mov eax,3
		mov ebx,0
		int 80h
		mov[qde], eax
	
	; Verificações
	cmp byte[qde],1 ; compara pra ver se qde é igual a 1
	je readNumber ; se for igual repete
	jmp loopCheck ; senão sai
	
	loopCheck:
		cmp byte [buffer + esi],10 ; compara o byte com 10
		je exit ; se for igual sai
		cmp byte [buffer + esi], '0' ; 0 em ascii é 48
		jl notNumber ; é menor que 48, logo não é número
		cmp byte [buffer + esi], '9' ; 9 em ascii é 57
		jg notNumber ; é maior que 57, logo não é número
		inc esi ; incrementa esi
		jmp loopCheck ; senão continua no loop
		
	notNumber:
	mov edx,sizeError ; imprime errorMens
	mov ecx,errorMens
	call print
	jmp readNumber
	
exit:
	ret
