#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_13_JsonObject_IterateMembers()
If @error Then MsgBox($MB_ICONERROR, "_Example_13_JsonObject_IterateMembers", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_13_JsonObject_IterateMembers
; Description ...: Demonstrates iterating over first-level JSON object members.
; Syntax ........: _Example_13_JsonObject_IterateMembers()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows reading member names and values by index.
; ===============================================================================================================================
Func _Example_13_JsonObject_IterateMembers()
	_Log_ChilkatExample('_Example_13_JsonObject_IterateMembers')
	; This example demonstrates iterating over first-level JSON object members.
	; https://www.example-code.com/vbscript/json_iterate_members.asp
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sJSON_String = "{ ""id"": 1, ""name"": ""A green door"", ""tags"": [""home"", ""green""], ""price"": 125 }"

	Local $iSuccess = $oJSON.Load($sJSON_String)
	If ($iSuccess <> 1) Then
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
		Return SetError($CHILKAT_ERR_LOAD, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sName = '', $sValue = ''
	Local $iNumMembers = $oJSON.Size, $iValue = 0

	For $iMember_idx = 0 To $iNumMembers - 1
		$sName = $oJSON.NameAt($iMember_idx)
		$sValue = $oJSON.StringAt($iMember_idx)
		ConsoleWrite($sName & ": " & $sValue & @CRLF)

		$iValue = $oJSON.IntAt($iMember_idx)
		ConsoleWrite($sName & " as integer: " & $iValue & @CRLF)
	Next
EndFunc   ;==>_Example_13_JsonObject_IterateMembers
