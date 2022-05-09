一些基础知识可以提前Google一下：指针、和内存偏移，c语言的数组怎么索引。

目标：了解计算机如何组织内存。

``BIOS``把开机引导程序放在``0x7c00``处。

我们需要将``X``输出到屏幕上，有以下四种尝试。

**打开``boot_sect_memory_org.asm``**

首先，我们定义``X``在内存段:

```nasm
the_secret:
    db "X"
```
我们将尝试以下四种方法访问 `the_secret` 的内容：

1. `mov al, the_secret`
2. `mov al, [the_secret]`
3. `mov al, the_secret + 0x7C00`
4. `mov al, 2d + 0x7C00`, 其中 `2d` 是``X``字节在二进制文件中的位置

请查看代码的注释，了解详情。

编译运行代码，你会发现qemu会显示`1[2¢3X4X`，这里再1和2的后面会显示一堆乱码。


可以添加以下代码，让2方法成功访问到`X`。

```nasm
[org 0x7c00]
```