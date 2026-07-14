#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_15_CSV_ColumnNames()
If @error Then MsgBox($MB_ICONERROR, "_Example_15_CSV_ColumnNames", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_15_CSV_ColumnNames
; Description ...: Demonstrates loading CSV data and reading column names.
; Syntax ........: _Example_15_CSV_ColumnNames()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Uses Chilkat CSV functionality to inspect header columns.
; ===============================================================================================================================
Func _Example_15_CSV_ColumnNames()
	_Log_ChilkatExample('_Example_15_CSV_ColumnNames')
	; This example demonstrates loading CSV data and reading column names.
	; https://www.example-code.com/vbscript/csv_columnNames.asp

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

	Local $iIndex = 0
	Local $sColName = ''

	; Display the column names:
	For $iCol_idx = 0 To $oCSV.NumColumns - 1
		$sColName = $oCSV.GetColumnName($iCol_idx)
		_Log_ChilkatExample($iCol_idx & ": " & $sColName)

		; The following line demonstrates to to get the column
		; index given a column name:
		$iIndex = $oCSV.GetIndex($sColName)
		_Log_ChilkatExample($sColName & " is at column index " & $iIndex)
	Next

EndFunc   ;==>_Example_15_CSV_ColumnNames
