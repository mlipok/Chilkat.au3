#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_19b_CSV_CreateFile()
If @error Then MsgBox($MB_ICONERROR, "_Example_19b_CSV_CreateFile", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_19b_CSV_CreateFile
; Description ...: Demonstrates creating CSV content through a helper API callback.
; Syntax ........: _Example_19b_CSV_CreateFile()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows how data can be supplied by a small internal example helper.
; ===============================================================================================================================
Func _Example_19b_CSV_CreateFile()
	_Log_ChilkatExample('_Example_19_CSV_CreateFile')

	; https://www.example-code.com/vbscript/csv_create.asp

	;  Indicate that the 1st row
	;  should be treated as column names:
	__Example_19b_API(Null)
	__Example_19b_API("year", "color", "country", "food")
	__Example_19b_API("2001", "red", "France", "cheese")
	__Example_19b_API("2005", "blue", "United States", "hamburger")

	Local $oCSV = __Example_19b_API()

	;  Write the CSV to a string and display:
;~ 	Local $sCSV_String = $oCSV.SaveToString()

	;  Save the CSV to a file:
	Local $bSuccess = $oCSV.SaveFile("_Example_19b_CSV_CreateFile_Result.csv")
	If Not $bSuccess Then ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText)

EndFunc   ;==>_Example_19b_CSV_CreateFile

Func __Example_19b_API($vCol0 = Default, $vCol1 = Default, $vCol2 = Default, $vCol3 = Default)
	Local Static $oCSV = Null

	If $vCol0 = Null Or $oCSV = Null Then ; Create New Object
		$oCSV = _Chilkat_CSV_ObjCreate()
		$oCSV.HasColumnNames = True
	ElseIf $vCol0 = Default And $vCol1 = Default And $vCol2 = Default And $vCol3 = Default Then
		Return $oCSV
	ElseIf $oCSV.NumColumns = 0 Then
		$oCSV.SetColumnName(0, $vCol0)
		$oCSV.SetColumnName(1, $vCol1)
		$oCSV.SetColumnName(2, $vCol2)
		$oCSV.SetColumnName(3, $vCol3)
	Else
		Local $iRow = $oCSV.NumRows
		$oCSV.SetCell($iRow, 0, $vCol0)
		$oCSV.SetCell($iRow, 1, $vCol1)
		$oCSV.SetCell($iRow, 2, $vCol2)
		$oCSV.SetCell($iRow, 3, $vCol3)
	EndIf

EndFunc   ;==>__Example_19b_API

