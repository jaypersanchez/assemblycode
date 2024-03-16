format PE console
entry start

include 'C:\Program Files (x86)\fasmw17332\INCLUDE\win32a.inc'

section '.text' code readable executable

start:
    push    0               ; uType = MB_OK
    push    title           ; lpCaption
    push    message         ; lpText
    push    0               ; hWnd = NULL
    call    [MessageBoxA]

    push    0               ; Exit code
    call    [ExitProcess]

section '.data' data readable writeable

  message db 'Hello, World!',0
  title   db 'Hello',0

section '.idata' import data readable writeable

  library kernel32,'KERNEL32.DLL',\
          user32,'USER32.DLL'

  import kernel32,\
         ExitProcess,'ExitProcess'

  import user32,\
         MessageBoxA,'MessageBoxA'
