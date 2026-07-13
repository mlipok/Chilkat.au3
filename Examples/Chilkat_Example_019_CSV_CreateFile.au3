#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_19_CSV_CreateFile()
If @error Then MsgBox($MB_ICONERROR, "_Example_19_CSV_CreateFile", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_19_CSV_CreateFile
; Description ...: Demonstrates creating a CSV file with Chilkat CSV.
; Syntax ........: _Example_19_CSV_CreateFile()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Writes sample rows to a CSV file.
; ===============================================================================================================================
Func _Example_19_CSV_CreateFile()
	_Log_ChilkatExample('_Example_19_CSV_CreateFile')
	; This example demonstrates creating a CSV file with Chilkat CSV.

	; https://www.example-code.com/vbscript/csv_create.asp
	Local $oCSV = _Chilkat_CSV_ObjCreate()
	If @error Then MsgBox($MB_ICONERROR, 'CSV ObjectCreate', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

	;  Indicate that the 1st row
	;  should be treated as column names:
	$oCSV.HasColumnNames = True ;

	Local $bSuccess = $oCSV.SetColumnName(0, "year")
	$bSuccess = $oCSV.SetColumnName(1, "color")
	$bSuccess = $oCSV.SetColumnName(2, "country")
	$bSuccess = $oCSV.SetColumnName(3, "food")

	$bSuccess = $oCSV.SetCell(0, 0, "2001")
	$bSuccess = $oCSV.SetCell(0, 1, "red")
	$bSuccess = $oCSV.SetCell(0, 2, "France")
	$bSuccess = $oCSV.SetCell(0, 3, "cheese")

	$bSuccess = $oCSV.SetCell(1, 0, "2005")
	$bSuccess = $oCSV.SetCell(1, 1, "blue")
	$bSuccess = $oCSV.SetCell(1, 2, "United States")
	$bSuccess = $oCSV.SetCell(1, 3, "hamburger")

	;  Write the CSV to a string and display:
	Local $sCSV_String
	$sCSV_String = $oCSV.SaveToString()
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '', $sCSV_String)

	;  Save the CSV to a file:
	$bSuccess = $oCSV.SaveFile("_Example_19_CSV_CreateFile_Result.csv")
	If Not $bSuccess Then ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText)

EndFunc   ;==>_Example_19_CSV_CreateFile
