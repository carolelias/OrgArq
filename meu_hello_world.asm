; Carolina Elias de Alemida Américo - 1367


jmp main


helloWorld : string "Hello, World!"


main:
	loadn r0, #613			; r0 é a posição onde a primeira letra é impressa
	loadn r1, #helloWorld	; endereço da string (variável global)
	loadn r2, #1280			; cor roxa
	
	call PrintString   ;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"

	halt
	



; ------------ IMPRIME TODAS AS LETRAS DE UMA STRING ATÉ CHEGAR NO '\0'--------------------

PrintString:
	push r0
	push r1
	push r2
	push r3
	push r4
	
	loadn r3, #'\0'	; Criterio de parada

	Loop_print:	
		;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso
		;  r1 = endereco onde comeca a mensagem
		;  r2 = cor da mensagem
		
		loadi r4, r1
		add r4, r2, r4	; selecionando a cor
		outchar r4, r0	; printando a letra
		inc r0			; indo para a posição do próximo caractere
		inc r1			; passando para a próxima letra
		loadi r4, r1
		cmp r4, r3		; verifica se chegou no '\0' 
		jne Loop_print	; se ainda não chegou no final da string, continua no loop
	
	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
	
	