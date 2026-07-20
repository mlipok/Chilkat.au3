#include-once
#Region - Chilkat.au3 - Header
; #INDEX# ========================================================================
; Title .........: Chilkat.au3 UDF
; AutoIt Version : 3.3.10.2++
; Language ......: English
; Description ...: A collection of Function for use with Chilkat component
; Author ........: mLipok
; Modified ......:
; URL ...........: https://www.chilkatsoft.com/refdoc/activex.asp
; URL ...........: https://www.chilkatsoft.com/downloads_ActiveX.asp
; URL ...........: https://chilkatsoft.com/activex_dll_registration_tutorial.asp
; URL ...........: https://cknotes.com/category/release-notes/
; Date ..........: 2026/07/14
; Version .......: v0.3.0 BETA - Work in progress
; ================================================================================

; Release Notes .: See RELEASE_NOTES.md

#Region ; TODO LIST
#TODO Add an NTP-based network time example or a compatibility example for the legacy NIST RFC 868 time protocol.
#TODO Add _Chilkat_CertStore_LoadPfxBd() for loading PFX/P12 data from Chilkat BinData on Chilkat 10.1.2+.
#TODO Complete _Chilkat_PDF_GetDSS_AsArray().
#TODO Review advanced SCard APDU, transaction, status-change and reader-control helpers.
#TODO Review advanced PKCS11 token-object and mechanism operations beyond discovery, certificate listing and signing sessions.
#EndRegion ; TODO LIST

#EndRegion - Chilkat.au3 - Header

#Region - Chilkat.au3 - Options
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
;~ #AutoIt3Wrapper_Run_Debug_Mode=Y
#Tidy_Parameters=/sort_funcs /reel
#EndRegion - Chilkat.au3 - Options

#Region - Chilkat.au3 - Include
#include <AutoItConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <IE.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>

#include "ChilkatConstants.au3"
#EndRegion - Chilkat.au3 - Include

Global $__g_oChilkat_GLOBAL = Null
Global $__g_sChilkat_LastCOMError = ''

; Native AutoIt array column indexes for list/helper functions added in v0.2.7.
Global Const $CHILKAT_ZIP_LIST_COL_INDEX = 0
Global Const $CHILKAT_ZIP_LIST_COL_PATH = 1
Global Const $CHILKAT_ZIP_LIST_COL_ISDIR = 2
Global Const $CHILKAT_ZIP_LIST_COL_UNCOMPRESSED_SIZE = 3
Global Const $CHILKAT_ZIP_LIST_COL_COMPRESSED_SIZE = 4
Global Const $CHILKAT_ZIP_LIST_COL_MODIFIED = 5
Global Const $CHILKAT_ZIP_LIST_COL_CRC = 6
Global Const $CHILKAT_ZIP_LIST_COL_AES = 7
Global Const $CHILKAT_ZIP_LIST_COL_ENTRY_TYPE = 8
Global Const $CHILKAT_ZIP_LIST_COL_COMMENT = 9
Global Const $CHILKAT_ZIP_LIST_COL_COUNT = 10

Global Const $CHILKAT_SCARD_READER_COL_INDEX = 0
Global Const $CHILKAT_SCARD_READER_COL_NAME = 1
Global Const $CHILKAT_SCARD_READER_COL_COUNT = 2

Global Const $CHILKAT_PKCS11_SLOT_COL_INDEX = 0
Global Const $CHILKAT_PKCS11_SLOT_COL_ID = 1
Global Const $CHILKAT_PKCS11_SLOT_COL_DESCRIPTION = 2
Global Const $CHILKAT_PKCS11_SLOT_COL_MANUFACTURER = 3
Global Const $CHILKAT_PKCS11_SLOT_COL_TOKEN_PRESENT = 4
Global Const $CHILKAT_PKCS11_SLOT_COL_TOKEN_LABEL = 5
Global Const $CHILKAT_PKCS11_SLOT_COL_TOKEN_MANUFACTURER = 6
Global Const $CHILKAT_PKCS11_SLOT_COL_TOKEN_MODEL = 7
Global Const $CHILKAT_PKCS11_SLOT_COL_TOKEN_SERIAL = 8
Global Const $CHILKAT_PKCS11_SLOT_COL_COUNT = 9

Global Const $CHILKAT_CERT_LIST_COL_INDEX = 0
Global Const $CHILKAT_CERT_LIST_COL_SUBJECT_DN = 1
Global Const $CHILKAT_CERT_LIST_COL_ISSUER_DN = 2
Global Const $CHILKAT_CERT_LIST_COL_SUBJECT_CN = 3
Global Const $CHILKAT_CERT_LIST_COL_ISSUER_CN = 4
Global Const $CHILKAT_CERT_LIST_COL_SERIAL = 5
Global Const $CHILKAT_CERT_LIST_COL_SHA1 = 6
Global Const $CHILKAT_CERT_LIST_COL_HAS_PRIVATE_KEY = 7
Global Const $CHILKAT_CERT_LIST_COL_VALID_FROM = 8
Global Const $CHILKAT_CERT_LIST_COL_VALID_TO = 9
Global Const $CHILKAT_CERT_LIST_COL_DATE_VALID_NOW = 10
Global Const $CHILKAT_CERT_LIST_COL_KEY_USAGE = 11
Global Const $CHILKAT_CERT_LIST_COL_EXT_KEY_USAGE = 12
Global Const $CHILKAT_CERT_LIST_COL_QUALIFIED_TYPE = 13
Global Const $CHILKAT_CERT_LIST_COL_QUALIFIED_POLICY_OID = 14
Global Const $CHILKAT_CERT_LIST_COL_COUNT = 15

Global Const $CHILKAT_CERT_DATE_COL_VALID_NOW = 0
Global Const $CHILKAT_CERT_DATE_COL_NOT_BEFORE_OK = 1
Global Const $CHILKAT_CERT_DATE_COL_NOT_AFTER_OK = 2
Global Const $CHILKAT_CERT_DATE_COL_VALID_FROM_UTC = 3
Global Const $CHILKAT_CERT_DATE_COL_VALID_TO_UTC = 4
Global Const $CHILKAT_CERT_DATE_COL_NOW_UTC = 5
Global Const $CHILKAT_CERT_DATE_COL_VALID_FROM_RAW = 6
Global Const $CHILKAT_CERT_DATE_COL_VALID_TO_RAW = 7
Global Const $CHILKAT_CERT_DATE_COL_COUNT = 8

OnAutoItExitRegister(_Chilkat_ShutDown) ; in case the script exit without calling _Chilkat_ShutDown()

#Region - Chilkat.au3 - Object Group Modules
; Chilkat.au3 remains the primary include file.
#include "Chilkat_Certificates_PKI.au3"
#include "Chilkat_DigitalSignatures.au3"
#include "Chilkat_Email.au3"
#include "Chilkat_Cryptography.au3"
#include "Chilkat_DataFormats.au3"
#include "Chilkat_Authentication.au3"
#include "Chilkat_CloudStorage.au3"
#include "Chilkat_Google.au3"
#include "Chilkat_TransferNetworking.au3"
#include "Chilkat_CompressionArchives.au3"
#EndRegion - Chilkat.au3 - Object Group Modules

#Region - Chilkat.au3 - Function - INIT

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_DllVersion
; Description ...: Sets or returns the selected Chilkat ActiveX API version index.
; Syntax ........: _Chilkat_DllVersion($iVersion = Default)
; Parameters ....: $iVersion              - [in] Chilkat object API version index; Default returns the current index.
; Return values .: Success: current version index when called with Default; otherwise $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_Log
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_DllVersion($iVersion = Default)
	If $iVersion = Default And $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then
		__Chilkat_Log('DLL Version is not set.')
		Return SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	ElseIf $iVersion = Default Then
		__Chilkat_Log('DLL Version was not set.')
		Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $__g_iChilkat_DLLVersion)
	ElseIf Not IsInt($iVersion) Then
		__Chilkat_Log('Invalid Parameter Type - Version should be Integer')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	ElseIf $iVersion < 0 Or $iVersion > $CHILKATOBJ_VERSION_COUNTER - 1 Then
		__Chilkat_Log('Invalid Parameter Value - for Version number look for $CHILKATOBJ_VERSION_* ')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	$__g_iChilkat_DLLVersion = $iVersion
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_DllVersion

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ShutDown
; Description ...: Finalizes opened Chilkat resources and closes the DLL handle.
; Syntax ........: _Chilkat_ShutDown()
; Parameters ....: None
; Return values .: None.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_Log, _Chilkat_IsAtLeastThisVersion
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ShutDown()
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	__Chilkat_Log('Closing opened Chilkat instances')
	If IsObj($__g_oChilkat_GLOBAL) Then
		If _Chilkat_IsAtLeastThisVersion('9.5.0.56', "$__g_oChilkat_GLOBAL.FinalizeThreadPool") Then $__g_oChilkat_GLOBAL.FinalizeThreadPool()
		$__g_oChilkat_GLOBAL = Null
	EndIf
	DllClose($__g_hDll_CHILKAT)
	$__g_hDll_CHILKAT = 0
EndFunc   ;==>_Chilkat_ShutDown

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_StartUp
; Description ...: Opens the Chilkat ActiveX DLL and stores its handle for wrapper-based object creation.
; Syntax ........: _Chilkat_StartUp($sDLL_FileFullPath, $sComment)
; Parameters ....: $sDLL_FileFullPath     - [in] full path to the Chilkat ActiveX DLL file.
;                  $sComment              - [in] diagnostic comment used in console/log output.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_ConsoleWrite_IFNC, __Chilkat_LogOnError
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_StartUp($sDLL_FileFullPath, $sComment)
	__Chilkat_ConsoleWrite_IFNC($sComment & ' > ' & @ScriptLineNumber & ': $sDLL_FileFullPath = ' & $sDLL_FileFullPath)
	If Not FileExists($sDLL_FileFullPath) Then
		__Chilkat_ConsoleWrite_IFNC($sComment & ' > ' & @ScriptLineNumber)
		SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1)
		__Chilkat_LogOnError($sComment & ' > ' & @ScriptLineNumber & ': DLL File not exist:' & $sDLL_FileFullPath)
		Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	If $__g_hDll_CHILKAT = 0 Then $__g_hDll_CHILKAT = DllOpen($sDLL_FileFullPath)
	If @error Or $__g_hDll_CHILKAT = -1 Then
		__Chilkat_ConsoleWrite_IFNC($sComment & ' > ' & @ScriptLineNumber)
		$__g_hDll_CHILKAT = 0

		SetError($CHILKAT_ERR_GENERAL, $CHILKAT_EXT_PARAM1)
		__Chilkat_LogOnError($sComment & ' > ' & @ScriptLineNumber & ': DLL open error.' & $sDLL_FileFullPath)
		Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	__Chilkat_ConsoleWrite_IFNC($sComment & ' > ' & @ScriptLineNumber & ': $__g_hDll_CHILKAT = ' & $__g_hDll_CHILKAT)
	__Chilkat_ConsoleWrite_IFNC($sComment & ' > ' & @ScriptLineNumber & ': VarGetType($__g_hDll_CHILKAT) = ' & VarGetType($__g_hDll_CHILKAT))
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_StartUp

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_UnlockComponent
; Description ...: Unlocks a single Chilkat component object by using the supplied unlock code.
; Syntax ........: _Chilkat_UnlockComponent($oChilkat, $sUnlockCode)
; Parameters ....: $oChilkat              - [in] Chilkat component object to unlock.
;                  $sUnlockCode           - [in] Chilkat unlock code.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_IsValidObject, __Chilkat_LogOnError
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_UnlockComponent($oChilkat, $sUnlockCode)
	__Chilkat_IsValidObject($oChilkat)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oChilkat.UnlockComponent($sUnlockCode)
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError('Chilkat.UnlockComponent() ' & ObjName($oChilkat, $OBJ_PROGID), $oChilkat)
		Return SetError($CHILKAT_ERR_UNLOCK, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	#cs
		http://cknotes.com/unlockcomponent-returns-false0/
		https://www.chilkatsoft.com/p/p_402.asp
		http://cknotes.com/unlockcomponent-lasterrortext-shows-exact-string-passed-to-it/
		http://cknotes.com/verify-unlockcomponent-success-w-permanent-unlock-code/
	#ce
EndFunc   ;==>_Chilkat_UnlockComponent

#EndRegion - Chilkat.au3 - Function - INIT

#Region - Chilkat.au3 - Function - ObjCreate Core

Func __Chilkat_ObjCreate_ByProgIdSuffix($sClassName)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Fake_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sClassName) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	$sClassName = StringStripWS($sClassName, $STR_STRIPLEADING + $STR_STRIPTRAILING)
	If $sClassName = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $aProgID[2] = ["Chilkat." & $sClassName, "Chilkat_9_5_0." & $sClassName]
	Local $oObject = 0
	For $iProgID_idx = 0 To UBound($aProgID) - 1
		$__g_sChilkat_LastCOMError = ''
		$oObject = ObjCreate($aProgID[$iProgID_idx])
		If Not @error And IsObj($oObject) Then
			__Chilkat_Log('ObjCreate: ' & $aProgID[$iProgID_idx])
			If Not @Compiled Then _Chilkat_ObjName_FlagsValue($oObject, @ScriptLineNumber)
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
		EndIf
	Next

	$oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler
	__Chilkat_LogOnError('ObjCreate by ProgID suffix failed: ' & $sClassName, Null, $CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_PARAM1)
	Return SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
EndFunc   ;==>__Chilkat_ObjCreate_ByProgIdSuffix

Func __Chilkat_ObjCreate_Wrapper($iChilkatObjectName_IDX)
	; Try to use registered ActiveX object
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Fake_COM_ERROR_HANDLER__for_Chilkat)
	If $__g_iChilkat_DLLVersion = -1 Then
		If Not @Compiled Then
			ConsoleWrite($__g_iChilkat_DLLVersion & @CRLF)
			ConsoleWrite($iChilkatObjectName_IDX & @CRLF)
			ConsoleWrite($CHILKATOBJ_ID_CLSID & @CRLF)
		EndIf
		MsgBox($MB_TOPMOST, "Information", "CHILKAT NOT INITIALIZED YET")
		Return SetError($CHILKAT_ERR_GENERAL, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oObject = ObjCreate($CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_CLSID])
	If Not @error Then ; if registered
		__Chilkat_Log('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_PROGID])
		__Chilkat_ConsoleWrite_IFNC("")
		__Chilkat_ConsoleWrite_IFNC("")
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " CREATING OBJECT via registered ProgID")
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " PROGID=" & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_PROGID])
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " IsObj=" & IsObj($oObject))
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " VarType=" & VarGetType($oObject))
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " IDX=" & $iChilkatObjectName_IDX & ' > Using registered ActiveX component NAME=' & ObjName($oObject, $OBJ_NAME) & ' located: ' & ObjName($oObject, $OBJ_FILE))
		; Some Chilkat ActiveX objects, for example Chilkat.BinData.10, do not expose the Version property.
		; In that case the debug-only Version lookup may set
		; @error=-2147352570 (DISP_E_UNKNOWNNAME) even though ObjCreate() succeeded.
		; The fake COM error handler suppresses the COM interruption, so clear @error after this optional debug output to preserve the successful object creation state.
		If Not @Compiled And IsObj($oObject) Then
			__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " Object Version=" & $oObject.Version)
			SetError(0, @extended)
			_Chilkat_ObjName_FlagsValue($oObject, @ScriptLineNumber)
		EndIf
	Else ; if not Registered then try "Attach on the fly" to file (DLL / OCX)
		$oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
		#forceref $oErrorHandler

		If $__g_iChilkat_DLLVersion = $CHILKAT_RET_FAILURE Then
			__Chilkat_Log('DLL Version is not set.')
			Return SetError($CHILKAT_ERR_DLLVERSIONNOTSET, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
		EndIf

		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " ATTACHING to DLL file")
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' CLSID: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_CLSID])
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' IID: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_IID])
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' VarGetType($__g_hDll_CHILKAT): ' & VarGetType($__g_hDll_CHILKAT))
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' $__g_hDll_CHILKAT: ' & $__g_hDll_CHILKAT)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' DLL FILE: ' & $__g_hDll_CHILKAT)

		; https://www.autoitscript.com/forum/topic/149405-using-a-com-property-out-of-not-registered-dll/#comment-1064413
		; Registration-Free COM / SxS object creation path.
		; The object is created directly from the loaded Chilkat ActiveX DLL by using CLSID, IID and the DLL handle stored in $__g_hDll_CHILKAT.
		; This path does not require the Chilkat ActiveX ProgID to be registered in the Windows registry.
		$oObject = ObjCreate( _
				$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_CLSID], _
				$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_IID], _
				$__g_hDll_CHILKAT)

		; Some Chilkat ActiveX objects, for example Chilkat.BinData.10, do not expose the Version property.
		; In that case the debug-only Version lookup may set
		; @error=-2147352570 (DISP_E_UNKNOWNNAME) even though ObjCreate() succeeded.
		; The fake COM error handler suppresses the COM interruption, so clear @error after this optional debug output to preserve the successful object creation state.
		If Not @Compiled And IsObj($oObject) Then
			__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " Object Version=" & $oObject.Version)
			SetError(0, @extended)
			_Chilkat_ObjName_FlagsValue($oObject, @ScriptLineNumber)
		EndIf
	EndIf
	If Not @Compiled Then __Chilkat_Log('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_PROGID])

;~ 	MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, @ScriptLineNumber, @error & @CRLF & IsObj($oObject)& @CRLF & ObjName($oObject))
	If @error Then
		If Not @Compiled Then __Chilkat_LogOnError('ObjCreate: ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_PROGID])
		Return SetError($CHILKAT_ERR_OBJECTCREATE, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
	EndIf
	If IsObj($oObject) Then __Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " Object Version=" & $oObject.Version)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oObject)
EndFunc   ;==>__Chilkat_ObjCreate_Wrapper

#EndRegion - Chilkat.au3 - Function - ObjCreate Core

#Region - Chilkat.au3 - Chilkat object-specific functions

#Region ; _Chilkat_GLOBAL_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GLOBAL_ObjCreate
; Description ...: Creates and initializes a Chilkat Global object and selected global options.
; Syntax ........: _Chilkat_GLOBAL_ObjCreate($iVerboseLogging = 0, $iVerboseTls = 0, $iDefaultUtf8 = 1, $iDefaultNtlmVersion = 2, $sAnsiCodePage = Default)
; Parameters ....: $iVerboseLogging       - [in] an integer value. Default is 0.
;                  $iVerboseTls           - [in] an integer value. Default is 0.
;                  $iDefaultUtf8          - [in] an integer value. Default is 1.
;                  $iDefaultNtlmVersion   - [in] an integer value. Default is 2.
;                  $sAnsiCodePage         - [in] a string value. Default is Default.
; Return values .: Success: Chilkat Global object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Global object was introduced in version 9.5.0.49.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper, __Chilkat_LogOnError, _Chilkat_IsAtLeastThisVersion
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatGlobalRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GLOBAL_ObjCreate($iVerboseLogging = 0, $iVerboseTls = 0, $iDefaultUtf8 = 1, $iDefaultNtlmVersion = 2, $sAnsiCodePage = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_GLOBAL)
	If @error Then Return SetError(@error, @extended, $oObject)

	Local $iErrProtect = @error, $iExtProtect = @extended
	__Chilkat_LogOnError(@ScriptLineNumber & ' VarType=' & VarGetType($oObject))

	SetError($iErrProtect, $iExtProtect)
	__Chilkat_LogOnError(@ScriptLineNumber & ' Using DllFile=' & ObjName($oObject, $OBJ_FILE))

	SetError($iErrProtect, $iExtProtect)
	__Chilkat_LogOnError(@ScriptLineNumber & ' GLOGAL.version=' & $oObject.version)

	$__g_oChilkat_GLOBAL = $oObject
	$__g_oChilkat_GLOBAL.VerboseLogging = $iVerboseLogging
	If _Chilkat_IsAtLeastThisVersion('9.5.0.78', "$__g_oChilkat_GLOBAL.VerboseTls") Then $__g_oChilkat_GLOBAL.VerboseTls = $iVerboseTls
	$__g_oChilkat_GLOBAL.DefaultUtf8 = $iDefaultUtf8
	$__g_oChilkat_GLOBAL.DefaultNtlmVersion = $iDefaultNtlmVersion
	If IsString($sAnsiCodePage) Then _
			$__g_oChilkat_GLOBAL.AnsiCodePage = $sAnsiCodePage
	Return SetError(@error, @extended, $__g_oChilkat_GLOBAL)
EndFunc   ;==>_Chilkat_GLOBAL_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GLOBAL_UnlockBundle
; Description ...: Unlocks the Chilkat bundle by using a Chilkat Global object.
; Syntax ........: _Chilkat_GLOBAL_UnlockBundle(ByRef $oGLOBAL, $sUnlockCode)
; Parameters ....: $oGLOBAL               - [in/out] Chilkat Global object to unlock.
;                  $sUnlockCode           - [in] Chilkat unlock code.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_LogOnError
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GLOBAL_UnlockBundle(ByRef $oGLOBAL, $sUnlockCode)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $iSuccess = $oGLOBAL.UnlockBundle($sUnlockCode)
	If $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError('GLOBAL.UnlockBundle() ' & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$CHILKATOBJ_NAME_GLOBAL][$CHILKATOBJ_ID_PROGID], $oGLOBAL)
		Return SetError($CHILKAT_ERR_UNLOCK, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_GLOBAL_UnlockBundle

#EndRegion ; _Chilkat_GLOBAL_**

#Region ; _Chilkat_ATOM_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ATOM_ObjCreate
; Description ...: Creates a Chilkat Atom COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ATOM_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Atom object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAtomRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_ATOM_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatAtomRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ATOM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ATOM_ObjCreate

#EndRegion ; _Chilkat_ATOM_**

#Region ; _Chilkat_BINDATA_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_BINDATA_ObjCreate
; Description ...: Creates a Chilkat BinData COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_BINDATA_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat BinData object was introduced in version 9.5.0.51.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatBinDataRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_BINDATA_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_BINDATA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_BINDATA_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_BINDATA_FromBinary
; Description ...: Creates a Chilkat BinData object from an AutoIt binary Variant.
; Syntax ........: _Chilkat_BINDATA_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData           - [in/out] AutoIt binary Variant or COM byte-array Variant.
; Return values .: Success: Chilkat BinData object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses BinData.AppendBinary(). Useful as the first step in Binary -> Object workflows.
; Related .......: _Chilkat_BINDATA_ToBinary, _Chilkat_BINDATA_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatBinDataRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_BINDATA_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oBinData.AppendBinary($dBinaryData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_BINDATA_FromBinary() BinData.AppendBinary()', $oBinData, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oBinData)
EndFunc   ;==>_Chilkat_BINDATA_FromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_BINDATA_ToBinary
; Description ...: Returns the bytes stored in a Chilkat BinData object as an AutoIt binary Variant.
; Syntax ........: _Chilkat_BINDATA_ToBinary(ByRef $oBinData)
; Parameters ....: $oBinData              - [in/out] Chilkat BinData object.
; Return values .: Success: binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses BinData.GetBinary(). Useful as the last step in Object -> Binary workflows.
; Related .......: _Chilkat_BINDATA_FromBinary, _Chilkat_BINDATA_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatBinDataRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_BINDATA_ToBinary(ByRef $oBinData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oBinData) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $dBinaryData = $oBinData.GetBinary()
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $dBinaryData)
EndFunc   ;==>_Chilkat_BINDATA_ToBinary

#EndRegion ; _Chilkat_BINDATA_**

#Region ; _Chilkat_TASK_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_TASK_ObjCreate
; Description ...: Creates a Chilkat Task COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_TASK_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Task object was introduced in version 9.5.0.52.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatTaskRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_TASK_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TASK)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_TASK_ObjCreate

#EndRegion ; _Chilkat_TASK_**

#Region ; _Chilkat_TASKCHAIN_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_TASKCHAIN_ObjCreate
; Description ...: Creates a Chilkat TaskChain COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_TASKCHAIN_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat TaskChain object was introduced in version 9.5.0.52.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatTaskChainRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_TASKCHAIN_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TASKCHAIN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_TASKCHAIN_ObjCreate

#EndRegion ; _Chilkat_TASKCHAIN_**

#Region ; _Chilkat_StringTable_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_StringTable_ObjCreate
; Description ...: Creates a Chilkat StringTable COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_StringTable_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat StringTable object was introduced in version 9.5.0.62.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatStringTableRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_StringTable_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STRINGTABLE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_StringTable_ObjCreate

#EndRegion ; _Chilkat_StringTable_**

#Region ; _Chilkat_AuthUtil_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthUtil_ObjCreate
; Description ...: Creates a Chilkat AuthUtil COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthUtil_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthUtil object was introduced in version 9.5.0.67.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthUtilRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthUtil_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHUTIL)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthUtil_ObjCreate

#EndRegion ; _Chilkat_AuthUtil_**

#Region ; _Chilkat_Cache_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cache_ObjCreate
; Description ...: Creates a Chilkat Cache COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Cache_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Cache object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCacheRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cache_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CACHE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Cache_ObjCreate

#EndRegion ; _Chilkat_Cache_**

#Region ; _Chilkat_Cgi_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cgi_ObjCreate
; Description ...: Creates a Chilkat Cgi COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Cgi_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Cgi object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCgiRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cgi_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CGI)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Cgi_ObjCreate

#EndRegion ; _Chilkat_Cgi_**

#Region ; _Chilkat_Charset_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Charset_ObjCreate
; Description ...: Creates a Chilkat Charset COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Charset_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Charset object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCharsetRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Charset_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CHARSET)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Charset_ObjCreate

#EndRegion ; _Chilkat_Charset_**

#Region ; _Chilkat_CkDateTime_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CkDateTime_ObjCreate
; Description ...: Creates a Chilkat CkDateTime COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CkDateTime_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat CkDateTime object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCkDateTimeRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_CkDateTime_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CKDATETIME)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CkDateTime_ObjCreate

#EndRegion ; _Chilkat_CkDateTime_**

#Region ; _Chilkat_CreateCS_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CreateCS_ObjCreate
; Description ...: Creates a Chilkat CreateCS COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CreateCS_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat CreateCS object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCreateCSRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_CreateCS_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CREATECS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CreateCS_ObjCreate

#EndRegion ; _Chilkat_CreateCS_**

#Region ; _Chilkat_DirTree_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_DirTree_ObjCreate
; Description ...: Creates a Chilkat DirTree COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_DirTree_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat DirTree object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDirTreeRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_DirTree_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DIRTREE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_DirTree_ObjCreate

#EndRegion ; _Chilkat_DirTree_**

#Region ; _Chilkat_Dns_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Dns_ObjCreate
; Description ...: Creates a Chilkat Dns COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Dns_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Dns object was introduced in version 9.5.0.83.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDnsRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Dns_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DNS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Dns_ObjCreate

#EndRegion ; _Chilkat_Dns_**

#Region ; _Chilkat_DtObj_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_DtObj_ObjCreate
; Description ...: Creates a Chilkat DtObj COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_DtObj_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat DtObj object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDtObjRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_DtObj_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DTOBJ)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_DtObj_ObjCreate

#EndRegion ; _Chilkat_DtObj_**

#Region ; _Chilkat_FileAccess_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FileAccess_ObjCreate
; Description ...: Creates a Chilkat FileAccess COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_FileAccess_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat FileAccess object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFileAccessRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FileAccess_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_FILEACCESS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_FileAccess_ObjCreate

#EndRegion ; _Chilkat_FileAccess_**

#Region ; _Chilkat_Hashtable_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Hashtable_ObjCreate
; Description ...: Creates a Chilkat Hashtable COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Hashtable_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Hashtable object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHashtableRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Hashtable_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HASHTABLE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Hashtable_ObjCreate

#EndRegion ; _Chilkat_Hashtable_**

#Region ; _Chilkat_Log_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Log_ObjCreate
; Description ...: Creates a Chilkat Log COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Log_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Log object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatLogRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Log_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_LOG)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Log_ObjCreate

#EndRegion ; _Chilkat_Log_**

#Region ; _Chilkat_Rss_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Rss_ObjCreate
; Description ...: Creates a Chilkat Rss COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Rss_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Rss object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatRssRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Rss_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_RSS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Rss_ObjCreate

#EndRegion ; _Chilkat_Rss_**

#Region ; _Chilkat_ServerSentEvent_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ServerSentEvent_ObjCreate
; Description ...: Creates a Chilkat ServerSentEvent COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ServerSentEvent_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat ServerSentEvent object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatServerSentEventRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ServerSentEvent_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SERVERSENTEVENT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ServerSentEvent_ObjCreate

#EndRegion ; _Chilkat_ServerSentEvent_**

#Region ; _Chilkat_StringArray_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_StringArray_ObjCreate
; Description ...: Creates a Chilkat StringArray COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_StringArray_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat StringArray object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatStringArrayRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_StringArray_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STRINGARRAY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_StringArray_ObjCreate

#EndRegion ; _Chilkat_StringArray_**

#Region ; _Chilkat_Url_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Url_ObjCreate
; Description ...: Creates a Chilkat Url COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Url_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Url object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatUrlRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Url_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_URL)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Url_ObjCreate

#EndRegion ; _Chilkat_Url_**

#Region ; _Chilkat_Xmp_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Xmp_ObjCreate
; Description ...: Creates a Chilkat Xmp COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Xmp_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Xmp object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmpRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Xmp_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_XMP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Xmp_ObjCreate

#EndRegion ; _Chilkat_Xmp_**

#Region ; _Chilkat_Secrets_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Secrets_ObjCreate
; Description ...: Creates a Chilkat Secrets COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Secrets_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Secrets object was introduced in version 10.1.0.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSecretsRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Secrets_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SECRETS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Secrets_ObjCreate

#EndRegion ; _Chilkat_Secrets_**

#EndRegion - Chilkat.au3 - Chilkat object-specific functions

#Region - Chilkat.au3 - Function - Misc

Func __Chilkat_IsValidObject($oObject)
	If Not IsObj($oObject) Then
		__Chilkat_Log('IsNotObject:   VarGetType = ' & VarGetType($oObject))
		Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	If StringRegExp(ObjName($oObject, $OBJ_PROGID), '(?i)(Chilkat_\d+_\d+_\d+\..+)', 1) Then
		__Chilkat_Log('IsNotValid Chilkat Object: ' & ObjName($oObject, $OBJ_PROGID))
		Return SetError($CHILKAT_ERR_ISNOTCHILKAT, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_IsValidObject

Func __Chilkat_Log($sText, $iError = @error, $iExtended = @extended)
	_Chilkat_LogWrapper($sText & @CRLF)
	Return SetError($iError, $iExtended)
EndFunc   ;==>__Chilkat_Log

Func __Chilkat_LogOnError($sText, $oLastError = Null, $iError = @error, $iExtended = @extended)
	If $iError = 0 Then Return SetError($iError, $iExtended)

	Local $fnFunction = _Chilkat_ErrorLogWrapper()
	If FuncName($fnFunction) = FuncName(ConsoleWrite) Then
		If @Compiled Then Return SetError($iError, $iExtended) ; GDPR do not send messages to console on compiled code
		$sText &= ((@Compiled) ? ('') : (' :IFNC: Chilkat.au3'))
	EndIf

	If IsFunc($fnFunction) Then $fnFunction('! @error=' & $iError & ' @extended=' & $iExtended & ' : ' & $sText & @CRLF & (IsObj($oLastError) ? ($oLastError.LastErrorText & @CRLF) : ('')))
	Return SetError($iError, $iExtended)
EndFunc   ;==>__Chilkat_LogOnError

Func __Chilkat_ConsoleWrite_IFNC($sData, $iError = @error, $iExtended = @extended)
	If Not @Compiled Then ConsoleWrite('- IFNC: Chilkat.au3 ' & $sData & @CRLF)
	Return SetError($iError, $iExtended)
EndFunc   ;==>__Chilkat_ConsoleWrite_IFNC

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ObjName_FlagsValue
; Description ...: Builds and logs diagnostic ObjName information for an AutoIt object.
; Syntax ........: _Chilkat_ObjName_FlagsValue(ByRef $oObj, $sComment = @ScriptLineNumber, $iError = @error, $iExtended = @extended)
; Parameters ....: $oObj                  - [in/out] object passed to ObjName diagnostics.
;                  $sComment              - [in] diagnostic comment used in console/log output. Default is @ScriptLineNumber.
;                  $iError                - [in] @error value to preserve/restore. Default is @error.
;                  $iExtended             - [in] @extended value to preserve/restore. Default is @extended.
; Return values .: Success: diagnostic text. Preserves supplied @error/@extended values.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_Log
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_ObjName_FlagsValue(ByRef $oObj, $sComment = @ScriptLineNumber, $iError = @error, $iExtended = @extended)
	Local $sInfo = ''
	If Not IsObj($oObj) Then
		$sInfo &= 'Parameter - is not Object' & @CRLF
	ElseIf VarGetType($oObj) <> 'Object' Then
		$sInfo &= 'Parameter type - is not Object type' & @CRLF
	Else
		$sInfo &= '+>' & @TAB & 'ObjName($oObj,1) {The name of the Object} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_NAME)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

		; HELPFILE REMARKS: Not all Objects support flags 2 to 7. Always test for @error in these cases.
		$sInfo &= '+>' & @TAB & 'ObjName($oObj,2) {Description string of the Object} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_STRING)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

		$sInfo &= '+>' & @TAB & 'ObjName($oObj,3) {The ProgID of the Object} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_PROGID)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

		$sInfo &= '+>' & @TAB & 'ObjName($oObj,4) {The file that is associated with the object in the Registry} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_FILE)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

		$sInfo &= '+>' & @TAB & 'ObjName($oObj,5) {Module name in which the object runs (WIN XP And above). Marshaller for non-inproc objects.} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_MODULE)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

		$sInfo &= '+>' & @TAB & 'ObjName($oObj,6) {CLSID of the object''s coclass} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_CLSID)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

		$sInfo &= '+>' & @TAB & 'ObjName($oObj,7) {IID of the object''s interface} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_IID)
		If @error Then $sInfo &= '@error = ' & @error
		$sInfo &= @CRLF

	EndIf
	$sInfo = $sComment & ' _Chilkat_ObjName_FlagsValue' & @CRLF & $sInfo & @CRLF
	__Chilkat_Log($sInfo)
	Return SetError($iError, $iExtended, $sInfo)
EndFunc   ;==>_Chilkat_ObjName_FlagsValue

Func __Fake_COM_ERROR_HANDLER__for_Chilkat(ByRef $oError) ; User's COM error function. Will be called if COM error occurs
	; Do anything here.
	#forceref $oError
EndFunc   ;==>__Fake_COM_ERROR_HANDLER__for_Chilkat

Func __Internal_COM_ERROR_HANDLER__for_Chilkat(ByRef $oError) ; User's COM error function. Will be called if COM error occurs
	; Do anything here.

	$__g_sChilkat_LastCOMError = _
			@ScriptLineNumber & ' ' & @ScriptName & " (" & $oError.scriptline & ") : ==> COM Error intercepted from Chilkat object!" & @CRLF & _
			@TAB & "err.number is: " & @TAB & @TAB & "0x" & Hex($oError.number) & @CRLF & _
			@TAB & "err.windescription:" & @TAB & $oError.windescription & @CRLF & _
			@TAB & "err.description is: " & @TAB & $oError.description & @CRLF & _
			@TAB & "err.source is: " & @TAB & @TAB & $oError.source & @CRLF & _
			@TAB & "err.helpfile is: " & @TAB & $oError.helpfile & @CRLF & _
			@TAB & "err.helpcontext is: " & @TAB & $oError.helpcontext & @CRLF & _
			@TAB & "err.lastdllerror is: " & @TAB & $oError.lastdllerror & @CRLF & _
			@TAB & "err.scriptline is: " & @TAB & $oError.scriptline & @CRLF & _
			@TAB & "err.retcode is: " & @TAB & "0x" & Hex($oError.retcode) & @CRLF & _
			@CRLF

	__Chilkat_Log($__g_sChilkat_LastCOMError)
EndFunc   ;==>__Internal_COM_ERROR_HANDLER__for_Chilkat

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ErrorLogWrapper
; Description ...: Gets or sets the legacy error-log callback wrapper.
; Syntax ........: _Chilkat_ErrorLogWrapper($fnFunction = Default, $iError = @error, $iExtended = @extended)
; Parameters ....: $fnFunction            - [in] logging callback function; Default returns the current callback.
;                  $iError                - [in] @error value to preserve/restore. Default is @error.
;                  $iExtended             - [in] @extended value to preserve/restore. Default is @extended.
; Return values .: Success: current or new error-log callback.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......:
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_ErrorLogWrapper($fnFunction = Default, $iError = @error, $iExtended = @extended)
	Local Static $fnFunction_static = ConsoleWrite
	If $fnFunction = Default Then Return SetError($iError, $iExtended, $fnFunction_static)
	If $fnFunction = Null And Not IsFunc($fnFunction) Then Return SetError(1)

	$fnFunction_static = $fnFunction
	Return SetError($iError, $iExtended, $fnFunction_static)
EndFunc   ;==>_Chilkat_ErrorLogWrapper

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GetVersion
; Description ...: Returns the loaded Chilkat library version string.
; Syntax ........: _Chilkat_GetVersion()
; Parameters ....: None
; Return values .: Success: Chilkat version string. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_ConsoleWrite_IFNC
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_GetVersion()
	__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' VERSION: ' & $__g_oChilkat_GLOBAL.Version & ' :: TYPE :: ' & VarGetType($__g_oChilkat_GLOBAL))

	If IsObj($__g_oChilkat_GLOBAL) And VarGetType($__g_oChilkat_GLOBAL) = 'Object' Then _
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $__g_oChilkat_GLOBAL.Version)

	Return SetError($CHILKAT_ERR_GENERAL, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
EndFunc   ;==>_Chilkat_GetVersion

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_IsAtLeastThisVersion
; Description ...: Checks whether the loaded Chilkat version is at least the requested version.
; Syntax ........: _Chilkat_IsAtLeastThisVersion($sRequiredVersion)
; Parameters ....: $sRequiredVersion - [in] version string to compare with the loaded Chilkat version.
; Return values .: Success: True if the loaded Chilkat version is high enough; otherwise False. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_ConsoleWrite_IFNC, _Chilkat_GetVersion, __Chilkat_Log
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_IsAtLeastThisVersion($sRequiredVersion, $_Comment)
;~ https://www.autoitscript.com/forum/topic/166640-how-to-format-the-output-of-the-autoitversion-macro/?do=findComment&comment=1218031
	Local Static $b_IsRequiredVersion = Default
	Local Static $sRequiredVersion_Last_static = Default

	If Not IsString($sRequiredVersion) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, False)
	$sRequiredVersion = StringStripWS($sRequiredVersion, $STR_STRIPLEADING + $STR_STRIPTRAILING)
	If $sRequiredVersion = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, False)

	__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)
	If $b_IsRequiredVersion = Default Or $sRequiredVersion_Last_static <> $sRequiredVersion Then
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)
		$sRequiredVersion_Last_static = $sRequiredVersion
		Local $sChilkatVersion = _Chilkat_GetVersion()
		If @error Then Return SetError(@error, @extended, False)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)

		Local $aChilkatVersion = StringSplit($sChilkatVersion, '.', $STR_NOCOUNT)
		If @error Or Not UBound($aChilkatVersion) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, False)
		Local $iChilkatVersionPartCount = UBound($aChilkatVersion)
		If $iChilkatVersionPartCount < 4 Then
			ReDim $aChilkatVersion[4]
			For $iVersionPart = $iChilkatVersionPartCount To 3
				$aChilkatVersion[$iVersionPart] = 0
			Next
		EndIf

		Local $aVersionNumberToCompare = StringSplit($sRequiredVersion, '.', $STR_NOCOUNT)
		If @error Or Not UBound($aVersionNumberToCompare) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, False)
		Local $iRequiredVersionPartCount = UBound($aVersionNumberToCompare)
		If $iRequiredVersionPartCount < 4 Then
			ReDim $aVersionNumberToCompare[4]
			For $iVersionPart = $iRequiredVersionPartCount To 3
				$aVersionNumberToCompare[$iVersionPart] = 0
			Next
		EndIf

		For $iVersionPart = 0 To 3
			If Not StringRegExp($aChilkatVersion[$iVersionPart], '^\d+$') Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, False)
			If Not StringRegExp($aVersionNumberToCompare[$iVersionPart], '^\d+$') Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, False)
		Next

		Local $iCurrentVersion = Number(StringFormat('%03i%03i%03i%03i', _
				$aChilkatVersion[0], $aChilkatVersion[1], $aChilkatVersion[2], $aChilkatVersion[3]))
		Local $iVersionNumberToCompare = Number(StringFormat('%03i%03i%03i%03i', _
				$aVersionNumberToCompare[0], $aVersionNumberToCompare[1], $aVersionNumberToCompare[2], $aVersionNumberToCompare[3]))

		$b_IsRequiredVersion = ($iCurrentVersion >= $iVersionNumberToCompare)
		__Chilkat_Log(@ScriptLineNumber & ' _Chilkat_IsAtLeastThisVersion("' & $sRequiredVersion & '", "' & $_Comment & '")   > COMPARE:    CURRENT>=REQUIRED (' & $iCurrentVersion & ' >= ' & $iVersionNumberToCompare & ')    RESULT: ' & $b_IsRequiredVersion)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $b_IsRequiredVersion)
EndFunc   ;==>_Chilkat_IsAtLeastThisVersion

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_LogWrapper
; Description ...: Gets or sets the active Chilkat log callback, or writes a string through it.
; Syntax ........: _Chilkat_LogWrapper($fnFunction_Or_String = Default, $iError = @error, $iExtended = @extended)
; Parameters ....: $fnFunction_Or_String  - [in] logging callback function or a string to log; Default returns the current callback.
;                  $iError                - [in] @error value to preserve/restore. Default is @error.
;                  $iExtended             - [in] @extended value to preserve/restore. Default is @extended.
; Return values .: Success: current or new log callback, or no explicit return when writing a string.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_LogWrapper($fnFunction_Or_String = Default, $iError = @error, $iExtended = @extended)
	Local Static $fnFunction_static = ConsoleWrite
	If $fnFunction_Or_String = Default Then Return $fnFunction_static
	If Not IsFunc($fnFunction_Or_String) Then
		$fnFunction_static( _
				(($iError Or $iExtended) ? ('[ ' & $iError & ' / ' & $iExtended & ' ] : ') : ('')) _
				& $fnFunction_Or_String _
				)
		Return
	EndIf

	$fnFunction_static = $fnFunction_Or_String
	Return $fnFunction_static
EndFunc   ;==>_Chilkat_LogWrapper

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ViewHTML
; Description ...: Displays an HTML string in an embedded Internet Explorer control.
; Syntax ........: _Chilkat_ViewHTML(ByRef $sHTML)
; Parameters ....: $sHTML                 - [in/out] HTML string to display.
; Return values .: None.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......:
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_ViewHTML(ByRef $sHTML)
	Local $oIE = _IECreateEmbedded()
	If @error Then MsgBox($MB_ICONERROR, '_IECreateEmbedded()', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

	Local $hGUI = GUICreate("Embedded Web control Test", 640, 580, _
			(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
			$WS_OVERLAPPEDWINDOW + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
	#forceref $hGUI
	Local $id_IE = GUICtrlCreateObj($oIE, 10, 40, 600, 360)
	#forceref $id_IE
	GUICtrlSetColor(-1, 0xff0000)

	GUISetState(@SW_SHOW) ;Show GUI

	_IEBodyWriteHTML($oIE, $sHTML)
;~ 	_IEDocWriteHTML($oIE, $sHTML)
	If @error Then MsgBox($MB_ICONERROR, '_IEBodyWriteHTML($oIE, $sHTML)', '@error = ' & @error & @CRLF & '@extended = ' & @extended)

	; Waiting for user to close the window
	While 1
		Local $iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				ExitLoop
		EndSelect
	WEnd

	GUIDelete()

EndFunc   ;==>_Chilkat_ViewHTML

Func __Chilkat_GetAndSaveFileToDisc_Progress($iProgress)
	__Chilkat_Log("Progres: " & $iProgress & "%")
EndFunc   ;==>__Chilkat_GetAndSaveFileToDisc_Progress

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GetAndSaveFileToDisc
; Description ...: Downloads binary data from an HTTP URL and saves it to a local file.
; Syntax ........: _Chilkat_GetAndSaveFileToDisc($sHTTP_Source, $sFileFullPath_LocalDest)
; Parameters ....: $sHTTP_Source          - [in] HTTP URL to download.
;                  $sFileFullPath_LocalDest - [in] local destination file path.
; Return values .: Success: no explicit return. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_HTTP_ObjCreate, __Chilkat_LogOnError, _Chilkat_BINDATA_ObjCreate, __Chilkat_Log
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_GetAndSaveFileToDisc($sHTTP_Source, $sFileFullPath_LocalDest)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/autoit/box_download_binary_to_memory.asp

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber)

	Local $iSuccess = $oHttp.DownloadBd($sHTTP_Source, $oBinData)
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' DownloadBD ', $oHttp)
		Return SetError(@error, @extended, $iSuccess)
	EndIf
	__Chilkat_Log(@ScriptLineNumber & " Downloaded into an object holding the binary data. Number of bytes: " & $oBinData.NumBytes)
	Local $hFileOpen = FileOpen($sFileFullPath_LocalDest, $FO_BINARY + $FO_OVERWRITE)
	FileWrite($hFileOpen, Binary("0x" & $oBinData.GetEncoded("hex")))
	FileClose($hFileOpen)
EndFunc   ;==>_Chilkat_GetAndSaveFileToDisc

Func __Chilkat_Array_CreateEmpty2D($iCols)
	Local $aEmpty[0][$iCols]
	Return $aEmpty
EndFunc   ;==>__Chilkat_Array_CreateEmpty2D

Func __Chilkat_Array_SetCertRow(ByRef $aCerts, $iRow, ByRef $oCert, $iIndex)
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_INDEX] = $iIndex
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SUBJECT_DN] = $oCert.SubjectDN
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_ISSUER_DN] = $oCert.IssuerDN
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SUBJECT_CN] = $oCert.SubjectCN
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_ISSUER_CN] = $oCert.IssuerCN
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SERIAL] = $oCert.SerialNumber
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SHA1] = $oCert.Sha1Thumbprint
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_HAS_PRIVATE_KEY] = $oCert.HasPrivateKey()
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_VALID_FROM] = $oCert.ValidFromStr
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_VALID_TO] = $oCert.ValidToStr
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_DATE_VALID_NOW] = _Chilkat_Cert_IsDateValidNow($oCert)
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_KEY_USAGE] = $oCert.IntendedKeyUsage
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_EXT_KEY_USAGE] = $oCert.ExtendedKeyUsage
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_QUALIFIED_TYPE] = _Chilkat_Cert_GetQualifiedType($oCert)
	$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_QUALIFIED_POLICY_OID] = _Chilkat_Cert_GetQualifiedPolicyOid($oCert)
EndFunc   ;==>__Chilkat_Array_SetCertRow

Func __Chilkat_NowCalcUtc()
	Local $tSystemTime = DllStructCreate('ushort Year;ushort Month;ushort DayOfWeek;ushort Day;ushort Hour;ushort Minute;ushort Second;ushort Milliseconds')
	Local $aRet = DllCall('kernel32.dll', 'none', 'GetSystemTime', 'struct*', $tSystemTime)
	If @error Or Not IsArray($aRet) Then Return StringFormat('%04d/%02d/%02d %02d:%02d:%02d', @YEAR, @MON, @MDAY, @HOUR, @MIN, @SEC)
	Return StringFormat('%04d/%02d/%02d %02d:%02d:%02d', DllStructGetData($tSystemTime, 'Year'), DllStructGetData($tSystemTime, 'Month'), DllStructGetData($tSystemTime, 'Day'), DllStructGetData($tSystemTime, 'Hour'), DllStructGetData($tSystemTime, 'Minute'), DllStructGetData($tSystemTime, 'Second'))
EndFunc   ;==>__Chilkat_NowCalcUtc

Func __Chilkat_Rfc822GmtToCalc($sRfc822)
	If Not IsString($sRfc822) Then Return ''
	Local $aMatch = StringRegExp(StringStripWS($sRfc822, 3), '(?i)^(?:[a-z]{3},\s*)?(\d{1,2})\s+([a-z]{3})\s+(\d{4})\s+(\d{1,2}):(\d{2}):(\d{2})', 1)
	If @error Or UBound($aMatch) < 6 Then Return ''
	Local $iMonth = __Chilkat_Rfc822MonthToNumber($aMatch[1])
	If $iMonth < 1 Then Return ''
	Return StringFormat('%04d/%02d/%02d %02d:%02d:%02d', Number($aMatch[2]), $iMonth, Number($aMatch[0]), Number($aMatch[3]), Number($aMatch[4]), Number($aMatch[5]))
EndFunc   ;==>__Chilkat_Rfc822GmtToCalc

Func __Chilkat_Rfc822MonthToNumber($sMonth)
	Switch StringLower($sMonth)
		Case 'jan'
			Return 1
		Case 'feb'
			Return 2
		Case 'mar'
			Return 3
		Case 'apr'
			Return 4
		Case 'may'
			Return 5
		Case 'jun'
			Return 6
		Case 'jul'
			Return 7
		Case 'aug'
			Return 8
		Case 'sep'
			Return 9
		Case 'oct'
			Return 10
		Case 'nov'
			Return 11
		Case 'dec'
			Return 12
	EndSwitch
	Return 0
EndFunc   ;==>__Chilkat_Rfc822MonthToNumber

Func __Chilkat_PathGetDir($sFileFullPath)
	Local $sDir = StringRegExpReplace($sFileFullPath, '[\\/][^\\/]*$', '')
	If $sDir = $sFileFullPath Then Return '.'
	If $sDir = '' Then Return '.'
	Return $sDir
EndFunc   ;==>__Chilkat_PathGetDir

Func __Chilkat_PathGetFileName($sFileFullPath)
	Return StringRegExpReplace($sFileFullPath, '^.*[\\/]', '')
EndFunc   ;==>__Chilkat_PathGetFileName

#EndRegion - Chilkat.au3 - Function - Misc
