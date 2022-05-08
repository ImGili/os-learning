# os-learning
跟学[cfenollosa/os-tutorial](https://github.com/cfenollosa/os-tutorial)

如何从头写代码
我一直想从头写一个操作系统。在大学里，我已经学过如何实现高级特性（分页、信号量、内存管理等）但是：
* 我从来没用从开机引导开始
* 大学学习很难，我记不住大部分内容
* 我无法忍受阅读现存操作系统源码来学习操作系统

受到了[文档](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)和[OSDev wiki](http://wiki.osdev.org/)的启发，我将将步骤拆分成README，并且附上案例源码。实际上，这个教程就是将[文档](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)拆分成很多小部分，但不涉及太多理论。

更新：更多的学习资源：[the little book about OS development](https://littleosbook.github.io),
[JamesM's kernel development tutorials](https://web.archive.org/web/20160412174753/http://www.jamesmolloy.co.uk/tutorial_html/index.html)

# 特点
* 这个教程是一个代码教程，目的是以简单的方式教授操作系统。
* 几乎很少的理论，Google是一个很好的工具，过多的理论往往会使得事情变得更加复杂。
* 这门课程很简单，每门课可能只需要5-15分钟就能完成，你必须相信自己能够完成。

# 如何使用本教程
* 从第一个教程开始，每个章节的代码都是依托于上一个章节，如果不懂可以回到上一个章节查看。
* 阅读README，google不熟悉的理论，要搞清楚为什么，为什么和怎么做一样重要。
* （选做）在阅读README后，可以尝试自己编写代码。
* 查看代码案例。
* （选做）尝试改写代码。

# 目标
我们将完成如下目标：
* 不使用grub完成系统的开机引导
* 进入32位模式
* 从汇编跳转到C
* 中断处理
* 屏幕输出和键盘输入
* 一个基本的，微小的``libc(c语言库)``，其不断成长，以满足我们的需求
* 内存管理
* 编写一个文件系统来存储文件
* 创建一个非常简单的shell
* 用户模式
* 简单的文本编辑器
* 多进程和调度

如果胆子够大，我们说不定可以实现一个BASIC编译器，或者GUI界面，甚至是网络连接。

# 贡献代码
希望大家踊跃``issue``或者``pull requests``，我将努力将大家的代码合并到我的主分支上。