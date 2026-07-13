#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_22_JSONPaths_cookiemonster()
If @error Then MsgBox($MB_ICONERROR, "_Example_22_JSONPaths_cookiemonster", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_22_JSONPaths_cookiemonster
; Description ...: Demonstrates JSON path access on a Cookie Monster sample document.
; Syntax ........: _Example_22_JSONPaths_cookiemonster()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: A small focused JSON path example.
; ===============================================================================================================================
Func _Example_22_JSONPaths_cookiemonster()
	_Log_ChilkatExample('_Example_22_JSONPaths_cookiemonster')
	; This example demonstrates JSON path access on a Cookie Monster sample document.

;~ 	https://www.autoitscript.com/forum/topic/187104-json-to-array/

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	$oJSON.LoadFile(@ScriptDir & '\Example_Files\cookiemonster.json')

	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'cookiemonster.json', _Chilkat_JSON_ObjToString($oJSON))

	Local $iClientSize = $oJSON.SizeOfArray("client")
	Local $sJSON_Path = ''
	For $iClient_idx = 0 To $iClientSize - 1
		$sJSON_Path = "client[" & $iClient_idx & "].client_info.info.name"
		ConsoleWrite("+ " & $sJSON_Path & " = " & $oJSON.StringOf($sJSON_Path) & @CRLF)
	Next
EndFunc   ;==>_Example_22_JSONPaths_cookiemonster
