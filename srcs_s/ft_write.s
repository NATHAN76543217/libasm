; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
; rdi : int fildes
; rsi : void *buf
; rdx : size_t nbytes 


%ifidni		__OUTPUT_FORMAT__, elf64
	%define		ERRNO	__errno_location WRT ..plt
	%define		NAME	ft_write
	%assign		WRITE_SYSCALL_NB	0x1 
	%macro		ERRNO_PROCESS	1
	
	neg		rax							;invert error code
	%endmacro
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		ERRNO	___error
	%define		NAME	_ft_write
	%assign		WRITE_SYSCALL_NB	0x2000004
	%macro		ERRNO_PROCESS	1
	
	%endmacro
%endif

extern		ERRNO
global		NAME

section .text
NAME:
	push    rbp
	mov     rbp, rsp
	mov		rax, WRITE_SYSCALL_NB		; write
	syscall
	cmp		rax, 0
		js	error
	leave
	ret

error:
	ERRNO_PROCESS hey
	mov		rdi, rax					;save it in rdi
	call	ERRNO	;get errno pointed by rax
	mov		DWORD [rax], edi			;put error code in errno
	mov		rax, -1						;put return value -1 in RAX
	leave
	ret