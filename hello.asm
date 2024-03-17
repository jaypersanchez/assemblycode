format PE console ; opens the console for assembly to run
entry start ; entry point of the application basically the function where app will start

; OS specific library.  In this case Windows library. This is like import 
; library in Javascript and Python
include 'C:\Program Files (x86)\fasmw17332\INCLUDE\win32a.inc' 

; Program code starts here up to the 'call [MessageBoxA]
; equivalent to Javascript 'alert('Hello, World!') 
; and Python's 'ctypes.windll.user32.MessageBoxW(0, "Hello, World!", "Hello", 0)'
section '.text' code readable executable

start:
    push    0               ; uType = MB_OK
    push    title           ; lpCaption
    push    message         ; lpText
    push    0               ; hWnd = NULL
    call    [MessageBoxA]

; This is to exit the application cleanly.  There's no equivalent to Javascript
; it handles this for you.  For Python it's similar to 'sys.exit(0)
    push    0               ; Exit code
    call    [ExitProcess]

; Defines data (strings) used by the program. 
; db declares initialized data bytes. 
; The 0 at the end of each string is a null terminator, marking the string's end.
; Javascript/Python equivalent 
; let message = 'Hello, World!' and message = 'Hello, World!'
section '.data' data readable writeable

  message db 'Hello, World!',0
  title   db 'My Assembly Code',0

; Assembly: Declares which DLLs are needed and which functions are imported from those DLLs. 
; This is specific to the PE format and Windows programming.
; JavaScript/Python Equivalent: 
;Similar to importing functions from modules or libraries but more closely related to the 
;operating system's functionality.
section '.idata' import data readable writeable

  library kernel32,'KERNEL32.DLL',\
          user32,'USER32.DLL'

  import kernel32,\
         ExitProcess,'ExitProcess'

  import user32,\
         MessageBoxA,'MessageBoxA'
