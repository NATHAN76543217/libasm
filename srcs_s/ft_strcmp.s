; RDI   const char *s1
; RSI   const char *s2

%ifidni		__OUTPUT_FORMAT__, elf64
	%define		NAME	ft_strcmp
%elifidni	__OUTPUT_FORMAT__, macho64
	%define		NAME	_ft_strcmp
%endif

global NAME

NAME:
	push    rbp
	mov     rbp, rsp
	mov		rcx, 0h					;i = 0
	mov		r8, 0h
	cmp		rdi, 0h					; if s1 == NULL
		je	end
	cmp		rsi, 0h					; if s2 == NULL
		je	end
while:
	mov		dl, BYTE[rdi + rcx]		;récupere s1[i]
	mov		r8b, BYTE[rsi + rcx]	;resupere s2[i]
	cmp		dl, r8b					;if s1[i] != s2[i]
		jne	end
	cmp		dl, 0h					;if s1[i] == '\0'
		je	end
	cmp		r8b, 0h					;if s2[i] == '\0' 
		je	end
	inc		rcx						;i++;
	jmp		while
end:
	mov		rax, 0h
	mov		al, dl
	sub		rax, r8				;return(s1[i] - s2[i])
DEBUG:
	leave
	ret
