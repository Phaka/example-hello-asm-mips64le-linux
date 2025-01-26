# MIPS64LE assembly for Linux
# System calls for MIPS64LE Linux:
# 5001 for write
# 5058 for exit
    .section .rodata
    .align 3
message:
    .ascii "Hello, World!\n"
    .set message_len, .-message

    .text
    .align 2
    .global _start
    .ent _start
_start:
    # Write system call
    dli $v0, 5001        # write system call number
    li $a0, 1           # file descriptor 1 is stdout
    dla $a1, message    # address of message
    dli $a2, message_len # length of message
    syscall             # make system call

    # Exit system call
    dli $v0, 5058       # exit system call number
    li $a0, 0          # return code 0
    syscall            # make system call

    .end _start
