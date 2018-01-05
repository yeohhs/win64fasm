format PE64 GUI 5.0
entry start

include 'win64a.inc'

section '.text' code readable executable

  start:
        push rbp
        mov rbp,rsp
        sub rsp,30h
        invoke GetModuleHandle,NULL
        mov [x1],rax
        invoke LoadIcon,NULL,IDI_APPLICATION
        mov [x2],rax
        invoke LoadCursor,NULL,IDC_ARROW
        mov [x3],rax
        mov rax,x1
        mov [rsp+20h],eax
        lea ecx,[buffer]
        lea edx,[fmt]
        mov r8,x3
        mov r9,x2
        call [wsprintf]
        invoke MessageBox,NULL,buffer,MsgCaption,MB_OK
        invoke ExitProcess,NULL

section '.data' data readable writeable

  MsgCaption db "Iczelion's Tutorial #2b",0
  fmt db "hCursor = %08Xh",0Ah,"hIcon = %08Xh",0Ah,"hInstance =%08Xh",0
  n = $ - fmt + 12
  buffer db n dup(?)
  x1 dq ?
  x2 dq ?
  x3 dq ?

section '.idata' import data readable writeable

  library kernel32,'KERNEL32.DLL',\
          user32,'USER32.DLL'

  include 'api\kernel32.inc'
  include 'api\user32.inc'
