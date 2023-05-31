section .data
	; mensagens 
	inputMens db "Digite um numero de ate 9 digitos",10
	errorMens db "Numero invalido! Tente novamente",10
	resultMens db "O resultado da soma é: "
	rerunProgramMens db 10,"Deseja repetir o programa? Se sim, digite S, se não, digite N",10

	; tamanhos das mensagens
	sizeInput equ $ - inputMens
	sizeError equ $ - errorMens
	sizeResult equ $ - resultMens
	sizeRerun equ $ - rerunProgramMens

segment .bss
	buffer resb 10
	qde resd 1 ; tamanho do buffer apos a leitura

segment .text
global _start

_start:

readNumber1: ; leitura numero 1
	mov edx,sizeInput ; imprime inputMens
	mov ecx,inputMens
	call print

	mov ecx, buffer
	mov edx, 10
	int 80h
	call read
	mov[qde], eax
	cmp byte[qde],1 ; compara pra ver se qde é igual a 1
	je readNumber1 ; se for igual repete
	jmp exit1 ; senão sai
	
exit1:

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

checkNumber:
	loop:
		cmp byte[buffer + esi], 48 ; 0 em ascii é 48
		jl notNumber ; é menor que 48, logo não é número
		cmp byte[buffer + esi], 57 ; 9 em ascii é 57
		jg notNumber ; é maior que 57, logo não é número
		inc esi ; incrementa esi
		cmp esi,[qde] ; compara esi com o size qde
		je end ; se esi for igual ao size qde 
		jmp loop ; senão continua no loop
		
	notNumber:
	mov edx,sizeError ; imprime errorMens
	mov ecx,errorMens
	call print
	jmp readNumber1
	
	end:
	ret
