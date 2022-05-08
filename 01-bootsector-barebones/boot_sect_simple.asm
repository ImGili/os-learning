; 无限循环 (e9 fd ff)
; 这里就是 $
loop:
    jmp loop 

; times是重复操作的意思，$-$$是当前行命令到程序开始的程序距离，db是指定字节
times 510-($-$$) db 0 ; 这里就是 $$
; Magic number
; bios检查开机引导程序的标志
dw 0xaa55 