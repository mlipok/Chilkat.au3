#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_12_JsonObject_PrettyPrint()
If @error Then MsgBox($MB_ICONERROR, "_Example_12_JsonObject_PrettyPrint", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_12_JsonObject_PrettyPrint
; Description ...: Demonstrates loading JSON text and emitting it as formatted JSON.
; Syntax ........: _Example_12_JsonObject_PrettyPrint()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows EmitCompact and EmitCrLf options.
; ===============================================================================================================================
Func _Example_12_JsonObject_PrettyPrint()
	_Log_ChilkatExample('_Example_12_JsonObject_PrettyPrint')
	; This example demonstrates loading JSON text and emitting it as formatted JSON.
	; https://www.example-code.com/vbscript/json_pretty_print.asp
	; Create the Chilkat JSON object used by this example.
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sJSON_String = "{""name"": ""donut"",""image"":{""fname"": ""donut.jpg"",""w"": 200,""h"": 200},""thumbnail"":{""fname"": ""donutThumb.jpg"",""w"": 32,""h"": 32}}"

	; Load the JSON text into the Chilkat JSON object.
	Local $iSuccess = $oJSON.Load($sJSON_String)
	If ($iSuccess <> 1) Then
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
		Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	;  To pretty-print, set the EmitCompact property equal to 0
	$oJSON.EmitCompact = 0

	;  If bare-LF line endings are desired, turn off EmitCrLf
	;  Otherwise CRLF line endings are emitted.
	$oJSON.EmitCrLf = 0

	;  Emit the formatted JSON:
	ConsoleWrite($oJSON.Emit() & @CRLF)
EndFunc   ;==>_Example_12_JsonObject_PrettyPrint
