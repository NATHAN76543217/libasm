# libasm
librairie statique codé en ASM64

calling convention: System V Application Binary Interface AMD64

Interger ou pointer arguments:  RDI, RSI, RDX, RCX, R8, R9 (for syscall R10 is use instead of RCX. Other params are pushed on stack)
Floating arguments: XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6 and XMM7

Return values are stored in RAX and return value up to 128bits are stored in RAX ans RDX.

 Callee-saved registers: RBX, RBP, R12-R15.
 All others register must be saved by the caller to preserve their values.

# On Linux
On syscall error, rax is filled with the negative error code.

# On Darwin
On syscall rdx is clobbered.
On syscall error, CF (carry flag) is raised and rax is filled with error code.

# COMMANDS:

 LEAVE: mov RSP, RBP + pop RBP
