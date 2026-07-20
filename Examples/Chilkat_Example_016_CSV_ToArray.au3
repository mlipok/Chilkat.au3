#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_16_CSV_ToArray()
If @error Then MsgBox($MB_ICONERROR, "_Example_16_CSV_ToArray", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_16_CSV_ToArray
; Description ...: Demonstrates converting CSV content to a native AutoIt array.
; Syntax ........: _Example_16_CSV_ToArray()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Useful when further processing should be done by AutoIt array logic.
; ===============================================================================================================================
Func _Example_16_CSV_ToArray()
	_Log_ChilkatExample('_Example_16_CSV_ToArray')
	; This example demonstrates converting CSV content to a native AutoIt array.

	Local $sURL = 'http://www.chilkatsoft.com/testData/sample.csv'
	InetGet($sURL, @ScriptDir & '\Example_Files\sample.csv')

	Local $oCSV = _Chilkat_CSV_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	;  Prior to loading the CSV file, indicate that the 1st row
	;  should be treated as column names:
	$oCSV.HasColumnNames = 1

	; Load the $oCSV records from the file:
	Local $iSuccess = $oCSV.LoadFile(@ScriptDir & "\Example_Files\sample.csv")
	If ($iSuccess <> 1) Then
		_Log_ChilkatExample($__g_oChilkat_GLOBAL.LastErrorText)
		Return SetError($CHILKAT_ERR_LOADFILE, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iNumColumns = $oCSV.NumColumns
	Local $iNumRows = $oCSV.NumRows

	Local $aResult[$iNumRows + 1][$iNumColumns]

	; First get the column names
	For $iCol_idx = 0 To $iNumColumns - 1
		$aResult[0][$iCol_idx] = $oCSV.GetColumnName($iCol_idx)
	Next

	For $iRow_idx = 0 To $iNumRows - 1
		For $iCol_idx = 0 To $iNumColumns - 1
			$aResult[$iRow_idx + 1][$iCol_idx] = $oCSV.GetCell($iRow_idx, $iCol_idx)
		Next
	Next

	_ArrayDisplay($aResult, '$aResult')

EndFunc   ;==>_Example_16_CSV_ToArray
