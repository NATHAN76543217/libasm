; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
; rdi : int fildes
; rsi : void *buf
; rdx : size_t nbytes 

extern _ft_write
section .text

_ft_write:

	push    rbp
	mov     rbp, rsp
	cmp		rsi, 0h			;test si chaine de caractere non null
		jz  err
	mov     rax, 2000004h ; write
	syscall
	;faire retour de fonction
	leave
	ret

err:

mov		rax, -1
ret