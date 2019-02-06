;
; Change language for English Windows 10.
; Korean, Japanese, English
;
; @author: Hyungcheol Kim
;

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; //Change language
LAlt::SetInputLang(0x0409) ; //to English
RAlt::
If (A_PriorHotKey = "RAlt Up" AND A_TimeSincePriorHotkey < 500)
{
	Send, +{End}
	KeyWait, RAlt
    SetInputLang(0x0412) ; //to Korean
} else {
    SetInputLang(0x0411) ; //to Japanese
}
return


RAlt Up::
Send, {RAlt Up}
Send ^c
return


SetInputLang(Lang)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Lang, %CtrlInFocus%
}