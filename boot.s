.data

.globl	_start
.text

_start:
.code16
		xorw	%ax, %ax		#limpando registradores
		movw	%ax, %ds
		movw	%ax, %ss
		movw	%ax, %fs

		call clear_screen

		jmp	loop

clear_screen:

		movb	$' ', %al
		movb	$0x0F, %ah		#high 8-15
		movl	$0xB8000, %ecx	#onde vai escrever na tela
		movb	$0,%ebx
		movb	$4000,%edx		#80 linhas * 25 cols = 2000

loop_clear_screen:
		movl	%eax, (%ecx)	#escreve na tela
		inc 	%ebx			#incrementa contador
		cmp		%edx, %ebx		#verifica se preencheu tudo
		jg		fim_clear
		addl	$2, %ecx		#inc 2 pois sao 2 bytes por char
		jmp 	loop_clear_screen
fim_clear:

		ret

loop:		
		nop
		jmp	loop

. = _start + 510
.byte		0X55, 0xAA
