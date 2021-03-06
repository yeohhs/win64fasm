format PE64 GUI 5.0
entry start

include 'win64a.inc'

section '.text' code readable executable

  start:
        enter 4*8,0
        xor ecx,ecx
        mov r9,rcx
        lea r8,[MsgCaption]
        lea edx,[MsgBoxText]
        call [MessageBox]
        leave
        ret

section '.data' data readable writeable

  MsgCaption db "Iczelion's Tutorial #2a",0
  MsgBoxText db "Win64 Assembly is Great!",0

section '.idata' import data readable writeable

  library kernel32,'KERNEL32.DLL',\
          user32,'USER32.DLL'

  include 'api\kernel32.inc'
  include 'api\user32.inc'
