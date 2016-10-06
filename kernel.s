bits 32
section .text
        ;multiboot spec
        align 4					;declaracao de endereco de variaveis de saida
        dd 0x1BADB002            ;endereco magico do alex
        dd 0x00                  ;flags
        dd - (0x1BADB002 + 0x00) ;verifica se as flags + magico dao 0

global start
extern kmain	        ;kmain ta no .c

start:
  cli 			;limpa tela
  mov esp, stack_space	;seta stack pointer
  call kmain
  hlt		 	;fim

section .bss
resb 8192		;separa 8kb para pilha
stack_space: