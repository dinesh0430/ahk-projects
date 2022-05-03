
/*  Autohotkey Capslock Remapping Script
    ; - Deactivates capslock for normal (accidental) use.
    ; - Access the following functions when pressing Capslock:

    ;Navigation Keys :-

    ; Up             - k
    ; Down           - j
    ; Left           - h
    ; Right          - l
    ; Home           - i
    ; End            - o
    ; Enter          - m


    ;Esc                 - CapsLock only

    ;CapsLock            - CapsLock and LShift




    ;Text Editing :-

    ; Select All      - a
    ; Copy            - c
    ; Cut             - x
    ; Paste           - v
    ; Delete to home  - u
    ; Backspace       - n


 */

; ********************************************************************* ;



#Persistent
SetCapsLockState, AlwaysOff

AppsKey & x::
    if !WinExist("ahk_exe XYplorer.exe")
    {
        run, C:\Program Files (x86)\XYplorer\XYplorer.exe
    }
    else
    {
        winactivate ahk_exe XYplorer.exe
    }
return

AppsKey & c::
    if !WinExist("ahk_exe chrome.exe")
    {
        run, C:\Users\dines\AppData\Local\Chromium\Application\chrome.exe
    }
    else
    {
        winactivate ahk_exe chrome.exe
    }
return

AppsKey & f::
    if !WinExist("ahk_exe foobar2000.exe")
    {
        run, D:\Foobar Setups\1 - FINAL SETUP\foobar2000.exe
    }
    else
    {
        winactivate ahk_exe foobar2000.exe
    }
return


; ****************************************************************************************************************************************** ;

/*  Behaviour of CapsLock in GVIM
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;If window title has GVIM
    ; Specialized hotkeys for GVIM

    ;If present in GVIM then CapsLock works as dual switch:
    ;Single Tap: Escape
    ;Hold and press other keys: Ctrl + {other keys}

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 */

; ****************************************************************************************************************************************** ;


;SetTitleMatchMode, 2
#IfWinActive ahk_exe nvim-qt.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Escape Key
; Capslock only, Send Escape
; Hold and press other keys to send out <CTRL> + {other keys}

#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if ( A_PriorKey = "CapsLock" )
{
    Send {Esc}
}
return


; ****************************************************************************************************************************************** ;

; If windows is ------------------->  mintty or Git bash
#IfWinActive ahk_class mintty

Capslock & u::Send, ^u
Capslock::Send {Ctrl down}{Ctrl up}

; If windows is Windows Terminal
#IfWinActive ahk_exe WindowsTerminal.exe

Capslock & u::Send, ^u
Capslock & w::Send, ^w
Capslock & Space::Send, ^{Space}

; If windows is ------------------->  Foobar2000
#IfWinActive ahk_exe foobar2000.exe

Capslock & f::
ControlSetText,ATL:EDIT1,* HAS `
ControlClick,ATL:EDIT1
return

:*?:t;:: AND title HAS `
:*?:a;:: AND artist HAS `
:*?:al;:: AND album HAS `

; If windows is ------------------->  sumatra pdf viewer
#IfWinActive ahk_exe SumatraPDF.exe

Capslock & d::Send, +s
Capslock & e::Send, +k
d::Send,j
e::Send,k

; If windows is ------------------->  XYPlorer
#IfWinActive ahk_exe XYplorer.exe

Capslock & e::Send, ^+%A_Tab%
Capslock & r::Send, ^%A_Tab%

; ****************************************************************************************************************************************** ;

/*  Behaviour of CapsLock in places other than GVIM

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; See top comment in file at the start

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 */


; ****************************************************************************************************************************************** ;

#IfWinNotActive ahk_exe nvim-qt.exe


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Navigation Keys
; Capslock + h/j/k/l (left, down, up, right)

Capslock & h::Send {Blind}{Left Down}
Capslock & h up::Send {Blind}{Left Up}

Capslock & j::Send {Blind}{Down Down}
Capslock & j up::Send {Blind}{Down Up}

Capslock & k::Send {Blind}{Up Down}
Capslock & k up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right Down}
Capslock & l up::Send {Blind}{Right Up}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Backspace
; Capslock + n (backspace)

Capslock & n::SendInput {Blind}{BackSpace Down}
Capslock & n up::SendInput {Blind}{BackSpace Up}

; Capslock + b (Delete)
Capslock & b::Send {Delete}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Toggle CapsLock
; CapsLock + LShift :: Toggles CapsLock

LShift & Capslock::
If GetKeyState("CapsLock", "T") = 1
SetCapsLockState, AlwaysOff
Else
SetCapsLockState, AlwaysOn
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Escape Key
; Capslock only, Send Escape

CapsLock::Send, {ESC}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Select All, Cut , Copy and Paste
; Capslock + a/x/c/v

Capslock & a::SendInput {Ctrl Down}{a Down}
Capslock & a up::SendInput {Ctrl Up}{a Up}

Capslock & x::SendInput {Ctrl Down}{x Down}
Capslock & x up::SendInput {Ctrl Up}{x Up}

Capslock & c::SendInput {Ctrl Down}{c Down}
Capslock & c up::SendInput {Ctrl Up}{c Up}

Capslock & v::SendInput {Ctrl Down}{v Down}
Capslock & v up::SendInput {Ctrl Up}{v Up}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Enter Key
; Capslock + m

CapsLock & m::Send, {Enter}
CapsLock & /::Send, {\}
CapsLock & '::Send, {~}
CapsLock & ,::Send, {^}
CapsLock & .::Send, {$}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Faster text removal
; CapsLock + u/w

Capslock & u::SendInput {Shift Down}{Home}{Shift Up}{BackSpace}
CapsLock & w::SendInput {Ctrl Down}{Shift Down}{Left}{Ctrl Up}{Shift Up}{BackSpace}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Previous/Next folder or page
; CapsLock + s/d

Capslock & s::Send,!{Left}
Capslock & d::Send,!{Right}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Volume Control
; Here Volume_up 4 means 4*2=8, 8 steps of volume change as windows changes volume in increments of 2

CapsLock & WheelUp::
if getkeystate("Alt", "P")
Send {Volume_Up 4}
else
send {Volume_Up}
return

CapsLock & WheelDown::
if getkeystate("Alt", "P")
Send {Volume_Down 4}
else
send {Volume_Down}
return

CapsLock & MButton::Send {Volume_Mute}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Red Gear Thor mouse's Turbo Fire button (or) Green colored button beside left click button
;SC122::
;MsgBox,  %A_ThisHotkey% was pressed.
;return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Brightness Controls
;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Home, End, PageUp, PageDown
; CapsLock + i/o

CapsLock & i::
If GetKeyState("Shift", "P")
Send, ^{Home}
Else if GetKeyState("Alt", "P")
Send, {PgUP}
Else
Send, {Home}
return

CapsLock & o::
If GetKeyState("Shift", "P")
Send, ^{End}
Else if GetKeyState("Alt", "P")
Send, {PgDn}
Else
Send, {End}
return

; ********************************************************************* ;

/*  Open favourite applications with help of AppsKey

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; AppsKey + x :: XYplorer

 */

; ********************************************************************* ;





;AppsKey & g::
;IfWinNotExist ahk_exe gvim.exe
;  Run, C:\Users\madhu\Downloads\gVim.lnk
;WinWait, ahk_exe gvim.exe
;  winactivate ahk_exe gvim.exe
;
;AppsKey & x::
;IfWinNotExist ahk_exe XYplorer.exe
;  run, C:\Program Files (x86)\XYplorer\XYplorer.exe
;WinWait, ahk_exe XYplorer.exe
;  winactivate ahk_exe XYplorer.exe
;
;AppsKey & c::
;IfWinNotExist ahk_exe chrome.exe
;  run, D:\Advanced Chrome\Advanced Chrome\chrome.exe
;WinWait, ahk_exe chrome.exe
;  winactivate ahk_exe chrome.exe


;AppsKey & c::
;    if WinExist("ahk_exe chrome.exe")
;    {
;        WinWait, ahk_exe chrome.exe
;        WinActivate ahk_exe chrome.exe
;    }
;    else
;    {
;        run, D:\Advanced Chrome\Advanced Chrome\chrome.exe
;    }
;
;AppsKey & x::
;    if WinExist("ahk_exe XYplorer.exe")
;    {
;        WinWait, ahk_exe XYplorer.exe
;        WinActivate ahk_exe XYplorer.exe
;    }
;    else
;    {
;        run, C:\Program Files (x86)\XYplorer\XYplorer.exe
;    }
;
;AppsKey & g::
;    if WinExist("ahk_exe gvim.exe")
;    {
;        WinWait, ahk_exe gvim.exe
;        WinActivate ahk_exe gvim.exe
;    }
;    else
;    {
;        run, C:\Users\madhu\Downloads\gVim.lnk
;    }

^0::#space


; ********************************************************************* ;

/*  UNUSED CODE


    ;;; For navigation

    Capslock & h::Send {Blind}{Left DownTemp}
    Capslock & h up::Send {Blind}{Left Up}

    ;;; Remove all text till home

    Capslock & u up::SendInput {Ctrl Up}{a Up}{BackSpace}

    ;;; [[[[[[[DEPRECATED]]]]]]]  CapsLock & h with Alt as modifier

    Capslock & h::
    GetKeyState, state, Alt
    if state = D
    Send, {Left}
    else {
    Send, {BackSpace}
    }
    Return

    ;;; CapsLock & h with Alt as modifier -- 2

    CapsLock & h::
    If GetKeyState("Alt", "P")
    Send, {Left}
    Else
    Send, {Right}
    return


 */

; ********************************************************************* ;
