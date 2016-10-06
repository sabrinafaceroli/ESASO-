all: ks.o kc.o kernel

ks.o:
	nasm -f elf32 kernel.s -o ks.o

kc.o:
	gcc -m32 -c kernel.c -o kc.o

kernel:
	ld -m elf_i386 -T link.ld -o kernel ks.o kc.o

clean:
	rm *.o kernel

run:
	qemu-system-i386 -kernel kernel