#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_21_JSONPaths()
If @error Then MsgBox($MB_ICONERROR, "_Example_21_JSONPaths", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

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
	_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON.StringOf("nestedObject.aaa.bb1.cc1"))

	;  Now let's get number 18 from the nestedArray.
	;  It is located at nestedArray[1][2][1]
	;  (remember: Indexing is 0-based)
	_Log_ChilkatExample(@ScriptLineNumber & ": " & "This should be 18: " & $oJSON.IntOf("nestedArray[1][2][1]"))

	;  We can do the same thing in a more roundabout way using the
	;  I, J, and K properties.  (The I,J,K properties will be convenient
	;  for iterating over arrays, as we'll see later.)
	$oJSON.I = 1
	$oJSON.J = 2
	$oJSON.K = 1
	_Log_ChilkatExample(@ScriptLineNumber & ": " & "This should be 18: " & $oJSON.IntOf("nestedArray[i][j][k]"))

	;  Let's iterate over the array containing the numbers 17, 18, 19, 20.
	;  First, use the SizeOfArray method to get the array size:
	Local $iSize = $oJSON.SizeOfArray("nestedArray[1][2]")
	;  The size should be 4.
	_Log_ChilkatExample(@ScriptLineNumber & ": " & "size of array = " & $iSize & " (should equal 4)")

	;  Now iterate...
	For $iArray_idx = 0 To $iSize - 1
		$oJSON.I = $iArray_idx
		_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON.IntOf("nestedArray[1][2][i]"))
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

				_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON.IntOf("nestedArray[i][j][k]"))
			Next
		Next
	Next

	;  Now let's examine how to navigate to JSON objects contained within JSON arrays.
	;  This line of code gets the value "kiwi" contained within "mixture"
	_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON.StringOf("mixture.arrayA[2].fruit"))

	;  This line of code gets the color "yellow"
	_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON.StringOf("mixture.arrayA[1].colors[0]"))

	;  Getting an object at a path:
	;  This gets the 2nd object in "arrayA"
	; $oJSON2 is a Chilkat_9_5_0.JsonObject
	Local $oJSON2 = $oJSON.ObjectOf("mixture.arrayA[1]")
	;  This object's "animal" should be "plankton"
	_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON2.StringOf("animal"))

	;  Note that paths are relative to the object, not the absolute root of the JSON document.
	;  Starting from $oJSON2, "purple" is at "colors[2]"
	_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON2.StringOf("colors[2]"))

	;  Getting an array at a path:
	; This gets the array containing the colors red, green, blue:
	; $aJsonArray is a Chilkat_9_5_0.JsonArray
	Local $aJsonArray = $oJSON.ArrayOf("mixture.array[0].colors")
	Local $iSizeOfJsonArray = $aJsonArray.Size
	For $iArray_idx = 0 To $iSizeOfJsonArray - 1
		_Log_ChilkatExample(@ScriptLineNumber & ": " & $iArray_idx & ": " & $aJsonArray.StringAt($iArray_idx))
	Next

	;  The Chilkat JSON path uses ".", "[", and "]" chars for separators.  When a name
	;  contains one of these chars, use double-quotes in the path:
	_Log_ChilkatExample(@ScriptLineNumber & ": " & $oJSON.StringOf("""name.with.dots"".grain"))

EndFunc   ;==>_Example_21_JSONPaths
