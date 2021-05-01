mkdosfs -C temp/plOS.img 1440
nasm -O0 -w+orphan-labels -f bin -o temp/boot.sys boot/boot.asm
dd status=noxfer conv=notrunc if=temp/boot.sys of=temp/plOS.img
mkisofs -quiet -V 'plOS' -input-charset iso8859-1 -o iso/plOS.iso -b plOS.img ./temp
rm temp/plOS.flp
rm temp/boot.sys
