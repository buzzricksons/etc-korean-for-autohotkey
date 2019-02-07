;
; Change language for English Windows 10.
; (Korean, Japanese, English)
;
; @author: Hyungcheol Kim
;

; //Default Setting
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; //Change language
; //to English
; If (A_PriorHotKey = "LAlt" AND A_TimeSincePriorHotkey < 200)
; {
;     LAlt::SetInputLang(0x0409)
; }


$LAlt::
	KeyWait, LAlt, T0.5

	if (ErrorLevel) {
	    Send, {LAlt}
	    KeyWait, LAlt
	} else {
	    SetInputLang(0x0409) ;//to English
	}
	;KeyWait, LAlt
return



$PrintScreen::
	KeyWait, PrintScreen, T0.5

	if (ErrorLevel) {
	    Send, {PrintScreen}
	} else {
	    KeyWait, PrintScreen, D T0.2
	    if (ErrorLevel) {
	        SetInputLang(0x0409)
	        SetInputLang(0x0411) ; //to Japanese
	    } else {
	        SetInputLang(0x0412) ; //to Korean
	    }
	}
return


; //Setting language
SetInputLang(Lang)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Lang, %CtrlInFocus%
}