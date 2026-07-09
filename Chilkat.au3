#Region - Chilkat.au3 - Header
; #INDEX# ========================================================================
; Title .........: Chilkat.au3
; AutoIt Version : 3.3.10.2++
; Language ......: English
; Description ...: A collection of Function for use with Chilkat component
; Author ........: mLipok
; Modified ......:
; URL ...........: https://www.chilkatsoft.com/refdoc/activex.asp
; URL ...........: https://www.chilkatsoft.com/downloads_ActiveX.asp
; Date ..........: 2017/11/12
; Version .......: 0.1.3 BETA - Work in progress
; ================================================================================

#cs
	0.1.1
	2017/02/01
	.	First official version - mLipok

	0.1.2
	2017/02/08
	.	Chnaged: few refactoring - mLipok
	.	Added: Function: _Chilkat_CSV_StringToArray() - mLipok
	.	Added: Function: _Chilkat_JSON_ObjFromString() - mLipok
	.	Added: Function: _Chilkat_JSON_ObjToString() - mLipok
	.	Added: $CHILKATOBJ_API - modest beginning for support to create object for future Chilkat Component version - mLipok

	0.1.3
	2017/11/12
	.	Added: Function: _Chilkat_ATOM_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_CKSTRING_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_EMAIL_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_IMAP_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_MAILMAN_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_StringBuilder_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_ZIP_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_JSON_StringPretty() - mLipok
	.	Added: New Examples - mLipok

	@LAST

	;~ https://www.chilkatsoft.com/refdoc/xChilkatJsonObjectRef.html
#ce
#EndRegion - Chilkat.au3 - Header

#Region - Chilkat.au3 - Options
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w 7
;~ #AutoIt3Wrapper_Run_Debug_Mode=Y
#Tidy_Parameters=/sort_funcs /reel
#EndRegion - Chilkat.au3 - Options

#Region - Chilkat.au3 - Include
#include-once
#include <AutoItConstants.au3>
#include <StringConstants.au3>
#include "ChilkatConstants.au3"
#EndRegion - Chilkat.au3 - Include

OnAutoItExitRegister(_Chilkat_ShutDown) ; in case the script exit without calling _Chilkat_ShutDown()

#Region - Chilkat.au3 - Function - INIT

Func _Chilkat_DllVersion($iVersion = Default)
	If $iVersion = Default And $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then
		Return __ErrorLog_Chilkat('DLL Version is not set.') & _
				SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	ElseIf $iVersion = Default Then
		Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $__g_iChilkat_DLLVersion)
	ElseIf Not IsInt($iVersion) Then
		Return __ErrorLog_Chilkat('Invalid Parameter Type - Version should be Integer') & _
				SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	ElseIf $iVersion < 0 Or $iVersion > $CHILKATOBJ_VERSION_COUNTER - 1 Then
		Return __ErrorLog_Chilkat('Invalid Parameter Value - for Version number look for $CHILKATOBJ_VERSION_* ') & _
				SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	$__g_iChilkat_DLLVersion = $iVersion
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_DllVersion

Func _Chilkat_GLOBAL_UnlockBundle(ByRef $oGLOBAL, $sUnlockCode)
	Local $iSuccess = $oGLOBAL.UnlockBundle($sUnlockCode)
	If $iSuccess <> 1 Then _
			Return __ErrorLog_Chilkat('$oGLOBAL.UnlockBundle() ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_GLOBAL][$CHILKATOBJ_ID_PROGID] & @CRLF & $oGLOBAL.LastErrorText) & _
			SetError($CHILKAT_ERR_UNLOCK, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_GLOBAL_UnlockBundle

Func _Chilkat_ShutDown()
;~ 	DllClose($__g_hDll_CHILKAT)
	$__g_hDll_CHILKAT = 0
EndFunc   ;==>_Chilkat_ShutDown

Func _Chilkat_StartUp($sDLL_FileFullPath)
	If Not FileExists($sDLL_FileFullPath) Then _
			Return __ErrorLog_Chilkat('DLL File not exist:' & $sDLL_FileFullPath) & _
			SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $__g_hDll_CHILKAT = 0 Then $__g_hDll_CHILKAT = DllOpen($sDLL_FileFullPath)
	If @error Then
		$__g_hDll_CHILKAT = 0
		Return __ErrorLog_Chilkat('DLL open error.' & $sDLL_FileFullPath) & _
				SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_StartUp

Func _Chilkat_UnlockComponent($oChilkat, $sUnlockCode)
	__Chilkat_IsValidObject($oChilkat)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oChilkat.UnlockComponent($sUnlockCode)
	If $iSuccess <> 1 Then _
			Return __ErrorLog_Chilkat('$oChilkat.UnlockComponent() ' & ObjName($oChilkat, $OBJ_PROGID) & @CRLF & $oChilkat.LastErrorText) & _
			SetError($CHILKAT_ERR_UNLOCK, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	#CS
		http://cknotes.com/unlockcomponent-returns-false0/
		https://www.chilkatsoft.com/p/p_402.asp
		http://cknotes.com/unlockcomponent-lasterrortext-shows-exact-string-passed-to-it/
		http://cknotes.com/verify-unlockcomponent-success-w-permanent-unlock-code/
	#CE
EndFunc   ;==>_Chilkat_UnlockComponent
#EndRegion - Chilkat.au3 - Function - INIT

#Region - Chilkat.au3 - Function - ObjCreate

Func _Chilkat_ATOM_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatAtomRef.html
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_ATOM][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_ATOM][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_ATOM][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_ATOM_ObjCreate

Func _Chilkat_CKSTRING_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_CKSTRING][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_CKSTRING][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_CKSTRING][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_CKSTRING_ObjCreate

Func _Chilkat_CSV_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_CSV][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_CSV][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_CSV][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_CSV_ObjCreate

Func _Chilkat_EMAIL_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_EMAIL][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_EMAIL][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_EMAIL][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_EMAIL_ObjCreate

Func _Chilkat_GLOBAL_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_GLOBAL][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_GLOBAL][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_GLOBAL][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_GLOBAL_ObjCreate

Func _Chilkat_IMAP_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_IMAP][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_IMAP][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_IMAP][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_IMAP_ObjCreate

Func _Chilkat_JSON_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_JSON][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_JSON][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_JSON][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_JSON_ObjCreate

Func _Chilkat_MAILMAN_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_MAILMAN][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_MAILMAN][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_MAILMAN][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_MAILMAN_ObjCreate

Func _Chilkat_SSHTunel_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_SSHTUNEL][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_SSHTUNEL][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_SSHTUNEL][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_SSHTunel_ObjCreate

Func _Chilkat_StringBuilder_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_STRINGBUILDER][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_STRINGBUILDER][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_STRINGBUILDER][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_StringBuilder_ObjCreate

Func _Chilkat_XML_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_XML][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_XML][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_XML][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_XML_ObjCreate

Func _Chilkat_ZIP_ObjCreate()
	If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then _
			Return __ErrorLog_Chilkat('DLL Version is not set.') & _
			SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	Local $oObject = ObjCreate( _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_ZIP][$CHILKATOBJ_ID_CLSID], _
			$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_ZIP][$CHILKATOBJ_ID_IID], _
			$__g_hDll_CHILKAT)
	If @error Then _
			Return __ErrorLog_Chilkat('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_ZIP][$CHILKATOBJ_ID_PROGID]) & _
			SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>_Chilkat_ZIP_ObjCreate
#EndRegion - Chilkat.au3 - Function - ObjCreate

#Region - Chilkat.au3 - Function - Misc

Func __Chilkat_IsValidObject($oObject)
	If Not IsObj($oObject) Then _
			Return __ErrorLog_Chilkat('IsNotObject:   VarGetType = ' & VarGetType($oObject)) & _
			SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	If StringRegExp(ObjName($oObject, $OBJ_PROGID), '(?i)(Chilkat_\d+_\d+_\d+\..+)', 1) Then _
			Return __ErrorLog_Chilkat('IsNotValid Chilkat Object: ' & ObjName($oObject, $OBJ_PROGID)) & _
			SetError($CHILKAT_ERR_ISNOTCHILKAT, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_IsValidObject

Func __ErrorLog_Chilkat($sText, $iError = @error, $iExtended = @extended)
	Local $fnFunction = _ErrorLog_ChilkatWrapper()
	If IsFunc($fnFunction) Then $fnFunction("!" & ' @error=' & $iError & ' @extended=' & $iExtended & ' : ' & $sText & @CRLF)
	Return SetError($iError, $iExtended)
EndFunc   ;==>__ErrorLog_Chilkat

Func _Chilkat_GetVersion()
	Local $oGLOBAL = _Chilkat_GLOBAL_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oGLOBAL.Version)
EndFunc   ;==>_Chilkat_GetVersion

Func _ErrorLog_ChilkatWrapper($fnFunction = Default)
	Local Static $fnFunction_static = Null
	If $fnFunction = Default Then Return $fnFunction_static
	If Not IsFunc($fnFunction) Then Return SetError(1)

	$fnFunction_static = $fnFunction
	Return $fnFunction_static
EndFunc   ;==>_ErrorLog_ChilkatWrapper
#EndRegion - Chilkat.au3 - Function - Misc

#Region - Chilkat.au3 - Function - CSV  - WIP
Func _Chilkat_CSV_StringToArray(ByRef $sCSVContent, $sDelimeter = @TAB, $iHasColumnNames = 1, $fnShowProgress = Default)

	Local $oCSV = _Chilkat_CSV_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	;  Prior to loading the CSV file, indicate that the 1st row
	;  should be treated as column names:
	$oCSV.HasColumnNames = $iHasColumnNames
	$oCSV.Delimiter = $sDelimeter

	; Load the $oCSV records from the file:
	Local $iSuccess = $oCSV.LoadFromString($sCSVContent)
	If ($iSuccess <> 1) Then
;~ 		ConsoleWrite($oCSV.LastErrorText & @CRLF)
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
		If IsFunc($fnShowProgress) Then $fnShowProgress($iRow_idx, $iNumRows - 1)
		For $iCol_idx = 0 To $iNumColumns - 1
			$aResult[$iRow_idx + 1][$iCol_idx] = $oCSV.GetCell($iRow_idx, $iCol_idx)
		Next
	Next

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aResult)
EndFunc   ;==>_Chilkat_CSV_StringToArray
#EndRegion - Chilkat.au3 - Function - CSV  - WIP

#Region - Chilkat.au3 - Function - JSON  - WIP
Func _Chilkat_JSON_ObjFromString(ByRef $sJSON_String, $iEmitCompact = 0, $iEmitCrLf = 1)

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oJSON.Load($sJSON_String)
	If ($iSuccess <> 1) Then
;~ 		ConsoleWrite($oJSON.LastErrorText & @CRLF)
		Return SetError($CHILKAT_ERR_LOAD, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	;  To pretty-print, set the EmitCompact property equal to 0
	$oJSON.EmitCompact = $iEmitCompact

	;  If bare-LF line endings are desired, turn off EmitCrLf
	;  Otherwise CRLF line endings are emitted.
	$oJSON.EmitCrLf = $iEmitCrLf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON)

EndFunc   ;==>_Chilkat_JSON_ObjFromString

Func _Chilkat_JSON_ObjToString(ByRef $oJSON, $iEmitCompact = 0, $iEmitCrLf = 1)

	If Not IsObj($oJSON) Then Return SetError(1) ; @TODO Error handling

	;  To pretty-print, set the EmitCompact property equal to 0
	$oJSON.EmitCompact = $iEmitCompact

	;  If bare-LF line endings are desired, turn off EmitCrLf
	;  Otherwise CRLF line endings are emitted.
	$oJSON.EmitCrLf = $iEmitCrLf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON.Emit())

EndFunc   ;==>_Chilkat_JSON_ObjToString

Func _Chilkat_JSON_StringPretty(ByRef $sJSON_String)
	Local $oJSON = _Chilkat_JSON_ObjFromString($sJSON_String)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON.Emit())
EndFunc   ;==>_Chilkat_JSON_StringPretty
#EndRegion - Chilkat.au3 - Function - JSON  - WIP
