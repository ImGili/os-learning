你可能需要去Google：linux、mac、终端、编译器、模拟器（虚拟机）、nasm、qemu
**目标是：安装本教程需要的软件**
我的工作环境是mac，当然linux更好，因为linux拥有更多可以使用的标准工具。
在mac上，请安装Homebrew，然后``brew install qemu nasm``
请不要使用xcode的nasm，因为他在很多案例上会出问题。
在某些系统上qemu会比拆分成很多的二进制文件，你可能会以如下方式调用``qemu-system-x86_64 binfile``