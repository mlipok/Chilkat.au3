#AutoIt3Wrapper_UseX64=N

;~ #AutoIt3Wrapper_AutoIt3Dir="z:\AutoItPortable\AutoIt_3_3_12_0_My\"
#AutoIt3Wrapper_AutoIt3Dir=z:\AutoItPortable\AutoIt_3_3_14_5
;~ #AutoIt3Wrapper_AutoIt3Dir="z:\AutoItPortable\AutoIt_3_3_15_5_beta"
;~ #AutoIt3Wrapper_AutoIt3Dir="z:\AutoItPortable\AutoIt_3_3_15_4_alpha24"

#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
;~ #AutoIt3Wrapper_Run_Debug_Mode=Y
#Tidy_Parameters=/sort_funcs /reel

#include <Array.au3>
#include <Debug.au3>
#include <StringConstants.au3>
#include "..\Chilkat.au3"

Global $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)

_DebugSetup("Chilkat_Examples", True) ; start displaying debug environment

_Chilkat_ErrorLogWrapper(_DebugOut)

_Example_Init()
If @error Then MsgBox($MB_ICONERROR, 'UnlockBundle', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

_Example()

MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '', 'END')
Exit

Func _Example()

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

	; Just comment / uncomment one of this following Examples functions:

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
;~ 	_Example_20b_CKSTRING_GetEncoded()
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

EndFunc   ;==>_Example

Func _Example_12_JsonObject_PrettyPrint()
	_Log_ChilkatExample('_Example_12_JsonObject_PrettyPrint')
	; https://www.example-code.com/vbscript/json_pretty_print.asp
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sJSON_String = "{""name"": ""donut"",""image"":{""fname"": ""donut.jpg"",""w"": 200,""h"": 200},""thumbnail"":{""fname"": ""donutThumb.jpg"",""w"": 32,""h"": 32}}"

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

Func _Example_13_JsonObject_IterateMembers()
	_Log_ChilkatExample('_Example_13_JsonObject_IterateMembers')
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

Func _Example_14_JsonObject_CreateDocument()
	_Log_ChilkatExample('_Example_14_JsonObject_CreateDocument')
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

Func _Example_15_CSV_ColumnNames()
	_Log_ChilkatExample('_Example_15_CSV_ColumnNames')
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

Func _Example_16_CSV_ToArray()
	_Log_ChilkatExample('_Example_16_CSV_ToArray')

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

Func _Example_17_CSV_ToArray($sName_RegExpPattern, $sCity_RegExpPattern)
	_Log_ChilkatExample('_Example_17_CSV_ToArray')
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

Func _Example_18_CSV_ClipToArray()
	_Log_ChilkatExample('_Example_16_CSV_ToArray')

	Local $sCSVContent = ClipGet()
	Local $aResult = _Chilkat_CSV_StringToArray($sCSVContent, @TAB, 1)
	If Not @error Then _ArrayDisplay($aResult, '$aResult: _Chilkat_CSV_StringToArray()')

EndFunc   ;==>_Example_18_CSV_ClipToArray

Func _Example_19_CSV_CreateFile()
	_Log_ChilkatExample('_Example_19_CSV_CreateFile')

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

Func _Example_20_CKSTRING_HTMLEntity_EncodeDecode()
	_Log_ChilkatExample('_Example_20_CKSTRING_HTMLEntity_EncodeDecode')

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

Func _Example_20b_CKSTRING_GetEncoded()
	_Log_ChilkatExample('_Example_20b_CKSTRING_GetEncoded')

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

Func _Example_21_JSONPaths()
	_Log_ChilkatExample('_Example_21_JSONPaths')

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

Func _Example_22_JSONPaths_cookiemonster()
	_Log_ChilkatExample('_Example_22_JSONPaths_cookiemonster')

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

Func _Example_23_ATOM()
	_Log_ChilkatExample('_Example_23_ATOM')

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

Func _Example_24_Simple_SMTP_Send()
	_Log_ChilkatExample('_Example_24_Simple_SMTP_Send')

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

Func _Example_25_Simple_IMAP_List_MailBoxes()
	_Log_ChilkatExample('_Example_25_Simple_IMAP_List_MailBoxes')

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

Func _Example_26_ZIP()
	_Log_ChilkatExample('_Example_26_ZIP')
	Return

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	#forceref $oHttp
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)

EndFunc   ;==>_Example_26_ZIP

Func _Example_27_HTTP_DownloadBd()
	_Log_ChilkatExample('_Example_27_HTTP_DownloadBd')

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

		MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'DowlnoadBd speed', _
				'Downoladed: ' & $oBinData.NumBytes & ' bytes' & @CRLF & _
				'Time: ' & $fDiff / 1000 & ' seconds' & @CRLF & _
				@CRLF & _
				'Speed: ' & ($oBinData.NumBytes / 1024) / ($fDiff / 1000) & ' KBytes/seconds' & @CRLF & _
				@CRLF & _
				'')

	EndIf

EndFunc   ;==>_Example_27_HTTP_DownloadBd

Func _Example_28_HTTP_DownloadBdAsync()
	_Log_ChilkatExample('_Example_28_HTTP_DownloadBdAsync')

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

		MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'DowlnoadBdAsync speed', _
				'Downoladed: ' & $oBinData.NumBytes & ' bytes' & @CRLF & _
				'Time: ' & $fDiff / 1000 & ' seconds' & @CRLF & _
				@CRLF & _
				'Speed: ' & ($oBinData.NumBytes / 1024) / ($fDiff / 1000) & ' KBytes/seconds' & @CRLF & _
				@CRLF & _
				'')

	EndIf

EndFunc   ;==>_Example_28_HTTP_DownloadBdAsync

Func _Example_30_SmartCards()
	; https://www.example-code.com/vbscript/list_cryptographic_service_providers.asp
	Local $aProvidersList = _Chilkat_Csp_GetProvidersList()
	_ArrayDisplay($aProvidersList, '$aProvidersList')

;~ 	https://www.example-code.com/vbscript/load_certificate_on_smartcard_in_reader.asp
;~ 	"CryptoCertum3 Csp"
	Local $s_CspName = "cryptoCertum3 CSP"
	Local $oCert = _Chilkat_Cert_LoadFromSmartCard($s_CspName)
	#forceref $oCert

	Local $s_PIN = "000000"
	Local $i_pinValid = _Chilkat_Cert_ValidateSmartCard_PIN($s_CspName, $s_PIN)
	#forceref $i_pinValid

EndFunc   ;==>_Example_30_SmartCards

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

Func _Example_Init()

	_Chilkat_ErrorLogWrapper(ConsoleWrite)
;~ 	_Chilkat_StartUp(@ScriptDir & '\ChilkatAx-9.5.0-win32.dll')
;~ 	_Chilkat_StartUp("z:\!!!_SVN_AU3\PROGRAMY\Biblioteki\ChilkatAx-9.5.0-win32.dll")
;~ 	_Chilkat_StartUp("z:\!!!_SVN_AU3\DOC_INSTALL\Chilkat\10.0\chilkatax-win32\ChilkatAx-win32.dll")
	_Chilkat_StartUp("c:\Users\agatk\Desktop\MICHAELO\Biblioteki\ChilkatAx-10.1.2.0-win32.dll")
;~ 	_Chilkat_StartUp("c:\Users\agatk\Desktop\MICHAELO\Biblioteki\ChilkatAx-11.1.0.0-win32.dll")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_9.5.98.dll")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-10.1.2.0-win32.dll")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-11.1.0.0-win32.dll")
	If @error Then MsgBox($MB_ICONERROR, '_Chilkat_StartUp', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

;~ 	_Chilkat_DllVersion($CHILKATOBJ_VERSION_950)
	_Chilkat_DllVersion($CHILKATOBJ_VERSION_10)

	$__g_oChilkat_GLOBAL = _Chilkat_GLOBAL_ObjCreate()
	If @error Then MsgBox($MB_ICONERROR, 'GLOBAL Declartion', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
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
