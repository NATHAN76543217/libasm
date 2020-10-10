; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
; rdi : int fildes
; rsi : void *buf
; rdx : size_t nbytes 

global		ft_write
extern		__errno_location
%ifidni		__OUTPUT_FORMAT__, efl64
	%define		ERRNO	__errno_location WRT ..plt
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		ERRNO	___error

section .text
ft_write:
	push    rbp
	mov     rbp, rsp
	mov		rax, 1						; write
	syscall
	cmp		rax, 0
		js	error
	leave
	ret

error:
	neg		rax							;invert error code
	mov		rdi, rax					;save it in rdi
	call	ERROR	;get errno pointed by rax
	mov		DWORD [rax], edi			;put error code in errno
	mov		rax, -1						;put return value -1 in RAX
	leave
	ret