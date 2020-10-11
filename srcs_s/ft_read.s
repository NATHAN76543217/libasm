; RDI int fd
; RSI void *buf
; RDX size_t count

%ifidni		__OUTPUT_FORMAT__, elf64
	extern		__errno_location
	%define		ERRNO	__errno_location WRT ..plt
	%define		NAME	ft_read
	%assign		READ_SYSCALL_NB	0x0
	%macro		ERRNO_PROCESS	1
	cmp		rax, 0
		jns		%1                      ;si il n'y a pas d'erreur alors aller a 'quit'
	neg		rax							;invert error code
	%endmacro
%elifidni	__OUTPUT_FORMAT__, macho64
	extern		___error
	%define		ERRNO	___error
	%define		NAME	_ft_read
	%assign		READ_SYSCALL_NB	0x2000003
	%macro		ERRNO_PROCESS	1
	jnc		%1                             ;si aucune erreur alors aller a 'quit'
	%endmacro
%endif

global NAME

section .text
NAME:
    push    rbp
    mov     rbp, rsp
    mov     rax, READ_SYSCALL_NB
	syscall
	ERRNO_PROCESS	quit				;if no error jump to quit
	mov		rdi, rax					;save error code in rdi
	call	ERRNO						;get errno pointer in rax
	mov		DWORD [rax], edi			;put error code in errno
	mov		rax, -1						;put return value -1 in RAX
quit:
	leave
	ret
