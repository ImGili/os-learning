### 本章目的：让之前的引导程序输出一些文本

> 在开始之前，你需要了解这些概念： interrupts, CPU registers

我们可以通过【中断】来完成这个功能。

在这个例子中我们将会向寄存器`al`(`ax`的低端部分)写入`hello`单词的每个字符，把`0x0e`写入`ah`(`ax`的高端部分)然后发出中断`0x10`，这是视频服务的通用中断。


`0x0e`写入`ah`告诉视频中断我们想要以`tty`模式显示`al`寄存器中的内容。

代码：

```asm
mov ah, 0x0e ; 进入tty模式 显示字符 并且光标随
mov al, 'H'
int 0x10 ; 根据ah寄存器的数据 触发中断
; 此时会在屏幕上输出一个 'H'字符

mov al, 'e'
int 0x10
; 此时会在屏幕上输出一个 'e'字符

mov al, 'l'
int 0x10
int 0x10
; 此时会在屏幕上输出两个 'l'字符

mov al, 'o'
int 0x10
; 此时会在屏幕上输出一个 'o'字符

jmp $ ; 跳回到第一条指令, 进入循环

times 510 - ($-$$) db 0 ; 从jmp $ 这条指令开始， 填充到第510字节，都是字节0

; 第511-512填充0xaa5
dw 0xaa55
```

编译和运行：

```
nasm -fbin boot_sect_print.asm -o boot_sect_print.bin
qemu-system-x86_64 boot_sect_print.bin
```

<img width="953" alt="image" src="https://user-images.githubusercontent.com/92664048/166137109-ee0bb1af-9baf-4051-92d6-0e896d421fd1.png">