/*
*  kernel.c
*/
void kmain(void)
{
	const char *str = "xupa federal";
	char *vidptr = (char*)0xb8000; 	//endereco de memoria de video
	unsigned int i = 0;
	unsigned int j = 0;

	// limpa tela
	// 25 linhas e 80 colunas, e cada elemento usa 2 bytes
	while(j < 80 * 25 * 2) {
		vidptr[j] = ' ';
		//atribui um byte de cor
		vidptr[j+1] = 0x0f; 		
		j = j + 2;
	}

	j = 0;

	//escreve a string em *str na tela
	while(str[j] != '\0') {
		vidptr[i] = str[j]; //pega ascii
		//byte de cor de cada letra
		vidptr[i+1] = 0x07;
		++j;
		i = i + 2;
	}
	return;
}