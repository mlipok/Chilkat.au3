#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_26_ZIP()
If @error Then MsgBox($MB_ICONERROR, "_Example_26_ZIP", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_26_ZIP
; Description ...: Demonstrates basic in-memory ZIP creation, listing and extraction.
; Syntax ........: _Example_26_ZIP()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Uses native AutoIt Binary data and ZIP object wrappers.
; ===============================================================================================================================
Func _Example_26_ZIP()
	_Log_ChilkatExample('_Example_26_ZIP')
	; This example demonstrates basic in-memory ZIP creation, listing and extraction.

	; Create an in-memory ZIP object for the example.
	Local $oZIP = _Chilkat_ZIP_NewInMemory()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dReadme = StringToBinary('This file was added to an in-memory ZIP object.', $SB_UTF8)
	_Chilkat_ZIP_AddEntryBinary($oZIP, 'docs/readme.txt', $dReadme)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $aList = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aList, '_Chilkat_ZIP_ListEntriesFromObject_AsArray')

	Local $dZipBinary = _Chilkat_ZIP_ObjectToBinary($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $aBinaryList = _Chilkat_ZIP_ListEntriesFromBinary_AsArray($dZipBinary)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aBinaryList, '_Chilkat_ZIP_ListEntriesFromBinary_AsArray')

	Local $dExtracted = _Chilkat_ZIP_Binary_GetEntry($dZipBinary, 'docs/readme.txt')
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_Log_ChilkatExample('Extracted from binary ZIP: ' & BinaryToString($dExtracted, $SB_UTF8))

EndFunc   ;==>_Example_26_ZIP
