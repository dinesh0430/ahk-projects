
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

    ;CapsLock            - CapsLock and q




    ;Text Editing :-

    ; Delete to home  - u
    ; Delete 		  - b
    ; Backspace       - n


 */

; ********************************************************************* ;



#Persistent
SetCapsLockState, AlwaysOff

;;;;;;;;;;;;;;;;;;;;;;; >>> OPEN Favourite  Windows  Apps with AppsKey <<< 


AppsKey & x::							;; XYPlorer
    if !WinExist("ahk_exe XYplorer.exe")
    {
        run, C:\Program Files (x86)\XYplorer\XYplorer.exe
    }
    else
    {
        winactivate ahk_exe XYplorer.exe
    }
return

AppsKey & c::							;; Chrome or chromium 
    if !WinExist("ahk_exe chrome.exe")
    {
        run, C:\Users\dines\AppData\Local\Chromium\Application\chrome.exe
    }
    else
    {
        winactivate ahk_exe chrome.exe
    }
return

AppsKey & f::							;; Foobar2000 
    if !WinExist("ahk_exe foobar2000.exe")
    {
        run, D:\Foobar Setups\1 - FINAL SETUP\foobar2000.exe
    }
    else
    {
        winactivate ahk_exe foobar2000.exe
}
return



; If windows is ------------------->  Foobar2000
#IfWinActive ahk_exe foobar2000.exe

Capslock & f::
ControlSetText,ATL:EDIT1,* HAS `		;; Facets component filter to compare with all fields
ControlClick,ATL:EDIT1				;; Focus the filter textbox to write further query
return

:*?:t;:: AND title HAS `				;; Facets component filter to include title 
:*?:a;:: AND artist HAS `			;; Facets component filter to include artist
:*?:al;:: AND album HAS `			;; Facets component filter to include album

#IfWinActive	; Closes the previous #IfWinActive usage




; If windows is ------------------->  sumatra pdf viewer
#IfWinActive ahk_exe SumatraPDF.exe

Capslock & d::Send, +s
Capslock & e::Send, +k
d::Send,j
e::Send,k

#IfWinActive	; Closes the previous #IfWinActive usage




; If windows is ------------------->  XYPlorer
#IfWinActive ahk_exe XYplorer.exe

Capslock & e::Send, ^+%A_Tab%		; goes to the tab on the left side 
Capslock & r::Send, ^%A_Tab%		; goes to the tab on the right side

#IfWinActive	; Closes the previous #IfWinActive usage






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Navigation Keys
; Capslock + h/j/k/l (left, down, up, right)

Capslock & h::Send {Left}

Capslock & j::Send {Down}

Capslock & k::Send {Up}

Capslock & l::Send {Right}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Backspace
; Capslock + n (backspace)

Capslock & n::SendInput {Backspace}

; Capslock + b (Delete)
Capslock & b::Send {Delete}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Toggle CapsLock
; CapsLock + LShift :: Toggles CapsLock

Capslock & q::
If GetKeyState("CapsLock", "T") = 1
	SetCapsLockState, AlwaysOff
Else
	SetCapsLockState, AlwaysOn
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Escape Key
; Capslock only, Send Escape

CapsLock::Send, {ESC}


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
if getkeystate("Control", "P")
	Send {Left}				; Can be used to go backward in video with scroll
else if getkeystate("Alt", "P")
	Send {Volume_Up 5}
else
	send {Volume_Up}
return

CapsLock & WheelDown::
if getkeystate("Control", "P")
	Send {Right}				; Can be used to go forward in video with scroll
else if getkeystate("Alt", "P")
	Send {Volume_Down 5}
else
	send {Volume_Down}
return

CapsLock & MButton::Send {Volume_Mute}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Home, End, PageUp, PageDown
; CapsLock + i/o


CapsLock & i::
If GetKeyState("Shift", "P")
	Send, {PgUP}
Else if GetKeyState("Alt", "P")
	Send, ^{Home}
Else
	Send, {Home}
return

CapsLock & o::
If GetKeyState("Shift", "P")
	Send {PgDn}
Else if GetKeyState("Alt", "P")
	Send, ^{End}
Else
	Send, {End}
return



;^0::#space






; ********************************************************************* ;


;;;;;;;;;;;;;;;;;;;;;; Red Gear Thor mouse's Turbo Fire button (or) Green colored button beside left click button
;SC122::
;MsgBox,  %A_ThisHotkey% was pressed.
;return



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
		
	
; ********************************************************************* ;
	
	;  Open favourite applications with help of AppsKey
	
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
    ; AppsKey + x :: XYplorer
	


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


; ****************************************************************************************************************************************** ;
	
  ;Behaviour of CapsLock in GVIM
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
    ;If window title has GVIM
    ; Specialized hotkeys for GVIM
	
    ;If present in GVIM then CapsLock works as dual switch:
    ;Single Tap: Escape
    ;Hold and press other keys: Ctrl + {other keys}
	
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
; ****************************************************************************************************************************************** ;
	
	
;SetTitleMatchMode, 2
	#IfWinActive ahk_exe nvim-qt.exe
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Escape Key
 ;Capslock only, Send Escape
 ;Hold and press other keys to send out <CTRL> + {other keys}
	
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
	

	
	
	Capslock & h::Send {Blind}{Left Down}
	Capslock & h up::Send {Blind}{Left Up}
	
	Capslock & j::Send {Blind}{Down Down}
	Capslock & j up::Send {Blind}{Down Up}
	
	Capslock & k::Send {Blind}{Up Down}
	Capslock & k up::Send {Blind}{Up Up}
	
	Capslock & l::Send {Blind}{Right Down}
	Capslock & l up::Send {Blind}{Right Up}
	
	

	
	CapsLock & i::
	If GetKeyState("Ctrl", "P")
		Send, ^{Home}
	Else if GetKeyState("Alt", "P")
		Send, {PgUP}
	Else
		Send, {Home}
	return
	
	CapsLock & o::
	If GetKeyState("Ctrl", "P")			; 
		Send, ^{End}
	Else if GetKeyState("Alt", "P")
		Send, {PgDn}
	Else
		Send, {End}
	return
	
*/


; ********************************************************************* ;
