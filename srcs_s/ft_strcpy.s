; rdi : char *des
; rsi : char *src
%ifidni		__OUTPUT_FORMAT__, elf64
	%define		NAME	ft_strcpy
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		NAME	_ft_strcpy
%endif

global NAME

section .text
NAME:
	push    rbp
	mov     rbp, rsp		;init stackframe
	mov		rcx, 0h			
start:	
	mov		dl, BYTE[rsi + rcx]
	mov		BYTE[rdi + rcx], dl 	;copy *src in *des 
	cmp		BYTE [rdi + rcx], 0h	;si carac copié = '\0'
		je	end
	inc		rcx				;i++
	jmp		start
end:
	mov		rax, rdi		;return des
	leave					;quit stackframe
	ret