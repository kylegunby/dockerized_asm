; Obligatory Hello World Program

; .data section is where global variables are declared
section .data
  ; db - data byte
  hello db 'Hello, World!', 0xA ; Null terminated string

section .text
  global _start ; Specify the entrypoint to the binary 

_start:
  ; eax - Accumulator register. Used in arithmatic operations
  ; ebx - Used as a pointer for data
  ; edx - Used for arithmatic operations and io (ED data register)
  mov eax, 0x4 ; write syscall
  mov ebx, 0x1 ; stdout syscall
  mov ecx, hello
  mov edx, 13 ; length of the string in the hello variable
  int 0x80 ; call the Kernel

  ; Graceful exit
  mov eax, 0x1
  xor ebx, ebx
  int 0x80


