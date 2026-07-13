#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_20_CKSTRING_HTMLEntity_EncodeDecode()
If @error Then MsgBox($MB_ICONERROR, "_Example_20_CKSTRING_HTMLEntity_EncodeDecode", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_20_CKSTRING_HTMLEntity_EncodeDecode
; Description ...: Demonstrates HTML entity encoding and decoding with Chilkat String.
; Syntax ........: _Example_20_CKSTRING_HTMLEntity_EncodeDecode()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows conversion between literal HTML text and encoded entity text.
; ===============================================================================================================================
Func _Example_20_CKSTRING_HTMLEntity_EncodeDecode()
	_Log_ChilkatExample('_Example_20_CKSTRING_HTMLEntity_EncodeDecode')
	; This example demonstrates HTML entity encoding and decoding with Chilkat String.

	Local $oCKS = _Chilkat_CKSTRING_ObjCreate()

	; HTML entity encode
	$oCKS.Str = "<p> eeée eeée </p>1" & @CRLF & "2"
	$oCKS.HtmlEntityEncode

	; The string now contains: &lt ;p&gt; eeée eeée &lt;/p&gt;
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'HtmlEntityEncode > ResultString:', $oCKS.Str)

	; HTML entity decode
;~ 	$oCKS.Str = "&lt;p&gt; e&egrave;&eacute;&ecirc; e&#232;&#233;&#234; &lt;/p&gt;"
	$oCKS.HtmlEntityDecode

	; The string now contains: <p> eeée eeée </p>
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'HtmlEntityDecode > ResultString:', $oCKS.Str)

EndFunc   ;==>_Example_20_CKSTRING_HTMLEntity_EncodeDecode
