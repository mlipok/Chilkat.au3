#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_23_ATOM()
If @error Then MsgBox($MB_ICONERROR, "_Example_23_ATOM", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_23_ATOM
; Description ...: Demonstrates parsing an Atom feed document.
; Syntax ........: _Example_23_ATOM()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows basic Atom XML loading and access.
; ===============================================================================================================================
Func _Example_23_ATOM()
	_Log_ChilkatExample('_Example_23_ATOM')
	; This example demonstrates parsing an Atom feed document.

;~ 	https://www.chilkatsoft.com/refdoc/xChilkatAtomRef.html

	Local $oATOM = _Chilkat_ATOM_ObjCreate()
	$oATOM.DownloadAtom('https://status.teamviewer.com/history.atom')
	Local $iATOM_NumEntries = $oATOM.NumEntries
	ConsoleWrite("> $iATOM_NumEntries = " & $iATOM_NumEntries & @CRLF)
	ClipPut($oATOM.ToXmlString())
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '$oATOM.ToXmlString()', $oATOM.ToXmlString())

	ConsoleWrite(@CRLF)
	Local $oATOMEntry = Null
	For $iEntry_idx = 0 To $iATOM_NumEntries - 1
		$oATOMEntry = $oATOM.GetEntry($iEntry_idx)
;~ 		ConsoleWrite($oATOMEntry.GetElementCount('id') & @CRLF)
		ConsoleWrite("+ ID: " & $oATOMEntry.GetElement('id', 0) & @CRLF)
		ConsoleWrite("+ Published: " & $oATOMEntry.GetElement('published', 0) & @CRLF)
		ConsoleWrite("+ Updated: " & $oATOMEntry.GetElement('updated', 0) & @CRLF)
		ConsoleWrite("+ Title: " & $oATOMEntry.GetElement('title', 0) & @CRLF)
		ConsoleWrite("> Content Type: " & $oATOMEntry.GetElementAttr('content', 0, 'type') & @CRLF)
		ConsoleWrite("> Content: " & $oATOMEntry.GetElement('content', 0) & @CRLF)
		ConsoleWrite(@CRLF)
	Next

EndFunc   ;==>_Example_23_ATOM
