nasm boot/boot.asm -o boot/boot.bin
nasm kernel/kernel.asm -o kernel/kernel.bin
dd if=boot/boot.bin of=60M.img bs=512 count=1 conv=notrunc
dd if=kernel/kernel.bin of=60M.img bs=512 count=1 seek=1 conv=notrunc
bochsdbg -q -f bochsrc