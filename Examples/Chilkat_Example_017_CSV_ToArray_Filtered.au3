#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_17_CSV_ToArray()
If @error Then MsgBox($MB_ICONERROR, "_Example_17_CSV_ToArray", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_17_CSV_ToArray
; Description ...: Demonstrates converting filtered CSV data to a native AutoIt array.
; Syntax ........: _Example_17_CSV_ToArray($sName_RegExpPattern, $sCity_RegExpPattern)
; Parameters ....: $sName_RegExpPattern - [in] Regular expression used to filter the name column.
;                  $sCity_RegExpPattern - [in] Regular expression used to filter the city column.
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Uses regular expression filters supplied by the caller.
; ===============================================================================================================================
Func _Example_17_CSV_ToArray($sName_RegExpPattern, $sCity_RegExpPattern)
	_Log_ChilkatExample('_Example_17_CSV_ToArray')
	; This example demonstrates converting filtered CSV data to a native AutoIt array.
	; https://www.example-code.com/vbscript/csv_columnNames.asp

	Local $sURL = 'https://epuap.gov.pl/wps/wcm/connect/61e062b9-d981-4526-9f63-c2569263775a/RESP_2016-10-07.csv?MOD=AJPERES'
	InetGet($sURL, @ScriptDir & '\Example_Files\ePUAP.csv')
	ConsoleWrite("- Download completed" & @CRLF)

	Local $oCSV = _Chilkat_CSV_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	;  Prior to loading the CSV file, indicate that the 1st row
	;  should be treated as column names:
	$oCSV.HasColumnNames = 1

	; Load the $oCSV records from the file:
	Local $sCSVContent = FileRead(@ScriptDir & "\Example_Files\ePUAP.csv")
	ConsoleWrite("- Load File completed" & @CRLF)
	Local $iSuccess = $oCSV.LoadFromString($sCSVContent)
	If ($iSuccess <> 1) Then
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
		Return SetError($CHILKAT_ERR_LOADFILE, @extended, $CHILKAT_RET_FAILURE)
	EndIf
	ConsoleWrite("- LoadFromString completed" & @CRLF)

	Local $iNumColumns = $oCSV.NumColumns
	Local $iNumRows = $oCSV.NumRows

	Local $aResult[$iNumRows + 1][$iNumColumns]

	; First get the column names
	For $iCol_idx = 0 To $iNumColumns - 1
		$aResult[0][$iCol_idx] = $oCSV.GetColumnName($iCol_idx)
	Next

	Local $iResult_RowCount = 1 ; First is ColumnName
	For $iRow_idx = 0 To $iNumRows - 1
		If _
				StringRegExp($oCSV.GetCell($iRow_idx, 0), $sName_RegExpPattern, $STR_REGEXPMATCH) _
				And _
				StringRegExp($oCSV.GetCell($iRow_idx, 4), $sCity_RegExpPattern, $STR_REGEXPMATCH) _
				Then
			For $iCol_idx = 0 To $iNumColumns - 1
				$aResult[$iResult_RowCount][$iCol_idx] = $oCSV.GetCell($iRow_idx, $iCol_idx)
			Next
			$iResult_RowCount += 1
		EndIf
	Next

	; strip array size to Number of founds rows
	ReDim $aResult[$iResult_RowCount][$iNumColumns]

	ConsoleWrite("! $iNumRows = " & $iNumRows & @CRLF)
	ConsoleWrite("! $iNumColumns = " & $iNumColumns & @CRLF)
	ConsoleWrite("! $iResult_RowCount = " & $iResult_RowCount & @CRLF)
	ConsoleWrite("! $iNumColumns = " & $iNumColumns & @CRLF)

	ConsoleWrite("- Parsing completed" & @CRLF)

	_ArrayDisplay($aResult, '$aResult')

EndFunc   ;==>_Example_17_CSV_ToArray
