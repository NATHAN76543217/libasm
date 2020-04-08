global start
extern ft_write

section .text

start:

	push    rbp
	mov     rbp, rsp
	
	while:			;
	mov		rax, rsp
	mov		rdx, 0
	mov		rcx, 1h
	div		rcx 	;modulo 16 pour avoir le reste
	if:		
	test	edx, edx			;
	jz		end_while	;si le reste est 0 alors c'est bon
    sub     rsp, 8		; sinon on ajoute 8
	jmp		while
	end_while:			;
	; preparer les parametres de ft_write
    mov     rdi, 1 			; fildes: stdout
    mov     rsi, msg
    mov     rdx, msg.len
	call    ft_write
	mov     rax, 2000001h ; exit
	mov     rdi, 0
	syscall

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg

; PROGRAMME POUR LANCER
; UN APPEL 'call' SUR UNE ADRESSE MULTIPLE DE 16

; global start
; extern ft_write

; section .text

; start:

; 	push    rbp
; 	mov     rbp, rsp
	
; 	while:			;
; 	mov		rax, rsp
; 	mov		rdx, 0
; 	mov		rcx, 1h
; 	div		rcx 	;modulo 16 pour avoir le reste
; 	if:		
; 	test	edx, edx			;
; 	jz		end_while	;si le reste est 0 alors c'est bon
;     sub     rsp, 8		; sinon on ajoute 8
; 	jmp		while
; 	end_while:			;
; 	call    ft_write
; 	mov     rax, 2000001h ; exit
; 	mov     rdi, 0
; 	syscall