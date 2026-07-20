#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_48_SmartCardFailReason()
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_48_SmartCardFailReason
; Description ...: Demonstrates SmartCardFailReason returned in @extended when legacy LoadFromSmartcard fails.
; Syntax ........: _Example_48_SmartCardFailReason()
; Parameters ....: None
; Return values .: None.
; Remarks .......: Requires Chilkat 10.1.0 or newer for detailed reason codes.
; ===============================================================================================================================
Func _Example_48_SmartCardFailReason()
	Local $oCert = _Chilkat_Cert_LoadFromSmartCard('')
	If @error Then
		Local $iReason = @extended
		MsgBox($MB_ICONWARNING, 'SmartCardFailReason', _
				'Code: ' & $iReason & @CRLF & _
				'Reason: ' & _Chilkat_Cert_SmartCardFailReasonToText($iReason))
		Return
	EndIf
	MsgBox($MB_ICONINFORMATION, 'SmartCardFailReason', 'Certificate loaded successfully: ' & $oCert.SubjectCN)
EndFunc   ;==>_Example_48_SmartCardFailReason
