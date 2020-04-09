;size_t	ft_strlen(const char *s);
;rdi == char *str

extern	_ft_strlen
section .text

_ft_strlen:

	push	rbp
	mov		rbp, rsp		; init stackframe

	mov		rcx, 0h			; init compteur à 0
	cmp		rdi, 0h			; si chaine null		
	jz		end_while
	mov		rdx, rdi
	while:
	cmp		BYTE[rdx], 0h	; si la valeur pointé par rdx est '\0'
	jz		end_while
	inc		rdx
	inc		rcx
	jmp		while
	end_while:
	mov		rax, rcx		; valeur de retour dans rax
	leave					; quit stackframe
	ret

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg



; int ft_strlen(const char*str)
; {
; 	int i;
; 	i = 0;
	; if (str == NULL)
	; 	return (0);
;	while (str[i] != '\0')
;		 i++;
; 	return (i)
; }
