#include-once

#include <Array.au3>
#include <Debug.au3>
#include <StringConstants.au3>

Global $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)

Func _Example_Init()

	_Chilkat_ErrorLogWrapper(ConsoleWrite)
;~ 	_Chilkat_DllVersion($CHILKATOBJ_VERSION_950)
	_Chilkat_DllVersion($CHILKATOBJ_VERSION_10)
;~ 	_Chilkat_DllVersion($CHILKATOBJ_VERSION_11)

;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_9.5.98.dll", "_Example_Init")
	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_10.1.2.0.dll", "_Example_Init")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_11.0.0.0.dll", "_Example_Init")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_11.1.0.0.dll", "_Example_Init")
;~ 	_Chilkat_StartUp(@ScriptDir & "\ChilkatAx-win32_11.5.0.0.dll", "_Example_Init")
	If @error Then
		MsgBox($MB_ICONERROR, '_Chilkat_StartUp', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
		If Not @Compiled Then _ArrayDisplay($CHILKATOBJ_API, '$CHILKATOBJ_API')
		Return SetError(1)
	EndIf

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

Func _File_ReadHexData($sFileFullPath, $iFileOpenMode = $FO_READ)
	Local $hFile = FileOpen($sFileFullPath, $FO_BINARY + $iFileOpenMode)
	If @error Then Return SetError(@error, @extended, $hFile)

	Local $dBinaryData = FileRead($hFile)
	FileClose($hFile)

	Return $dBinaryData
EndFunc   ;==>_File_ReadHexData
