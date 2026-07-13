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
; Date ..........: 2026/07/13
; Version .......: v0.3.0 BETA - Work in progress
; ================================================================================

; Release Notes .: See RELEASE_NOTES.md

#Region ; TODO LIST
#TODO https://www.example-code.com/autoit/socket_nist_time_server.asp
#TODO https://www.example-code.com/autoit/scard.asp
#TODO https://www.example-code.com/autoit/pdf_signatures.asp
#TODO https://www.example-code.com/autoit/pkcs11.asp
#TODO https://www.example-code.com/autoit/cert.asp
#TODO Cert: Added the SmartcardFailReason property to provide the ability to know the main reason the LoadFromSmartcard method failed.
#TODO CertStore: Improved functionality for smart cards and USB tokens. Also extended to better support the Apple Keychain.
#TODO CertStore: Added the following methods: FindCert, GetCert, LoadPfxBd.
#TODO https://www.example-code.com/xojo/pcsc_list_readers.asp
#TODO https://www.example-code.com/chilkat2-python/authenticode_sign_using_yubikey.asp
#TODO https://stackoverflow.com/questions/67173206/chilkat-codesigning
#TODO https://www.example-code.com/autoit/code_sign_sectigo_usb_token.asp
#TODO https://www.example-code.com/autoit/authenticode_sign_using_yubikey.asp
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

Global Const $CHILKAT_FTP2_LIST_COL_INDEX = 0
Global Const $CHILKAT_FTP2_LIST_COL_NAME = 1
Global Const $CHILKAT_FTP2_LIST_COL_ISDIR = 2
Global Const $CHILKAT_FTP2_LIST_COL_SIZE = 3
Global Const $CHILKAT_FTP2_LIST_COL_MODIFIED = 4
Global Const $CHILKAT_FTP2_LIST_COL_CREATED = 5
Global Const $CHILKAT_FTP2_LIST_COL_OWNER = 6
Global Const $CHILKAT_FTP2_LIST_COL_GROUP = 7
Global Const $CHILKAT_FTP2_LIST_COL_PATH = 8
Global Const $CHILKAT_FTP2_LIST_COL_RELPATH = 9
Global Const $CHILKAT_FTP2_LIST_COL_TYPE = 10
Global Const $CHILKAT_FTP2_LIST_COL_ISLINK = 11
Global Const $CHILKAT_FTP2_LIST_COL_LEVEL = 12
Global Const $CHILKAT_FTP2_LIST_COL_COUNT = 13

Global Const $CHILKAT_FTP2_LIST_RETURN_FILES = 1
Global Const $CHILKAT_FTP2_LIST_RETURN_DIRS = 2
Global Const $CHILKAT_FTP2_LIST_RETURN_FILESFOLDERS = 3
Global Const $CHILKAT_FTP2_LIST_RETURN_LINKS = 4
Global Const $CHILKAT_FTP2_LIST_RETURN_ALL = 7

Global Const $CHILKAT_FTP2_LIST_RECUR_NORECUR = 0
Global Const $CHILKAT_FTP2_LIST_RECUR_RECUR = 1

Global Const $CHILKAT_FTP2_LIST_SORT_NOSORT = 0
Global Const $CHILKAT_FTP2_LIST_SORT_ASC = 1
Global Const $CHILKAT_FTP2_LIST_SORT_DESC = 2

Global Const $CHILKAT_FTP2_LIST_RELPATH = 0
Global Const $CHILKAT_FTP2_LIST_FULLPATH = 1

Global Const $CHILKAT_FTP2_ITEM_TYPE_FILE = 'FILE'
Global Const $CHILKAT_FTP2_ITEM_TYPE_DIR = 'DIR'
Global Const $CHILKAT_FTP2_ITEM_TYPE_LINK = 'LINK'

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

#Region ; _Chilkat_CSV_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CSV_ObjCreate
; Description ...: Creates a Chilkat Csv COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CSV_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Csv object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCsvRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CSV_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CSV)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CSV_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CSV_StringToArray
; Description ...: Parses CSV text with Chilkat CSV and returns a two-dimensional AutoIt array.
; Syntax ........: _Chilkat_CSV_StringToArray(ByRef $sCSVContent, $sDelimeter = @TAB, $iHasColumnNames = 1, $fnShowProgress = Default, $bEnableQuotes = 0)
; Parameters ....: $sCSVContent           - [in/out] CSV content string to parse.
;                  $sDelimeter            - [in] CSV delimiter character or string. Default is @TAB.
;                  $iHasColumnNames       - [in] flag indicating whether the first row contains column names. Default is 1.
;                  $fnShowProgress        - [in] optional progress callback called while rows are parsed. Default is Default.
;                  $bEnableQuotes         - [in] flag passed to Chilkat CSV EnableQuotes. Default is 0.
; Return values .: Success: two-dimensional array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI - Returned array row 0 contains column names; data rows start at row 1.
; Related .......: _Chilkat_CSV_ObjCreate, __Chilkat_LogOnError
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CSV_StringToArray(ByRef $sCSVContent, $sDelimeter = @TAB, $iHasColumnNames = 1, $fnShowProgress = Default, $bEnableQuotes = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oCSV = _Chilkat_CSV_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oCSV)

	;  Prior to loading the CSV file, indicate that the 1st row
	;  should be treated as column names:
	$oCSV.HasColumnNames = $iHasColumnNames
	__Chilkat_LogOnError(@ScriptLineNumber, $oCSV)
	$oCSV.Delimiter = $sDelimeter
	__Chilkat_LogOnError(@ScriptLineNumber, $oCSV)
	$oCSV.EnableQuotes = $bEnableQuotes
	__Chilkat_LogOnError(@ScriptLineNumber, $oCSV)

;~ 	If Not StringInStr($sDelimeter,'"') Then StringReplace($sCSVContent,'"','') ; @TODO temporary solution to fix bug which should be reported to chilkat

	; Load the $oCSV records from the file:
	Local $iSuccess = $oCSV.LoadFromString($sCSVContent)
	If @error Or ($iSuccess <> 1) Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber, $oCSV)
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
		If IsFunc($fnShowProgress) Then $fnShowProgress($iRow_idx + 1, $iNumRows)
		For $iCol_idx = 0 To $iNumColumns - 1
			$aResult[$iRow_idx + 1][$iCol_idx] = $oCSV.GetCell($iRow_idx, $iCol_idx)
		Next
	Next

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aResult)
EndFunc   ;==>_Chilkat_CSV_StringToArray
#EndRegion ; _Chilkat_CSV_**

#Region ; _Chilkat_JSON_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_JSON_ObjCreate
; Description ...: Creates a Chilkat JsonObject COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_JSON_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat JsonObject object was introduced in version 9.5.0.56.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatJsonObjectRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_JSON_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JSONOBJECT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_JSON_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_JSON_ObjFromString
; Description ...: Creates a Chilkat JsonObject and loads JSON text into it.
; Syntax ........: _Chilkat_JSON_ObjFromString(ByRef $sJSON_String, $iEmitCompact = 0, $iEmitCrLf = 1)
; Parameters ....: $sJSON_String          - [in/out] JSON string to load or format.
;                  $iEmitCompact          - [in] an integer value. Default is 0.
;                  $iEmitCrLf             - [in] an integer value. Default is 1.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_JSON_ObjCreate, __Chilkat_LogOnError
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_JSON_ObjFromString(ByRef $sJSON_String, $iEmitCompact = 0, $iEmitCrLf = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oJSON.Load($sJSON_String)
	If @error Or ($iSuccess <> 1) Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber, $oJSON)
		Return SetError($CHILKAT_ERR_LOAD, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	;  To pretty-print, set the EmitCompact property equal to 0
	$oJSON.EmitCompact = $iEmitCompact

	;  If bare-LF line endings are desired, turn off EmitCrLf
	;  Otherwise CRLF line endings are emitted.
	$oJSON.EmitCrLf = $iEmitCrLf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON)

EndFunc   ;==>_Chilkat_JSON_ObjFromString

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_JSON_ObjToString
; Description ...: Serializes a Chilkat JsonObject to a JSON string.
; Syntax ........: _Chilkat_JSON_ObjToString(ByRef $oJSON, $iEmitCompact = 0, $iEmitCrLf = 1)
; Parameters ....: $oJSON                 - [in/out] Chilkat JsonObject object.
;                  $iEmitCompact          - [in] an integer value. Default is 0.
;                  $iEmitCrLf             - [in] an integer value. Default is 1.
; Return values .: Success: JSON string. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......:
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_JSON_ObjToString(ByRef $oJSON, $iEmitCompact = 0, $iEmitCrLf = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oJSON) Then Return SetError(1) ; @TODO Error handling

	;  To pretty-print, set the EmitCompact property equal to 0
	$oJSON.EmitCompact = $iEmitCompact

	;  If bare-LF line endings are desired, turn off EmitCrLf
	;  Otherwise CRLF line endings are emitted.
	$oJSON.EmitCrLf = $iEmitCrLf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON.Emit())

EndFunc   ;==>_Chilkat_JSON_ObjToString

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_JSON_StringPretty
; Description ...: Returns a formatted JSON string from a JSON input string.
; Syntax ........: _Chilkat_JSON_StringPretty(ByRef $sJSON_String)
; Parameters ....: $sJSON_String          - [in/out] JSON string to load or format.
; Return values .: Success: formatted JSON string. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_JSON_ObjFromString
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_JSON_StringPretty(ByRef $sJSON_String)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oJSON = _Chilkat_JSON_ObjFromString($sJSON_String)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON.Emit())
EndFunc   ;==>_Chilkat_JSON_StringPretty
#EndRegion ; _Chilkat_JSON_**

#Region ; _Chilkat_XML_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XML_ObjCreate
; Description ...: Creates a Chilkat Xml COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_XML_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Xml object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XML_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_XML)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_XML_ObjCreate
#EndRegion ; _Chilkat_XML_**

#Region ; _Chilkat_SSHTunel_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SSHTunel_ObjCreate
; Description ...: Creates a Chilkat SshTunnel COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SSHTunel_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SshTunnel object was introduced in version 9.5.0.50.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSshTunnelRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SSHTunel_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSHTUNEL)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SSHTunel_ObjCreate
#EndRegion ; _Chilkat_SSHTunel_**

#Region ; _Chilkat_CKSTRING_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CKSTRING_ObjCreate
; Description ...: Creates a Chilkat CkString COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CKSTRING_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat CkString object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCkStringRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CKSTRING_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CKSTRING)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CKSTRING_ObjCreate
#EndRegion ; _Chilkat_CKSTRING_**

#Region ; _Chilkat_StringBuilder_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_StringBuilder_ObjCreate
; Description ...: Creates a Chilkat StringBuilder COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_StringBuilder_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat StringBuilder object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatStringBuilderRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_StringBuilder_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STRINGBUILDER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_StringBuilder_ObjCreate
#EndRegion ; _Chilkat_StringBuilder_**

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

#Region ; _Chilkat_SFTP_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SFTP_ObjCreate
; Description ...: Creates a Chilkat SFtp COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SFTP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SFtp object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSFtpRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SFTP_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTP_ObjCreate
#EndRegion ; _Chilkat_SFTP_**

#Region ; _Chilkat_SFTPDIR_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SFTPDIR_ObjCreate
; Description ...: Creates a Chilkat SFtpDir COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SFTPDIR_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SFtpDir object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSFtpDirRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SFTPDIR_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPDIRRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTPDIR)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTPDIR_ObjCreate
#EndRegion ; _Chilkat_SFTPDIR_**

#Region ; _Chilkat_SFTPFILE_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SFTPFILE_ObjCreate
; Description ...: Creates a Chilkat SFtpFile COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SFTPFILE_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SFtpFile object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSFtpFileRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SFTPFILE_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPFILERef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTPFILE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTPFILE_ObjCreate
#EndRegion ; _Chilkat_SFTPFILE_**

#Region ; _Chilkat_FTP2_**


Func __Chilkat_FTP2_ListDirectoryItems_AddCurrent(ByRef $oFTP, $iIndex, $sBaseDir, $sRelDir, $iReturn, $iReturnPath, ByRef $aList, ByRef $iRows, $iLevel)
	Local $sName = $oFTP.GetFilename($iIndex)
	If $sName = '.' Or $sName = '..' Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	Local $bIsDir = $oFTP.GetIsDirectory($iIndex)
	Local $bIsLink = $oFTP.GetIsSymbolicLink($iIndex)
	Local $sType = $CHILKAT_FTP2_ITEM_TYPE_FILE
	If $bIsLink Then
		$sType = $CHILKAT_FTP2_ITEM_TYPE_LINK
	ElseIf $bIsDir Then
		$sType = $CHILKAT_FTP2_ITEM_TYPE_DIR
	EndIf

	If Not __Chilkat_FTP2_ListDirectoryItems_ShouldReturn($sType, $iReturn) Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	Local $sRelPath = __Chilkat_FTP2_RemotePathJoin($sRelDir, $sName)
	Local $sFullPath = __Chilkat_FTP2_RemotePathJoin($sBaseDir, $sRelPath)
	Local $sPath = $sRelPath
	If $iReturnPath = $CHILKAT_FTP2_LIST_FULLPATH Then $sPath = $sFullPath

	ReDim $aList[$iRows + 1][$CHILKAT_FTP2_LIST_COL_COUNT]
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_INDEX] = $iRows
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_NAME] = $sName
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_ISDIR] = $bIsDir
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_SIZE] = $oFTP.GetSizeStr($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_MODIFIED] = $oFTP.GetLastModifiedTimeStr($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_CREATED] = $oFTP.GetCreateTimeStr($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_OWNER] = $oFTP.GetOwner($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_GROUP] = $oFTP.GetGroup($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_PATH] = $sPath
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_RELPATH] = $sRelPath
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_TYPE] = $sType
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_ISLINK] = $bIsLink
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_LEVEL] = $iLevel
	$iRows += 1

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_AddCurrent

Func __Chilkat_FTP2_ListDirectoryItems_Collect(ByRef $oFTP, $sBaseDir, $sRelDir, $sMask, $iReturn, $iRecur, $iReturnPath, $bClearCachedDir, ByRef $aList, ByRef $iRows, $iLevel)
	Local $sRemoteDir = __Chilkat_FTP2_RemotePathJoin($sBaseDir, $sRelDir)
	If $oFTP.ChangeRemoteDir($sRemoteDir) = 0 Then
		__Chilkat_LogOnError('__Chilkat_FTP2_ListDirectoryItems_Collect() Ftp2.ChangeRemoteDir()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$oFTP.ListPattern = $sMask
	If $bClearCachedDir Then $oFTP.ClearDirCache()

	Local $iCount = $oFTP.GetDirCount()
	If $iCount < 0 Then
		__Chilkat_LogOnError('__Chilkat_FTP2_ListDirectoryItems_Collect() Ftp2.GetDirCount()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	For $i = 0 To $iCount - 1
		__Chilkat_FTP2_ListDirectoryItems_AddCurrent($oFTP, $i, $sBaseDir, $sRelDir, $iReturn, $iReturnPath, $aList, $iRows, $iLevel)
	Next

	If $iRecur = $CHILKAT_FTP2_LIST_RECUR_RECUR Then
		$oFTP.ListPattern = '*'
		If $bClearCachedDir Then $oFTP.ClearDirCache()
		Local $iDirCount = $oFTP.GetDirCount()
		If $iDirCount < 0 Then
			__Chilkat_LogOnError('__Chilkat_FTP2_ListDirectoryItems_Collect() Ftp2.GetDirCount() for recursion', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		Local $aDirs[0]
		Local $iDirs = 0
		For $i = 0 To $iDirCount - 1
			Local $sName = $oFTP.GetFilename($i)
			If $sName = '.' Or $sName = '..' Then ContinueLoop
			If $oFTP.GetIsDirectory($i) And Not $oFTP.GetIsSymbolicLink($i) Then
				ReDim $aDirs[$iDirs + 1]
				$aDirs[$iDirs] = __Chilkat_FTP2_RemotePathJoin($sRelDir, $sName)
				$iDirs += 1
			EndIf
		Next

		For $i = 0 To $iDirs - 1
			__Chilkat_FTP2_ListDirectoryItems_Collect($oFTP, $sBaseDir, $aDirs[$i], $sMask, $iReturn, $iRecur, $iReturnPath, $bClearCachedDir, $aList, $iRows, $iLevel + 1)
			If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		Next
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_Collect

Func __Chilkat_FTP2_ListDirectoryItems_ShouldReturn($sType, $iReturn)
	Switch $sType
		Case $CHILKAT_FTP2_ITEM_TYPE_FILE
			Return BitAND($iReturn, $CHILKAT_FTP2_LIST_RETURN_FILES) <> 0
		Case $CHILKAT_FTP2_ITEM_TYPE_DIR
			Return BitAND($iReturn, $CHILKAT_FTP2_LIST_RETURN_DIRS) <> 0
		Case $CHILKAT_FTP2_ITEM_TYPE_LINK
			Return BitAND($iReturn, $CHILKAT_FTP2_LIST_RETURN_LINKS) <> 0
	EndSwitch
	Return False
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_ShouldReturn

Func __Chilkat_FTP2_ListDirectoryItems_Sort(ByRef $aList, $iSort)
	Local $iRows = UBound($aList, 1)
	Local $iCols = UBound($aList, 2)
	If $iRows < 2 Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	For $i = 1 To $iRows - 1
		For $j = $i To 1 Step -1
			Local $bSwap = False
			If $iSort = $CHILKAT_FTP2_LIST_SORT_ASC Then
				$bSwap = StringCompare($aList[$j - 1][$CHILKAT_FTP2_LIST_COL_PATH], $aList[$j][$CHILKAT_FTP2_LIST_COL_PATH]) > 0
			ElseIf $iSort = $CHILKAT_FTP2_LIST_SORT_DESC Then
				$bSwap = StringCompare($aList[$j - 1][$CHILKAT_FTP2_LIST_COL_PATH], $aList[$j][$CHILKAT_FTP2_LIST_COL_PATH]) < 0
			EndIf
			If Not $bSwap Then ExitLoop
			For $c = 0 To $iCols - 1
				Local $vTmp = $aList[$j - 1][$c]
				$aList[$j - 1][$c] = $aList[$j][$c]
				$aList[$j][$c] = $vTmp
			Next
		Next
	Next

	For $i = 0 To $iRows - 1
		$aList[$i][$CHILKAT_FTP2_LIST_COL_INDEX] = $i
	Next
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_Sort

Func __Chilkat_FTP2_RemotePathJoin($sLeft, $sRight)
	If $sLeft = Default Then $sLeft = ''
	If $sRight = Default Then $sRight = ''
	If $sLeft = '' Then Return $sRight
	If $sRight = '' Then Return $sLeft
	While StringRight($sLeft, 1) = '/' And StringLen($sLeft) > 1
		$sLeft = StringTrimRight($sLeft, 1)
	WEnd
	While StringLeft($sRight, 1) = '/'
		$sRight = StringTrimLeft($sRight, 1)
	WEnd
	If $sLeft = '/' Then Return '/' & $sRight
	Return $sLeft & '/' & $sRight
EndFunc   ;==>__Chilkat_FTP2_RemotePathJoin

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_AppendFileBinary
; Description ...: Appends an AutoIt binary Variant to a remote FTP/FTPS file without using a local input file.
; Syntax ........: _Chilkat_FTP2_AppendFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $dBinaryData           - [in/out] bytes to append.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.AppendFileFromBinaryData() for v10-compatible append-from-memory behavior.
; Related .......: _Chilkat_FTP2_UploadFileBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_AppendFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.AppendFileFromBinaryData($sRemoteFilePath, $dBinaryData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_AppendFileBinary() Ftp2.AppendFileFromBinaryData()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_AppendFileBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ChangeRemoteDir
; Description ...: Changes the current FTP/FTPS remote directory.
; Syntax ........: _Chilkat_FTP2_ChangeRemoteDir(ByRef $oFTP, $sRemoteDir)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteDir            - [in] remote directory.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.ChangeRemoteDir().
; Related .......: _Chilkat_FTP2_Connect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ChangeRemoteDir(ByRef $oFTP, $sRemoteDir)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.ChangeRemoteDir($sRemoteDir)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_ChangeRemoteDir() Ftp2.ChangeRemoteDir()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_ChangeRemoteDir

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_Connect
; Description ...: Creates a Chilkat Ftp2 object, sets common connection options and connects/logs in.
; Syntax ........: _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword, $iPort = 21, $bAuthTls = 0, $bSsl = 0, $bPassive = 1, $iConnectTimeout = Default)
; Parameters ....: $sHostName             - [in] FTP/FTPS host.
;                  $sUsername             - [in] user name.
;                  $sPassword             - [in] password.
;                  $iPort                 - [in] port. Default is 21.
;                  $bAuthTls              - [in] explicit FTPS/TLS. Default is 0.
;                  $bSsl                  - [in] implicit SSL/TLS. Default is 0.
;                  $bPassive              - [in] passive mode. Default is 1.
;                  $iConnectTimeout       - [in] optional timeout in seconds.
; Return values .: Success: connected Chilkat Ftp2 object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.Connect().
; Related .......: _Chilkat_FTP2_UploadFile, _Chilkat_FTP2_DownloadFile, _Chilkat_FTP2_Disconnect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword, $iPort = 21, $bAuthTls = 0, $bSsl = 0, $bPassive = 1, $iConnectTimeout = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sHostName) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sUsername) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sPassword) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $oFTP = _Chilkat_FTP2_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oFTP.Hostname = $sHostName
	$oFTP.Username = $sUsername
	$oFTP.Password = $sPassword
	$oFTP.Port = $iPort
	$oFTP.Passive = $bPassive ? 1 : 0
	$oFTP.AuthTls = $bAuthTls ? 1 : 0
	$oFTP.Ssl = $bSsl ? 1 : 0
	If $iConnectTimeout <> Default Then $oFTP.ConnectTimeout = $iConnectTimeout

	Local $iSuccess = $oFTP.Connect()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_Connect() Ftp2.Connect()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $oFTP.ConnectFailReason, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oFTP)
EndFunc   ;==>_Chilkat_FTP2_Connect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_Disconnect
; Description ...: Disconnects a connected Chilkat Ftp2 object.
; Syntax ........: _Chilkat_FTP2_Disconnect(ByRef $oFTP)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Calls Ftp2.Disconnect().
; Related .......: _Chilkat_FTP2_Connect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_Disconnect(ByRef $oFTP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	$oFTP.Disconnect()
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_Disconnect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadFile
; Description ...: Downloads a remote file from the connected FTP/FTPS server.
; Syntax ........: _Chilkat_FTP2_DownloadFile(ByRef $oFTP, $sRemoteFilePath, $sLocalFileFullPath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteFilePath       - [in] remote path/name.
;                  $sLocalFileFullPath    - [in] local output path.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.GetFile().
; Related .......: _Chilkat_FTP2_Connect, _Chilkat_FTP2_UploadFile
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadFile(ByRef $oFTP, $sRemoteFilePath, $sLocalFileFullPath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sLocalFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.GetFile($sRemoteFilePath, $sLocalFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_DownloadFile() Ftp2.GetFile()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_DownloadFile

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadFileBd
; Description ...: Downloads a remote FTP/FTPS file directly into a Chilkat BinData object.
; Syntax ........: _Chilkat_FTP2_DownloadFileBd(ByRef $oFTP, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: Chilkat BinData object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.GetFileBd(), no local output file.
; Related .......: _Chilkat_FTP2_DownloadFileBinary, _Chilkat_FTP2_UploadFileBd
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadFileBd(ByRef $oFTP, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.GetFileBd($sRemoteFilePath, $oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_DownloadFileBd() Ftp2.GetFileBd()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oBinData)
EndFunc   ;==>_Chilkat_FTP2_DownloadFileBd

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadFileBinary
; Description ...: Downloads a remote FTP/FTPS file directly into an AutoIt binary Variant.
; Syntax ........: _Chilkat_FTP2_DownloadFileBinary(ByRef $oFTP, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: binary bytes. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses BinData as the transfer buffer.
; Related .......: _Chilkat_FTP2_DownloadFileBd, _Chilkat_FTP2_UploadFileBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadFileBinary(ByRef $oFTP, $sRemoteFilePath)
	Local $oBinData = _Chilkat_FTP2_DownloadFileBd($oFTP, $sRemoteFilePath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dBinaryData = _Chilkat_BINDATA_ToBinary($oBinData)
	Return SetError(@error, @extended, $dBinaryData)
EndFunc   ;==>_Chilkat_FTP2_DownloadFileBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadZipToObject
; Description ...: Downloads a remote ZIP file to memory and opens it as a Chilkat Zip object.
; Syntax ........: _Chilkat_FTP2_DownloadZipToObject(ByRef $oFTP, $sRemoteZipFilePath, $sDecryptPassword = Default)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteZipFilePath    - [in] remote ZIP path/name.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: FTP remote file -> Binary -> ZIP object, without writing the ZIP to disk.
; Related .......: _Chilkat_FTP2_DownloadFileBinary, _Chilkat_ZIP_OpenFromBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadZipToObject(ByRef $oFTP, $sRemoteZipFilePath, $sDecryptPassword = Default)
	Local $dZipBinaryData = _Chilkat_FTP2_DownloadFileBinary($oFTP, $sRemoteZipFilePath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	Return SetError(@error, @extended, $oZIP)
EndFunc   ;==>_Chilkat_FTP2_DownloadZipToObject

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_List_AsArray
; Description ...: Legacy alias for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Syntax ........: _Chilkat_FTP2_List_AsArray(ByRef $oFTP, $sListPattern = Default, $bClearCachedDir = 1)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sListPattern          - [in] optional wildcard pattern. Default uses '*'.
;                  $bClearCachedDir       - [in] when 1, calls ClearDirCache before reading.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Kept for backward compatibility. New code should use _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_List_AsArray(ByRef $oFTP, $sListPattern = Default, $bClearCachedDir = 1)
	If $sListPattern = Default Then $sListPattern = '*'
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, Default, $sListPattern, $CHILKAT_FTP2_LIST_RETURN_ALL, $CHILKAT_FTP2_LIST_RECUR_NORECUR, $CHILKAT_FTP2_LIST_SORT_NOSORT, $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_List_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryDirs_AsArray
; Description ...: Convenience wrapper returning only remote FTP/FTPS directories.
; Syntax ........: _Chilkat_FTP2_ListDirectoryDirs_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]])
; Parameters ....: See _Chilkat_FTP2_ListDirectoryItems_AsArray.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wrapper for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryDirs_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, $sMask, $CHILKAT_FTP2_LIST_RETURN_DIRS, $iRecur, $iSort, $iReturnPath, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryDirs_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryFiles_AsArray
; Description ...: Convenience wrapper returning only remote FTP/FTPS files.
; Syntax ........: _Chilkat_FTP2_ListDirectoryFiles_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]])
; Parameters ....: See _Chilkat_FTP2_ListDirectoryItems_AsArray.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wrapper for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryFiles_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, $sMask, $CHILKAT_FTP2_LIST_RETURN_FILES, $iRecur, $iSort, $iReturnPath, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryFiles_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Description ...: Returns FTP/FTPS remote directory items as a native AutoIt 2D array.
; Syntax ........: _Chilkat_FTP2_ListDirectoryItems_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL[, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]]]])
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteDir            - [in] optional remote directory to list. Default means the current remote directory.
;                  $sMask                 - [in] wildcard pattern, for example '*', '*.pdf', '*.xml;*.txt'. See Remarks.
;                  $iReturn               - [in] item type filter: $CHILKAT_FTP2_LIST_RETURN_* constants.
;                  $iRecur                - [in] recursion mode: $CHILKAT_FTP2_LIST_RECUR_* constants.
;                  $iSort                 - [in] sorting mode: $CHILKAT_FTP2_LIST_SORT_* constants. Sorts by $CHILKAT_FTP2_LIST_COL_PATH.
;                  $iReturnPath           - [in] primary path mode for $CHILKAT_FTP2_LIST_COL_PATH: $CHILKAT_FTP2_LIST_RELPATH or $CHILKAT_FTP2_LIST_FULLPATH.
;                  $bClearCachedDir       - [in] when 1, calls ClearDirCache before reading each remote directory.
; Return values .: Success: 2D array [n][$CHILKAT_FTP2_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The array contains files, directories and symbolic links. Columns are described by $CHILKAT_FTP2_LIST_COL_* constants.
;                  $sMask maps to Chilkat Ftp2.ListPattern and must contain only a wildcard pattern, for example '*', '*.pdf' or '*.xml;*.txt'.
;                  Do not include a remote directory path in $sMask. Use $sRemoteDir or _Chilkat_FTP2_ChangeRemoteDir() to select the directory first.
;                  Recursion traverses directories found with ListPattern='*', so directories can be traversed even when $sMask filters files.
; Related .......: _Chilkat_FTP2_ListDirectoryFiles_AsArray, _Chilkat_FTP2_ListDirectoryDirs_AsArray, _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryItems_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $sRemoteDir <> Default And Not IsString($sRemoteDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sMask) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	If Not IsInt($iReturn) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM4, $CHILKAT_RET_FAILURE)
	If Not IsInt($iRecur) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM5, $CHILKAT_RET_FAILURE)
	If Not IsInt($iSort) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM6, $CHILKAT_RET_FAILURE)
	If Not IsInt($iReturnPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM7, $CHILKAT_RET_FAILURE)

	Local $sOriginalDir = $oFTP.GetCurrentRemoteDir()
	If @error Then
		__Chilkat_LogOnError('_Chilkat_FTP2_ListDirectoryItems_AsArray() Ftp2.GetCurrentRemoteDir()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sOriginalListPattern = $oFTP.ListPattern
	Local $sBaseDir = $sOriginalDir
	If $sRemoteDir <> Default Then $sBaseDir = $sRemoteDir

	Local $aList[0][$CHILKAT_FTP2_LIST_COL_COUNT]
	Local $iRows = 0
	Local $iCollect = __Chilkat_FTP2_ListDirectoryItems_Collect($oFTP, $sBaseDir, '', $sMask, $iReturn, $iRecur, $iReturnPath, $bClearCachedDir, $aList, $iRows, 0)
	#forceref $iCollect
	Local $iCollectError = @error
	Local $iCollectExtended = @extended

	$oFTP.ListPattern = $sOriginalListPattern
	If IsString($sOriginalDir) And $sOriginalDir <> '' Then $oFTP.ChangeRemoteDir($sOriginalDir)

	If $iCollectError Then Return SetError($iCollectError, $iCollectExtended, $CHILKAT_RET_FAILURE)

	If $iSort <> $CHILKAT_FTP2_LIST_SORT_NOSORT And $iRows > 1 Then __Chilkat_FTP2_ListDirectoryItems_Sort($aList, $iSort)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aList)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryItems_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray
; Description ...: Convenience wrapper returning remote FTP/FTPS directory items recursively.
; Syntax ........: _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]])
; Parameters ....: See _Chilkat_FTP2_ListDirectoryItems_AsArray.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wrapper for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, $sMask, $iReturn, $CHILKAT_FTP2_LIST_RECUR_RECUR, $iSort, $iReturnPath, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ObjCreate
; Description ...: Creates a Chilkat Ftp2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_FTP2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ftp2 object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatFTP2Ref.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_FTP2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_FTP2_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadFile
; Description ...: Uploads a local file to the connected FTP/FTPS server.
; Syntax ........: _Chilkat_FTP2_UploadFile(ByRef $oFTP, $sLocalFileFullPath, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sLocalFileFullPath    - [in] local file path.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.PutFile().
; Related .......: _Chilkat_FTP2_Connect, _Chilkat_FTP2_DownloadFile
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadFile(ByRef $oFTP, $sLocalFileFullPath, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not FileExists($sLocalFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.PutFile($sLocalFileFullPath, $sRemoteFilePath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_UploadFile() Ftp2.PutFile()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_UploadFile

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadFileBd
; Description ...: Uploads a Chilkat BinData object to a remote FTP/FTPS file without using a local input file.
; Syntax ........: _Chilkat_FTP2_UploadFileBd(ByRef $oFTP, ByRef $oBinData, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $oBinData              - [in/out] Chilkat BinData object to upload.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.PutFileBd().
; Related .......: _Chilkat_FTP2_UploadFileBinary, _Chilkat_FTP2_DownloadFileBd
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadFileBd(ByRef $oFTP, ByRef $oBinData, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsObj($oBinData) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.PutFileBd($oBinData, $sRemoteFilePath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_UploadFileBd() Ftp2.PutFileBd()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_UploadFileBd

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadFileBinary
; Description ...: Uploads an AutoIt binary Variant to a remote FTP/FTPS file without using a local input file.
; Syntax ........: _Chilkat_FTP2_UploadFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $dBinaryData           - [in/out] bytes to upload.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Binary -> BinData -> FTP remote file.
; Related .......: _Chilkat_FTP2_UploadFileBd, _Chilkat_FTP2_DownloadFileBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
	Local $oBinData = _Chilkat_BINDATA_FromBinary($dBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = _Chilkat_FTP2_UploadFileBd($oFTP, $oBinData, $sRemoteFilePath)
	Return SetError(@error, @extended, $iSuccess)
EndFunc   ;==>_Chilkat_FTP2_UploadFileBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadZipObject
; Description ...: Serializes a Chilkat Zip object to memory and uploads it to a remote FTP/FTPS file.
; Syntax ........: _Chilkat_FTP2_UploadZipObject(ByRef $oFTP, ByRef $oZIP, $sRemoteZipFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $oZIP                  - [in/out] Chilkat Zip object.
;                  $sRemoteZipFilePath    - [in] remote ZIP path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: ZIP object -> BinData -> FTP remote file, without writing a local ZIP file.
; Related .......: _Chilkat_ZIP_ObjectToBinData, _Chilkat_FTP2_UploadFileBd
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadZipObject(ByRef $oFTP, ByRef $oZIP, $sRemoteZipFilePath)
	Local $oZipBd = _Chilkat_ZIP_ObjectToBinData($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = _Chilkat_FTP2_UploadFileBd($oFTP, $oZipBd, $sRemoteZipFilePath)
	Return SetError(@error, @extended, $iSuccess)
EndFunc   ;==>_Chilkat_FTP2_UploadZipObject
#EndRegion ; _Chilkat_FTP2_**

#Region ; _Chilkat_SCP_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCP_ObjCreate
; Description ...: Creates a Chilkat Scp COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SCP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Scp object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatScpRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SCP_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSCPRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SCP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SCP_ObjCreate
#EndRegion ; _Chilkat_SCP_**

#Region ; _Chilkat_HTTP_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Http_DownloadFile_Async
; Description ...: Downloads a file asynchronously by using Chilkat Http, BinData and Task objects.
; Syntax ........: _Chilkat_Http_DownloadFile_Async($sURL, $sDestination_FileFullPath, $fnProgressWrapper = __Chilkat_GetAndSaveFileToDisc_Progress)
; Parameters ....: $sURL                  - [in] HTTP URL to download.
;                  $sDestination_FileFullPath - [in] local destination file path.
;                  $fnProgressWrapper     - [in] optional progress callback called with percent done. Default is __Chilkat_GetAndSaveFileToDisc_Progress.
; Return values .: Success: no explicit return. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_HTTP_ObjCreate, __Chilkat_LogOnError, _Chilkat_BINDATA_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Http_DownloadFile_Async($sURL, $sDestination_FileFullPath, $fnProgressWrapper = __Chilkat_GetAndSaveFileToDisc_Progress)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber, $oHttp)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber, $oBinData)

	Local $oTask = $oHttp.DownloadBdAsync($sURL, $oBinData)

	Local $iSuccess = $oTask.Run()
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' Task.Run ', $oTask)
		Return SetError(@error, @extended, $iSuccess)
	EndIf

	Local $iCurPctDone = 0
	While $oTask.Finished <> 1 And $oTask.StatusInt < 5
		If ($oTask.PercentDone <> $iCurPctDone) Then
			If IsFunc($fnProgressWrapper) Then $fnProgressWrapper($oTask.PercentDone)
		EndIf
		$oTask.SleepMs(10)
	WEnd

	Local $hFileOpen = FileOpen($sDestination_FileFullPath, $FO_BINARY + $FO_OVERWRITE)
	FileWrite($hFileOpen, $oBinData.GetBinary())
	FileClose($hFileOpen)
EndFunc   ;==>_Chilkat_Http_DownloadFile_Async

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HTTP_ObjCreate
; Description ...: Creates a Chilkat Http COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HTTP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Http object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_HTTP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HTTP_ObjCreate
#EndRegion ; _Chilkat_HTTP_**

#Region ; _Chilkat_BINDATA_**


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

#Region ; _Chilkat_Asn_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Asn_ObjCreate
; Description ...: Creates a Chilkat Asn COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Asn_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Asn object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAsnRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Asn_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ASN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Asn_ObjCreate
#EndRegion ; _Chilkat_Asn_**

#Region ; _Chilkat_AuthAws_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAws_ObjCreate
; Description ...: Creates a Chilkat AuthAws COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAws_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAws object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAwsRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAws_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAWS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAws_ObjCreate
#EndRegion ; _Chilkat_AuthAws_**

#Region ; _Chilkat_AuthAzureAD_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAzureAD_ObjCreate
; Description ...: Creates a Chilkat AuthAzureAD COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAzureAD_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAzureAD object introduction version is not explicitly documented in the current Chilkat ActiveX refdoc.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAzureADRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAzureAD_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAZUREAD)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAzureAD_ObjCreate
#EndRegion ; _Chilkat_AuthAzureAD_**

#Region ; _Chilkat_AuthAzureSAS_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAzureSAS_ObjCreate
; Description ...: Creates a Chilkat AuthAzureSAS COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAzureSAS_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAzureSAS object was introduced in version 9.5.0.65.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAzureSASRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAzureSAS_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAZURESAS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAzureSAS_ObjCreate
#EndRegion ; _Chilkat_AuthAzureSAS_**

#Region ; _Chilkat_AuthAzureStorage_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAzureStorage_ObjCreate
; Description ...: Creates a Chilkat AuthAzureStorage COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAzureStorage_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAzureStorage object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAzureStorageRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAzureStorage_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAZURESTORAGE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAzureStorage_ObjCreate
#EndRegion ; _Chilkat_AuthAzureStorage_**

#Region ; _Chilkat_AuthGoogle_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthGoogle_ObjCreate
; Description ...: Creates a Chilkat AuthGoogle COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthGoogle_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthGoogle object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthGoogleRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthGoogle_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHGOOGLE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthGoogle_ObjCreate
#EndRegion ; _Chilkat_AuthGoogle_**

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

#Region ; _Chilkat_HtmlToText_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HtmlToText_ObjCreate
; Description ...: Creates a Chilkat HtmlToText COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HtmlToText_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat HtmlToText object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHtmlToTextRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HtmlToText_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTMLTOTEXT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HtmlToText_ObjCreate
#EndRegion ; _Chilkat_HtmlToText_**

#Region ; _Chilkat_HtmlToXml_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HtmlToXml_ObjCreate
; Description ...: Creates a Chilkat HtmlToXml COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HtmlToXml_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat HtmlToXml object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHtmlToXmlRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HtmlToXml_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTMLTOXML)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HtmlToXml_ObjCreate
#EndRegion ; _Chilkat_HtmlToXml_**

#Region ; _Chilkat_HttpRequest_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HttpRequest_ObjCreate
; Description ...: Creates a Chilkat HttpRequest COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HttpRequest_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat HttpRequest object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRequestRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HttpRequest_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTPREQUEST)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HttpRequest_ObjCreate
#EndRegion ; _Chilkat_HttpRequest_**

#Region ; _Chilkat_HttpResponse_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HttpResponse_ObjCreate
; Description ...: Creates a Chilkat HttpResponse COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HttpResponse_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat HttpResponse object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpResponseRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HttpResponse_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTPRESPONSE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HttpResponse_ObjCreate
#EndRegion ; _Chilkat_HttpResponse_**

#Region ; _Chilkat_JsonArray_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_JsonArray_ObjCreate
; Description ...: Creates a Chilkat JsonArray COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_JsonArray_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat JsonArray object was introduced in version 9.5.0.56.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatJsonArrayRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_JsonArray_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JSONARRAY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_JsonArray_ObjCreate
#EndRegion ; _Chilkat_JsonArray_**

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

#Region ; _Chilkat_Ntlm_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Ntlm_ObjCreate
; Description ...: Creates a Chilkat Ntlm COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Ntlm_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ntlm object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatNtlmRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Ntlm_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_NTLM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Ntlm_ObjCreate
#EndRegion ; _Chilkat_Ntlm_**

#Region ; _Chilkat_OAuth1_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_OAuth1_ObjCreate
; Description ...: Creates a Chilkat OAuth1 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_OAuth1_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat OAuth1 object was introduced in version 9.5.0.53.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatOAuth1Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_OAuth1_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_OAUTH1)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_OAuth1_ObjCreate
#EndRegion ; _Chilkat_OAuth1_**

#Region ; _Chilkat_OAuth2_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_OAuth2_ObjCreate
; Description ...: Creates a Chilkat OAuth2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_OAuth2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat OAuth2 object was introduced in version 9.5.0.59.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatOAuth2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_OAuth2_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_OAUTH2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_OAuth2_ObjCreate
#EndRegion ; _Chilkat_OAuth2_**

#Region ; _Chilkat_Rest_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Rest_ObjCreate
; Description ...: Creates a Chilkat Rest COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Rest_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Rest object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatRestRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Rest_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_REST)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Rest_ObjCreate
#EndRegion ; _Chilkat_Rest_**

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

#Region ; _Chilkat_Socket_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Socket_ObjCreate
; Description ...: Creates a Chilkat Socket COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Socket_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Socket object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSocketRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Socket_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SOCKET)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Socket_ObjCreate
#EndRegion ; _Chilkat_Socket_**

#Region ; _Chilkat_Spider_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Spider_ObjCreate
; Description ...: Creates a Chilkat Spider COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Spider_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Spider object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSpiderRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Spider_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SPIDER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Spider_ObjCreate
#EndRegion ; _Chilkat_Spider_**

#Region ; _Chilkat_Ssh_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Ssh_ObjCreate
; Description ...: Creates a Chilkat Ssh COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Ssh_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ssh object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSshRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Ssh_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSH)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Ssh_ObjCreate
#EndRegion ; _Chilkat_Ssh_**

#Region ; _Chilkat_SshKey_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SshKey_ObjCreate
; Description ...: Creates a Chilkat SshKey COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SshKey_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SshKey object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSshKeyRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SshKey_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSHKEY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SshKey_ObjCreate
#EndRegion ; _Chilkat_SshKey_**

#Region ; _Chilkat_Stream_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Stream_ObjCreate
; Description ...: Creates a Chilkat Stream COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Stream_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Stream object was introduced in version 9.5.0.56.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatStreamRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Stream_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STREAM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Stream_ObjCreate
#EndRegion ; _Chilkat_Stream_**

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

#Region ; _Chilkat_Upload_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Upload_ObjCreate
; Description ...: Creates a Chilkat Upload COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Upload_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Upload object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatUploadRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Upload_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_UPLOAD)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Upload_ObjCreate
#EndRegion ; _Chilkat_Upload_**

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

#Region ; _Chilkat_WebSocket_**


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_WebSocket_ObjCreate
; Description ...: Creates a Chilkat WebSocket COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_WebSocket_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat WebSocket object was introduced in version 9.5.0.70.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatWebSocketRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_WebSocket_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_WEBSOCKET)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_WebSocket_ObjCreate
#EndRegion ; _Chilkat_WebSocket_**

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

Func __Chilkat_ConsoleWrite_IFNC($sData, $iError = @error, $iExtended = @extended)
	If Not @Compiled Then ConsoleWrite('- IFNC: Chilkat.au3 ' & $sData & @CRLF)
	Return SetError($iError, $iExtended)
EndFunc   ;==>__Chilkat_ConsoleWrite_IFNC

Func __Chilkat_GetAndSaveFileToDisc_Progress($iProgress)
	__Chilkat_Log("Progres: " & $iProgress & "%")
EndFunc   ;==>__Chilkat_GetAndSaveFileToDisc_Progress

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

Func __Chilkat_NowCalcUtc()
	Local $tSystemTime = DllStructCreate('ushort Year;ushort Month;ushort DayOfWeek;ushort Day;ushort Hour;ushort Minute;ushort Second;ushort Milliseconds')
	Local $aRet = DllCall('kernel32.dll', 'none', 'GetSystemTime', 'struct*', $tSystemTime)
	If @error Or Not IsArray($aRet) Then Return StringFormat('%04d/%02d/%02d %02d:%02d:%02d', @YEAR, @MON, @MDAY, @HOUR, @MIN, @SEC)
	Return StringFormat('%04d/%02d/%02d %02d:%02d:%02d', DllStructGetData($tSystemTime, 'Year'), DllStructGetData($tSystemTime, 'Month'), DllStructGetData($tSystemTime, 'Day'), DllStructGetData($tSystemTime, 'Hour'), DllStructGetData($tSystemTime, 'Minute'), DllStructGetData($tSystemTime, 'Second'))
EndFunc   ;==>__Chilkat_NowCalcUtc

Func __Chilkat_PathGetDir($sFileFullPath)
	Local $sDir = StringRegExpReplace($sFileFullPath, '[\\/][^\\/]*$', '')
	If $sDir = $sFileFullPath Then Return '.'
	If $sDir = '' Then Return '.'
	Return $sDir
EndFunc   ;==>__Chilkat_PathGetDir

Func __Chilkat_PathGetFileName($sFileFullPath)
	Return StringRegExpReplace($sFileFullPath, '^.*[\\/]', '')
EndFunc   ;==>__Chilkat_PathGetFileName

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
#EndRegion - Chilkat.au3 - Function - Misc
