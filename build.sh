sudo apt install qemu-system-x86
sudo apt install nasm

nasm -f bin -o plOS.bin boot/boot.asm 
qemu-system-x86_64 plOS.bin