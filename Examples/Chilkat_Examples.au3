#AutoIt3Wrapper_UseX64=N

;~ #AutoIt3Wrapper_AutoIt3Dir=z:\AutoItPortable\AutoIt_3_3_18_0

#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
;~ #AutoIt3Wrapper_Run_Debug_Mode=Y
#Tidy_Parameters=/sort_funcs /reel

#include <Array.au3>
#include <Debug.au3>
#include <StringConstants.au3>
#include "..\Chilkat.au3"

; #Region RELEASE NOTES
;
; Chilkat_Examples.au3 release notes
;
; v0.1.0
; 2026/07/08
; . Added: Separate RELEASE NOTES region for the examples file - AI / mLipok
; . Changed: Standardized documentation headers for all _Example_XX_* functions - AI / mLipok
; . Changed: Added explanatory step comments inside example functions, especially ZIP binary workflow - AI / mLipok
; . Changed: Updated comments and messages to English where corrections were needed - AI / mLipok
;
; #EndRegion RELEASE NOTES

Global $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)

_Example()
MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '', 'END')
Exit

Func _Example()

	_DebugSetup("Chilkat_Examples", True) ; start displaying debug environment

	_Chilkat_ErrorLogWrapper(_DebugOut)

	_Example_Init()
	If @error Then
		MsgBox($MB_ICONERROR, 'UnlockBundle', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
		Return
	EndIf

	#cs
		; example for: MyChilkatConfig.ini
		[SMTP]
		MyEmail=
		SmtpHost=
		SmtpUserName=
		SmtpPassword=
		SmtpSsl=
		SmtpPort=
	#ce

	; Comment or uncomment one of the following example functions:

	_Example_12_JsonObject_PrettyPrint()
;~ 	_Example_13_JsonObject_IterateMembers()
;~ 	_Example_14_JsonObject_CreateDocument()
;~ 	_Example_15_CSV_ColumnNames()
;~ 	_Example_16_CSV_ToArray()
;~ 	_Example_17_CSV_ToArray('(?i).*?Urz.*?Skarb.*?', '(?i).*Jasło.*?')
;~ 	_Example_17_CSV_ToArray('(?i).*?KRESOWY SZPITA.*?', '(?i).*Żary.*?')
;~ 	_Example_17_CSV_ToArray('(?i).*?Urz.*?Skarb.*?', '(?i).*?Piekary.*?Śląskie')
;~ 	_Example_17_CSV_ToArray('(?i)Drugi.*?urz.*?skarb', '(?i).*bielsko.*?')
;~ 	_Example_18_CSV_ClipToArray()
;~ 	_Example_19_CSV_CreateFile()
;~ 	_Example_19b_CSV_CreateFile()
;~ 	_Example_20_CKSTRING_HTMLEntity_EncodeDecode()
;~ 	_Example_20b_CKSTRING_GetEncoded()511
;~ 	_Example_21_JSONPaths()
;~ 	_Example_22_JSONPaths_cookiemonster()
;~ 	_Example_23_ATOM()
;~ 	_Example_24_Simple_SMTP_Send()
;~ 	_Example_25_Simple_IMAP_List_MailBoxes()
;~ 	_Example_26_ZIP()
;~ 	_Example_27_HTTP_DownloadBd()
;~ 	_Example_28_HTTP_DownloadBdAsync()
;~ 	_Example_29_IMAP()
;~ 	_Example_30_SmartCards()
;~ 	_Example_31_PDF()
;~ 	_Example_32_ZIP_Binary_Workflow()
;~ 	_Example_33_FTP2_ListDirectoryItems_AsArray()
;~ 	_Example_34_FTP2_ZIP_Binary_Workflow()
;~ 	_Example_35_SmartCards_PKCS11_List()
;~ 	_Example_36_PDF_PAdES_Binary()
;~ 	_Example_37_XADES_Binary()

EndFunc   ;==>_Example

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_12_JsonObject_PrettyPrint
; Description ...: Demonstrates loading JSON text and emitting it as formatted JSON.
; Syntax ........: _Example_12_JsonObject_PrettyPrint()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows EmitCompact and EmitCrLf options.
; ===============================================================================================================================
Func _Example_12_JsonObject_PrettyPrint()
	_Log_ChilkatExample('_Example_12_JsonObject_PrettyPrint')
	; This example demonstrates loading JSON text and emitting it as formatted JSON.
	; https://www.example-code.com/vbscript/json_pretty_print.asp
	; Create the Chilkat JSON object used by this example.
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sJSON_String = "{""name"": ""donut"",""image"":{""fname"": ""donut.jpg"",""w"": 200,""h"": 200},""thumbnail"":{""fname"": ""donutThumb.jpg"",""w"": 32,""h"": 32}}"

	; Load the JSON text into the Chilkat JSON object.
	Local $iSuccess = $oJSON.Load($sJSON_String)
	If ($iSuccess <> 1) Then
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
		Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	;  To pretty-print, set the EmitCompact property equal to 0
	$oJSON.EmitCompact = 0

	;  If bare-LF line endings are desired, turn off EmitCrLf
	;  Otherwise CRLF line endings are emitted.
	$oJSON.EmitCrLf = 0

	;  Emit the formatted JSON:
	ConsoleWrite($oJSON.Emit() & @CRLF)
EndFunc   ;==>_Example_12_JsonObject_PrettyPrint

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_13_JsonObject_IterateMembers
; Description ...: Demonstrates iterating over first-level JSON object members.
; Syntax ........: _Example_13_JsonObject_IterateMembers()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows reading member names and values by index.
; ===============================================================================================================================
Func _Example_13_JsonObject_IterateMembers()
	_Log_ChilkatExample('_Example_13_JsonObject_IterateMembers')
	; This example demonstrates iterating over first-level JSON object members.
	; https://www.example-code.com/vbscript/json_iterate_members.asp
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sJSON_String = "{ ""id"": 1, ""name"": ""A green door"", ""tags"": [""home"", ""green""], ""price"": 125 }"

	Local $iSuccess = $oJSON.Load($sJSON_String)
	If ($iSuccess <> 1) Then
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
		Return SetError($CHILKAT_ERR_LOAD, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sName = '', $sValue = ''
	Local $iNumMembers = $oJSON.Size, $iValue = 0

	For $iMember_idx = 0 To $iNumMembers - 1
		$sName = $oJSON.NameAt($iMember_idx)
		$sValue = $oJSON.StringAt($iMember_idx)
		ConsoleWrite($sName & ": " & $sValue & @CRLF)

		$iValue = $oJSON.IntAt($iMember_idx)
		ConsoleWrite($sName & " as integer: " & $iValue & @CRLF)
	Next
EndFunc   ;==>_Example_13_JsonObject_IterateMembers

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_14_JsonObject_CreateDocument
; Description ...: Demonstrates creating a JSON document programmatically.
; Syntax ........: _Example_14_JsonObject_CreateDocument()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Builds JSON from code instead of parsing existing text.
; ===============================================================================================================================
Func _Example_14_JsonObject_CreateDocument()
	_Log_ChilkatExample('_Example_14_JsonObject_CreateDocument')
	; This example demonstrates creating a JSON document programmatically.
	; https://www.example-code.com/vbscript/create_json.asp
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess
	$iSuccess = $oJSON.AddStringAt(-1, "Title", "Pan's Labyrinth")
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$iSuccess = $oJSON.AddStringAt(-1, "Director", "Guillermo del Toro")
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$iSuccess = $oJSON.AddStringAt(-1, "Original_Title", "El laberinto del fauno")
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$iSuccess = $oJSON.AddIntAt(-1, "Year_Released", 2006)
	ConsoleWrite("- $iSuccess=" & $iSuccess & @CRLF)
	$oJSON.EmitCompact = 0
	ConsoleWrite($oJSON.Emit() & @CRLF)
EndFunc   ;==>_Example_14_JsonObject_CreateDocument

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
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
		Return SetError($CHILKAT_ERR_LOADFILE, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iIndex = 0
	Local $sColName = ''

	; Display the column names:
	For $iCol_idx = 0 To $oCSV.NumColumns - 1
		$sColName = $oCSV.GetColumnName($iCol_idx)
		ConsoleWrite($iCol_idx & ": " & $sColName & @CRLF)

		; The following line demonstrates to to get the column
		; index given a column name:
		$iIndex = $oCSV.GetIndex($sColName)
		ConsoleWrite($sColName & " is at column index " & $iIndex & @CRLF)
	Next

EndFunc   ;==>_Example_15_CSV_ColumnNames

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
		ConsoleWrite($__g_oChilkat_GLOBAL.LastErrorText & @CRLF)
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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_18_CSV_ClipToArray
; Description ...: Demonstrates reading CSV-like data from the clipboard into an AutoIt array.
; Syntax ........: _Example_18_CSV_ClipToArray()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires suitable tabular clipboard content.
; ===============================================================================================================================
Func _Example_18_CSV_ClipToArray()
	_Log_ChilkatExample('_Example_16_CSV_ToArray')

	Local $sCSVContent = ClipGet()
	Local $aResult = _Chilkat_CSV_StringToArray($sCSVContent, @TAB, 1)
	If Not @error Then _ArrayDisplay($aResult, '$aResult: _Chilkat_CSV_StringToArray()')

EndFunc   ;==>_Example_18_CSV_ClipToArray

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
	$oCKS.Str = "<p> eèéê eèéê </p>1" & @CRLF & "2"
	$oCKS.HtmlEntityEncode

	; The string now contains: &lt ;p&gt; eèéê eèéê &lt;/p&gt;
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'HtmlEntityEncode > ResultString:', $oCKS.Str)

	; HTML entity decode
;~ 	$oCKS.Str = "&lt;p&gt; e&egrave;&eacute;&ecirc; e&#232;&#233;&#234; &lt;/p&gt;"
	$oCKS.HtmlEntityDecode

	; The string now contains: <p> eèéê eèéê </p>
	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'HtmlEntityDecode > ResultString:', $oCKS.Str)

EndFunc   ;==>_Example_20_CKSTRING_HTMLEntity_EncodeDecode

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
	$oCKS.Str = "Ã¨Ã¨Ã¨"
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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_21_JSONPaths
; Description ...: Demonstrates JSON path based access to nested data.
; Syntax ........: _Example_21_JSONPaths()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows reading selected data from a JSON document using paths.
; ===============================================================================================================================
Func _Example_21_JSONPaths()
	_Log_ChilkatExample('_Example_21_JSONPaths')
	; This example demonstrates JSON path based access to nested data.

;~ 	https://www.example-code.com/vbscript/json_paths.asp

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	$oJSON.LoadFile(@ScriptDir & '\Example_Files\JSON_paths.json')

	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'JSON_paths.json', _Chilkat_JSON_ObjToString($oJSON))

	;  First, let's get the value of "cc1"
	;  The path to this value is: nestedObject.aaa.bb1.cc1
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("nestedObject.aaa.bb1.cc1") & @CRLF)

	;  Now let's get number 18 from the nestedArray.
	;  It is located at nestedArray[1][2][1]
	;  (remember: Indexing is 0-based)
	ConsoleWrite(@ScriptLineNumber & ": " & "This should be 18: " & $oJSON.IntOf("nestedArray[1][2][1]") & @CRLF)

	;  We can do the same thing in a more roundabout way using the
	;  I, J, and K properties.  (The I,J,K properties will be convenient
	;  for iterating over arrays, as we'll see later.)
	$oJSON.I = 1
	$oJSON.J = 2
	$oJSON.K = 1
	ConsoleWrite(@ScriptLineNumber & ": " & "This should be 18: " & $oJSON.IntOf("nestedArray[i][j][k]") & @CRLF)

	;  Let's iterate over the array containing the numbers 17, 18, 19, 20.
	;  First, use the SizeOfArray method to get the array size:
	Local $iSize = $oJSON.SizeOfArray("nestedArray[1][2]")
	;  The size should be 4.
	ConsoleWrite(@ScriptLineNumber & ": " & "size of array = " & $iSize & " (should equal 4)" & @CRLF)

	;  Now iterate...
	For $iArray_idx = 0 To $iSize - 1
		$oJSON.I = $iArray_idx
		ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.IntOf("nestedArray[1][2][i]") & @CRLF)
	Next

	;  Let's use a triple-nested loop to iterate over the nestedArray:

	;  $iSizeI should equal 1.
	Local $iSizeI = $oJSON.SizeOfArray("nestedArray")
	Local $iSizeJ = 0, $iSizeK = 0
	For $iArrayI_idx = 0 To $iSizeI - 1
		$oJSON.I = $iArrayI_idx

		$iSizeJ = $oJSON.SizeOfArray("nestedArray[i]")
		For $iArrayJ_idx = 0 To $iSizeJ - 1
			$oJSON.J = $iArrayJ_idx

			$iSizeK = $oJSON.SizeOfArray("nestedArray[i][j]")
			For $iArrayK_idx = 0 To $iSizeK - 1
				$oJSON.K = $iArrayK_idx

				ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.IntOf("nestedArray[i][j][k]") & @CRLF)
			Next
		Next
	Next

	;  Now let's examine how to navigate to JSON objects contained within JSON arrays.
	;  This line of code gets the value "kiwi" contained within "mixture"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("mixture.arrayA[2].fruit") & @CRLF)

	;  This line of code gets the color "yellow"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("mixture.arrayA[1].colors[0]") & @CRLF)

	;  Getting an object at a path:
	;  This gets the 2nd object in "arrayA"
	; $oJSON2 is a Chilkat_9_5_0.JsonObject
	Local $oJSON2 = $oJSON.ObjectOf("mixture.arrayA[1]")
	;  This object's "animal" should be "plankton"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON2.StringOf("animal") & @CRLF)

	;  Note that paths are relative to the object, not the absolute root of the JSON document.
	;  Starting from $oJSON2, "purple" is at "colors[2]"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON2.StringOf("colors[2]") & @CRLF)

	;  Getting an array at a path:
	; This gets the array containing the colors red, green, blue:
	; $aJsonArray is a Chilkat_9_5_0.JsonArray
	Local $aJsonArray = $oJSON.ArrayOf("mixture.array[0].colors")
	Local $iSizeOfJsonArray = $aJsonArray.Size
	For $iArray_idx = 0 To $iSizeOfJsonArray - 1
		ConsoleWrite(@ScriptLineNumber & ": " & $iArray_idx & ": " & $aJsonArray.StringAt($iArray_idx) & @CRLF)
	Next

	;  The Chilkat JSON path uses ".", "[", and "]" chars for separators.  When a name
	;  contains one of these chars, use double-quotes in the path:
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("""name.with.dots"".grain") & @CRLF)

EndFunc   ;==>_Example_21_JSONPaths

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_22_JSONPaths_cookiemonster
; Description ...: Demonstrates JSON path access on a Cookie Monster sample document.
; Syntax ........: _Example_22_JSONPaths_cookiemonster()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: A small focused JSON path example.
; ===============================================================================================================================
Func _Example_22_JSONPaths_cookiemonster()
	_Log_ChilkatExample('_Example_22_JSONPaths_cookiemonster')
	; This example demonstrates JSON path access on a Cookie Monster sample document.

;~ 	https://www.autoitscript.com/forum/topic/187104-json-to-array/

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	$oJSON.LoadFile(@ScriptDir & '\Example_Files\cookiemonster.json')

	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'cookiemonster.json', _Chilkat_JSON_ObjToString($oJSON))

	Local $iClientSize = $oJSON.SizeOfArray("client")
	Local $sJSON_Path = ''
	For $iClient_idx = 0 To $iClientSize - 1
		$sJSON_Path = "client[" & $iClient_idx & "].client_info.info.name"
		ConsoleWrite("+ " & $sJSON_Path & " = " & $oJSON.StringOf($sJSON_Path) & @CRLF)
	Next
EndFunc   ;==>_Example_22_JSONPaths_cookiemonster

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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_24_Simple_SMTP_Send
; Description ...: Demonstrates sending a simple email message via SMTP.
; Syntax ........: _Example_24_Simple_SMTP_Send()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires SMTP configuration values before running.
; ===============================================================================================================================
Func _Example_24_Simple_SMTP_Send()
	_Log_ChilkatExample('_Example_24_Simple_SMTP_Send')
	; This example demonstrates sending a simple email message via SMTP.

;~ 	http://www.chilkatsoft.com/refdoc/xChilkatMailManRef.html
;~ https://www.example-code.com/vbscript/smtp_send_email_with_attachments.asp

	; we will use __Chilkat_LogOnError instead following reporting model
	; Set outFile = fso.CreateTextFile("output.txt", True)

	;  The mailman object is used for sending (SMTP) and receiving (POP3) email.
	Local $oMailMan = _Chilkat_MailMan_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sMyEmail = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'MyEmail', '')
	If $sMyEmail = '' Then $sMyEmail = "youremail@domain.com"

	Local $sSmtpHost = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpHost', '')
	If $sSmtpHost = '' Then $sSmtpHost = "smtp.my-tls-mail-server.com"

	Local $sSmtpUserName = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpUserName', '')
	If $sSmtpUserName = '' Then $sSmtpUserName = "MY_SMTP_USER"

	Local $sSmtpPassword = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpPassword', '')
	If $sSmtpPassword = '' Then $sSmtpPassword = "MY_SMTP_PASSWORD"

	Local $iSmtpSsl = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpSsl', '')
	If $iSmtpSsl = '' Then $iSmtpSsl = "1"

	Local $iSmtpPort = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpPort', '')
	If $iSmtpPort = '' Then $iSmtpPort = "465"

	;  Any string argument automatically begins the 30-day trial.

	#cs
		; this is already unlocked on begining of this example
		success = $oMailMan.UnlockComponent("30-day trial")
		If (success <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
		EndIf

	#ce

	;  Set the SMTP server.
	$oMailMan.SmtpHost = $sSmtpHost

	;  Set the SMTP login/password (if required)
	$oMailMan.SmtpUsername = $sSmtpUserName
	$oMailMan.SmtpPassword = $sSmtpPassword

	;  Connect to SMTP port 465 using TLS.
	$oMailMan.SmtpSsl = $iSmtpSsl
	$oMailMan.SmtpPort = $iSmtpPort

	;  Create a new email object
	Local $oEmail = _Chilkat_Email_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oEmail.Subject = "This is a test"
	$oEmail.Body = "This is a test from: " & @ComputerName
	$oEmail.From = $sMyEmail
	Local $iSuccess = $oEmail.AddTo("My Email Testing", $sMyEmail)
	;  To add more recipients, call AddTo, AddCC, or AddBcc once per recipient.

	;  Add some attachments.
	;  The AddFileAttachment method returns the value of the content-type it chose for the attachment.
;~ 	Local $iContentType = $oEmail.AddFileAttachment(@ScriptFullPath)
;~ 	#forceref $iContentType
	If ($oEmail.LastMethodSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

;~ 	$iContentType = $oEmail.AddFileAttachment(@ScriptFullPath)
	If ($oEmail.LastMethodSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	;  Call SendEmail to connect to the SMTP server and send.
	;  The connection (i.e. session) to the SMTP server remains
	;  open so that subsequent SendEmail calls may use the
	;  same connection.
	$iSuccess = $oMailMan.SendEmail($oEmail)
	_DebugOut('--- $iSuccess = ' & $iSuccess)
	_DebugOut('$__g_oChilkat_GLOBAL.LastErrorText = ' & $__g_oChilkat_GLOBAL.LastErrorText)
	__Chilkat_LogOnError('$iSuccess = ' & $iSuccess)
	__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
	If ($iSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	$iSuccess = $oMailMan.CloseSmtpConnection()
	If ($iSuccess <> 1) Then
		__Chilkat_LogOnError("Connection to SMTP server not closed cleanly.")
	EndIf

	__Chilkat_LogOnError("Mail with attachments sent!")

EndFunc   ;==>_Example_24_Simple_SMTP_Send

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_25_Simple_IMAP_List_MailBoxes
; Description ...: Demonstrates connecting to IMAP and listing mailboxes.
; Syntax ........: _Example_25_Simple_IMAP_List_MailBoxes()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires IMAP credentials before running.
; ===============================================================================================================================
Func _Example_25_Simple_IMAP_List_MailBoxes()
	_Log_ChilkatExample('_Example_25_Simple_IMAP_List_MailBoxes')
	; This example demonstrates connecting to IMAP and listing mailboxes.

;~ 	https://www.example-code.com/vbscript/imap_listMailboxes.asp
;~ 	https://www.example-code.com/vbscript/imap_listMailboxes2.asp

	; we will use __Chilkat_LogOnError instead following reporting model
	; Set outFile = fso.CreateTextFile("output.txt", True)

	ConsoleWrite(@ScriptLineNumber & @CRLF)
	Local $oImap = _Chilkat_Imap_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	ConsoleWrite(@ScriptLineNumber & @CRLF)
	Local $sMyEmail = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'MyEmail', '')
	If $sMyEmail = '' Then $sMyEmail = "youremail@domain.com"

	Local $sImapServer = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapServer', '')
	If $sImapServer = '' Then $sImapServer = "imap.my-tls-mail-server.com"

	Local $sImapUserName = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapUserName', '')
	If $sImapUserName = '' Then $sImapUserName = "MY_SMTP_USER"

	Local $sImapPassword = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapPassword', '')
	If $sImapPassword = '' Then $sImapPassword = "MY_SMTP_PASSWORD"

	Local $iImapSsl = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapSsl', '')
	If $iImapSsl = '' Then $iImapSsl = "1"
	ConsoleWrite("! " & $iImapSsl & @CRLF)

	Local $iImapPort = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapPort', '')
	If $iImapPort = '' Then $iImapPort = "143"
	ConsoleWrite("! " & $iImapPort & @CRLF)

	ConsoleWrite(@ScriptLineNumber & @CRLF)
	;  Any string argument automatically begins the 30-day trial.

	#cs
		; this is already unlocked on begining of this example
		success = $oImap.UnlockComponent("30-day trial")
		If (success <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
		EndIf

	#ce

	;  Connect to an IMAP server.
	;  Use TLS
	$oImap.ssl = $iImapSsl
	$oImap.Port = $iImapPort
	$oImap.Connect($sImapServer)
	If ($oImap.LastMethodSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	ConsoleWrite(@ScriptLineNumber & @CRLF)
	;  Login using login/password
	$oImap.Login($sImapUserName, $sImapPassword)
	If ($oImap.LastMethodSuccess <> 1) Then
		ConsoleWrite(@ScriptLineNumber & ' LOGIN: ' & $oImap.LastErrorText & @CRLF)
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf
	ConsoleWrite(@ScriptLineNumber & ' LOGIN: ' & $oImap.LastErrorText & @CRLF)

	;  The ListMailboxes method returns a Mailboxes object that contains the collection of mailboxes.
	;  It accepts two arguments: a refName and a wildcardedMailbox.
	Local $s_refName = ''
	;  refName is usually set to an empty string.
	;  A non-empty reference name argument is the name of a mailbox or a level of mailbox hierarchy,
	;	and indicates the context in which the mailbox name is interpreted.

	;  Select all mailboxes matching this pattern:
	Local $s_wildcardedMailbox = '*'

	Local $oMBoxes = $oImap.ListMailboxes($s_refName, $s_wildcardedMailbox)
;~ 	If ($oImap.LastMethodSuccess <> 1) Or $oMBoxes = Null Then
;~ 		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
;~ 		Return ; @TODO - refactoring
;~ 	EndIf
	ConsoleWrite(@ScriptLineNumber & ' ' & $oImap.LastErrorText & @CRLF)
	ConsoleWrite('! ' & IsObj($oMBoxes) & @CRLF)
	ConsoleWrite('! ' & ObjName($oMBoxes, $OBJ_STRING) & @CRLF)
	ConsoleWrite('! ' & VarGetType($oMBoxes) & @CRLF)

	ConsoleWrite('! Count MBoxes = ' & $oMBoxes.Count & @CRLF)
	__Chilkat_LogOnError("Get ListMailboxes")
	__Chilkat_LogOnError("Mailboxes has been listed : " & $oMBoxes.Count)
	ConsoleWrite(@ScriptLineNumber & @CRLF)
	ConsoleWrite("Mailboxes has been listed : " & $oMBoxes.Count & @CRLF)

	; https://www.example-code.com/csharp/imap_find_sent_mailbox.asp

	For $iMailbox_idx = 0 To $oMBoxes.Count - 1
;~ 		ConsoleWrite('! ' & $oMBoxes.GetName($iMailbox_idx) & @CRLF)
;~         ConsoleWrite(">> mboxes.GetNthFlag(i,0)=" & $oMBoxes.GetNthFlag($iMailbox_idx, 0)& @CRLF)
;~         ConsoleWrite(">> mboxes.GetNthFlag(i,1)=" & $oMBoxes.GetNthFlag($iMailbox_idx, 1)& @CRLF)

		If $oMBoxes.GetName($iMailbox_idx) = "Sent" Then
			__Chilkat_LogOnError(@ScriptLineNumber & ' ' & $oMBoxes.GetName($iMailbox_idx))
		ElseIf $oMBoxes.HasFlag($iMailbox_idx, '\\Junk') Then
			__Chilkat_LogOnError(@ScriptLineNumber & ' ' & $oMBoxes.GetName($iMailbox_idx))
		ElseIf $oMBoxes.HasFlag($iMailbox_idx, '\Junk') Then
			__Chilkat_LogOnError(@ScriptLineNumber & ' ' & $oMBoxes.GetName($iMailbox_idx))
		EndIf
	Next
	__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)

	Local $iSuccess = $oImap.SelectMailbox('INBOX')
	If ($iSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	Local $bUid = 0
	Local $iNumMessages = $oImap.NumMessages

	__Chilkat_LogOnError('$oImap.NumMessages = ' & $iNumMessages)

	Local $oEmail = Null, $sHtml = ''
	For $iMessage_idx = $iNumMessages To 1 Step -1
		$oEmail = $oImap.FetchSingle($iMessage_idx, $bUid)
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
		$sHtml = $oEmail.GetHtmlBody()
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
		If IsString($sHtml) And $sHtml <> '' Then
			MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '$sHtml', $sHtml)
			_Chilkat_ViewHTML($sHtml)
		EndIf
	Next

EndFunc   ;==>_Example_25_Simple_IMAP_List_MailBoxes

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
	ConsoleWrite('Extracted from binary ZIP: ' & BinaryToString($dExtracted, $SB_UTF8) & @CRLF)

EndFunc   ;==>_Example_26_ZIP

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_27_HTTP_DownloadBd
; Description ...: Demonstrates downloading HTTP content directly into Chilkat BinData.
; Syntax ........: _Example_27_HTTP_DownloadBd()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Writes the downloaded binary data to a local file only after the in-memory download.
; ===============================================================================================================================
Func _Example_27_HTTP_DownloadBd()
	_Log_ChilkatExample('_Example_27_HTTP_DownloadBd')
	; This example demonstrates downloading HTTP content directly into Chilkat BinData.

;~ 	https://www.example-code.com/vbscript/box_download_binary_to_memory.asp

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oHttp.LastErrorText)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)

	Local $hTimer = TimerInit() ; Begin the timer and store the handle in a variable.
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-setup.exe", $oBinData)
	Local $iSuccess = $oHttp.DownloadBd("https://upgrades.michaelo.pl/ML_Programy/KK_ePUAP_2020-05-07_v2.exe", $oBinData)

	If $iSuccess <> 1 Then
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	Else
		__Chilkat_LogOnError("Downloaded into an object holding the binary data.")
		__Chilkat_LogOnError("Number of bytes: " & $oBinData.NumBytes)

		Local $hFileOpen = FileOpen(@ScriptDir & '\autoit-v3-setup.exe', $FO_BINARY + $FO_OVERWRITE)
		FileWrite($hFileOpen, $oBinData.GetBinary())
		FileClose($hFileOpen)

		Local $fDiff = TimerDiff($hTimer) ; Find the difference in time from the previous call of TimerInit. The variable we stored the TimerInit handlem is passed as the "handle" to TimerDiff.

		MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'DownloadBd speed', _
				'Downloaded: ' & $oBinData.NumBytes & ' bytes' & @CRLF & _
				'Time: ' & $fDiff / 1000 & ' seconds' & @CRLF & _
				@CRLF & _
				'Speed: ' & ($oBinData.NumBytes / 1024) / ($fDiff / 1000) & ' KBytes/seconds' & @CRLF & _
				@CRLF & _
				'')

	EndIf

EndFunc   ;==>_Example_27_HTTP_DownloadBd

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_28_HTTP_DownloadBdAsync
; Description ...: Demonstrates asynchronous HTTP download into Chilkat BinData.
; Syntax ........: _Example_28_HTTP_DownloadBdAsync()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows task startup, waiting and final binary data handling.
; ===============================================================================================================================
Func _Example_28_HTTP_DownloadBdAsync()
	_Log_ChilkatExample('_Example_28_HTTP_DownloadBdAsync')
	; This example demonstrates asynchronous HTTP download into Chilkat BinData.

;~ 	https://www.example-code.com/vbscript/box_download_binary_to_memory.asp

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oHttp.LastErrorText)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oBinData.LastErrorText)

	Local $hTimer = TimerInit() ; Begin the timer and store the handle in a variable.
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-setup.exe", $oBinData)
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://upgrades.michaelo.pl/ML_Programy/KK_ePUAP_2020-05-07_v2.exe", $oBinData)
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://upgrades.michaelo.pl/ML_Downloader/KK_Upgrades/2018-08-03__36_41_Small.zip", $oBinData)
	ConsoleWrite('! 11111' & @CRLF)
;~ 	Local $oTaskMy = _Chilkat_TASK_ObjCreate()
;~ 	_Chilkat_ObjName_FlagsValue($oTaskMy)

	Local $oTask = $oHttp.DownloadBdAsync("https://upgrades.michaelo.pl/ByteScout_OCRData/pol_fast.traineddata", $oBinData)
	_Chilkat_ObjName_FlagsValue($oTask)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oHttp.LastErrorText)

	Local $iSuccess = $oTask.Run()
	If $iSuccess <> 1 Then
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	Else
		Local $iCurPctDone = 0
		While $oTask.Finished <> 1 And $oTask.StatusInt < 5

			If ($oTask.PercentDone <> $iCurPctDone) Then
				$iCurPctDone = $oTask.PercentDone
				ConsoleWrite("+ Downloading progress = " & $iCurPctDone & '%' & ' Status = ' & $oTask.Status & @CRLF)
			EndIf

			$oTask.SleepMs(100)
		WEnd
		__Chilkat_LogOnError("Downloaded into an object holding the binary data.")
		__Chilkat_LogOnError("Number of bytes: " & $oBinData.NumBytes)

		Local $hFileOpen = FileOpen("z:\TOOLs\Macro\PROGRAMY\Skaner\OCRData\pol_fast.traineddata", $FO_BINARY + $FO_OVERWRITE)
		FileWrite($hFileOpen, $oBinData.GetBinary())
		FileClose($hFileOpen)

		Local $fDiff = TimerDiff($hTimer) ; Find the difference in time from the previous call of TimerInit. The variable we stored the TimerInit handlem is passed as the "handle" to TimerDiff.

		MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'DownloadBdAsync speed', _
				'Downloaded: ' & $oBinData.NumBytes & ' bytes' & @CRLF & _
				'Time: ' & $fDiff / 1000 & ' seconds' & @CRLF & _
				@CRLF & _
				'Speed: ' & ($oBinData.NumBytes / 1024) / ($fDiff / 1000) & ' KBytes/seconds' & @CRLF & _
				@CRLF & _
				'')

	EndIf

EndFunc   ;==>_Example_28_HTTP_DownloadBdAsync

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_30_SmartCards
; Description ...: Demonstrates basic smart card certificate loading.
; Syntax ........: _Example_30_SmartCards()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a configured smart card environment.
; ===============================================================================================================================
Func _Example_30_SmartCards()
	; https://www.example-code.com/vbscript/list_cryptographic_service_providers.asp
	Local $aProvidersList = _Chilkat_Csp_GetProvidersList()
	_ArrayDisplay($aProvidersList, '$aProvidersList')

;~ 	https://www.example-code.com/vbscript/load_certificate_on_smartcard_in_reader.asp
;~ 	"CryptoCertum3 Csp"
	Local $s_CspName = "cryptoCertum3 CSP"
	Local $oCert = _Chilkat_Cert_LoadFromSmartCard($s_CspName)
	#forceref $oCert

	Local $s_PIN = __Chilkat_PIN_Request(@ScriptLineNumber)
	Local $i_pinValid = _Chilkat_Cert_ValidateSmartCard_PIN($s_CspName, $s_PIN)
	#forceref $i_pinValid

EndFunc   ;==>_Example_30_SmartCards

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_31_PDF
; Description ...: Demonstrates basic PDF loading and information retrieval.
; Syntax ........: _Example_31_PDF()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a local PDF file selected by the user.
; ===============================================================================================================================
Func _Example_31_PDF()
;~ 	z:\!!!_SVN_AU3\PROGRAMY\KK_ePUAP\DOKUMENTY\TEST_PODPISU\TEST PODPISU - CERTUM.pdf
	Local $s_PDF_FileFullPath = FileOpenDialog('ChooseFile', '', 'PDF (*.pdf)')

	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oPDF)

	Local $bSuccess = $oPDF.LoadFile($s_PDF_FileFullPath)
	#forceref $bSuccess
	If @error Then
		MsgBox($MB_ICONERROR, '$oPdf.LoadFile', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
		Exit
	EndIf
	MsgBox($MB_TOPMOST, "Success", '$oPdf.LoadFile($s_PDF_FileFullPath)')

	Local $dFileContent = _File_ReadHexData($s_PDF_FileFullPath)
	If @error Then Return SetError(@error, @extended, '')

	Local $bVerification = _Chilkat_PDF_VerifySignatureInBd_AsBool($dFileContent, 0)
	#forceref $bVerification
	If @error Then
		MsgBox($MB_ICONERROR, '_Chilkat_PDF_VerifySignatureInBd_AsBool', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
		Exit
	EndIf
	MsgBox($MB_TOPMOST, "Success", '$oPDF.LoadBd($oBinData)')

EndFunc   ;==>_Example_31_PDF

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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_33_FTP2_ListDirectoryItems_AsArray
; Description ...: Demonstrates FTP directory listing returned as a native AutoIt array.
; Syntax ........: _Example_33_FTP2_ListDirectoryItems_AsArray()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires FTP connection settings before running.
; ===============================================================================================================================
Func _Example_33_FTP2_ListDirectoryItems_AsArray()
	_Log_ChilkatExample('_Example_33_FTP2_ListDirectoryItems_AsArray')
	; This example demonstrates FTP directory listing returned as a native AutoIt array.

	Local $sHostName = ''
	Local $sUsername = ''
	Local $sPassword = ''
	Local $sRemoteDir = '/'

	If $sHostName = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_33_FTP2_ListDirectoryItems_AsArray', 'Set FTP credentials in the example before running it.')
		Return
	EndIf

	; Connect to the FTP server using the credentials configured above.
	Local $oFTP = _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; List remote directory items as a native AutoIt array.
	Local $aItems = _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, '*', _
			$CHILKAT_FTP2_LIST_RETURN_ALL, _
			$CHILKAT_FTP2_LIST_RECUR_RECUR, _
			$CHILKAT_FTP2_LIST_SORT_ASC, _
			$CHILKAT_FTP2_LIST_RELPATH)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_ArrayDisplay($aItems, 'FTP directory items')
	_Chilkat_FTP2_Disconnect($oFTP)

EndFunc   ;==>_Example_33_FTP2_ListDirectoryItems_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_34_FTP2_ZIP_Binary_Workflow
; Description ...: Demonstrates downloading a ZIP from FTP, editing it in memory and uploading it back.
; Syntax ........: _Example_34_FTP2_ZIP_Binary_Workflow()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires FTP connection settings and remote ZIP paths before running.
; ===============================================================================================================================
Func _Example_34_FTP2_ZIP_Binary_Workflow()
	_Log_ChilkatExample('_Example_34_FTP2_ZIP_Binary_Workflow')
	; This example demonstrates downloading a ZIP from FTP, editing it in memory and uploading it back.

	Local $sHostName = ''
	Local $sUsername = ''
	Local $sPassword = ''
	Local $sRemoteInputZip = '/in/archive.zip'
	Local $sRemoteOutputZip = '/out/archive.zip'

	If $sHostName = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_34_FTP2_ZIP_Binary_Workflow', 'Set FTP credentials and remote paths in the example before running it.')
		Return
	EndIf

	Local $oFTP = _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_FTP2_DownloadZipToObject($oFTP, $sRemoteInputZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $aBefore = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aBefore, 'ZIP downloaded from FTP')

	Local $dAdded = StringToBinary('Added without using a local ZIP file.', $SB_UTF8)
	_Chilkat_ZIP_AddEntryBinary($oZIP, 'added/from-memory.txt', $dAdded)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_Chilkat_FTP2_UploadZipObject($oFTP, $oZIP, $sRemoteOutputZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_Chilkat_FTP2_Disconnect($oFTP)

EndFunc   ;==>_Example_34_FTP2_ZIP_Binary_Workflow

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_35_SmartCards_PKCS11_List
; Description ...: Demonstrates listing PC/SC readers, PKCS#11 slots and certificates with private keys.
; Syntax ........: _Example_35_SmartCards_PKCS11_List()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a PKCS#11 module path and optional PIN for the certificate part.
; ===============================================================================================================================
Func _Example_35_SmartCards_PKCS11_List()
	_Log_ChilkatExample('_Example_35_SmartCards_PKCS11_List')
	; This example demonstrates listing PC/SC readers, PKCS#11 slots and certificates with private keys.

	; List PC/SC readers available in the current system.
	Local $aReaders = _Chilkat_SCARD_ListReaders_AsArray()
	If Not @error Then
		_ArrayDisplay($aReaders, 'PC/SC readers')
	Else
		MsgBox($MB_ICONINFORMATION, '_Example_35_SmartCards_PKCS11_List', 'There is no readers found')
		Return
	EndIf

;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\aetpkss1.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\aetpkss1.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\eps2003csp11.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\eps2003csp11.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\CCGraphiteP1164p.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\CCGraphiteP1164p.dll'
;~ 	Local $sPkcs11DllFullPath = 'c:\Program Files\Krajowa Izba Rozliczeniowa S.A\Szafir 2.0\bin\CCGraphiteP11p.x64.dll'
;~ 	Local $sPkcs11DllFullPath = 'c:\Program Files\Krajowa Izba Rozliczeniowa S.A\Szafir 2.0\bin\libgraphite64.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\CCP1164p.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\CCP1164p.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\CloudSingerP1164.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\CloudSingerP1164.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\crypto3PKCS.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\crypto3PKCS.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\cryptoCertum3PKCS.dll'
	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\cryptoCertum3PKCS.dll'

	Local $s_PIN = __Chilkat_PIN_Request(@ScriptLineNumber)
	If $sPkcs11DllFullPath = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_35_SmartCards_PKCS11_List', 'Set PKCS#11 DLL path and PIN in the example before running the PKCS#11 part.')
		Return
	EndIf

	Local $aSlots = _Chilkat_PKCS11_DiscoverSlots_AsArray($sPkcs11DllFullPath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aSlots, 'PKCS#11 slots')

	Local $aCerts = _Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray($sPkcs11DllFullPath, $s_PIN)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aCerts, 'Certificates with private key', Default, Default, Default, _
		'Slot ID|Token Label|Certificate Label|Subject CN|Subject DN|Serial Number|Issuer CN|Issuer DN|Valid From|Valid To')

EndFunc   ;==>_Example_35_SmartCards_PKCS11_List

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_36_PDF_PAdES_Binary
; Description ...: Demonstrates PAdES signing and verification using binary PDF data.
; Syntax ........: _Example_36_PDF_PAdES_Binary()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a PDF file and a smart card PIN for signing.
; ===============================================================================================================================
Func _Example_36_PDF_PAdES_Binary()
	_Log_ChilkatExample('_Example_36_PDF_PAdES_Binary')
	; This example demonstrates PAdES signing and verification using binary PDF data.

	; Ask the user to select the PDF file used by this example.
	Local $sPDF_FileFullPath = FileOpenDialog('Choose PDF', '', 'PDF (*.pdf)')
	If @error Or $sPDF_FileFullPath = '' Then Return

	Local $dPDF = _File_ReadHexData($sPDF_FileFullPath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $s_PIN = __Chilkat_PIN_Request(@ScriptLineNumber)
	If $s_PIN = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_36_PDF_PAdES_Binary', 'Set smart card PIN in the example before signing. Verification will be shown only.')
		Local $oVerifyJson = _Chilkat_PDF_VerifySignaturesInBinary_AsJson($dPDF)
		If Not @error Then ConsoleWrite($oVerifyJson.Emit() & @CRLF)
		Return
	EndIf

	Local $oOptions = _Chilkat_PDF_PAdES_CreateOptions()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dSignedPDF = _Chilkat_PDF_SignPAdES_Binary_BySmartCard($dPDF, $s_PIN, '', $oOptions)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sOutput = StringTrimRight($sPDF_FileFullPath, 4) & '.pades.pdf'
	Local $hFile = FileOpen($sOutput, $FO_BINARY + $FO_OVERWRITE)
	FileWrite($hFile, $dSignedPDF)
	FileClose($hFile)

	MsgBox($MB_ICONINFORMATION, '_Example_36_PDF_PAdES_Binary', 'Signed PDF saved to:' & @CRLF & $sOutput)

EndFunc   ;==>_Example_36_PDF_PAdES_Binary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_37_XADES_Binary
; Description ...: Demonstrates detached XAdES signing and verification using binary payload data.
; Syntax ........: _Example_37_XADES_Binary()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a file payload and a smart card PIN for signing.
; ===============================================================================================================================
Func _Example_37_XADES_Binary()
	_Log_ChilkatExample('_Example_37_XADES_Binary')
	; This example demonstrates detached XAdES signing and verification using binary payload data.

	; Ask the user to select the payload file used by this detached XAdES example.
	Local $sFileFullPath = FileOpenDialog('Choose file to sign with detached XAdES', '', 'All (*.*)')
	If @error Or $sFileFullPath = '' Then Return

	Local $dPayload = _File_ReadHexData($sFileFullPath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $s_PIN = __Chilkat_PIN_Request(@ScriptLineNumber)
	If $s_PIN = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_37_XADES_Binary', 'Set smart card PIN in the example before running it.')
		Return
	EndIf

	Local $sReferenceUri = StringRegExpReplace($sFileFullPath, '^.*[\\/]', '')
	Local $dXadesXml = _Chilkat_XADES_SignExternalBinary_BES_BySmartCard($dPayload, $s_PIN, '', $sReferenceUri)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oVerifyJson = _Chilkat_XADES_VerifyBinary_AsJson($dXadesXml, $dPayload, $sReferenceUri)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	ConsoleWrite($oVerifyJson.Emit() & @CRLF)

	Local $sOutput = $sFileFullPath & '.xades.xml'
	Local $hFile = FileOpen($sOutput, $FO_BINARY + $FO_OVERWRITE)
	FileWrite($hFile, $dXadesXml)
	FileClose($hFile)

	MsgBox($MB_ICONINFORMATION, '_Example_37_XADES_Binary', 'XAdES XML saved to:' & @CRLF & $sOutput)

EndFunc   ;==>_Example_37_XADES_Binary

Func _Example_Init()

	_Chilkat_ErrorLogWrapper(ConsoleWrite)
;~ 	_Chilkat_DllVersion($CHILKATOBJ_VERSION_950)
	_Chilkat_DllVersion($CHILKATOBJ_VERSION_10)
;~ 	_Chilkat_DllVersion($CHILKATOBJ_VERSION_11)

;~ 	_Chilkat_StartUp(@ScriptDir & '\ChilkatAx-9.5.0-win32.dll', "_Example_Init")
;~ 	_Chilkat_StartUp("z:\!!!_SVN_AU3\PROGRAMY\Biblioteki\ChilkatAx-9.5.0-win32.dll", "_Example_Init")
	_Chilkat_StartUp("z:\!!!_SVN_AU3\PROGRAMY\Biblioteki\ChilkatAx-10.1.2.0-win32.dll", "_Example_Init")
;~ 	_Chilkat_StartUp("z:\!!!_SVN_AU3\PROGRAMY\Biblioteki\ChilkatAx-11.1.0.0-win32.dll", "_Example_Init")
;~ 	_Chilkat_StartUp("z:\!!!_SVN_AU3\PROGRAMY\Biblioteki\ChilkatAx-11.5.0.0-win32.dll", "_Example_Init")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_9.5.98.dll", "_Example_Init")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-10.1.2.0-win32.dll", "_Example_Init")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-11.1.0.0-win32.dll", "_Example_Init")
	If @error Then MsgBox($MB_ICONERROR, '_Chilkat_StartUp', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

	$__g_oChilkat_GLOBAL = _Chilkat_GLOBAL_ObjCreate()
	If @error Then MsgBox($MB_ICONERROR, 'GLOBAL Declaration', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
	_Chilkat_ObjName_FlagsValue($__g_oChilkat_GLOBAL)

;~ 	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'IsObj', IsObj($__g_oChilkat_GLOBAL))
;~ 	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'VarGetType', VarGetType($__g_oChilkat_GLOBAL))
;~ 	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'OBJNAME', ObjName($__g_oChilkat_GLOBAL,2))
	; try to load UnlockCode from pre defined file or use Trial
	Local $sUnlockCode = FileRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyLicenseKey.txt')
	If @error Then $sUnlockCode = "Anything for 30-day trial"
	If Not @Compiled Then MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '$sUnlockCode', $sUnlockCode)

	_Chilkat_GLOBAL_UnlockBundle($__g_oChilkat_GLOBAL, $sUnlockCode)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Return $__g_oChilkat_GLOBAL
EndFunc   ;==>_Example_Init

Func _Log_ChilkatExample($sData)
	ConsoleWrite('>+ ' & $sData & @CRLF)
EndFunc   ;==>_Log_ChilkatExample
#Region - Internal


Func __Chilkat_PIN_Request($_ScriptLineNumber)
	Return InputBox("PIN", "Provide PIN" & @CRLF & "REF LINE=" & $_ScriptLineNumber, "", "*")
EndFunc   ;==>__Chilkat_PIN_Request
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

Func _File_ReadHexData($sFileFullPath, $iFileOpenMode = $FO_READ)
	Local $hFile = FileOpen($sFileFullPath, $FO_BINARY + $iFileOpenMode)
	If @error Then Return SetError(@error, @extended, $hFile)

	Local $dBinaryData = FileRead($hFile)
	FileClose($hFile)

	Return $dBinaryData
EndFunc   ;==>_File_ReadHexData
#EndRegion - Internal
