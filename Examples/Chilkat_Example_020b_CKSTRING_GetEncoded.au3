#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_20b_CKSTRING_GetEncoded()
If @error Then MsgBox($MB_ICONERROR, "_Example_20b_CKSTRING_GetEncoded", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_20b_CKSTRING_GetEncoded
; Description ...: Demonstrates character encoding conversion with Chilkat String.
; Syntax ........: _Example_20b_CKSTRING_GetEncoded()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Useful for checking how text is represented in different encodings.
; ===============================================================================================================================
Func _Example_20b_CKSTRING_GetEncoded()
	_Log_ChilkatExample('_Example_20b_CKSTRING_GetEncoded')
	; This example demonstrates character encoding conversion with Chilkat String.

	Local $oCKS = _Chilkat_CKSTRING_ObjCreate()

	; This example shows how to encode string, to different formats

	; https://www.chilkatsoft.com/refdoc/xCkStringDoc.html#method68
	$oCKS.Str = "A¨A¨A¨"
	; Returns the character string in an encoding use the charsetEncoding specified.
	; The binaryEncoding may be "base64", "hex", "url", or "quoted-printable".
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '$oCKS.GetEncoded:', _
			"Original:" & @CRLF & _
			$oCKS.Str & @CRLF & _
			@CRLF & _
			"hex iso-8859-1:" & @CRLF & _
			$oCKS.GetEncoded("hex", "iso-8859-1") & @CRLF & _
			@CRLF & _
			"hex utf-8:" & @CRLF & _
			$oCKS.GetEncoded("hex", "utf-8") & @CRLF & _
			@CRLF & _
			"hex unicode:" & @CRLF & _
			$oCKS.GetEncoded("hex", "unicode") & @CRLF & _
			@CRLF & _
			"quoted-printable utf-8:" & @CRLF & _
			$oCKS.GetEncoded("quoted-printable", "utf-8") & @CRLF & _
			@CRLF & _
			"url utf-8:" & @CRLF & _
			$oCKS.GetEncoded("url", "utf-8") & @CRLF & _
			@CRLF & _
			"base64 utf-8:" & @CRLF & _
			$oCKS.GetEncoded("base64", "utf-8") & @CRLF & _
			"")

	; This example shows how to encode string, and decode strings
	Local $sOriginal = "Ruda Śląska"
	$oCKS.Str = $sOriginal
	Local $sQPrintable = $oCKS.GetEncoded("quoted-printable", "utf-8")
	$oCKS.Str = ''
	$oCKS.AppendEncoded($sQPrintable, "quoted-printable", "utf-8")
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'Encode/Decode example', _
			'Original:' & @CRLF & _
			$sOriginal & @CRLF & @CRLF & _
			'quoted-printable:' & @CRLF & _
			$sQPrintable & @CRLF & @CRLF & _
			'Decoded:' & @CRLF & _
			$oCKS.Str & @CRLF & @CRLF & _
			'')

	; One more example - Maria Konopnicka - poem "Beetle"
	; http://www.wiersze.juniora.pl/konopnicka/konopnicka_zk1.html
	Local $sBase64 = "V3lzemVkxYIgxbx1Y3playBuYSBzxYJvbmVjemtvIA0KVyB6aWVsb255bSBwxYJhc3pjenlrdS4gDQrigJ5OaWUgYmllcnrFvGUgbW5pZSB6YSBza3J6eWRlxYJrYSwgDQpNacWCeSBtw7NqIGNoxYJvcGN6eWt1LiANCk5pZSBiaWVyesW8ZSBtbmllIHphIHNrcnp5ZGXFgmthLCANCkJvIG1hbSBwxYJhc3pjenlrIG5vd3k7IA0KU3p5xYJ5IG1pIGdvIGR3YSBjaHJhYsSFc3pjemUsIA0KQSBrcmFqYcWCeSBzb3d5Lg0KDQpaYSB0byBpbSBtdXNpYcWCZW0gcMWCYWNpxIcgDQpQbyBkd2FuYcWbY2llIGdyb3N6eSANCkkgamVzemN6ZW0gc2llIHphcG/FvHljennFgiANClUgdGVqIHBzdHJlaiBrb2tvc3p5LiANCkphayB1c3p5xYJ5LCB3eWtyb2nFgnksIA0KVGFrIHDFgmFzemN6eWsgemEga3LDs3RraTsgDQpKZXN6Y3plIGltIG11c2lhxYJlbSBkb2RhxIcgDQpQbyBraWVsaXN6a3Ugd8OzZGtp4oCdLg=="
	$oCKS.Str = ""
	$oCKS.AppendEncoded($sBase64, "base64", "utf-8")
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'Decoded from base64', $oCKS.Str)
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '$oCKS.GetEncoded("quoted-printable", "utf-8")', $oCKS.GetEncoded("quoted-printable", "utf-8"))

EndFunc   ;==>_Example_20b_CKSTRING_GetEncoded
