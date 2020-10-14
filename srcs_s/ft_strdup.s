; RDI const char *s

%ifidni		__OUTPUT_FORMAT__, elf64

	%define		NAME	ft_strdup
	%define		FT_STRLEN	ft_strlen
	%define		FT_STRCPY	ft_strcpy
	%define		MALLOC		malloc
	%macro		CALL_MALLOC	0
		call    malloc  wrt ..plt
	%endmacro
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		NAME	_ft_strdup
	%define		FT_STRLEN	_ft_strlen
	%define		FT_STRCPY	_ft_strcpy
	%define		MALLOC		_malloc
	%macro		CALL_MALLOC	0
		call    _malloc
	%endmacro
%endif

extern  MALLOC
extern  FT_STRLEN
extern  FT_STRCPY

global NAME

NAME:
	push    rbp
	mov     rbp, rsp    ;init stackframe
	call    FT_STRLEN
	inc     rax			;+1 pour \0
	push	rdi			;src dans rdx
	mov     rdi, rax    ;size à malloc
	mov		rax, 0h
	CALL_MALLOC
	cmp		rax, 0h
		je	fin
	pop		rsi
	mov     rdi, rax	;passe la chaine malloc à ft_strcpy
	call    FT_STRCPY
fin:
	leave
	ret