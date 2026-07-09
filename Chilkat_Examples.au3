#AutoIt3Wrapper_Aut2exe="z:\AutoItPortable\AutoIt_3_3_12_0_My\Aut2Exe\Aut2exe.exe"
#AutoIt3Wrapper_AutoIt3="z:\AutoItPortable\AutoIt_3_3_12_0_My\AutoIt3.exe"

#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w 7
;~ #AutoIt3Wrapper_Run_Debug_Mode=Y
#Tidy_Parameters=/sort_funcs /reel

#include <Array.au3>
#include <StringConstants.au3>
#include "Chilkat.au3"

Global $__g_oGLOBAL = _Example_Init()
_Example()
;~ Exit

Func _Example()
	; Just comment / uncomment one of this following Examples functions:

;~ 	_Example_12_JsonObject_PrettyPrint()
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

EndFunc   ;==>_Example

Func _Example_12_JsonObject_PrettyPrint()
	_Log_ChilkatExample('_Example_12_JsonObject_PrettyPrint')
	; https://www.example-code.com/vbscript/json_pretty_print.asp
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sJSON_String = "{""name"": ""donut"",""image"":{""fname"": ""donut.jpg"",""w"": 200,""h"": 200},""thumbnail"":{""fname"": ""donutThumb.jpg"",""w"": 32,""h"": 32}}"

	Local $iSuccess = $oJSON.Load($sJSON_String)
	If ($iSuccess <> 1) Then
		ConsoleWrite($oJSON.LastErrorText & @CRLF)
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
		ConsoleWrite($oJSON.LastErrorText & @CRLF)
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
		ConsoleWrite($oCSV.LastErrorText & @CRLF)
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
		ConsoleWrite($oCSV.LastErrorText & @CRLF)
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
	_Log_ChilkatExample('_Example_16_CSV_ToArray')
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
		ConsoleWrite($oCSV.LastErrorText & @CRLF)
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
	ConsoleWrite("! $iNumColumns = " & $iNumColumns& @CRLF)

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
	MsgBox(0, '', $sCSV_String)

	;  Save the CSV to a file:
	$bSuccess = $oCSV.SaveFile("_Example_19_CSV_CreateFile_Result.csv")
	If Not $bSuccess Then ConsoleWrite($oCSV.LastErrorText)

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
	If Not $bSuccess Then ConsoleWrite($oCSV.LastErrorText)

EndFunc   ;==>_Example_19b_CSV_CreateFile

Func _Example_20_CKSTRING_HTMLEntity_EncodeDecode()
	_Log_ChilkatExample('_Example_20_CKSTRING_HTMLEntity_EncodeDecode')

	Local $oCKS = _Chilkat_CKSTRING_ObjCreate()

	; HTML entity encode
	$oCKS.Str = "<p> eèéê eèéê </p>1" & @CRLF & "2"
	$oCKS.HtmlEntityEncode

	; The string now contains: &lt ;p&gt; eèéê eèéê &lt;/p&gt;
	MsgBox(0, 'HtmlEntityEncode > ResultString:', $oCKS.Str)

	; HTML entity decode
;~ 	$oCKS.Str = "&lt;p&gt; e&egrave;&eacute;&ecirc; e&#232;&#233;&#234; &lt;/p&gt;"
	$oCKS.HtmlEntityDecode

	; The string now contains: <p> eèéê eèéê </p>
	MsgBox(0, 'HtmlEntityDecode > ResultString:', $oCKS.Str)

EndFunc   ;==>_Example_20_CKSTRING_HTMLEntity_EncodeDecode

Func _Example_20b_CKSTRING_GetEncoded()
	_Log_ChilkatExample('_Example_20b_CKSTRING_GetEncoded')

	Local $oCKS = _Chilkat_CKSTRING_ObjCreate()

	; This example shows how to encode string, to different formats

	; https://www.chilkatsoft.com/refdoc/xCkStringDoc.html#method68
	$oCKS.Str = "Ã¨Ã¨Ã¨"
	; Returns the character string in an encoding use the charsetEncoding specified.
	; The binaryEncoding may be "base64", "hex", "url", or "quoted-printable".
	MsgBox(0, '$oCKS.GetEncoded:', _
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
	MsgBox(0, 'Encode/Decode example', _
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
	MsgBox(0, 'Decoded from base64', $oCKS.Str)
	MsgBox(0, '$oCKS.GetEncoded("quoted-printable", "utf-8")', $oCKS.GetEncoded("quoted-printable", "utf-8"))

EndFunc   ;==>_Example_20b_CKSTRING_GetEncoded

Func _Example_21_JSONPaths()
	_Log_ChilkatExample('_Example_21_JSONPaths')

;~ 	https://www.example-code.com/vbscript/json_paths.asp

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	$oJSON.LoadFile(@ScriptDir & '\Example_Files\JSON_paths.json')

	MsgBox(0, 'JSON_paths.json', _Chilkat_JSON_ObjToString($oJSON))

	;  First, let's get the value of "cc1"
	;  The path to this value is: nestedObject.aaa.bb1.cc1
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("nestedObject.aaa.bb1.cc1")& @CRLF)

	;  Now let's get number 18 from the nestedArray.
	;  It is located at nestedArray[1][2][1]
	;  (remember: Indexing is 0-based)
	ConsoleWrite(@ScriptLineNumber & ": " & "This should be 18: " & $oJSON.IntOf("nestedArray[1][2][1]")& @CRLF)

	;  We can do the same thing in a more roundabout way using the
	;  I, J, and K properties.  (The I,J,K properties will be convenient
	;  for iterating over arrays, as we'll see later.)
	$oJSON.I = 1
	$oJSON.J = 2
	$oJSON.K = 1
	ConsoleWrite(@ScriptLineNumber & ": " & "This should be 18: " & $oJSON.IntOf("nestedArray[i][j][k]")& @CRLF)

	;  Let's iterate over the array containing the numbers 17, 18, 19, 20.
	;  First, use the SizeOfArray method to get the array size:
	Local $iSize = $oJSON.SizeOfArray("nestedArray[1][2]")
	;  The size should be 4.
	ConsoleWrite(@ScriptLineNumber & ": " & "size of array = " & $iSize & " (should equal 4)"& @CRLF)

	;  Now iterate...
	For $iArray_idx = 0 To $iSize - 1
		$oJSON.I = $iArray_idx
		ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.IntOf("nestedArray[1][2][i]")& @CRLF)
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

				ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.IntOf("nestedArray[i][j][k]")& @CRLF)
			Next
		Next
	Next

	;  Now let's examine how to navigate to JSON objects contained within JSON arrays.
	;  This line of code gets the value "kiwi" contained within "mixture"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("mixture.arrayA[2].fruit")& @CRLF)

	;  This line of code gets the color "yellow"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("mixture.arrayA[1].colors[0]")& @CRLF)

	;  Getting an object at a path:
	;  This gets the 2nd object in "arrayA"
	; $oJSON2 is a Chilkat_9_5_0.JsonObject
	Local $oJSON2 = $oJSON.ObjectOf("mixture.arrayA[1]")
	;  This object's "animal" should be "plankton"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON2.StringOf("animal")& @CRLF)

	;  Note that paths are relative to the object, not the absolute root of the JSON document.
	;  Starting from $oJSON2, "purple" is at "colors[2]"
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON2.StringOf("colors[2]")& @CRLF)

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
	ConsoleWrite(@ScriptLineNumber & ": " & $oJSON.StringOf("""name.with.dots"".grain")& @CRLF)

EndFunc   ;==>_Example_21_JSONPaths

Func _Example_22_JSONPaths_cookiemonster()
	_Log_ChilkatExample('_Example_22_JSONPaths_cookiemonster')

;~ 	https://www.autoitscript.com/forum/topic/187104-json-to-array/

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	$oJSON.LoadFile(@ScriptDir & '\Example_Files\cookiemonster.json')

	MsgBox(0, 'cookiemonster.json', _Chilkat_JSON_ObjToString($oJSON))

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
	MsgBox(0, '$oATOM.ToXmlString()', $oATOM.ToXmlString())

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

Func _Example_Init()

	_ErrorLog_ChilkatWrapper(ConsoleWrite)
	_Chilkat_StartUp(@ScriptDir & '\ChilkatAx-9.5.0-win32.dll')
	_Chilkat_DllVersion($CHILKATOBJ_VERSION_950)

	$__g_oGLOBAL = _Chilkat_GLOBAL_ObjCreate()
	If @error Then MsgBox($MB_ICONERROR, 'GLOBAL Declartion', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

	_Chilkat_GLOBAL_UnlockBundle($__g_oGLOBAL, "Anything for 30-day trial")
	If @error Then MsgBox($MB_ICONERROR, 'UnlockBundle', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

	Return $__g_oGLOBAL
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
#EndRegion - Internal
