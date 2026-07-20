#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_32_ZIP_Binary_Workflow()
If @error Then MsgBox($MB_ICONERROR, "_Example_32_ZIP_Binary_Workflow", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_32_ZIP_Binary_Workflow
; Description ...: Demonstrates the complete Binary -> ZIP object -> Binary workflow.
; Syntax ........: _Example_32_ZIP_Binary_Workflow()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows adding, listing, deleting and updating ZIP content without a local ZIP file.
; ===============================================================================================================================
Func _Example_32_ZIP_Binary_Workflow()
	_Log_ChilkatExample('_Example_32_ZIP_Binary_Workflow')
	; This example demonstrates the complete Binary -> ZIP object -> Binary workflow.

	; Create an empty ZIP object that exists only in memory.
	Local $oZIP = _Chilkat_ZIP_NewInMemory()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; Prepare the first text payload as a native AutoIt Binary value.
	Local $dData1 = StringToBinary('First payload', $SB_UTF8)

	; Prepare the second text payload as a native AutoIt Binary value.
	Local $dData2 = StringToBinary('Second payload', $SB_UTF8)

	; Add the first Binary payload to the in-memory ZIP object.
	_Chilkat_ZIP_AddEntryBinary($oZIP, 'data/first.txt', $dData1)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; Add the second Binary payload to the in-memory ZIP object.
	_Chilkat_ZIP_AddEntryBinary($oZIP, 'data/second.txt', $dData2)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; List ZIP entries from the ZIP object before converting it to Binary.
	Local $aList = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aList, 'ZIP object entries')

	; Remove one entry from the ZIP object while it is still in memory.
	_Chilkat_ZIP_DeleteEntry($oZIP, 'data/first.txt')
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; Serialize the modified ZIP object back to a native AutoIt Binary value.
	Local $dZipBinary = _Chilkat_ZIP_ObjectToBinary($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; Prepare a third payload to demonstrate direct Binary ZIP modification.
	Local $dThird = StringToBinary('Third payload added directly to binary ZIP', $SB_UTF8)
	; Add a new entry directly to the Binary ZIP without manually keeping the ZIP object.
	$dZipBinary = _Chilkat_ZIP_Binary_AddEntry($dZipBinary, 'data/third.txt', $dThird)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; List entries again from the final Binary ZIP to verify the result.
	Local $aBinaryList = _Chilkat_ZIP_ListEntriesFromBinary_AsArray($dZipBinary)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aBinaryList, 'ZIP binary entries')

EndFunc   ;==>_Example_32_ZIP_Binary_Workflow
