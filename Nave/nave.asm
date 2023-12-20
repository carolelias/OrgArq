
jmp main

nomejogo	: string "Nave - Carolina Elias"


main:
	loadn r0, #50	; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #nomejogo	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #1536	; Seleciona a COR da Mensagem

    call PrintString

    loadn r0, #80   ; começa na terceira linha da tela
	loadn r1, #'o'	    ; caractere que representa a nave
	loadn r2, #32	    ; código ascii do space
    loadn r5, #1199     ; Fim da tela


Loop:
    call DeletaNave
    call NovaPos
    call ImprimeNave
    call Delay
    jmp Loop

	halt

PrintString:
    push r0
    push r1
    push r2
    push r3
    push r4
    
    loadn r3, #'\0' ; Criterio de parada

    Loop_print: 
        ;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso
        ;  r1 = endereco onde comeca a mensagem
        ;  r2 = cor da mensagem
        
        loadi r4, r1
        add r4, r2, r4  ; selecionando a cor
        outchar r4, r0  ; printando a letra
        inc r0          ; indo para a posição do próximo caractere
        inc r1          ; passando para a próxima letra
        loadi r4, r1
        cmp r4, r3      ; verifica se chegou no '\0' 
        jne Loop_print  ; se ainda não chegou no final da string, continua no loop
    
    
    pop r4 
    pop r3
    pop r2
    pop r1
    pop r0
    rts

DeletaNave:
    ; r0 é a posição atual da nave

    outchar r2, r0  ; coloca o caractere do espaço no lugar da nave
    rts

NovaPos:
    inc r0      ; aumenta em 1 a posição da nave
    cmp r0, r5  ; verifica se chegou no final da tela
    ceq Reinicia
    rts


ImprimeNave:
    ; r1 é o caractere da nave e r0 a posição na tela
    
    outchar r1, r0  ; imprime a nave na posição
    rts

Delay:
    push r0
    push r1

    loadn r1, #50

    Delay1:           
        loadn r0, #4000

        Delay2:
            dec r0;                 
            jnz Delay2
            dec r1
            jnz Delay1

    pop r1
    pop r0

    rts

; --------------- Volta com a nave para o começo (linha 3) ---------------------
Reinicia:
    loadn r0, #80
    rts