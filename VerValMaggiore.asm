; verifica valore maggiore

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA
    vettore          DB    1,2,3,4,9,6,7,8,9,'$'
    conta            DB    ? 
.CODE                                                                                                
    
.STARTUP         
    lea si,vettore
    lea di,vettore    
ciclo:        
    mov al,[si]
    cmp al,'$'
    jne nonuguale
    jmp saltafine
nonuguale:
    mov bl,[di]
    cmp bl,'$'
    je fineDI
    cmp al,bl
    ja  maggiore1
    inc di
    jmp ciclo
maggiore1:
    cmp al,conta
    ja  maggiore2 
    inc di
    jmp ciclo
maggiore2: 
    mov conta,al
    inc di
    jmp ciclo
fineDI:
    inc si
    mov di,0
    jmp ciclo
    
saltafine: 
;servizio DOS di chiusura programma
    mov ax, 4c00h ; exit to operating system.
    int 21h    
END

