Google关键词：汇编、BIOS

**目标：创建一个能被BIOS解释为开机引导的文件**

这很令人兴奋，因为我们将创建我们自己的开机引导

# 理论
当计算机启动时，BIOS不知道怎么取加载OS，所以计算机将加载OS的任务交给开机引导。因此，开机引导程序必须放置在一个已知、标准的位置。位置时在硬盘的第一个（ cylinder 0, head 0, sector 0 ），且，占用512个字节。

未来确保开机引导是“可启动”的，BIOS会检查511字节和512字节，并且这两个自己组成字``0xAA55``。

这是最简单的开机引导程序：
```
e9 fd ff 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[ 29 more lines with sixteen zero-bytes each ]
00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
```

这个程序几乎全是0，以十六位数值``0xAA55``（x86处理器是小端）。前三个字节是无限跳转。

# 最简单的开机引导程序
你可以用二进制编辑器将输入开机引导二进制程序，或者你可以简单的输入如下几句汇编程序：

```nasm
; 无限循环 (e9 fd ff)
; 这里就是 $
loop:
    jmp loop 

; times是重复操作的意思，$-$$是当前行命令到程序开始的程序距离，db是指定字节
times 510-($-$$) db 0 ; 这里就是 $$
; Magic number
; bios检查开机引导程序的标志
dw 0xaa55 
```

使用``nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin``来编译汇编程序。

> OSX会发生警告：如果发生警告或者错误，请参考00章

我知道你迫不及待的想跑这个程序了，所以就开跑：

```zsh
qemu-system-i386 boot_sect_simple.bin
```

> 在某些系统上可能需要运行：``qemu-system-x86_64 boot_sect_simple.bin``，如果发生SDL错误，可以传入 ``----nographic`` 或者 ``--curses``标志

你将看到一个窗口显示”Booting from Hard Disk...“，并且没有其他的内容。

