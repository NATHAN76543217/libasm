; rdi : char *des
; rsi : char *src
%ifidni		__OUTPUT_FORMAT__, elf64
	%define		NAME	ft_strcpy
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		NAME	_ft_strcpy
%endif

global NAME
NAME:
	push    rbp
	mov     rbp, rsp		;init stackframe
	mov		rcx, 0h			
start:	
	mov		dl, BYTE[rsi + rcx]
	mov		BYTE[rdi + rcx], dl 	;copy *src in *des 
	cmp		BYTE [rdi + rcx], 0h
	je		end
	inc		rcx				;
	jmp		start
end:
	mov		rax, rdi
	leave					;quit stackframe
	ret