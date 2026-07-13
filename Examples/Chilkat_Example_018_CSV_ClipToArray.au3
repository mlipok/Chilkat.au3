#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_18_CSV_ClipToArray()
If @error Then MsgBox($MB_ICONERROR, "_Example_18_CSV_ClipToArray", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_18_CSV_ClipToArray
; Description ...: Demonstrates reading CSV-like data from the clipboard into an AutoIt array.
; Syntax ........: _Example_18_CSV_ClipToArray()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires suitable tabular clipboard content.
; ===============================================================================================================================
Func _Example_18_CSV_ClipToArray()
	_Log_ChilkatExample('_Example_16_CSV_ToArray')

	Local $sCSVContent = ClipGet()
	Local $aResult = _Chilkat_CSV_StringToArray($sCSVContent, @TAB, 1)
	If Not @error Then _ArrayDisplay($aResult, '$aResult: _Chilkat_CSV_StringToArray()')

EndFunc   ;==>_Example_18_CSV_ClipToArray
