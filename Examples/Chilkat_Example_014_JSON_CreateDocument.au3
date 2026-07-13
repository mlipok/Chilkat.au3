#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_14_JsonObject_CreateDocument()
If @error Then MsgBox($MB_ICONERROR, "_Example_14_JsonObject_CreateDocument", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_14_JsonObject_CreateDocument
; Description ...: Demonstrates creating a JSON document programmatically.
; Syntax ........: _Example_14_JsonObject_CreateDocument()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Builds JSON from code instead of parsing existing text.
; ===============================================================================================================================
Func _Example_14_JsonObject_CreateDocument()
	_Log_ChilkatExample('_Example_14_JsonObject_CreateDocument')
	; This example demonstrates creating a JSON document programmatically.
	; https://www.example-code.com/vbscript/create_json.asp
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess
	$iSuccess = $oJSON.AddStringAt(-1, "Title", "Pan's Labyrinth")
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$iSuccess = $oJSON.AddStringAt(-1, "Director", "Guillermo del Toro")
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$iSuccess = $oJSON.AddStringAt(-1, "Original_Title", "El laberinto del fauno")
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$iSuccess = $oJSON.AddIntAt(-1, "Year_Released", 2006)
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$oJSON.EmitCompact = 0
	ConsoleWrite($oJSON.Emit() & @CRLF)
EndFunc   ;==>_Example_14_JsonObject_CreateDocument
