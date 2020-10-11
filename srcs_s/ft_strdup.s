; RDI const char *s

%ifidni		__OUTPUT_FORMAT__, elf64
	%define		NAME	ft_strdup
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		NAME	_ft_strdup
%endif

extern  malloc
extern  ft_strlen
extern  ft_strcpy

extern ft_write

global NAME

NAME:
	push    rbp
	mov     rbp, rsp    ;init stackframe
	call    ft_strlen
	inc     rax			;+1 pour \0
	push	rdi			;src dans rdx
	mov     rdi, rax    ;size à malloc
	mov		rax, 0h
	call    malloc  wrt ..plt
	cmp		rax, 0h
		je	fin
	pop		rsi
	mov     rdi, rax	;passe la chaine malloc à ft_strcpy
	call    ft_strcpy
fin:
	leave
	ret