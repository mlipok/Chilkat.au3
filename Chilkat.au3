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
; Version .......: v0.2.12 BETA - Work in progress
; ================================================================================

#Region ; Release Notes
#cs
	v0.1.1
	2017/02/01
	.	First official version - mLipok

	v0.1.2
	2017/02/08
	.	Chnaged: few refactoring - mLipok
	.	Added: Function: _Chilkat_CSV_StringToArray() - mLipok
	.	Added: Function: _Chilkat_JSON_ObjFromString() - mLipok
	.	Added: Function: _Chilkat_JSON_ObjToString() - mLipok
	.	Added: $CHILKATOBJ_API - modest beginning for support to create object for future Chilkat Component version - mLipok

	v0.1.3
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

	v0.1.4
	2026/06/06
	.	Added: support for $CHILKATOBJ_VERSION_10 - mLipok
	.	Added: Enums: $CHILKAT_ERR_FAILURE - mean when Chilkat object functions returns 0 - mLipok
	.	Added: Enums: $CHILKAT_ERR_UNKNOWN -  - mLipok
	.	Added: Enums: $CHILKAT_ERR_NOTFOUND -  - mLipok
	.	Added: $__g_sChilkat_LastCOMError - mLipok

	.	Added: Function: _Chilkat_EMAIL_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_SFTP_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_SFTPDIR_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_SFTPFILE_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_SCP_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_ZIPCRC_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_ZIPENTRY_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_MAILBOXES_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_HTTP_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_BINDATA_ObjCreate() - mLipok
	.	Added: Function: __Chilkat_ObjCreate_Wrapper() - mLipok
	.	Added: Function: _Chilkat_IsAtLeastThisVersion() - mLipok
	.	Added: Function: _Chilkat_ObjName_FlagsValue() - mLipok
	.	Added: Function: _Chilkat_LogWrapper() - mLipok
	.	Added: Function: __Chilkat_Log() - mLipok
	.	Added: Function: _Chilkat_StringTable_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_TASK_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_TASKCHAIN_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_Cert_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_Cert_LoadFromSmartCard() - mLipok
	.	Added: Function: _Chilkat_Cert_ValidateSmartCard_PIN() - mLipok
	.	Added: Function: _Chilkat_CertStore_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_Csp_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_Csp_GetProvidersList() - mLipok
	.	Added: Function: _Chilkat_Csp_FindCertificate_OnSmartCard_InReader() - mLipok
	.	Added: Function: _Chilkat_Pdf_ObjCreate() - mLipok
	.	Added: Function: _Chilkat_PDF_Sign() - mLipok
	.	Added: Function: _Chilkat_PDF_VerifySignature() - mLipok
	.	Added: Function: _Chilkat_PDF_GetDSS() - mLipok
	.	Added: Function: _Chilkat_IMAP_GetSentMailboxName() - mLipok

	.	Refactored: Function: all _Chilkat_XXX_ObjCreate() use __Chilkat_ObjCreate_Wrapper() - mLipok

	.	Renamed: Function: _ErrorLog_ChilkatWrapper() >> _Chilkat_ErrorLogWrapper() - mLipok - !!! SCRIPT BREAKING CHANGES !!!
	.	Renamed: Function: __ErrorLog_Chilkat() >> __Chilkat_LogOnError() - mLipok - !!! COULD BE SCRIPT BREAKING CHANGES !!!
	.	Changed: Function: _Chilkat_ErrorLogWrapper() store/restore @error/@extednded - mLipok
	.	Changed: Function: _Chilkat_EMAIL_SendSingleMail() better error checking - mLipok
	.	Changed: Function: _COM_Error_Handler__for_Chilkat()  >>>>>>__Internal_COM_ERROR_HANDLER__for_Chilkat() - mLipok
	.	Changed: Function: _Chilkat_ObjName_FlagsValue()  preserves @error @extended - mLipok
	.	Changed: in many places __Chilkat_LogOnError() >> __Chilkat_Log() - mLipok

	.	Added: Parameter: $bEnableQuotes to function: _Chilkat_CSV_StringToArray() - mLipok
	.	Added: IFNC to ConsoleWrite() messages - mLipok
	.	Added: IFNC to __Chilkat_LogOnError() messages - mLipok
	.	Added: __Chilkat_ConsoleWrite_IFNC() - mLipok

	.	Added: Examples: _Example_24_Simple_SMTP_Send() - mLipok
	.	Added: Examples: _Example_25_Simple_IMAP_List_MailBoxes() - mLipok
	.	Added: Examples: _Example_26_ZIP() - mLipok
	.	Added: Examples: _Example_27_DownloadBdAsync() - mLipok

	#AI from this version onward - keep the "#Region ; Release Notes" section up to date
	v0.2.4
	2026/06/07
	.	Added: headers suplemented by AI - ChatGPT / mLipok


	v0.2.5
	2026/07/07
	.   Added: ProgID fallback object creators for Pkcs11, SCard, ScMinidriver, XmlDSig, XmlDSigGen and PrivateKey - AI / mLipok
	.   Added: ZIP helpers for creating archives from patterns, encrypted ZIP, opening, appending, extracting and listing entries - AI / mLipok
	.   Added: FTP2 helpers for connect, upload, download, change directory and disconnect - AI / mLipok
	.   Added: PKCS11 and smart-card helpers for loading signing certificates and private-key capable certificate discovery - AI / mLipok
	.   Added: PAdES PDF signing helpers for Cert, SmartCard and PKCS11 plus aggregate PDF signature verification - AI / mLipok
	.   Added: XAdES-BES external-file signing helpers for Cert, SmartCard and PKCS11 plus XAdES verification helpers - AI / mLipok

	v0.2.6
	2026/07/07
	.   Added: BinData helpers for AutoIt binary Variant <-> Chilkat BinData conversion - AI / mLipok
	.   Added: ZIP in-memory helpers for Binary -> Zip object -> Binary workflows, listing, deleting, extracting and adding entries without filesystem files - AI / mLipok
	.   Added: FTP2 binary/BinData upload and download helpers plus direct FTP ZIP object transfer helpers - AI / mLipok
	.   Added: PAdES signing and aggregate verification helpers for binary PDF data, returning signed PDF bytes - AI / mLipok
	.   Added: XAdES-BES signing and verification helpers for external binary references and binary XAdES XML data - AI / mLipok

	v0.2.7
	2026/07/07
	.   Changed: ZIP listing helpers now return native AutoIt arrays; obsolete ZIP AsXml listing wrappers removed - AI / mLipok
	.   Added: FTP2 directory listing helper returning a native AutoIt array instead of XML/JSON - AI / mLipok
	.   Added: PC/SC and PKCS11 discovery helpers returning arrays for readers/slots/tokens - AI / mLipok
	.   Added: PKCS11 certificate listing helpers returning arrays, including private-key filtering and certificate metadata - AI / mLipok
	.   Added: Certificate helper functions for qualified-policy detection and validity date checks - AI / mLipok

	v0.2.8
	2026/07/07
	.   Changed: ZIP array listing helpers renamed to ListEntriesFromFile/Object/Binary for clearer English API naming - AI / mLipok

	v0.2.9
	2026/07/07
	.   Changed: FTP2 directory listing helper renamed to _Chilkat_FTP2_ListDirectoryItems_AsArray() - AI / mLipok
	.   Added: FTP2 directory listing filters for files, directories, symbolic links, recursion, sorting and path output mode - AI / mLipok
	.   Added: FTP2 convenience wrappers for files-only, directories-only and recursive directory item listings - AI / mLipok

	v0.2.10
	2026/07/07
	.   Changed: FTP2 ListPattern/$sMask usage note moved from parameter description to Remarks - AI / mLipok


	v0.2.11
	2026/07/09
	.   Changed: grouped Chilkat object functions into dedicated #Region blocks by object prefix - AI / mLipok
	.   Added: missing _Chilkat_*_ObjCreate() wrapper functions based on ChilkatConstants.au3 object metadata - AI / mLipok
	.   Added: ObjCreate() Remarks documenting Chilkat object introduction versions where available in the Chilkat ActiveX refdoc - AI / mLipok
	.   Added: Registration-Free COM / SxS comments for CLSID/IID/DLL-handle object creation and clarified registered ProgID fallback logging - AI / mLipok
	.   Changed: SmartCard certificate loading can reject expired or not-yet-valid certificates when selecting a certificate for signing - AI / mLipok
	
	v0.2.12
	2026/07/13
	.   Added: smart-card certificate listing as a native AutoIt array containing certificate name, issuer, serial number, validity dates, fingerprint, key usage and qualification metadata - AI / mLipok
	.   Added: interactive ListView-based selection of a valid smart-card certificate, with the selected certificate identified by its full SHA-1 fingerprint - AI / mLipok
	.   Changed: smart-card PIN prompts now display a readable summary of the selected certificate before requesting the PIN - AI / mLipok
	.   Changed: _Example_36_PDF_PAdES_Binary() now uses interactive smart-card certificate selection before PAdES signing - AI / mLipok

	@LAST

	;~	https://www.chilkatsoft.com/refdoc/xChilkatJsonObjectRef.html
#ce
#EndRegion ; Release Notes

#TODO https://www.example-code.com/autoit/socket_nist_time_server.asp
#TODO https://www.example-code.com/autoit/scard.asp
#TODO https://www.example-code.com/autoit/pdf_signatures.asp
#TODO https://www.example-code.com/autoit/pkcs11.asp
#TODO https://www.example-code.com/autoit/cert.asp
;~ Cert: Added the SmartcardFailReason property to provide the ability to know the main reason the LoadFromSmartcard method failed.
;~ CertStore: Improved functionality for smart cards and USB tokens. Also extended to better support the Apple Keychain.
;~ CertStore: Added the following methods: FindCert, GetCert, LoadPfxBd.
;~ https://www.example-code.com/xojo/pcsc_list_readers.asp
;~ https://www.example-code.com/chilkat2-python/authenticode_sign_using_yubikey.asp
;~ https://stackoverflow.com/questions/67173206/chilkat-codesigning
;~ https://www.example-code.com/autoit/code_sign_sectigo_usb_token.asp
;~ https://www.example-code.com/autoit/authenticode_sign_using_yubikey.asp

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

#Region ; _Chilkat_IMAP_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_IMAP_ObjCreate
; Description ...: Creates a Chilkat Imap COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_IMAP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Imap object was introduced in version 9.5.0.26.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatImapRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_IMAP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_IMAP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_IMAP_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_IMAP_ApendEmail
; Description ...: Appends a Chilkat Email object to the selected IMAP mailbox.
; Syntax ........: _Chilkat_IMAP_ApendEmail(ByRef $oIMAP, ByRef $oEmail, $sMailbox_name = "Inbox.Sent")
; Parameters ....: $oIMAP                 - [in/out] Chilkat Imap object.
;                  $oEmail                - [in/out] Chilkat Email object.
;                  $sMailbox_name         - [in] IMAP mailbox name. Default is "Inbox.Sent".
; Return values .: Success: Chilkat AppendMail result. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI - Name keeps the current UDF spelling for compatibility.
; Related .......: __Chilkat_ConsoleWrite_IFNC, _Chilkat_IMAP_ListMailboxes, __Chilkat_LogOnError, __Chilkat_Log
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_IMAP_ApendEmail(ByRef $oIMAP, ByRef $oEmail, $sMailbox_name = "Inbox.Sent")
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	; https://www.example-code.com/autoit/sendWithCopyToSentMailbox.asp
	#CS
	'  The AppendMail method uploads an email to an IMAP server
	'  and saves it in the mailbox specified:
	success = imap.AppendMail("Inbox.Sent",email)
	If (success <> 1) Then
		__Chilkat_ConsoleWrite_IFNC(imap.LastErrorText)
		WScript.Quit
	End If
	#CE
;~ _Log_Info(@ScriptLineNumber & ' IMAP sent: ListMailboxes::' )
;~ 	_log(_Chilkat_IMAP_ListMailboxes($oIMAP, '', '*'))

	Local $iSuccess = $oIMAP.AppendMail($sMailbox_name, $oEmail)
;~ _Log_Info(@ScriptLineNumber & ' IMAP sent: ' & $sMailbox_name & '  == '  & $iSuccess & ' :: ' & $oIMAP.AppendUid)
	If @error Or $iSuccess <> 1 Then
		If $sMailbox_name = 'INBOX.Sent' Then
			$sMailbox_name = 'Sent'
			$oIMAP.AppendMail($sMailbox_name, $oEmail)
;~ _Log_Info(@ScriptLineNumber & ' IMAP sent: ' & $sMailbox_name & '  == '  & $iSuccess & ' :: ' & $oIMAP.AppendUid)
			__Chilkat_LogOnError(@ScriptLineNumber & ' Changing: INBOX.Sent > Sent', $oIMAP)
		ElseIf $sMailbox_name = 'Sent' Then
			$sMailbox_name = 'INBOX.Sent'
			$oIMAP.AppendMail($sMailbox_name, $oEmail)
;~ _Log_Info(@ScriptLineNumber & ' IMAP sent: ' & $sMailbox_name & '  == '  & $iSuccess & ' :: ' & $oIMAP.AppendUid)
			__Chilkat_LogOnError(@ScriptLineNumber & ' Changing: Sent > INBOX.Sent', $oIMAP)
		EndIf
	EndIf
;~ _Log_Info(@ScriptLineNumber & ' IMAP sent')
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' IMAP.AppendMail ', $oIMAP)
		Return SetError(@error, @extended, $iSuccess)
	EndIf

;~ _Log_Info(@ScriptLineNumber & ' IMAP sent')
	__Chilkat_Log(@ScriptLineNumber & " Mail saved to Mailbox=" & $sMailbox_name)
EndFunc   ;==>_Chilkat_IMAP_ApendEmail

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_IMAP_ConnectAndLogin
; Description ...: Creates a Chilkat Imap object, connects to an IMAP server, and logs in.
; Syntax ........: _Chilkat_IMAP_ConnectAndLogin($sIMAP_Login, $sIMAP_Password, $sIMAP_ServerName, $sIMAP_Port = 993)
; Parameters ....: $sIMAP_Login           - [in] optional IMAP login used for saving the sent message.
;                  $sIMAP_Password        - [in] optional IMAP password used for saving the sent message.
;                  $sIMAP_ServerName      - [in] IMAP server host name.
;                  $sIMAP_Port            - [in] IMAP server port. Default is 993.
; Return values .: Success: Chilkat Imap object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_IMAP_ObjCreate, __Chilkat_ConsoleWrite_IFNC, __Chilkat_LogOnError
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_IMAP_ConnectAndLogin($sIMAP_Login, $sIMAP_Password, $sIMAP_ServerName, $sIMAP_Port = 993)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/autoit/sendWithCopyToSentMailbox.asp
	Local $oIMAP = _Chilkat_IMAP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	#CS
		'  Connect to an IMAP server.
		'  Use TLS
		imap.Ssl = 1
		imap.Port = 993
		success = imap.Connect("mail.mydomain.com")
		If (success <> 1) Then
			__Chilkat_ConsoleWrite_IFNC(imap.LastErrorText)
			WScript.Quit
		End If
	#CE
;~ 	$oIMAP.Ssl = 1
	$oIMAP.StartTLS = 1
	$oIMAP.Port = $sIMAP_Port
;~ 	$oIMAP.Port = 993

	Local $iSuccess = $oIMAP.Connect($sIMAP_ServerName)
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' IMAP.Connect ', $oIMAP)
		Return SetError(@error, @extended, $iSuccess)
	EndIf

	#CS
	'  Login
	success = imap.Login("myLogin","myPassword")
	If (success <> 1) Then
		__Chilkat_ConsoleWrite_IFNC(imap.LastErrorText)
		WScript.Quit
	End If
	#CE
	$iSuccess = $oIMAP.Login($sIMAP_Login, $sIMAP_Password)
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' IMAP.Login ', $oIMAP)
		Return SetError(@error, @extended, $iSuccess)
	EndIf

	Return $oIMAP
EndFunc   ;==>_Chilkat_IMAP_ConnectAndLogin

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_IMAP_GetSentMailboxName
; Description ...: Detects a usable Sent mailbox name for the connected IMAP account.
; Syntax ........: _Chilkat_IMAP_GetSentMailboxName(ByRef $oIMAP)
; Parameters ....: $oIMAP                 - [in/out] Chilkat Imap object.
; Return values .: Success: detected Sent mailbox name. Failure: sets @error/@extended and returns empty string.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header modified by #AI
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_IMAP_GetSentMailboxName(ByRef $oIMAP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler
	If $oIMAP.GetMailboxStatus('Sent') Then
		Return 'Sent'
	ElseIf $oIMAP.GetMailboxStatus('INBOX.Sent') Then
		Return 'INBOX.Sent'
	ElseIf $oIMAP.GetMailboxStatus('SENT') Then
		Return 'SENT'
	ElseIf $oIMAP.GetMailboxStatus('INBOX.SENT') Then
		Return 'INBOX.SENT'
	Else
		Return SetError($CHILKAT_ERR_UNKNOWN, 0, '')
	EndIf
EndFunc   ;==>_Chilkat_IMAP_GetSentMailboxName

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_IMAP_ListMailboxes
; Description ...: Lists IMAP mailboxes matching the supplied reference name and wildcard.
; Syntax ........: _Chilkat_IMAP_ListMailboxes(ByRef $oIMAP, $s_refName = '', $s_wildcardedMailbox = "*")
; Parameters ....: $oIMAP                 - [in/out] Chilkat Imap object.
;                  $s_refName             - [in] IMAP reference name. Default is ''.
;                  $s_wildcardedMailbox   - [in] IMAP wildcard mailbox pattern. Default is "*".
; Return values .: Success: Chilkat Mailboxes object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_ObjName_FlagsValue, __Chilkat_LogOnError, __Chilkat_ConsoleWrite_IFNC
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_IMAP_ListMailboxes(ByRef $oIMAP, $s_refName = '', $s_wildcardedMailbox = "*")
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/autoit/imap_listMailboxes.asp
	; The ListMailboxes method returns a Mailboxes object
	; that contains the collection of mailboxes.
	; It accepts two arguments: a $s_refName and a $s_wildcardedMailbox.

	; $s_refName is usually set to an empty string.
	; A non-empty reference name argument is the name of a mailbox or a level of
	; mailbox hierarchy, and indicates the context in which the mailbox
	; name is interpreted.

	; Select all mailboxes matching this pattern:  $s_wildcardedMailbox = "*"

	; mboxes is a Chilkat_9_5_0.Mailboxes
	_Chilkat_ObjName_FlagsValue($oIMAP, @ScriptLineNumber)
	$oIMAP.VerboseLogging = 1
	Local $oMBoxes = $oIMAP.ListMailboxes($s_refName, $s_wildcardedMailbox)
	Local $iError = @error
	Local $iLMS = $oIMAP.LastMethodSuccess
	If $iError Or $iLMS = 0 Or IsObj($oMBoxes) = 0 Then
		__Chilkat_LogOnError(@ScriptLineNumber & ' Can not get Mailboxes')
		If Not @Compiled Then _Chilkat_ObjName_FlagsValue($oMBoxes, @ScriptLineNumber)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' _Chilkat_IMAP_ListMailboxes:')
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' $s_refName = ' & $s_refName)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' $s_wildcardedMailbox = ' & $s_wildcardedMailbox)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' LMS: ' & $iLMS)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' LRC: ' & $oIMAP.LastResponseCode)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' LIR: ' & $oIMAP.LastIntermediateResponse)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' SM: ' & $oIMAP.SelectedMailbox)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' SL: ' & $oIMAP.SessionLog)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' TLSV: ' & $oIMAP.TlsVersion)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' ' & 'IsObj($oMBoxes)=' & IsObj($oMBoxes))
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' ' & 'VarGetType($oMBoxes)=' & VarGetType($oMBoxes))
		$oIMAP.VerboseLogging = 0
;~ 		Return SetError($CHILKAT_ERR_GENERAL, @extended, $oMBoxes)

	EndIf
	$oIMAP.VerboseLogging = 0

	Local $s_ListOfMBoxes = ''
	For $iMBox_idx = 0 To $oMBoxes.Count
		$s_ListOfMBoxes &= $oMBoxes.GetName($iMBox_idx) & @CRLF
	Next

	__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' _Chilkat_IMAP_ListMailboxes: $s_ListOfMBoxes:' & @CRLF & $s_ListOfMBoxes)
	Return $s_ListOfMBoxes

EndFunc   ;==>_Chilkat_IMAP_ListMailboxes

#EndRegion ; _Chilkat_IMAP_**

#Region ; _Chilkat_MAILBOXES_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_MAILBOXES_ObjCreate
; Description ...: Creates a Chilkat Mailboxes COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_MAILBOXES_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Mailboxes object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatMailboxesRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_MAILBOXES_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_MAILBOXES)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_MAILBOXES_ObjCreate

#EndRegion ; _Chilkat_MAILBOXES_**

#Region ; _Chilkat_MAILMAN_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_MAILMAN_ObjCreate
; Description ...: Creates and optionally initializes a Chilkat MailMan object for SMTP sending.
; Syntax ........: _Chilkat_MAILMAN_ObjCreate($s_Username = '', $s_Password = '', $s_SmtpServer = '', $s_SMTP_PORT = 465, $s_SSL = 1)
; Parameters ....: $s_Username            - [in] SMTP username. Default is ''.
;                  $s_Password            - [in] SMTP password. Default is ''.
;                  $s_SmtpServer          - [in] SMTP server host name. Default is ''.
;                  $s_SMTP_PORT           - [in] SMTP server port. Default is 465.
;                  $s_SSL                 - [in] flag enabling SMTP SSL/TLS. Default is 1.
; Return values .: Success: Chilkat MailMan object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat MailMan object was introduced in version 9.5.0.49.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatMailManRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_MAILMAN_ObjCreate($s_Username = '', $s_Password = '', $s_SmtpServer = '', $s_SMTP_PORT = 465, $s_SSL = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oMailMan = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_MAILMAN)
	If @error Then Return SetError(@error, @extended, $oMailMan)

	If $s_Username = '' Then Return SetError(@error, @extended, $oMailMan)

	;  Set the SMTP server.
	$oMailMan.SmtpHost = $s_SmtpServer
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	;  Set the SMTP login/password (if required)
	$oMailMan.SmtpUsername = $s_Username
	$oMailMan.SmtpPassword = $s_Password

	;  Connect to SMTP port 465 using TLS.
	$oMailMan.SmtpPort = $s_SMTP_PORT
;~ 	$oMailMan.SmtpSsl = $s_SSL
	$oMailMan.StartTLS = $s_SSL

	Return SetError(@error, @extended, $oMailMan)
EndFunc   ;==>_Chilkat_MAILMAN_ObjCreate

#EndRegion ; _Chilkat_MAILMAN_**

#Region ; _Chilkat_EMAIL_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EMAIL_ObjCreate
; Description ...: Creates and optionally initializes a Chilkat Email object.
; Syntax ........: _Chilkat_EMAIL_ObjCreate($s_FromAddress = '', $s_ToAddress = '', $s_Subject = '', $s_Body = '', $s_ReplyTo = '', $i_Importance = 3, $s_UserAgent = @ScriptName, $s_Charset = 'utf-8')
; Parameters ....: $s_FromAddress         - [in] sender email address. Default is ''.
;                  $s_ToAddress           - [in] recipient email address list separated by commas. Default is ''.
;                  $s_Subject             - [in] email subject. Default is ''.
;                  $s_Body                - [in] email body. Default is ''.
;                  $s_ReplyTo             - [in] Reply-To address. Default is ''.
;                  $i_Importance          - [in] email importance value. Default is 3.
;                  $s_UserAgent           - [in] User-Agent header value stored in the email object. Default is @ScriptName.
;                  $s_Charset             - [in] email charset value. Default is 'utf-8'.
; Return values .: Success: Chilkat Email object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Email object was introduced in version 9.5.0.57.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatEmailRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EMAIL_ObjCreate($s_FromAddress = '', $s_ToAddress = '', $s_Subject = '', $s_Body = '', $s_ReplyTo = '', $i_Importance = 3, $s_UserAgent = @ScriptName, $s_Charset = 'utf-8')
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oEmail = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_EMAIL)
	If @error Then Return SetError(@error, @extended, $oEmail)

	If $s_FromAddress = '' Then Return SetError(@error, @extended, $oEmail)

	$oEmail.Subject = $s_Subject

	Local $a_ToAddress = StringSplit($s_ToAddress, ',')
	For $iEmail_idx = 1 To $a_ToAddress[0]
		$oEmail.AddTo("", $a_ToAddress[$iEmail_idx])
	Next

	$oEmail.From = $s_FromAddress
	$oEmail.Body = $s_Body
	$oEmail.Charset = $s_Charset
	;  To add more recipients, call AddTo, AddCC, or AddBcc once per recipient.

	Switch $i_Importance
		Case 1
			$oEmail.AddHeaderField("X-Priority", "1 (High)")
		Case 3
			$oEmail.AddHeaderField("X-Priority", "3 (Normal)")
		Case 5
			$oEmail.AddHeaderField("X-Priority", "5 (Low)")
		Case Else
			$oEmail.AddHeaderField("X-Priority", "3 (Normal)")
	EndSwitch
	$oEmail.AddHeaderField("User-Agent", $s_UserAgent)

	$oEmail.ReplyTo = $s_ReplyTo ; Sets the "Reply-To" header field to the specified email address.
	$oEmail.ReturnReceipt = 0 ; Set to 1 if you want the email to request a return-receipt when received by the recipient. The default value is 0.

	Return SetError(@error, @extended, $oEmail)
EndFunc   ;==>_Chilkat_EMAIL_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EMAIL_AddFileAttachment
; Description ...: Adds one or more file attachments to a Chilkat Email object.
; Syntax ........: _Chilkat_EMAIL_AddFileAttachment(ByRef $oEmail, $s_Attachments)
; Parameters ....: $oEmail                - [in/out] Chilkat Email object.
;                  $s_Attachments         - [in] semicolon-separated attachment list or a one-column array.
; Return values .: Success: no explicit return. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_LogOnError
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EMAIL_AddFileAttachment(ByRef $oEmail, $s_Attachments)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler
	;  Add some attachments.
	;  The AddFileAttachment method returns the value of the content-type it chose for the attachment.

	Local $a_Attachment_FilesList
	If IsString($s_Attachments) Then
		$a_Attachment_FilesList = StringSplit($s_Attachments, ';')
	ElseIf UBound($s_Attachments, $UBOUND_ROWS) And UBound($s_Attachments, $UBOUND_COLUMNS) = 1 Then
		$a_Attachment_FilesList = $s_Attachments
	ElseIf $s_Attachments = Default Then
		; @TODO ?
	Else
		; @TODO ?
	EndIf

	If Not ($s_Attachments = Default Or $s_Attachments = '') Then
		Local $iContentType
		#forceref $iContentType
		For $iAttachment_idx = 1 To $a_Attachment_FilesList[0]
			$iContentType = $oEmail.AddFileAttachment($a_Attachment_FilesList[$iAttachment_idx])
			If @error Or ($oEmail.LastMethodSuccess <> 1) Then
				If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
				__Chilkat_LogOnError(@ScriptLineNumber & ' AddFileAttachment: ' & $a_Attachment_FilesList[$iAttachment_idx], $oEmail)
				Return ; @TODO - refactoring
			EndIf
		Next
	EndIf
EndFunc   ;==>_Chilkat_EMAIL_AddFileAttachment

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EMAIL_SendEmail
; Description ...: Sends a prepared Chilkat Email object by using a Chilkat MailMan object.
; Syntax ........: _Chilkat_EMAIL_SendEmail(ByRef $oMailMan, ByRef $oEmail)
; Parameters ....: $oMailMan              - [in/out] Chilkat MailMan object.
;                  $oEmail                - [in/out] Chilkat Email object.
; Return values .: Success: no explicit return. Failure: returns Chilkat failure value and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: __Chilkat_LogOnError
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EMAIL_SendEmail(ByRef $oMailMan, ByRef $oEmail)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	;  Call SendEmail to connect to the SMTP server and send.
	;  The connection (i.e. session) to the SMTP server remains open
	;  so that subsequent SendEmail calls may use the same connection.
	Local $iSuccess = $oMailMan.SendEmail($oEmail)
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' MailMan.SendEmail ', $oMailMan)
		Return SetError(@error, @extended, $iSuccess)
;~ 		Return SetError($CHILKAT_ERR_MAILMAN_0, @extended, $CHILKAT_RET_FAILURE) ; @TODO - refactoring
	EndIf

	Return ; @TODO - refactoring ?
EndFunc   ;==>_Chilkat_EMAIL_SendEmail

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EMAIL_SendSingleMail
; Description ...: Builds and sends one email, with optional attachments, EML save, and IMAP Sent copy.
; Syntax ........: _Chilkat_EMAIL_SendSingleMail($s_From_CommonName, $s_FromAddress, $s_ToAddress, $s_Subject, $s_Body, $s_Attachments, $s_ReplyTo, $s_Username, $s_Password, $s_SmtpServer, $s_SMTP_PORT = 465, $s_SSL = 1, $i_Importance = 3, $s_UserAgent = @ScriptName, $sIMAP_Login = '', $sIMAP_Password = '', $sIMAP_ServerName = '', $sIMAP_Port = 993, $s_Sent_Mailbox_Name = Default, $s_SaveEML_FFP = '')
; Parameters ....: $s_From_CommonName     - [in] sender display name.
;                  $s_FromAddress         - [in] sender email address.
;                  $s_ToAddress           - [in] recipient email address list separated by commas.
;                  $s_Subject             - [in] email subject.
;                  $s_Body                - [in] email body.
;                  $s_Attachments         - [in] semicolon-separated attachment list or a one-column array.
;                  $s_ReplyTo             - [in] Reply-To address.
;                  $s_Username            - [in] SMTP username.
;                  $s_Password            - [in] SMTP password.
;                  $s_SmtpServer          - [in] SMTP server host name.
;                  $s_SMTP_PORT           - [in] SMTP server port. Default is 465.
;                  $s_SSL                 - [in] flag enabling SMTP SSL/TLS. Default is 1.
;                  $i_Importance          - [in] email importance value. Default is 3.
;                  $s_UserAgent           - [in] User-Agent header value stored in the email object. Default is @ScriptName.
;                  $sIMAP_Login           - [in] optional IMAP login used for saving the sent message. Default is ''.
;                  $sIMAP_Password        - [in] optional IMAP password used for saving the sent message. Default is ''.
;                  $sIMAP_ServerName      - [in] IMAP server host name. Default is ''.
;                  $sIMAP_Port            - [in] IMAP server port. Default is 993.
;                  $s_Sent_Mailbox_Name   - [in] optional Sent mailbox name; Default auto-detects it.
;                  $s_SaveEML_FFP         - [in] optional full path where the generated EML is saved. Default is ''.
; Return values .: Success: MIME binary data. Failure: $CHILKAT_RET_FAILURE or empty string and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_MAILMAN_ObjCreate, __Chilkat_LogOnError, _Chilkat_EMAIL_ObjCreate, _Chilkat_EMAIL_AddFileAttachment, _Chilkat_EMAIL_SendEmail, __Chilkat_Log, __Chilkat_ConsoleWrite_IFNC, _Chilkat_IMAP_ConnectAndLogin, _Chilkat_IMAP_GetSentMailboxName, _Chilkat_IMAP_ApendEmail
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EMAIL_SendSingleMail($s_From_CommonName, $s_FromAddress, $s_ToAddress, $s_Subject, $s_Body, $s_Attachments, $s_ReplyTo, $s_Username, $s_Password, $s_SmtpServer, $s_SMTP_PORT = 465, $s_SSL = 1, $i_Importance = 3, $s_UserAgent = @ScriptName, $sIMAP_Login = '', $sIMAP_Password = '', $sIMAP_ServerName = '', $sIMAP_Port = 993, $s_Sent_Mailbox_Name = Default, $s_SaveEML_FFP = '')

	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If $s_Attachments <> '' And Not FileExists($s_Attachments) Then _
			Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)

	If IsString($s_From_CommonName) And StringLen($s_From_CommonName) > 0 Then
		$s_FromAddress = '"' & $s_From_CommonName & '" <' & $s_FromAddress & '>'
	Else
	EndIf

	Local $oMailMan = _Chilkat_MAILMAN_ObjCreate($s_Username, $s_Password, $s_SmtpServer, $s_SMTP_PORT, $s_SSL)
	__Chilkat_LogOnError(@ScriptLineNumber & ' _Chilkat_EMAIL_SendSingleMail 1 ', $oMailMan)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	;  Create a new email object
	Local $oEmail = _Chilkat_EMAIL_ObjCreate($s_FromAddress, $s_ToAddress, $s_Subject, $s_Body, $s_ReplyTo, $i_Importance, $s_UserAgent, 'utf-8')
	__Chilkat_LogOnError(@ScriptLineNumber & ' _Chilkat_EMAIL_SendSingleMail  2', $oMailMan)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $s_Attachments <> '' Then
		_Chilkat_EMAIL_AddFileAttachment($oEmail, $s_Attachments)
		__Chilkat_LogOnError(@ScriptLineNumber & ' _Chilkat_EMAIL_SendSingleMail 3 ', $oMailMan)
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	_Chilkat_EMAIL_SendEmail($oMailMan, $oEmail)
	__Chilkat_LogOnError(@ScriptLineNumber & ' _Chilkat_EMAIL_SendSingleMail 4 ', $oMailMan)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	__Chilkat_Log(@ScriptLineNumber & ' Mail with attachments sent!')

	If $s_SaveEML_FFP <> '' Then
		__Chilkat_ConsoleWrite_IFNC('---> @error=' & @error & '  @extended=' & @extended & '  @ScriptLineNumber=' & @ScriptLineNumber & ' : IFNC: Chilkat.au3' & @CRLF)
		__Chilkat_LogOnError(@ScriptLineNumber & " Save result = " & $oEmail.SaveEML($s_SaveEML_FFP))
		__Chilkat_ConsoleWrite_IFNC('---> @error=' & @error & '  @extended=' & @extended & '  @ScriptLineNumber=' & @ScriptLineNumber & ' : IFNC: Chilkat.au3' & @CRLF)
	EndIf

	Local $vReturn = '', $iErr, $iExt
	If $sIMAP_Login <> '' Then
		Local $oIMAP = _Chilkat_IMAP_ConnectAndLogin($sIMAP_Login, $sIMAP_Password, $sIMAP_ServerName, $sIMAP_Port)
		__Chilkat_LogOnError(@ScriptLineNumber & ' _Chilkat_EMAIL_SendSingleMail 5 ', $oMailMan)
		If @error Then Return SetError(@error, @extended, '')

		If $s_Sent_Mailbox_Name = Default Then $s_Sent_Mailbox_Name = _Chilkat_IMAP_GetSentMailboxName($oIMAP)
		__Chilkat_Log(@ScriptLineNumber & ' "SENT" Mailbox name = ' & $s_Sent_Mailbox_Name)
		$iErr = @error
		$iExt = @extended
		If Not @error Then
			$vReturn = _Chilkat_IMAP_ApendEmail($oIMAP, $oEmail, $s_Sent_Mailbox_Name)
			__Chilkat_LogOnError(@ScriptLineNumber & ' _Chilkat_EMAIL_SendSingleMail 6', $oMailMan)
			$iErr = @error
			$iExt = @extended
		EndIf
		$oIMAP.Disconnect()
	EndIf

	Local $iSuccess_CloseConnection = $oMailMan.CloseSmtpConnection()
	If $iErr Then Return SetError($iErr, $iExt, $vReturn)

	If @error Or $iSuccess_CloseConnection <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' MailMan.CloseSmtpConnection ', $oMailMan)
		Return SetError(@error, @extended, $iSuccess_CloseConnection)
	EndIf

	Return SetError(@error, @extended, $oEmail.GetMimeBinary())
EndFunc   ;==>_Chilkat_EMAIL_SendSingleMail

#EndRegion ; _Chilkat_EMAIL_**

#Region ; _Chilkat_ZIP_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ObjCreate
; Description ...: Creates a Chilkat Zip COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ZIP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Zip object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIP_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_AddEntryBinary
; Description ...: Adds or replaces one ZIP entry from an AutoIt binary Variant in an already-open Zip object.
; Syntax ........: _Chilkat_ZIP_AddEntryBinary(ByRef $oZIP, $sPathInZip, ByRef $dEntryBinaryData, $bReplaceExisting = 1)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] path/name to store inside the ZIP.
;                  $dEntryBinaryData      - [in/out] bytes to store in the ZIP entry.
;                  $bReplaceExisting      - [in] when 1, replace existing entry contents if the same path exists. Default is 1.
; Return values .: Success: Chilkat ZipEntry object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses ZipEntry.ReplaceData() when replacing; uses Zip.AppendBd() for Chilkat v10-compatible in-memory append.
; Related .......: _Chilkat_ZIP_NewInMemory, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_AddEntryBinary(ByRef $oZIP, $sPathInZip, ByRef $dEntryBinaryData, $bReplaceExisting = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPathInZip) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sPathInZip, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oEntry = 0
	If $bReplaceExisting Then
		$oEntry = $oZIP.GetEntryByName($sPathInZip)
		If IsObj($oEntry) Then
			Local $iReplaced = $oEntry.ReplaceData($dEntryBinaryData)
			If $iReplaced = 0 Then
				__Chilkat_LogOnError('_Chilkat_ZIP_AddEntryBinary() ZipEntry.ReplaceData()', $oEntry, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
				Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
			EndIf
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oEntry)
		EndIf
	EndIf

	Local $oEntryData = _Chilkat_BINDATA_FromBinary($dEntryBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oEntry = $oZIP.AppendBd($sPathInZip, $oEntryData)
	If Not IsObj($oEntry) Then
		__Chilkat_LogOnError('_Chilkat_ZIP_AddEntryBinary() Zip.AppendBd()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oEntry)
EndFunc   ;==>_Chilkat_ZIP_AddEntryBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_AddFiles
; Description ...: Appends files matched by a pattern to an already-open Chilkat Zip object.
; Syntax ........: _Chilkat_ZIP_AddFiles(ByRef $oZIP, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sFilePattern          - [in] wildcard pattern.
;                  $bRecurse              - [in] include subdirectories. Default is 0.
;                  $sAppendFromDir        - [in] optional base directory to strip from stored names.
;                  $bDiscardPaths         - [in] optional discard stored paths flag.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The ZIP is not written until _Chilkat_ZIP_SaveAndClose() or a Chilkat Write* method is called.
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_SaveAndClose
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_AddFiles(ByRef $oZIP, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFilePattern) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sFilePattern, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	If $sAppendFromDir <> Default Then $oZIP.AppendFromDir = $sAppendFromDir
	If $bDiscardPaths <> Default Then $oZIP.DiscardPaths = $bDiscardPaths ? 1 : 0

	Local $iSuccess = $oZIP.AppendFiles($sFilePattern, $bRecurse ? 1 : 0)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_AddFiles() Zip.AppendFiles()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_AddFiles

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Binary_AddEntry
; Description ...: Convenience wrapper that adds/replaces one entry in binary ZIP data and returns modified ZIP bytes.
; Syntax ........: _Chilkat_ZIP_Binary_AddEntry(ByRef $dZipBinaryData, $sPathInZip, ByRef $dEntryBinaryData, $sDecryptPassword = Default, $bReplaceExisting = 1)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sPathInZip            - [in] path/name to store inside the ZIP.
;                  $dEntryBinaryData      - [in/out] bytes to store in the ZIP entry.
;                  $sDecryptPassword      - [in] optional ZIP password.
;                  $bReplaceExisting      - [in] when 1, replace existing entry contents. Default is 1.
; Return values .: Success: modified ZIP bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> add/replace -> Binary.
; Related .......: _Chilkat_ZIP_AddEntryBinary, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Binary_AddEntry(ByRef $dZipBinaryData, $sPathInZip, ByRef $dEntryBinaryData, $sDecryptPassword = Default, $bReplaceExisting = 1)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oEntry = _Chilkat_ZIP_AddEntryBinary($oZIP, $sPathInZip, $dEntryBinaryData, $bReplaceExisting)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	#forceref $oEntry

	Local $dModifiedZipBinaryData = _Chilkat_ZIP_ObjectToBinary($oZIP)
	Return SetError(@error, @extended, $dModifiedZipBinaryData)
EndFunc   ;==>_Chilkat_ZIP_Binary_AddEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Binary_DeleteEntry
; Description ...: Convenience wrapper that removes one entry from binary ZIP data and returns modified ZIP bytes.
; Syntax ........: _Chilkat_ZIP_Binary_DeleteEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: modified ZIP bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> delete -> Binary.
; Related .......: _Chilkat_ZIP_DeleteEntry, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Binary_DeleteEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = _Chilkat_ZIP_DeleteEntry($oZIP, $sPathInZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	#forceref $iSuccess

	Local $dModifiedZipBinaryData = _Chilkat_ZIP_ObjectToBinary($oZIP)
	Return SetError(@error, @extended, $dModifiedZipBinaryData)
EndFunc   ;==>_Chilkat_ZIP_Binary_DeleteEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Binary_GetEntry
; Description ...: Convenience wrapper that extracts one entry from binary ZIP data and returns the entry bytes.
; Syntax ........: _Chilkat_ZIP_Binary_GetEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: uncompressed entry bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> entry binary.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_GetEntryBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipEntryRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Binary_GetEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $dEntryBinaryData = _Chilkat_ZIP_GetEntryBinary($oZIP, $sPathInZip)
	Return SetError(@error, @extended, $dEntryBinaryData)
EndFunc   ;==>_Chilkat_ZIP_Binary_GetEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_CreateFromPattern
; Description ...: Creates a ZIP archive from one or more files matched by a file pattern.
; Syntax ........: _Chilkat_ZIP_CreateFromPattern($sZipFileFullPath, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default, $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
; Parameters ....: $sZipFileFullPath      - [in] output ZIP file path.
;                  $sFilePattern          - [in] wildcard pattern, for example "C:\data\*.pdf".
;                  $bRecurse              - [in] include subdirectories. Default is 0.
;                  $sAppendFromDir        - [in] optional base directory to strip from stored names.
;                  $bDiscardPaths         - [in] optional discard stored paths flag.
;                  $sEncryptPassword      - [in] optional password. When set, AES encryption is enabled by default.
;                  $iEncryption           - [in] optional Chilkat ZIP encryption mode. Default is 4 (AES) when a password is supplied.
;                  $iEncryptKeyLength     - [in] optional encryption key length. Default is 256.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses NewZip, AppendFiles and WriteZipAndClose.
; Related .......: _Chilkat_ZIP_ObjCreate, _Chilkat_ZIP_Open
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_CreateFromPattern($sZipFileFullPath, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default, $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sZipFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFilePattern) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sZipFileFullPath, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If StringStripWS($sFilePattern, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.NewZip($sZipFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_CreateFromPattern() Zip.NewZip()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	If $sAppendFromDir <> Default Then $oZIP.AppendFromDir = $sAppendFromDir
	If $bDiscardPaths <> Default Then $oZIP.DiscardPaths = $bDiscardPaths ? 1 : 0

	If $sEncryptPassword <> Default And $sEncryptPassword <> '' Then
		$oZIP.EncryptPassword = $sEncryptPassword
		$oZIP.Encryption = ($iEncryption = Default) ? 4 : $iEncryption
		$oZIP.EncryptKeyLength = $iEncryptKeyLength
	EndIf

	$iSuccess = $oZIP.AppendFiles($sFilePattern, $bRecurse ? 1 : 0)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_CreateFromPattern() Zip.AppendFiles()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oZIP.WriteZipAndClose()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_CreateFromPattern() Zip.WriteZipAndClose()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_CreateFromPattern

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_DeleteEntry
; Description ...: Removes one ZIP entry from an already-open Zip object.
; Syntax ........: _Chilkat_ZIP_DeleteEntry(ByRef $oZIP, $sPathInZip)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The modified ZIP is not serialized until _Chilkat_ZIP_ObjectToBinary() or Write* is called.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_DeleteEntry(ByRef $oZIP, $sPathInZip)
	Local $oEntry = _Chilkat_ZIP_GetEntry($oZIP, $sPathInZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.DeleteEntry($oEntry)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_DeleteEntry() Zip.DeleteEntry()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_DeleteEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ExtractAll
; Description ...: Extracts all files from a ZIP archive.
; Syntax ........: _Chilkat_ZIP_ExtractAll($sZipFileFullPath, $sDestDir, $sDecryptPassword = Default, $bFlatten = 0)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDestDir              - [in] destination directory.
;                  $sDecryptPassword      - [in] optional ZIP password.
;                  $bFlatten              - [in] when 1, extracts into one directory without recreating stored paths.
; Return values .: Success: number of files extracted. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Unzip() or UnzipInto().
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_ExtractMatching
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ExtractAll($sZipFileFullPath, $sDestDir, $sDecryptPassword = Default, $bFlatten = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sDestDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not FileExists($sDestDir) Then DirCreate($sDestDir)
	If Not FileExists($sDestDir) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iUnzipped = $bFlatten ? $oZIP.UnzipInto($sDestDir) : $oZIP.Unzip($sDestDir)
	If $iUnzipped < 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_ExtractAll() Zip.Unzip/UnzipInto()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $iUnzipped)
EndFunc   ;==>_Chilkat_ZIP_ExtractAll

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ExtractMatching
; Description ...: Extracts files matching a pattern from a ZIP archive.
; Syntax ........: _Chilkat_ZIP_ExtractMatching($sZipFileFullPath, $sDestDir, $sPattern = "*", $sDecryptPassword = Default, $bFlatten = 0, $bVerbose = 0)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDestDir              - [in] destination directory.
;                  $sPattern              - [in] wildcard pattern inside ZIP. Default is "*".
;                  $sDecryptPassword      - [in] optional ZIP password.
;                  $bFlatten              - [in] when 1, extracts into one directory without recreating stored paths.
;                  $bVerbose              - [in] Chilkat verbose flag for matching extraction.
; Return values .: Success: number of files extracted. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses UnzipMatching().
; Related .......: _Chilkat_ZIP_ExtractAll
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ExtractMatching($sZipFileFullPath, $sDestDir, $sPattern = "*", $sDecryptPassword = Default, $bFlatten = 0, $bVerbose = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sDestDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sPattern) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	If Not FileExists($sDestDir) Then DirCreate($sDestDir)
	If Not FileExists($sDestDir) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iUnzipped = $oZIP.UnzipMatching($sDestDir, $sPattern, $bFlatten ? 1 : 0, $bVerbose ? 1 : 0)
	If $iUnzipped < 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_ExtractMatching() Zip.UnzipMatching()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $iUnzipped)
EndFunc   ;==>_Chilkat_ZIP_ExtractMatching

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_GetEntry
; Description ...: Returns a ZipEntry object by exact stored path from an already-open Zip object.
; Syntax ........: _Chilkat_ZIP_GetEntry(ByRef $oZIP, $sPathInZip)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
; Return values .: Success: Chilkat ZipEntry object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses GetEntryByName for Chilkat v10 compatibility; Chilkat v11 also provides EntryOf.
; Related .......: _Chilkat_ZIP_GetEntryBinary, _Chilkat_ZIP_DeleteEntry
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_GetEntry(ByRef $oZIP, $sPathInZip)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPathInZip) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sPathInZip, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oEntry = $oZIP.GetEntryByName($sPathInZip)
	If Not IsObj($oEntry) Then Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oEntry)
EndFunc   ;==>_Chilkat_ZIP_GetEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_GetEntryBinary
; Description ...: Extracts one ZIP entry from an already-open Zip object directly to an AutoIt binary Variant.
; Syntax ........: _Chilkat_ZIP_GetEntryBinary(ByRef $oZIP, $sPathInZip)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
; Return values .: Success: uncompressed entry bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses ZipEntry.UnzipToBd(), no filesystem output.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_GetEntry
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipEntryRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_GetEntryBinary(ByRef $oZIP, $sPathInZip)
	Local $oEntry = _Chilkat_ZIP_GetEntry($oZIP, $sPathInZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oEntry.UnzipToBd($oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_GetEntryBinary() ZipEntry.UnzipToBd()', $oEntry, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf

	Local $dEntryBinaryData = _Chilkat_BINDATA_ToBinary($oBinData)
	Return SetError(@error, @extended, $dEntryBinaryData)
EndFunc   ;==>_Chilkat_ZIP_GetEntryBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ListEntriesFromBinary_AsArray
; Description ...: Opens binary ZIP data and returns ZIP entries as a native AutoIt 2D array.
; Syntax ........: _Chilkat_ZIP_ListEntriesFromBinary_AsArray(ByRef $dZipBinaryData, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: 2D array [n][$CHILKAT_ZIP_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> native AutoIt array listing.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ListEntriesFromObject_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ListEntriesFromBinary_AsArray(ByRef $dZipBinaryData, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $aList = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	Return SetError(@error, @extended, $aList)
EndFunc   ;==>_Chilkat_ZIP_ListEntriesFromBinary_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ListEntriesFromFile_AsArray
; Description ...: Opens a ZIP archive from a filesystem path and returns ZIP entries as a native AutoIt 2D array.
; Syntax ........: _Chilkat_ZIP_ListEntriesFromFile_AsArray($sZipFileFullPath, $sDecryptPassword = Default)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: 2D array [n][$CHILKAT_ZIP_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns are described by $CHILKAT_ZIP_LIST_COL_* constants. No XML/JSON parsing is needed.
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_ListEntriesFromObject_AsArray, _Chilkat_ZIP_ListEntriesFromBinary_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ListEntriesFromFile_AsArray($sZipFileFullPath, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $aList = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	Return SetError(@error, @extended, $aList)
EndFunc   ;==>_Chilkat_ZIP_ListEntriesFromFile_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ListEntriesFromObject_AsArray
; Description ...: Returns entries from an already-open Chilkat Zip object as a native AutoIt 2D array.
; Syntax ........: _Chilkat_ZIP_ListEntriesFromObject_AsArray(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: 2D array [n][$CHILKAT_ZIP_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns: INDEX, PATH, ISDIR, UNCOMPRESSED_SIZE, COMPRESSED_SIZE, MODIFIED, CRC, AES, ENTRY_TYPE, COMMENT.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ListEntriesFromFile_AsArray, _Chilkat_ZIP_ListEntriesFromBinary_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ListEntriesFromObject_AsArray(ByRef $oZIP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $iCount = $oZIP.NumEntries
	Local $aList[$iCount][$CHILKAT_ZIP_LIST_COL_COUNT]
	For $i = 0 To $iCount - 1
		Local $oEntry = $oZIP.GetEntryByIndex($i)
		If Not IsObj($oEntry) Then
			__Chilkat_LogOnError('_Chilkat_ZIP_ListEntriesFromObject_AsArray() Zip.GetEntryByIndex()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		$aList[$i][$CHILKAT_ZIP_LIST_COL_INDEX] = $i
		$aList[$i][$CHILKAT_ZIP_LIST_COL_PATH] = $oEntry.FileName
		$aList[$i][$CHILKAT_ZIP_LIST_COL_ISDIR] = $oEntry.IsDirectory
		$aList[$i][$CHILKAT_ZIP_LIST_COL_UNCOMPRESSED_SIZE] = $oEntry.UncompressedLengthStr
		$aList[$i][$CHILKAT_ZIP_LIST_COL_COMPRESSED_SIZE] = $oEntry.CompressedLengthStr
		$aList[$i][$CHILKAT_ZIP_LIST_COL_MODIFIED] = $oEntry.FileDateTimeStr
		$aList[$i][$CHILKAT_ZIP_LIST_COL_CRC] = $oEntry.Crc
		$aList[$i][$CHILKAT_ZIP_LIST_COL_AES] = $oEntry.IsAesEncrypted
		$aList[$i][$CHILKAT_ZIP_LIST_COL_ENTRY_TYPE] = $oEntry.EntryType
		$aList[$i][$CHILKAT_ZIP_LIST_COL_COMMENT] = $oEntry.Comment
	Next

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aList)
EndFunc   ;==>_Chilkat_ZIP_ListEntriesFromObject_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_NewInMemory
; Description ...: Creates a new empty ZIP object intended to be written to BinData/binary instead of a filesystem file.
; Syntax ........: _Chilkat_ZIP_NewInMemory($sVirtualZipName = "memory.zip", $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
; Parameters ....: $sVirtualZipName       - [in] virtual ZIP filename used by Chilkat metadata. Default is "memory.zip".
;                  $sEncryptPassword      - [in] optional password for new entries.
;                  $iEncryption           - [in] optional Chilkat ZIP encryption mode. Default is 4 (AES) when password is supplied.
;                  $iEncryptKeyLength     - [in] optional encryption key length. Default is 256.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Use _Chilkat_ZIP_ObjectToBinary() or _Chilkat_ZIP_ObjectToBinData() to obtain final bytes.
; Related .......: _Chilkat_ZIP_AddEntryBinary, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_NewInMemory($sVirtualZipName = "memory.zip", $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sVirtualZipName) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If StringStripWS($sVirtualZipName, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then $sVirtualZipName = 'memory.zip'

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.NewZip($sVirtualZipName)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_NewInMemory() Zip.NewZip()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	If $sEncryptPassword <> Default And $sEncryptPassword <> '' Then
		$oZIP.EncryptPassword = $sEncryptPassword
		$oZIP.Encryption = ($iEncryption = Default) ? 4 : $iEncryption
		$oZIP.EncryptKeyLength = $iEncryptKeyLength
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oZIP)
EndFunc   ;==>_Chilkat_ZIP_NewInMemory

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ObjectToBinary
; Description ...: Writes a Chilkat Zip object to an AutoIt binary Variant without using a filesystem file.
; Syntax ........: _Chilkat_ZIP_ObjectToBinary(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: binary ZIP bytes. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the ZIP Object -> Binary step.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ObjectToBinData
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ObjectToBinary(ByRef $oZIP)
	Local $oBinData = _Chilkat_ZIP_ObjectToBinData($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dZipBinaryData = _Chilkat_BINDATA_ToBinary($oBinData)
	Return SetError(@error, @extended, $dZipBinaryData)
EndFunc   ;==>_Chilkat_ZIP_ObjectToBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ObjectToBinData
; Description ...: Writes a Chilkat Zip object to a Chilkat BinData object without using a filesystem file.
; Syntax ........: _Chilkat_ZIP_ObjectToBinData(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: Chilkat BinData object with ZIP bytes. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the ZIP Object -> BinData step. The ZIP object remains usable after WriteBd().
; Related .......: _Chilkat_ZIP_ObjectToBinary, _Chilkat_ZIP_OpenFromBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ObjectToBinData(ByRef $oZIP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.WriteBd($oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_ObjectToBinData() Zip.WriteBd()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oBinData)
EndFunc   ;==>_Chilkat_ZIP_ObjectToBinData

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Open
; Description ...: Opens an existing ZIP archive and optionally sets the decryption password.
; Syntax ........: _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword = Default)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Caller is responsible for Save/Close when modifying the archive.
; Related .......: _Chilkat_ZIP_SaveAndClose, _Chilkat_ZIP_AddFiles
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sZipFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not FileExists($sZipFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $sDecryptPassword <> Default And $sDecryptPassword <> '' Then $oZIP.DecryptPassword = $sDecryptPassword
	Local $iSuccess = $oZIP.OpenZip($sZipFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_Open() Zip.OpenZip()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oZIP)
EndFunc   ;==>_Chilkat_ZIP_Open

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_OpenFromBinary
; Description ...: Opens a ZIP archive from an AutoIt binary Variant and returns a Chilkat Zip object.
; Syntax ........: _Chilkat_ZIP_OpenFromBinary(ByRef $dZipBinaryData, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes from database, HTTP, FTP, etc.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the Binary -> ZIP Object step. The ZIP is processed in memory through BinData/OpenBd.
; Related .......: _Chilkat_ZIP_ObjectToBinary, _Chilkat_ZIP_ListEntriesFromObject_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_OpenFromBinary(ByRef $dZipBinaryData, $sDecryptPassword = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oBinData = _Chilkat_BINDATA_FromBinary($dZipBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $sDecryptPassword <> Default And $sDecryptPassword <> '' Then
		$oZIP.DecryptPassword = $sDecryptPassword
		$oZIP.EncryptPassword = $sDecryptPassword
	EndIf

	Local $iSuccess = $oZIP.OpenBd($oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_OpenFromBinary() Zip.OpenBd()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oZIP)
EndFunc   ;==>_Chilkat_ZIP_OpenFromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_SaveAndClose
; Description ...: Writes ZIP changes to disk and closes the archive.
; Syntax ........: _Chilkat_ZIP_SaveAndClose(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses WriteZipAndClose().
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_AddFiles
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_SaveAndClose(ByRef $oZIP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oZIP.WriteZipAndClose()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_SaveAndClose() Zip.WriteZipAndClose()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_SaveAndClose

#EndRegion ; _Chilkat_ZIP_**

#Region ; _Chilkat_ZIPCRC_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIPCRC_ObjCreate
; Description ...: Creates a Chilkat ZipCrc COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ZIPCRC_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat ZipCrc object was introduced in version 9.5.0.75.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipCrcRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIPCRC_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIPCRC)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIPCRC_ObjCreate

#EndRegion ; _Chilkat_ZIPCRC_**

#Region ; _Chilkat_ZIPENTRY_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIPENTRY_ObjCreate
; Description ...: Creates a Chilkat ZipEntry COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ZIPENTRY_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat ZipEntry object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipEntryRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIPENTRY_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIPENTRY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIPENTRY_ObjCreate

#EndRegion ; _Chilkat_ZIPENTRY_**

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

#EndRegion ; _Chilkat_HTTP_**

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

#Region ; _Chilkat_Cert_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_ObjCreate
; Description ...: Creates a Chilkat Cert COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Cert_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Cert object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CERT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Cert_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: __Chilkat_Cert_NormalizeFingerprint
; Description ...: Normalizes a certificate fingerprint for exact comparisons.
; Syntax ........: __Chilkat_Cert_NormalizeFingerprint($sFingerprint)
; Parameters ....: $sFingerprint          - [in] certificate fingerprint string.
; Return values .: Uppercase fingerprint without whitespace.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The fingerprint is used only as a stable certificate identifier, not as a trust decision.
; Related .......: __Chilkat_CertStore_GetCertByFingerprint, __Chilkat_Cert_SelectFingerprintFromArray
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func __Chilkat_Cert_NormalizeFingerprint($sFingerprint)
	If Not IsString($sFingerprint) Then Return ''
	Return StringUpper(StringStripWS($sFingerprint, $STR_STRIPALL))
EndFunc   ;==>__Chilkat_Cert_NormalizeFingerprint

; #FUNCTION# ====================================================================================================================
; Name ..........: __Chilkat_Cert_GetPINRequestSummary
; Description ...: Builds a readable summary of the selected certificate for the smart-card PIN prompt.
; Syntax ........: __Chilkat_Cert_GetPINRequestSummary(ByRef $oCert)
; Parameters ....: $oCert                 - [in/out] selected Chilkat Cert object.
; Return values .: Success: certificate summary string. Failure: empty string and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Includes subject, issuer, serial number, validity dates and the complete SHA-1 fingerprint.
; Related .......: __Chilkat_PIN_Request, _Chilkat_Cert_LoadFromSmartCardEx
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func __Chilkat_Cert_GetPINRequestSummary(ByRef $oCert)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, '')

	Local $sSubject = $oCert.SubjectCN
	If $sSubject = '' Then $sSubject = $oCert.SubjectDN
	If $sSubject = '' Then $sSubject = 'selected smart-card certificate'

	Local $sSummary = $sSubject
	If $oCert.IssuerCN <> '' Then $sSummary &= @CRLF & 'Issuer: ' & $oCert.IssuerCN
	If $oCert.SerialNumber <> '' Then $sSummary &= @CRLF & 'Serial number: ' & $oCert.SerialNumber
	If $oCert.ValidFromStr <> '' Then $sSummary &= @CRLF & 'Valid from: ' & $oCert.ValidFromStr
	If $oCert.ValidToStr <> '' Then $sSummary &= @CRLF & 'Valid to: ' & $oCert.ValidToStr
	If $oCert.Sha1Thumbprint <> '' Then $sSummary &= @CRLF & 'Fingerprint: ' & $oCert.Sha1Thumbprint

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $sSummary)
EndFunc   ;==>__Chilkat_Cert_GetPINRequestSummary

; #FUNCTION# ====================================================================================================================
; Name ..........: __Chilkat_PIN_Request
; Description ...: Requests a smart-card PIN and identifies the certificate for which the PIN is required.
; Syntax ........: __Chilkat_PIN_Request($sCertSummary = '', $sComment = '')
; Parameters ....: $sCertSummary          - [in] readable summary of the selected certificate.
;                  $sComment              - [in] optional operation description displayed in the dialog title.
; Return values .: Success: entered PIN. Failure/cancel: empty string and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The PIN is returned to the caller and must not be logged or persisted.
; Related .......: __Chilkat_Cert_GetPINRequestSummary, _Chilkat_Cert_LoadFromSmartCardEx
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func __Chilkat_PIN_Request($sCertSummary = '', $sComment = '')
	; Compatibility with older examples that passed @ScriptLineNumber as the first argument.
	If IsNumber($sCertSummary) Then
		If $sComment = '' Then $sComment = 'script line ' & $sCertSummary
		$sCertSummary = ''
	EndIf

	If $sCertSummary = Default Or $sCertSummary = '' Then $sCertSummary = 'selected smart-card certificate'
	If $sComment = Default Then $sComment = ''

	Local $sPIN = InputBox('Chilkat smart-card PIN : ' & $sComment, _
			'Enter PIN for certificate:' & @CRLF & @CRLF & $sCertSummary, '', '*')
	If @error Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $sPIN)
EndFunc   ;==>__Chilkat_PIN_Request

; #FUNCTION# ====================================================================================================================
; Name ..........: __Chilkat_Cert_SelectFingerprintFromArray
; Description ...: Displays valid smart-card certificates in a ListView and returns the fingerprint selected by the user.
; Syntax ........: __Chilkat_Cert_SelectFingerprintFromArray(ByRef $aCerts)
; Parameters ....: $aCerts                - [in/out] certificate metadata array using $CHILKAT_CERT_LIST_COL_* columns.
; Return values .: Success: complete SHA-1 fingerprint. Failure/cancel: empty string and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The ListView row is only a UI position. The returned complete fingerprint identifies the selected certificate.
; Related .......: _Chilkat_CertStore_ListValidCertificates_AsArray, __Chilkat_CertStore_GetCertByFingerprint
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func __Chilkat_Cert_SelectFingerprintFromArray(ByRef $aCerts)
	If Not IsArray($aCerts) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, '')
	If UBound($aCerts, 0) <> 2 Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, '')
	If UBound($aCerts, 2) < $CHILKAT_CERT_LIST_COL_COUNT Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, '')

	Local $iRows = UBound($aCerts, 1)
	If $iRows < 1 Then Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, '')

	Local $hGUI = GUICreate('Chilkat smart-card certificate selection', 1280, 570, -1, -1, _
			BitOR($WS_CAPTION, $WS_MINIMIZEBOX, $WS_SYSMENU))
	If $hGUI = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')

	GUICtrlCreateLabel('Select the certificate to use, then click "Use selected certificate".', 12, 12, 900, 20)

	Local $idListView = GUICtrlCreateListView( _
			'Name|Issuer|Valid from|Valid to|Fingerprint|Serial number|Qualified type', _
			10, 38, 1260, 470, _
			BitOR($LVS_REPORT, $LVS_SINGLESEL, $LVS_SHOWSELALWAYS))
	If $idListView = 0 Then
		GUIDelete($hGUI)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')
	EndIf

	Local $hListView = GUICtrlGetHandle($idListView)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES))

	Local $aListViewItemID[$iRows]
	For $iRow = 0 To $iRows - 1
		Local $sName = $aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SUBJECT_CN]
		If $sName = '' Then $sName = $aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SUBJECT_DN]
		If $sName = '' Then $sName = 'Unnamed certificate'

		Local $sIssuer = $aCerts[$iRow][$CHILKAT_CERT_LIST_COL_ISSUER_CN]
		If $sIssuer = '' Then $sIssuer = $aCerts[$iRow][$CHILKAT_CERT_LIST_COL_ISSUER_DN]

		$sName = StringReplace(StringReplace($sName, @CRLF, ' '), '|', '/')
		$sIssuer = StringReplace(StringReplace($sIssuer, @CRLF, ' '), '|', '/')

		Local $idItem = GUICtrlCreateListViewItem( _
				$sName & '|' & _
				$sIssuer & '|' & _
				$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_VALID_FROM] & '|' & _
				$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_VALID_TO] & '|' & _
				$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SHA1] & '|' & _
				$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_SERIAL] & '|' & _
				$aCerts[$iRow][$CHILKAT_CERT_LIST_COL_QUALIFIED_TYPE], _
				$idListView)
		If $idItem = 0 Then
			GUIDelete($hGUI)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')
		EndIf
		$aListViewItemID[$iRow] = $idItem
	Next

	_GUICtrlListView_SetColumnWidth($hListView, 0, 190)
	_GUICtrlListView_SetColumnWidth($hListView, 1, 180)
	_GUICtrlListView_SetColumnWidth($hListView, 2, 145)
	_GUICtrlListView_SetColumnWidth($hListView, 3, 145)
	_GUICtrlListView_SetColumnWidth($hListView, 4, 300)
	_GUICtrlListView_SetColumnWidth($hListView, 5, 150)
	_GUICtrlListView_SetColumnWidth($hListView, 6, 130)

	_GUICtrlListView_SetItemSelected($hListView, 0, True, True)
	_GUICtrlListView_SetSelectionMark($hListView, 0)
	_GUICtrlListView_EnsureVisible($hListView, 0)

	Local $idSelect = GUICtrlCreateButton('Use selected certificate', 875, 522, 230, 34)
	Local $idCancel = GUICtrlCreateButton('Cancel', 1120, 522, 150, 34)

	GUISetState(@SW_SHOW, $hGUI)

	Local $iLastSelectedRow = 0
	While 1
		Local $iGUIMessage = GUIGetMsg()

		; Remember the row clicked by the user. GUICtrlCreateListViewItem() creates
		; a separate control ID for every row.
		For $iRow = 0 To $iRows - 1
			If $iGUIMessage = $aListViewItemID[$iRow] Then
				$iLastSelectedRow = $iRow
				ExitLoop
			EndIf
		Next

		Switch $iGUIMessage
			Case $idSelect
				; SelectionMark is reliable after the ListView loses focus to the button.
				Local $iSelectedRow = _GUICtrlListView_GetSelectionMark($hListView)

				; Fallback for controls/providers that do not update SelectionMark.
				If $iSelectedRow < 0 Or $iSelectedRow >= $iRows Then _
					$iSelectedRow = _GUICtrlListView_GetNextItem($hListView, -1, $LVNI_SELECTED)

				; Final fallback: use the last ListViewItem control clicked by the user.
				If $iSelectedRow < 0 Or $iSelectedRow >= $iRows Then $iSelectedRow = $iLastSelectedRow

				If $iSelectedRow < 0 Or $iSelectedRow >= $iRows Then
					MsgBox($MB_ICONWARNING, 'Chilkat smart-card certificate selection', 'Select a certificate from the list.')
					ContinueLoop
				EndIf

				Local $sFingerprint = __Chilkat_Cert_NormalizeFingerprint($aCerts[$iSelectedRow][$CHILKAT_CERT_LIST_COL_SHA1])
				If $sFingerprint = '' Then
					MsgBox($MB_ICONWARNING, 'Chilkat smart-card certificate selection', 'The selected certificate does not have a valid fingerprint.')
					ContinueLoop
				EndIf

				GUIDelete($hGUI)
				Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $sFingerprint)

			Case $idCancel, $GUI_EVENT_CLOSE
				GUIDelete($hGUI)
				Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')
		EndSwitch
	WEnd
EndFunc   ;==>__Chilkat_Cert_SelectFingerprintFromArray

; #FUNCTION# ====================================================================================================================
; Name ..........: __Chilkat_CertStore_GetCertByFingerprint
; Description ...: Retrieves a certificate from an open CertStore by its complete SHA-1 fingerprint.
; Syntax ........: __Chilkat_CertStore_GetCertByFingerprint(ByRef $oCertStore, $sFingerprint)
; Parameters ....: $oCertStore            - [in/out] open Chilkat CertStore object.
;                  $sFingerprint          - [in] complete certificate SHA-1 fingerprint.
; Return values .: Success: matching Chilkat Cert object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Compares normalized complete fingerprints; partial fingerprint matching is not used.
; Related .......: __Chilkat_Cert_NormalizeFingerprint, __Chilkat_Cert_SelectFingerprintFromArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertStoreRef.html
; Example .......: No
; ===============================================================================================================================
Func __Chilkat_CertStore_GetCertByFingerprint(ByRef $oCertStore, $sFingerprint)
	If Not IsObj($oCertStore) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $sExpectedFingerprint = __Chilkat_Cert_NormalizeFingerprint($sFingerprint)
	If $sExpectedFingerprint = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	For $iCertIndex = 0 To $oCertStore.NumCertificates - 1
		Local $oCert = _Chilkat_Cert_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

		Local $iSuccess = $oCertStore.GetCert($iCertIndex, $oCert)
		If $iSuccess = 0 Then ContinueLoop

		If __Chilkat_Cert_NormalizeFingerprint($oCert.Sha1Thumbprint) = $sExpectedFingerprint Then _
				Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oCert)
	Next

	Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
EndFunc   ;==>__Chilkat_CertStore_GetCertByFingerprint

; #FUNCTION# ====================================================================================================================
; Name ..........: __Chilkat_Cert_LoadFromSmartCardStoreEx
; Description ...: Lists valid signing certificates from a smart card, lets the user select one, and configures its PIN.
; Syntax ........: __Chilkat_Cert_LoadFromSmartCardStoreEx($s_CspName = '', $s_PIN = Default, $bNoDialog = Default, $sPINComment = '')
; Parameters ....: $s_CspName             - [in] optional CSP/provider name. Empty string lets Chilkat choose.
;                  $s_PIN                 - [in] optional PIN. Default or empty requests the PIN after certificate selection.
;                  $bNoDialog             - [in] optional SmartCardNoDialog value applied to the selected Cert object.
;                  $sPINComment           - [in] optional operation description for the PIN dialog title.
; Return values .: Success: selected Chilkat Cert object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Selection is performed from an AutoIt metadata array and resolved back to the CertStore by full fingerprint.
; Related .......: _Chilkat_CertStore_ListValidCertificates_AsArray, __Chilkat_Cert_SelectFingerprintFromArray, __Chilkat_PIN_Request
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertStoreRef.html
; Example .......: No
; ===============================================================================================================================
Func __Chilkat_Cert_LoadFromSmartCardStoreEx($s_CspName = '', $s_PIN = Default, $bNoDialog = Default, $sPINComment = '')
	Local $oErrorHandler = ObjEvent('AutoIt.Error', __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oCertStore = _Chilkat_CertStore_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $s_PIN <> Default And $s_PIN <> '' Then $oCertStore.SmartCardPin = $s_PIN

	Local $iSuccess = $oCertStore.OpenSmartcard($s_CspName)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('__Chilkat_Cert_LoadFromSmartCardStoreEx() CertStore.OpenSmartcard()', $oCertStore, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $aCerts = _Chilkat_CertStore_ListValidCertificates_AsArray($oCertStore, 1)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If UBound($aCerts, 1) = 0 Then
		__Chilkat_Log('__Chilkat_Cert_LoadFromSmartCardStoreEx(): no currently valid smart-card certificate with a private key was found.')
		Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sSelectedFingerprint = __Chilkat_Cert_SelectFingerprintFromArray($aCerts)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oCert = __Chilkat_CertStore_GetCertByFingerprint($oCertStore, $sSelectedFingerprint)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $bNoDialog <> Default Then $oCert.SmartCardNoDialog = $bNoDialog ? 1 : 0

	Local $sEffectivePIN = $s_PIN
	If $sEffectivePIN = Default Or $sEffectivePIN = '' Then
		Local $sCertSummary = __Chilkat_Cert_GetPINRequestSummary($oCert)
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

		$sEffectivePIN = __Chilkat_PIN_Request($sCertSummary, $sPINComment)
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	$oCert.SmartCardPin = $sEffectivePIN
	$sEffectivePIN = ''

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oCert)
EndFunc   ;==>__Chilkat_Cert_LoadFromSmartCardStoreEx

Func __Chilkat_Cert_QualifiedPolicyOidFromXml($sXml)
	If Not IsString($sXml) Or $sXml = '' Then Return ''
	If StringInStr($sXml, '0.4.0.194112.1.2') Then Return '0.4.0.194112.1.2'
	If StringInStr($sXml, '0.4.0.194112.1.3') Then Return '0.4.0.194112.1.3'
	If StringInStr($sXml, '0.4.0.194112.1.0') Then Return '0.4.0.194112.1.0'
	If StringInStr($sXml, '0.4.0.194112.1.1') Then Return '0.4.0.194112.1.1'
	If StringInStr($sXml, '0.4.0.194112.1.4') Then Return '0.4.0.194112.1.4'
	If StringInStr($sXml, '0.4.0.194112.1.5') Then Return '0.4.0.194112.1.5'
	If StringInStr($sXml, '0.4.0.194112.1.6') Then Return '0.4.0.194112.1.6'
	Return ''
EndFunc   ;==>__Chilkat_Cert_QualifiedPolicyOidFromXml

Func __Chilkat_Cert_QualifiedTypeFromOid($sOid)
	Switch $sOid
		Case '0.4.0.194112.1.0'
			Return 'QCP-n'
		Case '0.4.0.194112.1.1'
			Return 'QCP-l'
		Case '0.4.0.194112.1.2'
			Return 'QCP-n-qscd'
		Case '0.4.0.194112.1.3'
			Return 'QCP-l-qscd'
		Case '0.4.0.194112.1.4'
			Return 'QCP-w'
		Case '0.4.0.194112.1.5'
			Return 'QNCP-w'
		Case '0.4.0.194112.1.6'
			Return 'QNCP-w-gen'
	EndSwitch
	Return ''
EndFunc   ;==>__Chilkat_Cert_QualifiedTypeFromOid

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_DateValidation_AsArray
; Description ...: Validates certificate validity period against current UTC time and returns details as a native AutoIt array.
; Syntax ........: _Chilkat_Cert_DateValidation_AsArray(ByRef $oCert, $sNowUtcCalc = Default)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
;                  $sNowUtcCalc           - [in] optional UTC time in YYYY/MM/DD HH:MM:SS for testing; Default = current UTC.
; Return values .: Success: 1D array [$CHILKAT_CERT_DATE_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: ValidFromStr/ValidToStr returned by Chilkat are GMT/UTC RFC822 strings.
; Related .......: _Chilkat_Cert_IsDateValidNow
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_DateValidation_AsArray(ByRef $oCert, $sNowUtcCalc = Default)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $sValidFromRaw = $oCert.ValidFromStr
	Local $sValidToRaw = $oCert.ValidToStr
	Local $sValidFromUtc = __Chilkat_Rfc822GmtToCalc($sValidFromRaw)
	Local $sValidToUtc = __Chilkat_Rfc822GmtToCalc($sValidToRaw)
	If $sValidFromUtc = '' Or $sValidToUtc = '' Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	If $sNowUtcCalc = Default Or $sNowUtcCalc = '' Then $sNowUtcCalc = __Chilkat_NowCalcUtc()
	If Not IsString($sNowUtcCalc) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $aInfo[$CHILKAT_CERT_DATE_COL_COUNT]
	$aInfo[$CHILKAT_CERT_DATE_COL_NOT_BEFORE_OK] = ($sNowUtcCalc >= $sValidFromUtc) ? 1 : 0
	$aInfo[$CHILKAT_CERT_DATE_COL_NOT_AFTER_OK] = ($sNowUtcCalc <= $sValidToUtc) ? 1 : 0
	$aInfo[$CHILKAT_CERT_DATE_COL_VALID_NOW] = ($aInfo[$CHILKAT_CERT_DATE_COL_NOT_BEFORE_OK] And $aInfo[$CHILKAT_CERT_DATE_COL_NOT_AFTER_OK]) ? 1 : 0
	$aInfo[$CHILKAT_CERT_DATE_COL_VALID_FROM_UTC] = $sValidFromUtc
	$aInfo[$CHILKAT_CERT_DATE_COL_VALID_TO_UTC] = $sValidToUtc
	$aInfo[$CHILKAT_CERT_DATE_COL_NOW_UTC] = $sNowUtcCalc
	$aInfo[$CHILKAT_CERT_DATE_COL_VALID_FROM_RAW] = $sValidFromRaw
	$aInfo[$CHILKAT_CERT_DATE_COL_VALID_TO_RAW] = $sValidToRaw
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aInfo)
EndFunc   ;==>_Chilkat_Cert_DateValidation_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_GetQualifiedPolicyOid
; Description ...: Returns a known EU qualified certificate policy OID from the certificate policy extension.
; Syntax ........: _Chilkat_Cert_GetQualifiedPolicyOid(ByRef $oCert)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
; Return values .: Success: policy OID or empty string. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is policy-OID recognition, not full EU Trusted List / revocation validation.
; Related .......: _Chilkat_Cert_GetQualifiedType, _Chilkat_Cert_IsQualified_ByPolicy
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_GetQualifiedPolicyOid(ByRef $oCert)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $sPolicyXml = $oCert.GetExtensionAsXml('2.5.29.32')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, __Chilkat_Cert_QualifiedPolicyOidFromXml($sPolicyXml))
EndFunc   ;==>_Chilkat_Cert_GetQualifiedPolicyOid

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_GetQualifiedType
; Description ...: Classifies a certificate by known EU qualified certificate policy OID.
; Syntax ........: _Chilkat_Cert_GetQualifiedType(ByRef $oCert)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
; Return values .: Success: QCP-n, QCP-l, QCP-n-qscd, QCP-l-qscd, QCP-w, QNCP-w, QNCP-w-gen, NONQUALIFIED or UNKNOWN.
;                  Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: UNKNOWN means the certificate policy extension was not available/readable. NONQUALIFIED means no known qualified policy OID was found.
; Related .......: _Chilkat_Cert_GetQualifiedPolicyOid, _Chilkat_Cert_IsQualified_ByPolicy
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_GetQualifiedType(ByRef $oCert)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $sPolicyXml = $oCert.GetExtensionAsXml('2.5.29.32')
	If Not IsString($sPolicyXml) Or $sPolicyXml = '' Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'UNKNOWN')
	Local $sOid = __Chilkat_Cert_QualifiedPolicyOidFromXml($sPolicyXml)
	If $sOid = '' Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'NONQUALIFIED')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, __Chilkat_Cert_QualifiedTypeFromOid($sOid))
EndFunc   ;==>_Chilkat_Cert_GetQualifiedType

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_Info_AsArray
; Description ...: Returns metadata for a single Chilkat Cert object as a native AutoIt 2D array with one row.
; Syntax ........: _Chilkat_Cert_Info_AsArray(ByRef $oCert)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
; Return values .: Success: 2D array [1][$CHILKAT_CERT_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the same columns as PKCS11 certificate listing.
; Related .......: _Chilkat_PKCS11_ListCerts_AsArray, _Chilkat_Cert_GetQualifiedType, _Chilkat_Cert_DateValidation_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_Info_AsArray(ByRef $oCert)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $aCert[1][$CHILKAT_CERT_LIST_COL_COUNT]
	__Chilkat_Array_SetCertRow($aCert, 0, $oCert, 0)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aCert)
EndFunc   ;==>_Chilkat_Cert_Info_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_IsDateValidNow
; Description ...: Returns 1 if the current UTC time is within the certificate ValidFrom/ValidTo range.
; Syntax ........: _Chilkat_Cert_IsDateValidNow(ByRef $oCert, $sNowUtcCalc = Default)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
;                  $sNowUtcCalc           - [in] optional UTC time in YYYY/MM/DD HH:MM:SS for testing; Default = current UTC.
; Return values .: Success: 1 or 0. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Checks both not-before and not-after boundaries.
; Related .......: _Chilkat_Cert_DateValidation_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_IsDateValidNow(ByRef $oCert, $sNowUtcCalc = Default)
	Local $aInfo = _Chilkat_Cert_DateValidation_AsArray($oCert, $sNowUtcCalc)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aInfo[$CHILKAT_CERT_DATE_COL_VALID_NOW])
EndFunc   ;==>_Chilkat_Cert_IsDateValidNow

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_IsQualified_ByPolicy
; Description ...: Returns 1 when a known EU qualified certificate policy OID is present.
; Syntax ........: _Chilkat_Cert_IsQualified_ByPolicy(ByRef $oCert, $bRequireQSCD = 0)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
;                  $bRequireQSCD          - [in] when 1, returns 1 only for QCP-n-qscd or QCP-l-qscd.
; Return values .: Success: 1 or 0. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is policy-OID recognition, not full EU Trusted List / revocation validation.
; Related .......: _Chilkat_Cert_GetQualifiedType
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Cert_IsQualified_ByPolicy(ByRef $oCert, $bRequireQSCD = 0)
	Local $sType = _Chilkat_Cert_GetQualifiedType($oCert)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If $bRequireQSCD Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, (StringInStr($sType, 'qscd') > 0) ? 1 : 0)
	If $sType = 'UNKNOWN' Or $sType = 'NONQUALIFIED' Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 0)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 1)
EndFunc   ;==>_Chilkat_Cert_IsQualified_ByPolicy

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_LoadFromSmartCard
; Description ...: Loads a certificate from a smart card by using an optional CSP name.
; Syntax ........: _Chilkat_Cert_LoadFromSmartCard($s_CspName = '')
; Parameters ....: $s_CspName             - [in] optional CSP name or smart-card provider name. Default is ''.
; Return values .: Success: Chilkat Cert object. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_Cert_ObjCreate, __Chilkat_ConsoleWrite_IFNC
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Cert_LoadFromSmartCard($s_CspName = '')
;~ https://www.example-code.com/autoit/load_certificate_on_smartcard_in_reader.asp
;~ LoadFromSmartcard
;~ If the smartcard contains multiple certificates, this method arbitrarily picks one. To load a specific certificate, call CertStore.OpenSmartcard and then iterate over the certs to find the desired certificate.
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/autoit/load_certificate_on_smartcard_in_reader.asp
	Local $oCert = _Chilkat_Cert_ObjCreate()
	Local $iSuccess = $oCert.LoadFromSmartcard($s_CspName)
	If $iSuccess = 0 Then
		__Chilkat_ConsoleWrite_IFNC($oCert.LastErrorText)
		Return SetError(1)
	EndIf
	Return $oCert
EndFunc   ;==>_Chilkat_Cert_LoadFromSmartCard

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_LoadFromSmartCardEx
; Description ...: Selects a currently valid smart-card certificate with a private key and configures its PIN.
; Syntax ........: _Chilkat_Cert_LoadFromSmartCardEx($s_CspName = '', $s_PIN = Default, $bNoDialog = Default, $bRejectExpired = 1, $sPINComment = '')
; Parameters ....: $s_CspName             - [in] optional CSP/provider name. Empty string lets Chilkat choose.
;                  $s_PIN                 - [in] optional PIN. Default or empty requests the PIN after certificate selection.
;                  $bNoDialog             - [in] optional SmartCardNoDialog value applied to the selected Cert object.
;                  $bRejectExpired        - [in] when 1, lists only currently valid certificates and lets the user choose one. Default = 1.
;                  $sPINComment           - [in] optional operation description for the PIN dialog title.
; Return values .: Success: selected Chilkat Cert object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The default safe path uses CertStore.OpenSmartcard(), builds an AutoIt metadata array, and identifies the selected certificate by its full fingerprint.
;                  Pass $bRejectExpired = 0 only to retain the legacy Cert.LoadFromSmartcard() behavior, which may arbitrarily choose one certificate.
; Related .......: _Chilkat_CertStore_ListValidCertificates_AsArray, __Chilkat_Cert_GetPINRequestSummary, __Chilkat_PIN_Request
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Cert_LoadFromSmartCardEx($s_CspName = '', $s_PIN = Default, $bNoDialog = Default, $bRejectExpired = 1, $sPINComment = '')
	Local $oErrorHandler = ObjEvent('AutoIt.Error', __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If $bRejectExpired = Default Then $bRejectExpired = 1
	If $bRejectExpired Then Return __Chilkat_Cert_LoadFromSmartCardStoreEx($s_CspName, $s_PIN, $bNoDialog, $sPINComment)

	Local $oCert = _Chilkat_Cert_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $s_PIN <> Default And $s_PIN <> '' Then $oCert.SmartCardPin = $s_PIN
	If $bNoDialog <> Default Then $oCert.SmartCardNoDialog = $bNoDialog ? 1 : 0

	Local $iSuccess = $oCert.LoadFromSmartcard($s_CspName)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_Cert_LoadFromSmartCardEx() Cert.LoadFromSmartcard()', $oCert, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oCert)
EndFunc   ;==>_Chilkat_Cert_LoadFromSmartCardEx

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_ValidateSmartCard_PIN
; Description ...: Checks whether the supplied smart-card PIN is valid for a loaded smart-card certificate.
; Syntax ........: _Chilkat_Cert_ValidateSmartCard_PIN($s_CspName = '', $s_PIN = "000000")
; Parameters ....: $s_CspName             - [in] optional CSP name or smart-card provider name. Default is ''.
;                  $s_PIN                 - [in] smart-card PIN. Default is "000000".
; Return values .: Success: PIN validation result. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_Cert_LoadFromSmartCard, __Chilkat_ConsoleWrite_IFNC
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Cert_ValidateSmartCard_PIN($s_CspName = '', $s_PIN = "000000")
;~ 	https://www.example-code.com/autoit/check_smartcard_pin.asp
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oCert = _Chilkat_Cert_LoadFromSmartCard($s_CspName)
	If @error Then Return SetError(@error, @extended, $oCert)

	$oCert.SmartCardPin = $s_PIN

	; Check to see if the SmartCardPin property contains the valid PIN for the smartcard.
	Local $i_pinValid = $oCert.CheckSmartCardPin()
	If $i_pinValid < 0 Then
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " Unable to check the PIN validity")
		__Chilkat_ConsoleWrite_IFNC($oCert.LastErrorText)
		Return
	ElseIf $i_pinValid Then
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " PIN is valid")
	Else
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " PIN is invalid")
	EndIf
EndFunc   ;==>_Chilkat_Cert_ValidateSmartCard_PIN

#EndRegion ; _Chilkat_Cert_**

#Region ; _Chilkat_CertStore_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CertStore_ObjCreate
; Description ...: Creates a Chilkat CertStore COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CertStore_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat CertStore object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertStoreRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_CertStore_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CERTSTORE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CertStore_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CertStore_ListValidCertificates_AsArray
; Description ...: Lists currently valid certificates from an open smart-card CertStore as a native AutoIt 2D array.
; Syntax ........: _Chilkat_CertStore_ListValidCertificates_AsArray(ByRef $oCertStore, $bOnlyWithPrivateKey = 1)
; Parameters ....: $oCertStore            - [in/out] open Chilkat CertStore object.
;                  $bOnlyWithPrivateKey   - [in] when 1, includes only certificates with an available private key. Default = 1.
; Return values .: Success: 2D array [n][$CHILKAT_CERT_LIST_COL_COUNT], including an empty array when no match is found.
;                  Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns are described by $CHILKAT_CERT_LIST_COL_* constants and include names, issuer, serial, fingerprint, dates and key usage.
; Related .......: _Chilkat_Cert_Info_AsArray, _Chilkat_Cert_IsDateValidNow, __Chilkat_Cert_SelectFingerprintFromArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertStoreRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CertStore_ListValidCertificates_AsArray(ByRef $oCertStore, $bOnlyWithPrivateKey = 1)
	Local $oErrorHandler = ObjEvent('AutoIt.Error', __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oCertStore) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $iNumCerts = $oCertStore.NumCertificates
	If $iNumCerts < 1 Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, __Chilkat_Array_CreateEmpty2D($CHILKAT_CERT_LIST_COL_COUNT))

	Local $aCerts[$iNumCerts][$CHILKAT_CERT_LIST_COL_COUNT]
	Local $iOut = 0

	For $iStoreIndex = 0 To $iNumCerts - 1
		Local $oCert = _Chilkat_Cert_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

		Local $iSuccess = $oCertStore.GetCert($iStoreIndex, $oCert)
		If $iSuccess = 0 Then ContinueLoop
		If $bOnlyWithPrivateKey And $oCert.HasPrivateKey() <> 1 Then ContinueLoop
		If _Chilkat_Cert_IsDateValidNow($oCert) <> 1 Then ContinueLoop
		If __Chilkat_Cert_NormalizeFingerprint($oCert.Sha1Thumbprint) = '' Then ContinueLoop

		__Chilkat_Array_SetCertRow($aCerts, $iOut, $oCert, $iStoreIndex)
		$iOut += 1
	Next

	If $iOut = 0 Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, __Chilkat_Array_CreateEmpty2D($CHILKAT_CERT_LIST_COL_COUNT))

	ReDim $aCerts[$iOut][$CHILKAT_CERT_LIST_COL_COUNT]
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aCerts)
EndFunc   ;==>_Chilkat_CertStore_ListValidCertificates_AsArray

#EndRegion ; _Chilkat_CertStore_**

#Region ; _Chilkat_Csp_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Csp_ObjCreate
; Description ...: Creates a Chilkat Csp COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Csp_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Csp object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCspRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Csp_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CSP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Csp_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Csp_FindCertificate_OnSmartCard_InReader
; Description ...: Reserved helper for finding a certificate on a smart card in a reader.
; Syntax ........: _Chilkat_Csp_FindCertificate_OnSmartCard_InReader()
; Parameters ....: None
; Return values .: Currently no explicit return.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI - @WIP. Function body is currently a placeholder.
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Csp_FindCertificate_OnSmartCard_InReader()
	#REMARK ABOUT:   SmartCardNoDialog    https://www.chilkatsoft.com/refdoc/csCertRef.html#prop42

;~ 	https://www.example-code.com/autoit/find_certificate_on_smartcard_in_reader.asp
EndFunc   ;==>_Chilkat_Csp_FindCertificate_OnSmartCard_InReader

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Csp_GetProvidersList
; Description ...: Returns the list of CSP providers reported by Chilkat Csp.
; Syntax ........: _Chilkat_Csp_GetProvidersList()
; Parameters ....: None
; Return values .: Success: provider list string. Failure: no explicit return in the current implementation.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_Csp_ObjCreate, _Chilkat_StringTable_ObjCreate, __Chilkat_ConsoleWrite_IFNC
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Csp_GetProvidersList()
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler
;~ 	https://www.example-code.com/autoit/list_cryptographic_service_providers.asp
;~ Dim fso, outFile
;~ Set fso = CreateObject("Scripting.FileSystemObject")
;~ Set outFile = fso.CreateTextFile("output.txt", True)

;~ set csp = CreateObject("Chilkat_9_5_0.Csp")
;~ set st = CreateObject("Chilkat_9_5_0.StringTable")

	Local $oCsp = _Chilkat_Csp_ObjCreate()
	Local $oStringTable = _Chilkat_StringTable_ObjCreate()

	Local $iSuccess = $oCsp.GetProviders($oStringTable)
	If $iSuccess = 0 Then
		__Chilkat_ConsoleWrite_IFNC($oCsp.LastErrorText & ' : IFNC: Chilkat.au3')
		Return
	EndIf

	; Iterate over the CSP names..
	Local $iNumProviders = $oStringTable.Count
	Local $aProvidersList[$iNumProviders]
	For $i = 0 To $iNumProviders - 1
		$aProvidersList[$i] = $oStringTable.StringAt($i)
	Next
	Return $aProvidersList

	# Sample output:
	# 0: Microsoft Base Cryptographic Provider v1.0
	# 1: Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
	# 2: Microsoft Base DSS Cryptographic Provider
	# 3: Microsoft Base Smart Card Crypto Provider
	# 4: Microsoft DH SChannel Cryptographic Provider
	# 5: Microsoft Enhanced Cryptographic Provider v1.0
	# 6: Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
	# 7: Microsoft Enhanced RSA and AES Cryptographic Provider
	# 8: Microsoft RSA SChannel Cryptographic Provider
	# 9: Microsoft Strong Cryptographic Provider
EndFunc   ;==>_Chilkat_Csp_GetProvidersList

#EndRegion ; _Chilkat_Csp_**

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

#Region ; _Chilkat_Pdf_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Pdf_ObjCreate
; Description ...: Creates a Chilkat Pdf COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Pdf_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Pdf object was introduced in version 9.5.0.85.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Pdf_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PDF)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Pdf_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_CreateFromBD
; Description ...: Creates a Chilkat Pdf object and loads it from binary PDF data.
; Syntax ........: _Chilkat_PDF_CreateFromBD(ByRef $dBinaryData)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
; Return values .: Success: Chilkat Pdf object. Failure: returns Chilkat failure value and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_Pdf_ObjCreate, _Chilkat_BINDATA_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_CreateFromBD(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oPDF)
	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	$oBinData.AppendBinary($dBinaryData)
	Local $iSuccess = $oPDF.LoadBd($oBinData)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_GENERAL, 0, $iSuccess)

	Return $oPDF
EndFunc   ;==>_Chilkat_PDF_CreateFromBD

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_GetDSS_AsArray
; Description ...: Returns PDF DSS information as an AutoIt array placeholder.
; Syntax ........: _Chilkat_PDF_GetDSS_AsArray($sPDF_FileFullPath)
; Parameters ....: $sPDF_FileFullPath     - [in] full path to a PDF file.
; Return values .: Success: AutoIt array placeholder. Failure: sets @error/@extended where applicable.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI - @WIP. Current implementation returns a placeholder array variable.
; Related .......: _Chilkat_PDF_GetDSS_AsJson
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_GetDSS_AsArray($sPDF_FileFullPath)
;~ 	https://www.example-code.com/vbscript/pdf_dss.asp
	Local $oJSON = _Chilkat_PDF_GetDSS_AsJson($sPDF_FileFullPath)
	#forceref $oJSON
	#TODO Danyfirex
	Local $a_DSS_Result
	Return $a_DSS_Result
	#forceref $a_DSS_Result
EndFunc   ;==>_Chilkat_PDF_GetDSS_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_GetDSS_AsJson
; Description ...: Loads a PDF file and returns its DSS information as a Chilkat JsonObject.
; Syntax ........: _Chilkat_PDF_GetDSS_AsJson($sPDF_FileFullPath)
; Parameters ....: $sPDF_FileFullPath     - [in] full path to a PDF file.
; Return values .: Success: Chilkat JsonObject with DSS data. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_Pdf_ObjCreate, _Chilkat_JSON_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_GetDSS_AsJson($sPDF_FileFullPath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/autoit/pdf_dss.asp
	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oPDF)

	Local $iSuccess = $oPDF.LoadFile($sPDF_FileFullPath)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_GENERAL, 0, $iSuccess)

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, 0)

	$oJSON.EmitCompact = 0
	$iSuccess = $oPDF.GetDss($oJSON)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_GENERAL, 0, $iSuccess)

	Return $oJSON
EndFunc   ;==>_Chilkat_PDF_GetDSS_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_HasCertificationSig
; Description ...: Returns whether a loaded PDF object has a certification signature.
; Syntax ........: _Chilkat_PDF_HasCertificationSig(ByRef $oPDF)
; Parameters ....: $oPDF                  - [in/out] Chilkat Pdf object.
; Return values .: Success: 1 if a certification signature exists; otherwise 0.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header modified by #AI - PDF supports approval signatures and certification signatures. Certification signature is unique and must be the first signature in the document.
; Related .......:
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html#prop1
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_HasCertificationSig(ByRef $oPDF)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Return $oPDF.HasCertificationSig
EndFunc   ;==>_Chilkat_PDF_HasCertificationSig

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_HasCertificationSig_FromBinary
; Description ...: Returns whether binary PDF data contains a certification signature.
; Syntax ........: _Chilkat_PDF_HasCertificationSig_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
; Return values .: Success: 1 if a certification signature exists; otherwise 0. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header modified by #AI - PDF supports approval signatures and certification signatures. Certification signature is unique and must be the first signature in the document.
; Related .......: _Chilkat_PDF_CreateFromBD
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html#prop1
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_HasCertificationSig_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Return $oPDF.HasCertificationSig
EndFunc   ;==>_Chilkat_PDF_HasCertificationSig_FromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_LoadBD
; Description ...: Loads binary PDF data into an existing Chilkat Pdf object.
; Syntax ........: _Chilkat_PDF_LoadBD(ByRef $oPDF, ByRef $dBinaryData)
; Parameters ....: $oPDF                  - [in/out] Chilkat Pdf object.
;                  $dBinaryData           - [in/out] binary PDF data.
; Return values .: Success: Chilkat LoadBd result. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_BINDATA_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_LoadBD(ByRef $oPDF, ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oBinData)

	Local $iSuccess = $oBinData.AppendBinary($dBinaryData)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_GENERAL, 0, $iSuccess)

	$iSuccess = $oPDF.LoadBd($oBinData)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_GENERAL, 0, $iSuccess)
EndFunc   ;==>_Chilkat_PDF_LoadBD

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumEmbeddedFiles
; Description ...: Returns the number of embedded files in a loaded PDF object.
; Syntax ........: _Chilkat_PDF_NumEmbeddedFiles(ByRef $oPDF)
; Parameters ....: $oPDF                  - [in/out] Chilkat Pdf object.
; Return values .: Success: number of embedded files.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_NumEmbeddedFiles(ByRef $oPDF)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Return $oPDF.NumEmbeddedFiles
EndFunc   ;==>_Chilkat_PDF_NumEmbeddedFiles

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumEmbeddedFiles_FromBinary
; Description ...: Returns the number of embedded files in binary PDF data.
; Syntax ........: _Chilkat_PDF_NumEmbeddedFiles_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
; Return values .: Success: number of embedded files. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_PDF_CreateFromBD
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_NumEmbeddedFiles_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Return $oPDF.NumEmbeddedFiles
EndFunc   ;==>_Chilkat_PDF_NumEmbeddedFiles_FromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumPages
; Description ...: Returns the number of pages in a loaded PDF object.
; Syntax ........: _Chilkat_PDF_NumPages(ByRef $oPDF)
; Parameters ....: $oPDF                  - [in/out] Chilkat Pdf object.
; Return values .: Success: number of PDF pages.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_NumPages(ByRef $oPDF)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Return $oPDF.NumPages
EndFunc   ;==>_Chilkat_PDF_NumPages

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumPages_FromBinary
; Description ...: Returns the number of pages in binary PDF data.
; Syntax ........: _Chilkat_PDF_NumPages_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
; Return values .: Success: number of PDF pages. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_PDF_CreateFromBD
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_NumPages_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Return $oPDF.NumPages
EndFunc   ;==>_Chilkat_PDF_NumPages_FromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumSignatures
; Description ...: Returns the number of digital signatures in a loaded PDF object.
; Syntax ........: _Chilkat_PDF_NumSignatures(ByRef $oPDF)
; Parameters ....: $oPDF                  - [in/out] Chilkat Pdf object.
; Return values .: Success: number of digital signatures.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header modified by #AI
; Related .......:
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html#prop11
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_NumSignatures(ByRef $oPDF)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Return $oPDF.NumSignatures

EndFunc   ;==>_Chilkat_PDF_NumSignatures

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumSignatures_FromBinary
; Description ...: Returns the number of digital signatures in binary PDF data.
; Syntax ........: _Chilkat_PDF_NumSignatures_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
; Return values .: Success: number of digital signatures. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header modified by #AI
; Related .......: _Chilkat_PDF_CreateFromBD
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html#prop11
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_NumSignatures_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Return $oPDF.NumSignatures
EndFunc   ;==>_Chilkat_PDF_NumSignatures_FromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_OpenFromBinary
; Description ...: Creates a Chilkat Pdf object and loads it from binary PDF data.
; Syntax ........: _Chilkat_PDF_OpenFromBinary(ByRef $dPDF_BinaryData)
; Parameters ....: $dPDF_BinaryData       - [in/out] binary PDF bytes.
; Return values .: Success: Chilkat Pdf object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Robust Binary -> Pdf object helper using BinData/LoadBd.
; Related .......: _Chilkat_PDF_SignPAdES_Binary_ByCert, _Chilkat_PDF_VerifySignaturesInBinary_AsJson
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_OpenFromBinary(ByRef $dPDF_BinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oInputBd = _Chilkat_BINDATA_FromBinary($dPDF_BinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oPDF.LoadBd($oInputBd)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_OpenFromBinary() Pdf.LoadBd()', $oPDF, $CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oPDF)
EndFunc   ;==>_Chilkat_PDF_OpenFromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_PAdES_CreateOptions
; Description ...: Creates a JsonObject with default PAdES Baseline-B PDF signature options.
; Syntax ........: _Chilkat_PDF_PAdES_CreateOptions($iPage = 1, $sAppearanceX = "left", $sAppearanceY = "top", $sFontScale = "10.0", $sLine0 = "Digitally signed by: cert_cn", $sLine1 = "current_dt", $sLine2 = "", $sHashAlgorithm = "sha256", $sSigningAlgorithm = "pkcs", $bVisible = 1)
; Parameters ....: $iPage                 - [in] signature appearance page. Default is 1.
;                  $sAppearanceX          - [in] appearance X position. Default is "left".
;                  $sAppearanceY          - [in] appearance Y position. Default is "top".
;                  $sFontScale            - [in] appearance font scale. Default is "10.0".
;                  $sLine0                - [in] first appearance text line.
;                  $sLine1                - [in] second appearance text line.
;                  $sLine2                - [in] optional third appearance text line.
;                  $sHashAlgorithm        - [in] hash algorithm. Default is "sha256".
;                  $sSigningAlgorithm     - [in] signing algorithm. Default is "pkcs".
;                  $bVisible              - [in] create visible appearance fields. Default is 1.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Sets /ETSI.CAdES.detached and signingCertificateV2 for PAdES-style signing.
; Related .......: _Chilkat_PDF_SignPAdES_File_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_PAdES_CreateOptions($iPage = 1, $sAppearanceX = "left", $sAppearanceY = "top", $sFontScale = "10.0", $sLine0 = "Digitally signed by: cert_cn", $sLine1 = "current_dt", $sLine2 = "", $sHashAlgorithm = "sha256", $sSigningAlgorithm = "pkcs", $bVisible = 1)
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oJSON.EmitCompact = 0
	$oJSON.UpdateString("subFilter", "/ETSI.CAdES.detached")
	$oJSON.UpdateBool("signingCertificateV2", True)
	$oJSON.UpdateBool("signingTime", True)
	$oJSON.UpdateString("signingAlgorithm", $sSigningAlgorithm)
	$oJSON.UpdateString("hashAlgorithm", $sHashAlgorithm)

	If $bVisible Then
		$oJSON.UpdateInt("page", $iPage)
		$oJSON.UpdateString("appearance.y", $sAppearanceY)
		$oJSON.UpdateString("appearance.x", $sAppearanceX)
		$oJSON.UpdateString("appearance.fontScale", $sFontScale)
		$oJSON.UpdateString("appearance.text[0]", $sLine0)
		$oJSON.UpdateString("appearance.text[1]", $sLine1)
		If $sLine2 <> '' Then $oJSON.UpdateString("appearance.text[2]", $sLine2)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON)
EndFunc   ;==>_Chilkat_PDF_PAdES_CreateOptions

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_SignPAdES_Binary_ByCert
; Description ...: Signs binary PDF data as PAdES and returns signed PDF bytes.
; Syntax ........: _Chilkat_PDF_SignPAdES_Binary_ByCert(ByRef $dPDF_InputBinaryData, ByRef $oCert, $oJsonOptions = Default)
; Parameters ....: $dPDF_InputBinaryData  - [in/out] input PDF bytes.
;                  $oCert                 - [in/out] Chilkat Cert object with private-key access.
;                  $oJsonOptions          - [in] optional Chilkat JsonObject. If Default, _Chilkat_PDF_PAdES_CreateOptions() is used.
; Return values .: Success: signed PDF bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Binary PDF -> Pdf object -> signed PDF Binary using LoadBd/SetSigningCert/SignPdfBd.
; Related .......: _Chilkat_PDF_PAdES_CreateOptions, _Chilkat_PDF_SignPAdES_Binary_BySmartCard, _Chilkat_PDF_SignPAdES_Binary_ByPkcs11
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_SignPAdES_Binary_ByCert(ByRef $dPDF_InputBinaryData, ByRef $oCert, $oJsonOptions = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oOptions = 0
	If $oJsonOptions = Default Then
		$oOptions = _Chilkat_PDF_PAdES_CreateOptions()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Else
		If Not IsObj($oJsonOptions) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		$oOptions = $oJsonOptions
	EndIf

	Local $oPDF = _Chilkat_PDF_OpenFromBinary($dPDF_InputBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oPDF.SetSigningCert($oCert)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_SignPAdES_Binary_ByCert() Pdf.SetSigningCert()', $oPDF, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oOutputBd = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$iSuccess = $oPDF.SignPdfBd($oOptions, $oOutputBd)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_SignPAdES_Binary_ByCert() Pdf.SignPdfBd()', $oPDF, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $dSignedPdfBinaryData = _Chilkat_BINDATA_ToBinary($oOutputBd)
	Return SetError(@error, @extended, $dSignedPdfBinaryData)
EndFunc   ;==>_Chilkat_PDF_SignPAdES_Binary_ByCert

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_SignPAdES_Binary_ByPkcs11
; Description ...: Signs binary PDF data as PAdES using a PKCS11 token/HSM and returns signed PDF bytes.
; Syntax ........: _Chilkat_PDF_SignPAdES_Binary_ByPkcs11(ByRef $dPDF_InputBinaryData, $sPkcs11DllFullPath, $sPIN, $iUserType = 1, $oJsonOptions = Default)
; Parameters ....: $dPDF_InputBinaryData  - [in/out] input PDF bytes.
;                  $sPkcs11DllFullPath    - [in] PKCS11 shared library path.
;                  $sPIN                  - [in] PKCS11 user PIN.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
;                  $oJsonOptions          - [in] optional Chilkat JsonObject.
; Return values .: Success: signed PDF bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Opens a PKCS11 session, finds the first certificate with private key, signs, then closes the session.
; Related .......: _Chilkat_PKCS11_OpenSession, _Chilkat_PKCS11_FindCertWithPrivateKey, _Chilkat_PDF_SignPAdES_Binary_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_SignPAdES_Binary_ByPkcs11(ByRef $dPDF_InputBinaryData, $sPkcs11DllFullPath, $sPin, $iUserType = 1, $oJsonOptions = Default)
	Local $oPkcs11 = _Chilkat_PKCS11_OpenSession($sPkcs11DllFullPath, $sPin, $iUserType)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oCert = _Chilkat_PKCS11_FindCertWithPrivateKey($oPkcs11)
	If @error Then
		Local $iErr = @error, $iExt = @extended
		_Chilkat_PKCS11_CloseSession($oPkcs11)
		Return SetError($iErr, $iExt, $CHILKAT_RET_FAILURE)
	EndIf

	Local $dSignedPdfBinaryData = _Chilkat_PDF_SignPAdES_Binary_ByCert($dPDF_InputBinaryData, $oCert, $oJsonOptions)
	Local $iReturnError = @error, $iReturnExtended = @extended
	_Chilkat_PKCS11_CloseSession($oPkcs11)
	Return SetError($iReturnError, $iReturnExtended, $dSignedPdfBinaryData)
EndFunc   ;==>_Chilkat_PDF_SignPAdES_Binary_ByPkcs11

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_SignPAdES_Binary_BySmartCard
; Description ...: Signs binary PDF data as PAdES using a user-selected smart-card or USB-token certificate and returns signed PDF bytes.
; Syntax ........: _Chilkat_PDF_SignPAdES_Binary_BySmartCard(ByRef $dPDF_InputBinaryData, $sPIN = Default, $s_CspName = '', $oJsonOptions = Default, $bNoDialog = Default, $bRejectExpired = 1)
; Parameters ....: $dPDF_InputBinaryData  - [in/out] input PDF bytes.
;                  $sPIN                  - [in] optional smart-card/token PIN. Default or empty requests the PIN after certificate selection.
;                  $s_CspName             - [in] optional CSP/provider name.
;                  $oJsonOptions          - [in] optional Chilkat JsonObject.
;                  $bNoDialog             - [in] optional smart-card no-dialog flag.
;                  $bRejectExpired        - [in] when 1, lists only currently valid certificates with private keys. Default = 1.
; Return values .: Success: signed PDF bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The safe default path lets the user select a certificate by its displayed metadata, resolves it by full fingerprint, and then requests its PIN.
; Related .......: _Chilkat_Cert_LoadFromSmartCardEx, _Chilkat_PDF_SignPAdES_Binary_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_PDF_SignPAdES_Binary_BySmartCard(ByRef $dPDF_InputBinaryData, $sPin = Default, $s_CspName = '', $oJsonOptions = Default, $bNoDialog = Default, $bRejectExpired = 1)
	Local $oCert = _Chilkat_Cert_LoadFromSmartCardEx($s_CspName, $sPin, $bNoDialog, $bRejectExpired, 'PDF PAdES signing')
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dSignedPdfBinaryData = _Chilkat_PDF_SignPAdES_Binary_ByCert($dPDF_InputBinaryData, $oCert, $oJsonOptions)
	Return SetError(@error, @extended, $dSignedPdfBinaryData)
EndFunc   ;==>_Chilkat_PDF_SignPAdES_Binary_BySmartCard

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_SignPAdES_File_ByCert
; Description ...: Signs a PDF file as PAdES using a Chilkat Cert object that has private-key access.
; Syntax ........: _Chilkat_PDF_SignPAdES_File_ByCert($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, ByRef $oCert, $oJsonOptions = Default)
; Parameters ....: $sPDF_InputFileFullPath - [in] input PDF path.
;                  $sPDF_OutputFileFullPath - [in] output signed PDF path.
;                  $oCert                 - [in/out] Chilkat Cert object with a private key, smart card or PKCS11 backing.
;                  $oJsonOptions          - [in] optional Chilkat JsonObject. If Default, _Chilkat_PDF_PAdES_CreateOptions() is used.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Pdf.SetSigningCert() and Pdf.SignPdf().
; Related .......: _Chilkat_PDF_PAdES_CreateOptions, _Chilkat_PDF_SignPAdES_File_BySmartCard, _Chilkat_PDF_SignPAdES_File_ByPkcs11
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_SignPAdES_File_ByCert($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, ByRef $oCert, $oJsonOptions = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not FileExists($sPDF_InputFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPDF_OutputFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $oOptions = 0
	If $oJsonOptions = Default Then
		$oOptions = _Chilkat_PDF_PAdES_CreateOptions()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Else
		If Not IsObj($oJsonOptions) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		$oOptions = $oJsonOptions
	EndIf

	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oPDF.LoadFile($sPDF_InputFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_SignPAdES_File_ByCert() Pdf.LoadFile()', $oPDF, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oPDF.SetSigningCert($oCert)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_SignPAdES_File_ByCert() Pdf.SetSigningCert()', $oPDF, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oPDF.SignPdf($oOptions, $sPDF_OutputFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_SignPAdES_File_ByCert() Pdf.SignPdf()', $oPDF, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_PDF_SignPAdES_File_ByCert

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_SignPAdES_File_ByPkcs11
; Description ...: Signs a PDF as PAdES using a certificate/private key found through PKCS11.
; Syntax ........: _Chilkat_PDF_SignPAdES_File_ByPkcs11($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, $sPkcs11DllFullPath, $sPIN, $iUserType = 1, $oJsonOptions = Default)
; Parameters ....: $sPDF_InputFileFullPath - [in] input PDF path.
;                  $sPDF_OutputFileFullPath - [in] output signed PDF path.
;                  $sPkcs11DllFullPath    - [in] PKCS11 shared library path.
;                  $sPIN                  - [in] PKCS11 user PIN.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
;                  $oJsonOptions          - [in] optional JsonObject options.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Opens a quick PKCS11 session, finds the first certificate with private key, signs, then closes the session.
; Related .......: _Chilkat_PKCS11_OpenSession, _Chilkat_PKCS11_FindCertWithPrivateKey, _Chilkat_PDF_SignPAdES_File_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_SignPAdES_File_ByPkcs11($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, $sPkcs11DllFullPath, $sPin, $iUserType = 1, $oJsonOptions = Default)
	Local $oPkcs11 = _Chilkat_PKCS11_OpenSession($sPkcs11DllFullPath, $sPin, $iUserType)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oCert = _Chilkat_PKCS11_FindCertWithPrivateKey($oPkcs11)
	If @error Then
		Local $iErr = @error, $iExt = @extended
		_Chilkat_PKCS11_CloseSession($oPkcs11)
		Return SetError($iErr, $iExt, $CHILKAT_RET_FAILURE)
	EndIf

	Local $vReturn = _Chilkat_PDF_SignPAdES_File_ByCert($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, $oCert, $oJsonOptions)
	Local $iReturnError = @error, $iReturnExtended = @extended
	_Chilkat_PKCS11_CloseSession($oPkcs11)
	Return SetError($iReturnError, $iReturnExtended, $vReturn)
EndFunc   ;==>_Chilkat_PDF_SignPAdES_File_ByPkcs11

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_SignPAdES_File_BySmartCard
; Description ...: Signs a PDF as PAdES using a certificate located on a smart card or USB token.
; Syntax ........: _Chilkat_PDF_SignPAdES_File_BySmartCard($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, $sPIN = Default, $s_CspName = '', $oJsonOptions = Default, $bNoDialog = Default, $bRejectExpired = 1)
; Parameters ....: $sPDF_InputFileFullPath - [in] input PDF path.
;                  $sPDF_OutputFileFullPath - [in] output signed PDF path.
;                  $sPIN                  - [in] optional card/token PIN.
;                  $s_CspName             - [in] optional CSP/provider name.
;                  $oJsonOptions          - [in] optional JsonObject options.
;                  $bNoDialog             - [in] optional smart-card no-dialog flag.
;                  $bRejectExpired        - [in] when 1, skip expired and not-yet-valid certificates. Default = 1.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Certificate selection uses CertStore.OpenSmartcard() by default to avoid arbitrary selection of an expired certificate.
; Related .......: _Chilkat_Cert_LoadFromSmartCardEx, _Chilkat_PDF_SignPAdES_File_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_SignPAdES_File_BySmartCard($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, $sPin = Default, $s_CspName = '', $oJsonOptions = Default, $bNoDialog = Default, $bRejectExpired = 1)
	Local $oCert = _Chilkat_Cert_LoadFromSmartCardEx($s_CspName, $sPin, $bNoDialog, $bRejectExpired)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $vReturn = _Chilkat_PDF_SignPAdES_File_ByCert($sPDF_InputFileFullPath, $sPDF_OutputFileFullPath, $oCert, $oJsonOptions)
	Return SetError(@error, @extended, $vReturn)
EndFunc   ;==>_Chilkat_PDF_SignPAdES_File_BySmartCard

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignatureInBd_AsBool
; Description ...: Verifies a PDF signature in binary PDF data and returns a boolean result.
; Syntax ........: _Chilkat_PDF_VerifySignatureInBd_AsBool(ByRef $dBinaryData, $iSingature = 0)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
;                  $iSingature            - [in] zero-based signature index; name kept for compatibility with current UDF spelling. Default is 0.
; Return values .: Success: True when signature verification returns JSON details; otherwise False. Preserves @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_PDF_VerifySignatureInBd_AsJson, __Chilkat_ConsoleWrite_IFNC
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignatureInBd_AsBool(ByRef $dBinaryData, $iSingature = 0)
	Local $vResult = _Chilkat_PDF_VerifySignatureInBd_AsJson($dBinaryData, $iSingature)
	__Chilkat_ConsoleWrite_IFNC('_Chilkat_PDF_VerifySignatureInBd_AsJson:' & @CRLF & $vResult)

	Return SetError(@error, @extended, ($vResult <> 0))
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInBd_AsBool

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignatureInBd_AsJson
; Description ...: Verifies a PDF signature in binary PDF data and returns Chilkat JSON details.
; Syntax ........: _Chilkat_PDF_VerifySignatureInBd_AsJson(ByRef $dBinaryData, $iSingature = 0)
; Parameters ....: $dBinaryData           - [in/out] binary PDF data.
;                  $iSingature            - [in] zero-based signature index; name kept for compatibility with current UDF spelling. Default is 0.
; Return values .: Success: Chilkat JsonObject with verification details. Failure: 0 and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_PDF_CreateFromBD, _Chilkat_JSON_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignatureInBd_AsJson(ByRef $dBinaryData, $iSingature = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/vbscript/pdf_validate_signatures.asp
	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, 0)

	$oJSON.EmitCompact = 0
	Local $iValidated = $oPDF.VerifySignature($iSingature, $oJSON)
	Return $iValidated ? $oJSON : 0
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInBd_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignatureInFile_AsArray
; Description ...: Verifies a PDF signature in a file and returns selected verification details as an array.
; Syntax ........: _Chilkat_PDF_VerifySignatureInFile_AsArray($sPDF_FileFullPath, $iSingature)
; Parameters ....: $sPDF_FileFullPath     - [in] full path to a PDF file.
;                  $iSingature            - [in] zero-based signature index; name kept for compatibility with current UDF spelling.
; Return values .: Success: two-dimensional verification-details array. Failure: 0 and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_PDF_VerifySignatureInFile_AsJson, __Chilkat_ConsoleWrite_IFNC, _Chilkat_JSON_ObjToString
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignatureInFile_AsArray($sPDF_FileFullPath, $iSingature)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/vbscript/pdf_validate_signatures.asp
	Local $oJSON = _Chilkat_PDF_VerifySignatureInFile_AsJson($sPDF_FileFullPath, $iSingature) ;get x signature field
	If Not IsObj($oJSON) Then Return 0 ; this mean signature is not validated

	__Chilkat_ConsoleWrite_IFNC(_Chilkat_JSON_ObjToString($oJSON))

	Local $iCount_i = $oJSON.SizeOfArray("pkcs7.verify.signerInfo")
	__Chilkat_ConsoleWrite_IFNC('> Cert Count: ' & $iCount_i)

	Local $a_Verification_Result[$CHILKAT_PDF_Verification__Counter][2]

	Local $iCertIndex = 0
	$oJSON.I = $iCertIndex
	$a_Verification_Result[$CHILKAT_PDF_Verification_certSerialNumber][0] = "certSerialNumber"
	$a_Verification_Result[$CHILKAT_PDF_Verification_certSerialNumber][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].cert.serialNumber")
	$a_Verification_Result[$CHILKAT_PDF_Verification_certIssuerCN][0] = "issuerCN"
	$a_Verification_Result[$CHILKAT_PDF_Verification_certIssuerCN][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].cert.issuerCN")
	$a_Verification_Result[$CHILKAT_PDF_Verification_certDigestAlgOid][0] = "digestAlgOid"
	$a_Verification_Result[$CHILKAT_PDF_Verification_certDigestAlgOid][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].cert.digestAlgOid")
	$a_Verification_Result[$CHILKAT_PDF_Verification_certDigestAlgName][0] = "digestAlgName"
	$a_Verification_Result[$CHILKAT_PDF_Verification_certDigestAlgName][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].cert.digestAlgName")
	$a_Verification_Result[$CHILKAT_PDF_Verification_contentType][0] = "contentType"
	$a_Verification_Result[$CHILKAT_PDF_Verification_contentType][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].contentType")
	$a_Verification_Result[$CHILKAT_PDF_Verification_signingTime][0] = "signingTime"
	$a_Verification_Result[$CHILKAT_PDF_Verification_signingTime][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].signingTime")
	$a_Verification_Result[$CHILKAT_PDF_Verification_messageDigest][0] = "messageDigest"
	$a_Verification_Result[$CHILKAT_PDF_Verification_messageDigest][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].messageDigest")
	$a_Verification_Result[$CHILKAT_PDF_Verification_signingAlgOid][0] = "signingAlgOid"
	$a_Verification_Result[$CHILKAT_PDF_Verification_signingAlgOid][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].signingAlgOid")
	$a_Verification_Result[$CHILKAT_PDF_Verification_signingAlgName][0] = "signingAlgName"
	$a_Verification_Result[$CHILKAT_PDF_Verification_signingAlgName][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].signingAlgName")
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttr1_2_840_113583_1_1_8Der][0] = "AuthAttr1_2_840_113583_1_1_8Der"
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttr1_2_840_113583_1_1_8Der][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].authAttr.""1.2.840.113583.1.1.8"".der")

	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrContentTypeName][0] = "AuthAttrContentTypeName"
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrContentTypeName][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].authAttr.""1.2.840.113549.1.9.3"".name")
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrContentTypeOid][0] = "AuthAttrContentTypeOid"
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrContentTypeOid][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].authAttr.""1.2.840.113549.1.9.3"".oid")

	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrMessageDigestName][0] = "AuthAttrMessageDigestName"
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrMessageDigestName][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].authAttr.""1.2.840.113549.1.9.4"".name")

	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrMessageDigestDigest][0] = "AuthAttrMessageDigestDigest"
	$a_Verification_Result[$CHILKAT_PDF_Verification_AuthAttrMessageDigestDigest][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].authAttr.""1.2.840.113549.1.9.4"".digest")

	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenName][0] = "UnauthAttrTimestampTokenName"
	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenName][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".name")

	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenDer][0] = "UnauthAttrTimestampTokenDer"
	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenDer][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".der")

	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenTimestampSignatureVerified][0] = "UnauthAttrTimestampTokenTimestampSignatureVerified"
	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenTimestampSignatureVerified][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".timestampSignatureVerified")

	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenTimestampSignatureVerified][0] = "UnauthAttrTimestampTokenTimestampSignatureVerified"
	$a_Verification_Result[$CHILKAT_PDF_Verification_UnauthAttrTimestampTokenTimestampSignatureVerified][1] = $oJSON.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".timestampSignatureVerified")

;~     $sUnauthAttrTimestampTokenTstInfoTsaPolicyId = $oJson.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".tstInfo.tsaPolicyId")
;~     $sUnauthAttrTimestampTokenTstInfoMessageImprintHashAlg = $oJson.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".tstInfo.messageImprint.hashAlg")
;~     $sUnauthAttrTimestampTokenTstInfoMessageImprintDigest = $oJson.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".tstInfo.messageImprint.digest")
;~     $bUnauthAttrTimestampTokenTstInfoMessageImprintDigestMatches = $oJson.BoolOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".tstInfo.messageImprint.digestMatches")
;~     $sUnauthAttrTimestampTokenTstInfoSerialNumber = $oJson.StringOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".tstInfo.serialNumber")
;~     $oJson.DtOf("pkcs7.verify.signerInfo[i].unauthAttr.""1.2.840.113549.1.9.16.2.14"".tstInfo.genTime",False,$oUnauthAttrTimestampTokenTstInfoGenTime)
;~     $iJ = 0
	#TODO Danyfirex - suplement

	Return $a_Verification_Result
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInFile_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignatureInFile_AsBool
; Description ...: Verifies a PDF signature in a file and returns a boolean result.
; Syntax ........: _Chilkat_PDF_VerifySignatureInFile_AsBool($sPDF_FileFullPath, $iSingature = 0)
; Parameters ....: $sPDF_FileFullPath     - [in] full path to a PDF file.
;                  $iSingature            - [in] zero-based signature index; name kept for compatibility with current UDF spelling. Default is 0.
; Return values .: Success: True when signature verification returns JSON details; otherwise False. Preserves @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_PDF_VerifySignatureInFile_AsJson
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignatureInFile_AsBool($sPDF_FileFullPath, $iSingature = 0)
	Local $vResult = _Chilkat_PDF_VerifySignatureInFile_AsJson($sPDF_FileFullPath, $iSingature)

	Return SetError(@error, @extended, ($vResult <> 0))
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInFile_AsBool

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignatureInFile_AsJson
; Description ...: Verifies a PDF signature in a file and returns Chilkat JSON details.
; Syntax ........: _Chilkat_PDF_VerifySignatureInFile_AsJson($sPDF_FileFullPath, $iSingature = 0)
; Parameters ....: $sPDF_FileFullPath     - [in] full path to a PDF file.
;                  $iSingature            - [in] zero-based signature index; name kept for compatibility with current UDF spelling. Default is 0.
; Return values .: Success: Chilkat JsonObject with verification details. Failure: 0 and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_Pdf_ObjCreate, _Chilkat_JSON_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignatureInFile_AsJson($sPDF_FileFullPath, $iSingature = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

;~ 	https://www.example-code.com/vbscript/pdf_validate_signatures.asp
	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oPDF)

	Local $iSuccess = $oPDF.LoadFile($sPDF_FileFullPath)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_GENERAL, 0, $iSuccess)

	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, 0)

	$oJSON.EmitCompact = 0
	Local $iValidated = $oPDF.VerifySignature($iSingature, $oJSON)
	Return $iValidated ? $oJSON : 0
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInFile_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignaturesInBinary_AsJson
; Description ...: Verifies all signatures in binary PDF data and returns a JSON summary.
; Syntax ........: _Chilkat_PDF_VerifySignaturesInBinary_AsJson(ByRef $dPDF_BinaryData)
; Parameters ....: $dPDF_BinaryData       - [in/out] binary PDF bytes.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Binary equivalent of _Chilkat_PDF_VerifySignaturesInFile_AsJson(). Per-signature details are stored as JSON strings.
; Related .......: _Chilkat_PDF_OpenFromBinary, _Chilkat_PDF_VerifySignatureInBd_AsJson
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignaturesInBinary_AsJson(ByRef $dPDF_BinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_OpenFromBinary($dPDF_BinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oResult = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oResult.EmitCompact = 0
	$oResult.UpdateInt("numSignatures", $oPDF.NumSignatures)

	Local $iAllValid = 1
	For $iSignature_idx = 0 To $oPDF.NumSignatures - 1
		Local $oInfo = _Chilkat_JSON_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		$oInfo.EmitCompact = 0
		Local $iValid = $oPDF.VerifySignature($iSignature_idx, $oInfo)
		If $iValid <> 1 Then $iAllValid = 0
		$oResult.I = $iSignature_idx
		$oResult.UpdateInt("signatures[i].index", $iSignature_idx)
		$oResult.UpdateBool("signatures[i].valid", $iValid = 1)
		$oResult.UpdateString("signatures[i].info", $oInfo.Emit())
	Next

	$oResult.UpdateBool("allValid", $iAllValid = 1)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oResult)
EndFunc   ;==>_Chilkat_PDF_VerifySignaturesInBinary_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_VerifySignaturesInFile_AsJson
; Description ...: Verifies all PDF signatures and returns a JSON summary.
; Syntax ........: _Chilkat_PDF_VerifySignaturesInFile_AsJson($sPDF_FileFullPath)
; Parameters ....: $sPDF_FileFullPath     - [in] PDF file path.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The "info" field contains the per-signature JSON emitted by Chilkat.
; Related .......: _Chilkat_PDF_VerifySignatureInFile_AsJson, _Chilkat_PDF_NumSignatures_FromBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PDF_VerifySignaturesInFile_AsJson($sPDF_FileFullPath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not FileExists($sPDF_FileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oPDF.LoadFile($sPDF_FileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PDF_VerifySignaturesInFile_AsJson() Pdf.LoadFile()', $oPDF, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oResult = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oResult.EmitCompact = 0
	$oResult.UpdateInt("numSignatures", $oPDF.NumSignatures)

	Local $iAllValid = 1
	For $iSignature_idx = 0 To $oPDF.NumSignatures - 1
		Local $oInfo = _Chilkat_JSON_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		$oInfo.EmitCompact = 0
		Local $iValid = $oPDF.VerifySignature($iSignature_idx, $oInfo)
		If $iValid <> 1 Then $iAllValid = 0
		$oResult.I = $iSignature_idx
		$oResult.UpdateInt("signatures[i].index", $iSignature_idx)
		$oResult.UpdateBool("signatures[i].valid", $iValid = 1)
		$oResult.UpdateString("signatures[i].info", $oInfo.Emit())
	Next

	$oResult.UpdateBool("allValid", $iAllValid = 1)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oResult)
EndFunc   ;==>_Chilkat_PDF_VerifySignaturesInFile_AsJson

#EndRegion ; _Chilkat_Pdf_**

#Region ; _Chilkat_CodeSign_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CodeSign_ObjCreate
; Description ...: Creates a Chilkat CodeSign COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CodeSign_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat CodeSign object was introduced in version 9.5.0.97.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_CodeSign_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CODESIGN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CodeSign_ObjCreate

#EndRegion ; _Chilkat_CodeSign_**

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

#Region ; _Chilkat_Bounce_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Bounce_ObjCreate
; Description ...: Creates a Chilkat Bounce COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Bounce_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Bounce object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatBounceRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Bounce_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_BOUNCE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Bounce_ObjCreate

#EndRegion ; _Chilkat_Bounce_**

#Region ; _Chilkat_Bz2_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Bz2_ObjCreate
; Description ...: Creates a Chilkat Bz2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Bz2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Bz2 object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatBz2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Bz2_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_BZ2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Bz2_ObjCreate

#EndRegion ; _Chilkat_Bz2_**

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

#Region ; _Chilkat_CertChain_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CertChain_ObjCreate
; Description ...: Creates a Chilkat CertChain COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_CertChain_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat CertChain object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertChainRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_CertChain_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CERTCHAIN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CertChain_ObjCreate

#EndRegion ; _Chilkat_CertChain_**

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

#Region ; _Chilkat_Compression_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Compression_ObjCreate
; Description ...: Creates a Chilkat Compression COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Compression_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Compression object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCompressionRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Compression_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_COMPRESSION)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Compression_ObjCreate

#EndRegion ; _Chilkat_Compression_**

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

#Region ; _Chilkat_Crypt2_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Crypt2_ObjCreate
; Description ...: Creates a Chilkat Crypt2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Crypt2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Crypt2 object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCrypt2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Crypt2_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CRYPT2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Crypt2_ObjCreate

#EndRegion ; _Chilkat_Crypt2_**

#Region ; _Chilkat_Csr_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Csr_ObjCreate
; Description ...: Creates a Chilkat Csr COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Csr_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Csr object was introduced in version 9.5.0.65.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCsrRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Csr_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CSR)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Csr_ObjCreate

#EndRegion ; _Chilkat_Csr_**

#Region ; _Chilkat_Dh_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Dh_ObjCreate
; Description ...: Creates a Chilkat Dh COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Dh_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Dh object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDhRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Dh_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DH)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Dh_ObjCreate

#EndRegion ; _Chilkat_Dh_**

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

#Region ; _Chilkat_Dkim_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Dkim_ObjCreate
; Description ...: Creates a Chilkat Dkim COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Dkim_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Dkim object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDkimRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Dkim_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DKIM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Dkim_ObjCreate

#EndRegion ; _Chilkat_Dkim_**

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

#Region ; _Chilkat_Dsa_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Dsa_ObjCreate
; Description ...: Creates a Chilkat Dsa COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Dsa_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Dsa object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDsaRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Dsa_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DSA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Dsa_ObjCreate

#EndRegion ; _Chilkat_Dsa_**

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

#Region ; _Chilkat_Ecc_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Ecc_ObjCreate
; Description ...: Creates a Chilkat Ecc COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Ecc_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ecc object was introduced in version 9.5.0.52.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatEccRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Ecc_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ECC)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Ecc_ObjCreate

#EndRegion ; _Chilkat_Ecc_**

#Region ; _Chilkat_EdDSA_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EdDSA_ObjCreate
; Description ...: Creates a Chilkat EdDSA COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_EdDSA_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat EdDSA object was introduced in version 9.5.0.83.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatEdDSARef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EdDSA_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_EDDSA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_EdDSA_ObjCreate

#EndRegion ; _Chilkat_EdDSA_**

#Region ; _Chilkat_EmailBundle_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EmailBundle_ObjCreate
; Description ...: Creates a Chilkat EmailBundle COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_EmailBundle_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat EmailBundle object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatEmailBundleRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EmailBundle_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_EMAILBUNDLE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_EmailBundle_ObjCreate

#EndRegion ; _Chilkat_EmailBundle_**

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

#Region ; _Chilkat_Gzip_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Gzip_ObjCreate
; Description ...: Creates a Chilkat Gzip COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Gzip_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Gzip object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatGzipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Gzip_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_GZIP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Gzip_ObjCreate

#EndRegion ; _Chilkat_Gzip_**

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

#Region ; _Chilkat_JavaKeyStore_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_JavaKeyStore_ObjCreate
; Description ...: Creates a Chilkat JavaKeyStore COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_JavaKeyStore_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat JavaKeyStore object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatJavaKeyStoreRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_JavaKeyStore_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JAVAKEYSTORE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_JavaKeyStore_ObjCreate

#EndRegion ; _Chilkat_JavaKeyStore_**

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

#Region ; _Chilkat_Jwe_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Jwe_ObjCreate
; Description ...: Creates a Chilkat Jwe COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Jwe_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Jwe object was introduced in version 9.5.0.66.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatJweRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Jwe_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JWE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Jwe_ObjCreate

#EndRegion ; _Chilkat_Jwe_**

#Region ; _Chilkat_Jws_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Jws_ObjCreate
; Description ...: Creates a Chilkat Jws COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Jws_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Jws object was introduced in version 9.5.0.66.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatJwsRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Jws_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JWS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Jws_ObjCreate

#EndRegion ; _Chilkat_Jws_**

#Region ; _Chilkat_Jwt_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Jwt_ObjCreate
; Description ...: Creates a Chilkat Jwt COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Jwt_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Jwt object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatJwtRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Jwt_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JWT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Jwt_ObjCreate

#EndRegion ; _Chilkat_Jwt_**

#Region ; _Chilkat_KeyContainer_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_KeyContainer_ObjCreate
; Description ...: Creates a Chilkat KeyContainer COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_KeyContainer_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat KeyContainer object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatKeyContainerRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_KeyContainer_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_KEYCONTAINER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_KeyContainer_ObjCreate

#EndRegion ; _Chilkat_KeyContainer_**

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

#Region ; _Chilkat_MessageSet_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_MessageSet_ObjCreate
; Description ...: Creates a Chilkat MessageSet COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_MessageSet_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat MessageSet object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatMessageSetRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_MessageSet_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_MESSAGESET)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_MessageSet_ObjCreate

#EndRegion ; _Chilkat_MessageSet_**

#Region ; _Chilkat_Mht_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Mht_ObjCreate
; Description ...: Creates a Chilkat Mht COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Mht_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Mht object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatMhtRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Mht_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_MHT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Mht_ObjCreate

#EndRegion ; _Chilkat_Mht_**

#Region ; _Chilkat_Mime_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Mime_ObjCreate
; Description ...: Creates a Chilkat Mime COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Mime_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Mime object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatMimeRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Mime_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_MIME)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Mime_ObjCreate

#EndRegion ; _Chilkat_Mime_**

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

#Region ; _Chilkat_Pem_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Pem_ObjCreate
; Description ...: Creates a Chilkat Pem COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Pem_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Pem object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPemRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Pem_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PEM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Pem_ObjCreate

#EndRegion ; _Chilkat_Pem_**

#Region ; _Chilkat_Pfx_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Pfx_ObjCreate
; Description ...: Creates a Chilkat Pfx COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Pfx_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Pfx object was introduced in version 9.5.0.40.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPfxRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Pfx_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PFX)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Pfx_ObjCreate

#EndRegion ; _Chilkat_Pfx_**

#Region ; _Chilkat_PKCS11_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_ObjCreate
; Description ...: Creates a Chilkat Pkcs11 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_PKCS11_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat Pkcs11 object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat Pkcs11 object was introduced in version 9.5.0.88.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PKCS11)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_PKCS11_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_CloseSession
; Description ...: Logs out and closes a PKCS11 session.
; Syntax ........: _Chilkat_PKCS11_CloseSession(ByRef $oPkcs11, $bLogout = 1)
; Parameters ....: $oPkcs11               - [in/out] Chilkat Pkcs11 object.
;                  $bLogout               - [in] call Logout before CloseSession. Default is 1.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Intended for cleanup after signing.
; Related .......: _Chilkat_PKCS11_OpenSession
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_CloseSession(ByRef $oPkcs11, $bLogout = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oPkcs11) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $bLogout Then $oPkcs11.Logout()
	$oPkcs11.CloseSession()
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_PKCS11_CloseSession

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_DiscoverSlots_AsArray
; Description ...: Discovers PKCS11 slots/readers/tokens and returns them as a native AutoIt 2D array.
; Syntax ........: _Chilkat_PKCS11_DiscoverSlots_AsArray($sSharedLibPath, $bOnlyTokensPresent = 1, $bSkipMechanisms = 1)
; Parameters ....: $sSharedLibPath        - [in] PKCS11 DLL/shared library path.
;                  $bOnlyTokensPresent    - [in] when 1, returns only slots with a token present.
;                  $bSkipMechanisms       - [in] when 1, skips mechanism enumeration for faster discovery.
; Return values .: Success: 2D array [n][$CHILKAT_PKCS11_SLOT_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The Chilkat Discover JSON is parsed internally and not returned to the caller.
; Related .......: _Chilkat_PKCS11_ObjCreate, _Chilkat_PKCS11_ListCerts_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_DiscoverSlots_AsArray($sSharedLibPath, $bOnlyTokensPresent = 1, $bSkipMechanisms = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sSharedLibPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oPkcs11 = _Chilkat_PKCS11_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $oJSON = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oPkcs11.SharedLibPath = $sSharedLibPath
	If $bSkipMechanisms Then $oPkcs11.UncommonOptions = 'Pkcs11DiscoverSkipMechanisms'
	Local $iSuccess = $oPkcs11.Initialize()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_DiscoverSlots_AsArray() Pkcs11.Initialize()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oPkcs11.Discover($bOnlyTokensPresent ? 1 : 0, $oJSON)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_DiscoverSlots_AsArray() Pkcs11.Discover()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iCount = $oJSON.SizeOfArray('slot')
	If $iCount < 0 Then $iCount = 0
	Local $aSlots[$iCount][$CHILKAT_PKCS11_SLOT_COL_COUNT]
	For $i = 0 To $iCount - 1
		$oJSON.I = $i
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_INDEX] = $i
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_ID] = $oJSON.IntOf('slot[i].id')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_DESCRIPTION] = $oJSON.StringOf('slot[i].slotDescription')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_MANUFACTURER] = $oJSON.StringOf('slot[i].manufacturerID')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_TOKEN_PRESENT] = $oJSON.BoolOf('slot[i].tokenPresent')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_TOKEN_LABEL] = $oJSON.StringOf('slot[i].token.label')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_TOKEN_MANUFACTURER] = $oJSON.StringOf('slot[i].token.manufacturerID')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_TOKEN_MODEL] = $oJSON.StringOf('slot[i].token.model')
		$aSlots[$i][$CHILKAT_PKCS11_SLOT_COL_TOKEN_SERIAL] = $oJSON.StringOf('slot[i].token.serialNumber')
	Next

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aSlots)
EndFunc   ;==>_Chilkat_PKCS11_DiscoverSlots_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_FindCertWithPrivateKey
; Description ...: Finds the first certificate on the open PKCS11 session that has an associated private key.
; Syntax ........: _Chilkat_PKCS11_FindCertWithPrivateKey(ByRef $oPkcs11)
; Parameters ....: $oPkcs11               - [in/out] open Chilkat Pkcs11 object.
; Return values .: Success: Chilkat Cert object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Pkcs11.FindCert("privateKey", "", cert).
; Related .......: _Chilkat_PKCS11_OpenSession, _Chilkat_PKCS11_CloseSession
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_FindCertWithPrivateKey(ByRef $oPkcs11)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oPkcs11) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oCert = _Chilkat_Cert_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oPkcs11.FindCert("privateKey", "", $oCert)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_FindCertWithPrivateKey() Pkcs11.FindCert()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oCert)
EndFunc   ;==>_Chilkat_PKCS11_FindCertWithPrivateKey

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_ListCerts_AsArray
; Description ...: Lists certificates from a PKCS11 token/smart card and returns metadata as a native AutoIt 2D array.
; Syntax ........: _Chilkat_PKCS11_ListCerts_AsArray($sSharedLibPath, $sPin = Default, $iSlotId = -1, $iUserType = 1, $bOnlyWithPrivateKey = 1, $bReadWrite = 0)
; Parameters ....: $sSharedLibPath        - [in] PKCS11 DLL/shared library path.
;                  $sPin                  - [in] optional PIN. Required by many tokens to see private-key objects.
;                  $iSlotId               - [in] PKCS11 slot id. -1 lets Chilkat choose the first matching slot.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
;                  $bOnlyWithPrivateKey   - [in] when 1, returns only certificates with an available private key.
;                  $bReadWrite            - [in] open the PKCS11 session read/write. Default is read-only.
; Return values .: Success: 2D array [n][$CHILKAT_CERT_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns are described by $CHILKAT_CERT_LIST_COL_* constants.
; Related .......: _Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray, _Chilkat_PKCS11_DiscoverSlots_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_ListCerts_AsArray($sSharedLibPath, $sPin = Default, $iSlotId = -1, $iUserType = 1, $bOnlyWithPrivateKey = 1, $bReadWrite = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sSharedLibPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $sPin <> Default And $sPin <> '' And Not IsString($sPin) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $oPkcs11 = _Chilkat_PKCS11_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oPkcs11.SharedLibPath = $sSharedLibPath

	Local $iSuccess = $oPkcs11.Initialize()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_ListCerts_AsArray() Pkcs11.Initialize()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oPkcs11.OpenSession($iSlotId, $bReadWrite ? 1 : 0)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_ListCerts_AsArray() Pkcs11.OpenSession()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $bLoggedIn = 0
	If $sPin <> Default And $sPin <> '' Then
		$iSuccess = $oPkcs11.Login($iUserType, $sPin)
		If $iSuccess = 0 Then
			__Chilkat_LogOnError('_Chilkat_PKCS11_ListCerts_AsArray() Pkcs11.Login()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			$oPkcs11.CloseSession()
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf
		$bLoggedIn = 1
	EndIf

	$iSuccess = $oPkcs11.FindAllCerts()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_ListCerts_AsArray() Pkcs11.FindAllCerts()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		If $bLoggedIn Then $oPkcs11.Logout()
		$oPkcs11.CloseSession()
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iNumCerts = $oPkcs11.NumCerts
	Local $aCerts[$iNumCerts][$CHILKAT_CERT_LIST_COL_COUNT]
	Local $iOut = 0
	For $i = 0 To $iNumCerts - 1
		Local $oCert = _Chilkat_Cert_ObjCreate()
		If @error Then
			If $bLoggedIn Then $oPkcs11.Logout()
			$oPkcs11.CloseSession()
			Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		EndIf
		$iSuccess = $oPkcs11.GetCert($i, $oCert)
		If $iSuccess = 0 Then ContinueLoop
		If $bOnlyWithPrivateKey And Not $oCert.HasPrivateKey() Then ContinueLoop
		__Chilkat_Array_SetCertRow($aCerts, $iOut, $oCert, $i)
		$iOut += 1
	Next

	If $bLoggedIn Then $oPkcs11.Logout()
	$oPkcs11.CloseSession()

	If $iOut = 0 Then
		Local $aEmpty[0][$CHILKAT_CERT_LIST_COL_COUNT]
		Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aEmpty)
	EndIf
	ReDim $aCerts[$iOut][$CHILKAT_CERT_LIST_COL_COUNT]
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aCerts)
EndFunc   ;==>_Chilkat_PKCS11_ListCerts_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray
; Description ...: Lists only PKCS11 certificates that have an available private key and returns metadata as an AutoIt 2D array.
; Syntax ........: _Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray($sSharedLibPath, $sPin, $iSlotId = -1, $iUserType = 1)
; Parameters ....: $sSharedLibPath        - [in] PKCS11 DLL/shared library path.
;                  $sPin                  - [in] PIN used to authenticate the PKCS11 session.
;                  $iSlotId               - [in] PKCS11 slot id. -1 lets Chilkat choose the first matching slot.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
; Return values .: Success: 2D array [n][$CHILKAT_CERT_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Convenience wrapper around _Chilkat_PKCS11_ListCerts_AsArray(..., $bOnlyWithPrivateKey = 1).
; Related .......: _Chilkat_PKCS11_ListCerts_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray($sSharedLibPath, $sPin, $iSlotId = -1, $iUserType = 1)
	Local $aCerts = _Chilkat_PKCS11_ListCerts_AsArray($sSharedLibPath, $sPin, $iSlotId, $iUserType, 1, 0)
	Return SetError(@error, @extended, $aCerts)
EndFunc   ;==>_Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PKCS11_OpenSession
; Description ...: Opens a PKCS11 session for a smart card, USB token or HSM.
; Syntax ........: _Chilkat_PKCS11_OpenSession($sSharedLibPath, $sPin, $iUserType = 1)
; Parameters ....: $sSharedLibPath        - [in] PKCS11 shared library path.
;                  $sPin                  - [in] user PIN.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
; Return values .: Success: Chilkat Pkcs11 object with an open session. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Keeps the session open so the returned object can be used by signing helpers.
; Related .......: _Chilkat_PKCS11_FindCertWithPrivateKey, _Chilkat_PKCS11_CloseSession
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPkcs11Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PKCS11_OpenSession($sSharedLibPath, $sPin, $iUserType = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sSharedLibPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPin) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oPkcs11 = _Chilkat_PKCS11_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oPkcs11.SharedLibPath = $sSharedLibPath

	Local $iSuccess = $oPkcs11.QuickSession($iUserType, $sPin)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_PKCS11_OpenSession() Pkcs11.QuickSession()', $oPkcs11, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oPkcs11)
EndFunc   ;==>_Chilkat_PKCS11_OpenSession

#EndRegion ; _Chilkat_PKCS11_**

#Region ; _Chilkat_PRIVATEKEY_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PRIVATEKEY_ObjCreate
; Description ...: Creates a Chilkat PrivateKey COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_PRIVATEKEY_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat PrivateKey object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat PrivateKey object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPrivateKeyRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PRIVATEKEY_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PRIVATEKEY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_PRIVATEKEY_ObjCreate

#EndRegion ; _Chilkat_PRIVATEKEY_**

#Region ; _Chilkat_Prng_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Prng_ObjCreate
; Description ...: Creates a Chilkat Prng COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Prng_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Prng object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPrngRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Prng_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PRNG)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Prng_ObjCreate

#EndRegion ; _Chilkat_Prng_**

#Region ; _Chilkat_PublicKey_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PublicKey_ObjCreate
; Description ...: Creates a Chilkat PublicKey COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_PublicKey_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat PublicKey object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPublicKeyRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PublicKey_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PUBLICKEY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_PublicKey_ObjCreate

#EndRegion ; _Chilkat_PublicKey_**

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

#Region ; _Chilkat_Rsa_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Rsa_ObjCreate
; Description ...: Creates a Chilkat Rsa COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Rsa_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Rsa object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatRsaRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Rsa_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_RSA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Rsa_ObjCreate

#EndRegion ; _Chilkat_Rsa_**

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

#Region ; _Chilkat_SCARD_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_ObjCreate
; Description ...: Creates a Chilkat SCard COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SCARD_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat SCard object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat SCard object was introduced in version 9.5.0.87.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SCARD_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SCARD)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SCARD_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_ListReaders_AsArray
; Description ...: Lists available PC/SC smart-card readers / USB-token readers as a native AutoIt 2D array.
; Syntax ........: _Chilkat_SCARD_ListReaders_AsArray($sScope = 'user')
; Parameters ....: $sScope                - [in] PC/SC context scope: 'user' or 'system'. Default is 'user'.
; Return values .: Success: 2D array [n][$CHILKAT_SCARD_READER_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns are described by $CHILKAT_SCARD_READER_COL_* constants.
; Related .......: _Chilkat_SCARD_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SCARD_ListReaders_AsArray($sScope = 'user')
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sScope) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oSCard = _Chilkat_SCARD_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $oReaders = _Chilkat_StringTable_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oSCard.EstablishContext($sScope)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_ListReaders_AsArray() SCard.EstablishContext()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oSCard.ListReaders($oReaders)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_ListReaders_AsArray() SCard.ListReaders()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		$oSCard.ReleaseContext()
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iCount = $oReaders.Count
	Local $aReaders[$iCount][$CHILKAT_SCARD_READER_COL_COUNT]
	For $i = 0 To $iCount - 1
		$aReaders[$i][$CHILKAT_SCARD_READER_COL_INDEX] = $i
		$aReaders[$i][$CHILKAT_SCARD_READER_COL_NAME] = $oReaders.StringAt($i)
	Next
	$oSCard.ReleaseContext()
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aReaders)
EndFunc   ;==>_Chilkat_SCARD_ListReaders_AsArray

#EndRegion ; _Chilkat_SCARD_**

#Region ; _Chilkat_ScMinidriver_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ScMinidriver_ObjCreate
; Description ...: Creates a Chilkat ScMinidriver COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ScMinidriver_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat ScMinidriver object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat ScMinidriver object was introduced in version 9.5.0.87.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatScMinidriverRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ScMinidriver_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SCMINIDRIVER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ScMinidriver_ObjCreate

#EndRegion ; _Chilkat_ScMinidriver_**

#Region ; _Chilkat_SecureString_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SecureString_ObjCreate
; Description ...: Creates a Chilkat SecureString COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SecureString_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SecureString object was introduced in version 9.5.0.71.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSecureStringRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SecureString_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SECURESTRING)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SecureString_ObjCreate

#EndRegion ; _Chilkat_SecureString_**

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

#Region ; _Chilkat_Tar_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Tar_ObjCreate
; Description ...: Creates a Chilkat Tar COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Tar_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Tar object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatTarRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Tar_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TAR)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Tar_ObjCreate

#EndRegion ; _Chilkat_Tar_**

#Region ; _Chilkat_TrustedRoots_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_TrustedRoots_ObjCreate
; Description ...: Creates a Chilkat TrustedRoots COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_TrustedRoots_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat TrustedRoots object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatTrustedRootsRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_TrustedRoots_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TRUSTEDROOTS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_TrustedRoots_ObjCreate

#EndRegion ; _Chilkat_TrustedRoots_**

#Region ; _Chilkat_UnixCompress_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_UnixCompress_ObjCreate
; Description ...: Creates a Chilkat UnixCompress COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_UnixCompress_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat UnixCompress object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatUnixCompressRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_UnixCompress_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_UNIXCOMPRESS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_UnixCompress_ObjCreate

#EndRegion ; _Chilkat_UnixCompress_**

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

#Region ; _Chilkat_XmlCertVault_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XmlCertVault_ObjCreate
; Description ...: Creates a Chilkat XmlCertVault COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_XmlCertVault_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat XmlCertVault object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlCertVaultRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XmlCertVault_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_XMLCERTVAULT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_XmlCertVault_ObjCreate

#EndRegion ; _Chilkat_XmlCertVault_**

#Region ; _Chilkat_XMLDSIG_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XMLDSIG_ObjCreate
; Description ...: Creates a Chilkat XmlDSig COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_XMLDSIG_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat XmlDSig object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat XmlDSig object was introduced in version 9.5.0.69.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XMLDSIG_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_XMLDSIG)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_XMLDSIG_ObjCreate

#EndRegion ; _Chilkat_XMLDSIG_**

#Region ; _Chilkat_XMLDSIGGEN_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XMLDSIGGEN_ObjCreate
; Description ...: Creates a Chilkat XmlDSigGen COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_XMLDSIGGEN_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat XmlDSigGen object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat XmlDSigGen object was introduced in version 9.5.0.69.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XMLDSIGGEN_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_XMLDSIGGEN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_XMLDSIGGEN_ObjCreate

#EndRegion ; _Chilkat_XMLDSIGGEN_**

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

#Region ; _Chilkat_XADES_**

Func __Chilkat_XADES_DigestAlgorithmUri($sDigestMethod)
	Switch StringLower($sDigestMethod)
		Case 'sha1'
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'http://www.w3.org/2000/09/xmldsig#sha1')
		Case 'sha256'
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'http://www.w3.org/2001/04/xmlenc#sha256')
		Case 'sha384'
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'http://www.w3.org/2001/04/xmldsig-more#sha384')
		Case 'sha512'
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'http://www.w3.org/2001/04/xmlenc#sha512')
	EndSwitch
	Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
EndFunc   ;==>__Chilkat_XADES_DigestAlgorithmUri

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_SignExternalBinary_BES_ByCert
; Description ...: Creates a detached XAdES-BES XML signature for external binary data and returns the XML as binary bytes.
; Syntax ........: _Chilkat_XADES_SignExternalBinary_BES_ByCert(ByRef $dExternalBinaryData, ByRef $oCert, $sReferenceUri = 'data.bin', $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $sSignatureId = Default, $sSignedPropertiesId = Default, $sFileRefId = Default, $sXadesXmlCharset = 'utf-8')
; Parameters ....: $dExternalBinaryData   - [in/out] bytes to digest/sign as external reference.
;                  $oCert                 - [in/out] Chilkat Cert object with private-key access.
;                  $sReferenceUri         - [in] URI written into ds:Reference. Default is 'data.bin'.
;                  $sDigestMethod         - [in] digest method. Default is 'sha256'.
;                  $sMimeType             - [in] signed data MIME type. Default is 'application/octet-stream'.
;                  $sSignatureId          - [in] optional Signature Id.
;                  $sSignedPropertiesId   - [in] optional SignedProperties Id.
;                  $sFileRefId            - [in] optional external-data reference Id.
;                  $sXadesXmlCharset      - [in] output XML charset. Default is 'utf-8'.
; Return values .: Success: XAdES XML bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Binary data -> BinData -> detached XAdES object/XML -> Binary XML, with no filesystem files.
; Related .......: _Chilkat_XADES_VerifyBinary_AsJson, _Chilkat_XADES_SignExternalBinary_BES_BySmartCard
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_SignExternalBinary_BES_ByCert(ByRef $dExternalBinaryData, ByRef $oCert, $sReferenceUri = 'data.bin', $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $sSignatureId = Default, $sSignedPropertiesId = Default, $sFileRefId = Default, $sXadesXmlCharset = 'utf-8')
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sReferenceUri) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	If $sReferenceUri = '' Then $sReferenceUri = 'data.bin'

	Local $sDigestAlgorithmUri = __Chilkat_XADES_DigestAlgorithmUri($sDigestMethod)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oSourceBd = _Chilkat_BINDATA_FromBinary($dExternalBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sUnique = @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & Random(100000, 999999, 1)
	If $sSignatureId = Default Or $sSignatureId = '' Then $sSignatureId = 'xmldsig-' & $sUnique
	If $sSignedPropertiesId = Default Or $sSignedPropertiesId = '' Then $sSignedPropertiesId = $sSignatureId & '-signedprops'
	If $sFileRefId = Default Or $sFileRefId = '' Then $sFileRefId = $sSignatureId & '-ref0'

	Local $oGen = _Chilkat_XMLDSIGGEN_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oGen.SigId = $sSignatureId
	$oGen.SigNamespacePrefix = 'ds'
	$oGen.SigNamespaceUri = 'http://www.w3.org/2000/09/xmldsig#'
	$oGen.SigValueId = $sSignatureId & '-sigvalue'
	$oGen.SignedInfoCanonAlg = 'EXCL_C14N'
	$oGen.SignedInfoDigestMethod = $sDigestMethod
	$oGen.KeyInfoId = $sSignatureId & '-keyinfo'

	Local $oObject1 = _Chilkat_XML_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oObject1.Tag = 'xades:QualifyingProperties'
	$oObject1.AddAttribute('xmlns:xades', 'http://uri.etsi.org/01903/v1.3.2#')
	$oObject1.AddAttribute('xmlns:xades141', 'http://uri.etsi.org/01903/v1.4.1#')
	$oObject1.AddAttribute('Target', '#' & $sSignatureId)
	$oObject1.UpdateAttrAt('xades:SignedProperties', True, 'Id', $sSignedPropertiesId)
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningTime', 'TO BE GENERATED BY CHILKAT')
	$oObject1.UpdateAttrAt('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificateV2|xades:Cert|xades:CertDigest|ds:DigestMethod', True, 'Algorithm', $sDigestAlgorithmUri)
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificateV2|xades:Cert|xades:CertDigest|ds:DigestValue', 'TO BE GENERATED BY CHILKAT')
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificateV2|xades:Cert|xades:IssuerSerialV2', 'TO BE GENERATED BY CHILKAT')
	$oObject1.UpdateAttrAt('xades:SignedProperties|xades:SignedDataObjectProperties|xades:DataObjectFormat', True, 'ObjectReference', '#' & $sFileRefId)
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedDataObjectProperties|xades:DataObjectFormat|xades:MimeType', $sMimeType)

	Local $iSuccess = $oGen.AddObject('', $oObject1.GetXml(), '', '')
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalBinary_BES_ByCert() XmlDSigGen.AddObject()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oGen.AddExternalBinaryRef($sReferenceUri, $oSourceBd, $sDigestMethod, '')
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalBinary_BES_ByCert() XmlDSigGen.AddExternalBinaryRef()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf
	$oGen.SetRefIdAttr($sReferenceUri, $sFileRefId)

	$iSuccess = $oGen.AddObjectRef($sSignedPropertiesId, $sDigestMethod, 'EXCL_C14N', '', 'http://uri.etsi.org/01903#SignedProperties')
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalBinary_BES_ByCert() XmlDSigGen.AddObjectRef()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oGen.SetX509Cert($oCert, True)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalBinary_BES_ByCert() XmlDSigGen.SetX509Cert()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf
	$oGen.KeyInfoType = 'X509Data'
	$oGen.X509Type = 'Certificate'
	$oGen.Behaviors = 'IndentedSignature,IssuerSerialHex'

	Local $oSbXml = _Chilkat_StringBuilder_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$iSuccess = $oGen.CreateXmlDSigSb($oSbXml)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalBinary_BES_ByCert() XmlDSigGen.CreateXmlDSigSb()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oOutputBd = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$iSuccess = $oOutputBd.AppendSb($oSbXml, $sXadesXmlCharset)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalBinary_BES_ByCert() BinData.AppendSb()', $oOutputBd, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $dXadesXmlBinary = _Chilkat_BINDATA_ToBinary($oOutputBd)
	Return SetError(@error, @extended, $dXadesXmlBinary)
EndFunc   ;==>_Chilkat_XADES_SignExternalBinary_BES_ByCert

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_SignExternalBinary_BES_ByPkcs11
; Description ...: Creates a detached XAdES-BES XML signature for external binary data using a PKCS11 token/HSM.
; Syntax ........: _Chilkat_XADES_SignExternalBinary_BES_ByPkcs11(ByRef $dExternalBinaryData, $sPkcs11DllFullPath, $sPIN, $iUserType = 1, $sReferenceUri = 'data.bin', $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $sXadesXmlCharset = 'utf-8')
; Parameters ....: $dExternalBinaryData   - [in/out] bytes to digest/sign as external reference.
;                  $sPkcs11DllFullPath    - [in] PKCS11 shared library path.
;                  $sPIN                  - [in] PKCS11 user PIN.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
;                  $sReferenceUri         - [in] URI written into ds:Reference. Default is 'data.bin'.
;                  $sDigestMethod         - [in] digest method. Default is 'sha256'.
;                  $sMimeType             - [in] signed data MIME type. Default is 'application/octet-stream'.
;                  $sXadesXmlCharset      - [in] output XML charset. Default is 'utf-8'.
; Return values .: Success: XAdES XML bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Opens a PKCS11 session, finds the first certificate with private key, signs, then closes the session.
; Related .......: _Chilkat_PKCS11_OpenSession, _Chilkat_PKCS11_FindCertWithPrivateKey, _Chilkat_XADES_SignExternalBinary_BES_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_SignExternalBinary_BES_ByPkcs11(ByRef $dExternalBinaryData, $sPkcs11DllFullPath, $sPin, $iUserType = 1, $sReferenceUri = 'data.bin', $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $sXadesXmlCharset = 'utf-8')
	Local $oPkcs11 = _Chilkat_PKCS11_OpenSession($sPkcs11DllFullPath, $sPin, $iUserType)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oCert = _Chilkat_PKCS11_FindCertWithPrivateKey($oPkcs11)
	If @error Then
		Local $iErr = @error, $iExt = @extended
		_Chilkat_PKCS11_CloseSession($oPkcs11)
		Return SetError($iErr, $iExt, $CHILKAT_RET_FAILURE)
	EndIf

	Local $dXadesXmlBinary = _Chilkat_XADES_SignExternalBinary_BES_ByCert($dExternalBinaryData, $oCert, $sReferenceUri, $sDigestMethod, $sMimeType, Default, Default, Default, $sXadesXmlCharset)
	Local $iReturnError = @error, $iReturnExtended = @extended
	_Chilkat_PKCS11_CloseSession($oPkcs11)
	Return SetError($iReturnError, $iReturnExtended, $dXadesXmlBinary)
EndFunc   ;==>_Chilkat_XADES_SignExternalBinary_BES_ByPkcs11

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_SignExternalBinary_BES_BySmartCard
; Description ...: Creates a detached XAdES-BES XML signature for external binary data using a smart-card/USB-token certificate.
; Syntax ........: _Chilkat_XADES_SignExternalBinary_BES_BySmartCard(ByRef $dExternalBinaryData, $sPIN = Default, $s_CspName = '', $sReferenceUri = 'data.bin', $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $bNoDialog = Default, $sXadesXmlCharset = 'utf-8', $bRejectExpired = 1)
; Parameters ....: $dExternalBinaryData   - [in/out] bytes to digest/sign as external reference.
;                  $sPIN                  - [in] optional smart-card/token PIN.
;                  $s_CspName             - [in] optional CSP/provider name.
;                  $sReferenceUri         - [in] URI written into ds:Reference. Default is 'data.bin'.
;                  $sDigestMethod         - [in] digest method. Default is 'sha256'.
;                  $sMimeType             - [in] signed data MIME type. Default is 'application/octet-stream'.
;                  $bNoDialog             - [in] optional smart-card no-dialog flag.
;                  $sXadesXmlCharset      - [in] output XML charset. Default is 'utf-8'.
;                  $bRejectExpired        - [in] when 1, skip expired and not-yet-valid certificates. Default = 1.
; Return values .: Success: XAdES XML bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Certificate selection uses CertStore.OpenSmartcard() by default to avoid arbitrary selection of an expired certificate.
; Related .......: _Chilkat_Cert_LoadFromSmartCardEx, _Chilkat_XADES_SignExternalBinary_BES_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_SignExternalBinary_BES_BySmartCard(ByRef $dExternalBinaryData, $sPin = Default, $s_CspName = '', $sReferenceUri = 'data.bin', $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $bNoDialog = Default, $sXadesXmlCharset = 'utf-8', $bRejectExpired = 1)
	Local $oCert = _Chilkat_Cert_LoadFromSmartCardEx($s_CspName, $sPin, $bNoDialog, $bRejectExpired)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dXadesXmlBinary = _Chilkat_XADES_SignExternalBinary_BES_ByCert($dExternalBinaryData, $oCert, $sReferenceUri, $sDigestMethod, $sMimeType, Default, Default, Default, $sXadesXmlCharset)
	Return SetError(@error, @extended, $dXadesXmlBinary)
EndFunc   ;==>_Chilkat_XADES_SignExternalBinary_BES_BySmartCard

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_SignExternalFile_BES_ByCert
; Description ...: Creates a detached XAdES-BES XML signature for an external file using a Chilkat Cert object.
; Syntax ........: _Chilkat_XADES_SignExternalFile_BES_ByCert($sFileFullPath, $sOutputXadesFileFullPath, ByRef $oCert, $sReferenceUri = Default, $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $sSignatureId = Default, $sSignedPropertiesId = Default, $sFileRefId = Default)
; Parameters ....: $sFileFullPath         - [in] file to sign and digest.
;                  $sOutputXadesFileFullPath - [in] output XAdES XML file.
;                  $oCert                 - [in/out] Chilkat Cert object with private-key access.
;                  $sReferenceUri         - [in] optional URI written into the signature. Default is the signed file name.
;                  $sDigestMethod         - [in] digest method. Default is 'sha256'.
;                  $sMimeType             - [in] signed file MIME type. Default is 'application/octet-stream'.
;                  $sSignatureId          - [in] optional Signature Id.
;                  $sSignedPropertiesId   - [in] optional SignedProperties Id.
;                  $sFileRefId            - [in] optional external-file reference Id.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Creates a generic detached XAdES-BES envelope. Country- or schema-specific XAdES variants may require additional XML layout/options.
; Related .......: _Chilkat_XADES_SignExternalFile_BES_BySmartCard, _Chilkat_XADES_VerifyFile_AsJson
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_SignExternalFile_BES_ByCert($sFileFullPath, $sOutputXadesFileFullPath, ByRef $oCert, $sReferenceUri = Default, $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $sSignatureId = Default, $sSignedPropertiesId = Default, $sFileRefId = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not FileExists($sFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sOutputXadesFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $sDigestAlgorithmUri = __Chilkat_XADES_DigestAlgorithmUri($sDigestMethod)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sUnique = @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & Random(100000, 999999, 1)
	If $sReferenceUri = Default Or $sReferenceUri = '' Then $sReferenceUri = __Chilkat_PathGetFileName($sFileFullPath)
	If $sSignatureId = Default Or $sSignatureId = '' Then $sSignatureId = 'xmldsig-' & $sUnique
	If $sSignedPropertiesId = Default Or $sSignedPropertiesId = '' Then $sSignedPropertiesId = $sSignatureId & '-signedprops'
	If $sFileRefId = Default Or $sFileRefId = '' Then $sFileRefId = $sSignatureId & '-ref0'

	Local $oGen = _Chilkat_XMLDSIGGEN_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oGen.SigId = $sSignatureId
	$oGen.SigNamespacePrefix = 'ds'
	$oGen.SigNamespaceUri = 'http://www.w3.org/2000/09/xmldsig#'
	$oGen.SigValueId = $sSignatureId & '-sigvalue'
	$oGen.SignedInfoCanonAlg = 'EXCL_C14N'
	$oGen.SignedInfoDigestMethod = $sDigestMethod
	$oGen.KeyInfoId = $sSignatureId & '-keyinfo'

	Local $oObject1 = _Chilkat_XML_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oObject1.Tag = 'xades:QualifyingProperties'
	$oObject1.AddAttribute('xmlns:xades', 'http://uri.etsi.org/01903/v1.3.2#')
	$oObject1.AddAttribute('xmlns:xades141', 'http://uri.etsi.org/01903/v1.4.1#')
	$oObject1.AddAttribute('Target', '#' & $sSignatureId)
	$oObject1.UpdateAttrAt('xades:SignedProperties', True, 'Id', $sSignedPropertiesId)
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningTime', 'TO BE GENERATED BY CHILKAT')
	$oObject1.UpdateAttrAt('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificateV2|xades:Cert|xades:CertDigest|ds:DigestMethod', True, 'Algorithm', $sDigestAlgorithmUri)
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificateV2|xades:Cert|xades:CertDigest|ds:DigestValue', 'TO BE GENERATED BY CHILKAT')
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedSignatureProperties|xades:SigningCertificateV2|xades:Cert|xades:IssuerSerialV2', 'TO BE GENERATED BY CHILKAT')
	$oObject1.UpdateAttrAt('xades:SignedProperties|xades:SignedDataObjectProperties|xades:DataObjectFormat', True, 'ObjectReference', '#' & $sFileRefId)
	$oObject1.UpdateChildContent('xades:SignedProperties|xades:SignedDataObjectProperties|xades:DataObjectFormat|xades:MimeType', $sMimeType)

	Local $iSuccess = $oGen.AddObject('', $oObject1.GetXml(), '', '')
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalFile_BES_ByCert() XmlDSigGen.AddObject()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oGen.AddExternalFileRef($sReferenceUri, $sFileFullPath, $sDigestMethod, '')
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalFile_BES_ByCert() XmlDSigGen.AddExternalFileRef()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	$oGen.SetRefIdAttr($sReferenceUri, $sFileRefId)

	$iSuccess = $oGen.AddObjectRef($sSignedPropertiesId, $sDigestMethod, 'EXCL_C14N', '', 'http://uri.etsi.org/01903#SignedProperties')
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalFile_BES_ByCert() XmlDSigGen.AddObjectRef()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oGen.SetX509Cert($oCert, True)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalFile_BES_ByCert() XmlDSigGen.SetX509Cert()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	$oGen.KeyInfoType = 'X509Data'
	$oGen.X509Type = 'Certificate'
	$oGen.Behaviors = 'IndentedSignature,IssuerSerialHex'

	Local $oSbXml = _Chilkat_StringBuilder_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$iSuccess = $oGen.CreateXmlDSigSb($oSbXml)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_SignExternalFile_BES_ByCert() XmlDSigGen.CreateXmlDSigSb()', $oGen, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oSbXml.WriteFile($sOutputXadesFileFullPath, 'utf-8', False)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_XADES_SignExternalFile_BES_ByCert

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_SignExternalFile_BES_ByPkcs11
; Description ...: Creates a detached XAdES-BES XML signature for an external file using a PKCS11 token/HSM.
; Syntax ........: _Chilkat_XADES_SignExternalFile_BES_ByPkcs11($sFileFullPath, $sOutputXadesFileFullPath, $sPkcs11DllFullPath, $sPIN, $iUserType = 1, $sReferenceUri = Default, $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream')
; Parameters ....: $sFileFullPath         - [in] file to sign and digest.
;                  $sOutputXadesFileFullPath - [in] output XAdES XML file.
;                  $sPkcs11DllFullPath    - [in] PKCS11 shared library path.
;                  $sPIN                  - [in] PKCS11 user PIN.
;                  $iUserType             - [in] PKCS11 user type. Default is 1.
;                  $sReferenceUri         - [in] optional URI written into the signature.
;                  $sDigestMethod         - [in] digest method. Default is 'sha256'.
;                  $sMimeType             - [in] signed file MIME type. Default is 'application/octet-stream'.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Opens a quick PKCS11 session, finds the first certificate with private key, signs, then closes the session.
; Related .......: _Chilkat_PKCS11_OpenSession, _Chilkat_PKCS11_FindCertWithPrivateKey, _Chilkat_XADES_SignExternalFile_BES_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_SignExternalFile_BES_ByPkcs11($sFileFullPath, $sOutputXadesFileFullPath, $sPkcs11DllFullPath, $sPin, $iUserType = 1, $sReferenceUri = Default, $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream')
	Local $oPkcs11 = _Chilkat_PKCS11_OpenSession($sPkcs11DllFullPath, $sPin, $iUserType)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oCert = _Chilkat_PKCS11_FindCertWithPrivateKey($oPkcs11)
	If @error Then
		Local $iErr = @error, $iExt = @extended
		_Chilkat_PKCS11_CloseSession($oPkcs11)
		Return SetError($iErr, $iExt, $CHILKAT_RET_FAILURE)
	EndIf

	Local $vReturn = _Chilkat_XADES_SignExternalFile_BES_ByCert($sFileFullPath, $sOutputXadesFileFullPath, $oCert, $sReferenceUri, $sDigestMethod, $sMimeType)
	Local $iReturnError = @error, $iReturnExtended = @extended
	_Chilkat_PKCS11_CloseSession($oPkcs11)
	Return SetError($iReturnError, $iReturnExtended, $vReturn)
EndFunc   ;==>_Chilkat_XADES_SignExternalFile_BES_ByPkcs11

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_SignExternalFile_BES_BySmartCard
; Description ...: Creates a detached XAdES-BES XML signature for an external file using a smart-card or USB-token certificate.
; Syntax ........: _Chilkat_XADES_SignExternalFile_BES_BySmartCard($sFileFullPath, $sOutputXadesFileFullPath, $sPIN = Default, $s_CspName = '', $sReferenceUri = Default, $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $bNoDialog = Default, $bRejectExpired = 1)
; Parameters ....: $sFileFullPath         - [in] file to sign and digest.
;                  $sOutputXadesFileFullPath - [in] output XAdES XML file.
;                  $sPIN                  - [in] optional card/token PIN.
;                  $s_CspName             - [in] optional CSP/provider name.
;                  $sReferenceUri         - [in] optional URI written into the signature.
;                  $sDigestMethod         - [in] digest method. Default is 'sha256'.
;                  $sMimeType             - [in] signed file MIME type. Default is 'application/octet-stream'.
;                  $bNoDialog             - [in] optional smart-card no-dialog flag.
;                  $bRejectExpired        - [in] when 1, skip expired and not-yet-valid certificates. Default = 1.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Certificate selection uses CertStore.OpenSmartcard() by default to avoid arbitrary selection of an expired certificate.
; Related .......: _Chilkat_Cert_LoadFromSmartCardEx, _Chilkat_XADES_SignExternalFile_BES_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigGenRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_SignExternalFile_BES_BySmartCard($sFileFullPath, $sOutputXadesFileFullPath, $sPin = Default, $s_CspName = '', $sReferenceUri = Default, $sDigestMethod = 'sha256', $sMimeType = 'application/octet-stream', $bNoDialog = Default, $bRejectExpired = 1)
	Local $oCert = _Chilkat_Cert_LoadFromSmartCardEx($s_CspName, $sPin, $bNoDialog, $bRejectExpired)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $vReturn = _Chilkat_XADES_SignExternalFile_BES_ByCert($sFileFullPath, $sOutputXadesFileFullPath, $oCert, $sReferenceUri, $sDigestMethod, $sMimeType)
	Return SetError(@error, @extended, $vReturn)
EndFunc   ;==>_Chilkat_XADES_SignExternalFile_BES_BySmartCard

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_VerifyBinary_AsBool
; Description ...: Verifies binary XAdES/XMLDSig XML with external binary data and returns True only if every signature is valid.
; Syntax ........: _Chilkat_XADES_VerifyBinary_AsBool(ByRef $dXadesXmlBinary, ByRef $dExternalBinaryData, $sReferenceUri = Default)
; Parameters ....: $dXadesXmlBinary       - [in/out] XAdES/XMLDSig XML bytes.
;                  $dExternalBinaryData   - [in/out] external data bytes referenced by ds:Reference.
;                  $sReferenceUri         - [in] optional URI filter. Default/empty supplies the data for every external reference.
; Return values .: Success: True/False. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses _Chilkat_XADES_VerifyBinary_AsJson() and returns the allValid value.
; Related .......: _Chilkat_XADES_VerifyBinary_AsJson
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_VerifyBinary_AsBool(ByRef $dXadesXmlBinary, ByRef $dExternalBinaryData, $sReferenceUri = Default)
	Local $oResult = _Chilkat_XADES_VerifyBinary_AsJson($dXadesXmlBinary, $dExternalBinaryData, $sReferenceUri)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oResult.BoolOf('allValid'))
EndFunc   ;==>_Chilkat_XADES_VerifyBinary_AsBool

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_VerifyBinary_AsJson
; Description ...: Verifies XAdES/XMLDSig XML loaded from binary data and supplies external signed binary data from memory.
; Syntax ........: _Chilkat_XADES_VerifyBinary_AsJson(ByRef $dXadesXmlBinary, ByRef $dExternalBinaryData, $sReferenceUri = Default)
; Parameters ....: $dXadesXmlBinary       - [in/out] XAdES/XMLDSig XML bytes.
;                  $dExternalBinaryData   - [in/out] external data bytes referenced by ds:Reference.
;                  $sReferenceUri         - [in] optional URI filter. Default/empty supplies the data for every external reference.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses XmlDSig.LoadSignatureBd(), SetRefDataBd() and VerifySignature(True). For multiple different external refs, call/extend with per-URI data.
; Related .......: _Chilkat_XADES_VerifyBinary_AsBool, _Chilkat_XADES_SignExternalBinary_BES_ByCert
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_VerifyBinary_AsJson(ByRef $dXadesXmlBinary, ByRef $dExternalBinaryData, $sReferenceUri = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oSigBd = _Chilkat_BINDATA_FromBinary($dXadesXmlBinary)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oExternalBd = _Chilkat_BINDATA_FromBinary($dExternalBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oVerifier = _Chilkat_XMLDSIG_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oVerifier.LoadSignatureBd($oSigBd)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_VerifyBinary_AsJson() XmlDSig.LoadSignatureBd()', $oVerifier, $CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oResult = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oResult.EmitCompact = 0
	$oResult.UpdateInt('numSignatures', $oVerifier.NumSignatures)
	Local $sReferenceUriFilter = ''
	Local $bMatchAnyReference = 0
	If $sReferenceUri = Default Or $sReferenceUri = '' Then
		$bMatchAnyReference = 1
	Else
		$sReferenceUriFilter = $sReferenceUri
	EndIf
	$oResult.UpdateString('referenceUriFilter', $sReferenceUriFilter)

	Local $iAllValid = 1
	For $iSignature_idx = 0 To $oVerifier.NumSignatures - 1
		$oVerifier.Selector = $iSignature_idx
		Local $iExternalRefsMatched = 0
		$oResult.UpdateInt('signatures[' & $iSignature_idx & '].index', $iSignature_idx)
		$oResult.UpdateInt('signatures[' & $iSignature_idx & '].numReferences', $oVerifier.NumReferences)

		For $iReference_idx = 0 To $oVerifier.NumReferences - 1
			Local $sRefBase = 'signatures[' & $iSignature_idx & '].references[' & $iReference_idx & ']'
			Local $sRefUri = $oVerifier.ReferenceUri($iReference_idx)
			Local $iIsExternal = $oVerifier.IsReferenceExternal($iReference_idx)
			$oResult.UpdateInt($sRefBase & '.index', $iReference_idx)
			$oResult.UpdateString($sRefBase & '.uri', $sRefUri)
			$oResult.UpdateBool($sRefBase & '.external', $iIsExternal = 1)

			If $iIsExternal = 1 And ($bMatchAnyReference Or $sRefUri = $sReferenceUriFilter) Then
				Local $iSetRefOk = $oVerifier.SetRefDataBd($iReference_idx, $oExternalBd)
				$oResult.UpdateBool($sRefBase & '.refDataSupplied', $iSetRefOk = 1)
				If $iSetRefOk = 1 Then $iExternalRefsMatched = $iExternalRefsMatched + 1
			EndIf
		Next

		$oResult.UpdateInt('signatures[' & $iSignature_idx & '].externalRefsMatched', $iExternalRefsMatched)
		Local $iValid = $oVerifier.VerifySignature(True)
		If $iValid <> 1 Then $iAllValid = 0
		$oResult.UpdateBool('signatures[' & $iSignature_idx & '].valid', $iValid = 1)
		If $iValid <> 1 Then $oResult.UpdateString('signatures[' & $iSignature_idx & '].lastErrorText', $oVerifier.LastErrorText)
	Next
	$oResult.UpdateBool('allValid', $iAllValid = 1)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oResult)
EndFunc   ;==>_Chilkat_XADES_VerifyBinary_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_VerifyFile_AsBool
; Description ...: Verifies all signatures in an XAdES/XMLDSig file and returns True only if every signature is valid.
; Syntax ........: _Chilkat_XADES_VerifyFile_AsBool($sXadesFileFullPath, $sExternalRefDirs = Default, $sCharset = 'utf-8')
; Parameters ....: $sXadesFileFullPath    - [in] XAdES/XMLDSig file path.
;                  $sExternalRefDirs      - [in] semicolon-separated external-reference search directories. Default is the XAdES file directory.
;                  $sCharset              - [in] charset for loading XML. Default is 'utf-8'.
; Return values .: Success: True/False. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses _Chilkat_XADES_VerifyFile_AsJson() and returns the allValid value.
; Related .......: _Chilkat_XADES_VerifyFile_AsJson
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_VerifyFile_AsBool($sXadesFileFullPath, $sExternalRefDirs = Default, $sCharset = 'utf-8')
	Local $oResult = _Chilkat_XADES_VerifyFile_AsJson($sXadesFileFullPath, $sExternalRefDirs, $sCharset)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oResult.BoolOf('allValid'))
EndFunc   ;==>_Chilkat_XADES_VerifyFile_AsBool

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_XADES_VerifyFile_AsJson
; Description ...: Verifies all signatures in an XAdES/XMLDSig file and returns a JSON summary.
; Syntax ........: _Chilkat_XADES_VerifyFile_AsJson($sXadesFileFullPath, $sExternalRefDirs = Default, $sCharset = 'utf-8')
; Parameters ....: $sXadesFileFullPath    - [in] XAdES/XMLDSig file path.
;                  $sExternalRefDirs      - [in] semicolon-separated external-reference search directories. Default is the XAdES file directory.
;                  $sCharset              - [in] charset for loading XML. Default is 'utf-8'.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses XmlDSig.LoadSignatureSb() and VerifySignature(True).
; Related .......: _Chilkat_XADES_VerifyFile_AsBool, _Chilkat_XMLDSIG_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatXmlDSigRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_XADES_VerifyFile_AsJson($sXadesFileFullPath, $sExternalRefDirs = Default, $sCharset = 'utf-8')
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not FileExists($sXadesFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $sExternalRefDirs = Default Then $sExternalRefDirs = __Chilkat_PathGetDir($sXadesFileFullPath)

	Local $oSbXml = _Chilkat_StringBuilder_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oSbXml.LoadFile($sXadesFileFullPath, $sCharset)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $oVerifier = _Chilkat_XMLDSIG_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If $sExternalRefDirs <> '' Then $oVerifier.ExternalRefDirs = $sExternalRefDirs

	$iSuccess = $oVerifier.LoadSignatureSb($oSbXml)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_XADES_VerifyFile_AsJson() XmlDSig.LoadSignatureSb()', $oVerifier, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oResult = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oResult.EmitCompact = 0
	$oResult.UpdateInt('numSignatures', $oVerifier.NumSignatures)
	$oResult.UpdateString('externalRefDirs', $sExternalRefDirs)

	Local $iAllValid = 1
	For $iSignature_idx = 0 To $oVerifier.NumSignatures - 1
		$oVerifier.Selector = $iSignature_idx
		Local $iValid = $oVerifier.VerifySignature(True)
		If $iValid <> 1 Then $iAllValid = 0
		$oResult.I = $iSignature_idx
		$oResult.UpdateInt('signatures[i].index', $iSignature_idx)
		$oResult.UpdateBool('signatures[i].valid', $iValid = 1)
		If $iValid <> 1 Then $oResult.UpdateString('signatures[i].lastErrorText', $oVerifier.LastErrorText)
	Next
	$oResult.UpdateBool('allValid', $iAllValid = 1)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oResult)
EndFunc   ;==>_Chilkat_XADES_VerifyFile_AsJson

#EndRegion ; _Chilkat_XADES_**

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
	__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)
	If $b_IsRequiredVersion = Default Or $sRequiredVersion_Last_static <> $sRequiredVersion Then
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)
		$sRequiredVersion_Last_static = $sRequiredVersion
		Local $sChilkatVersion = _Chilkat_GetVersion()
		If @error Then Return SetError(@error, @extended, $sChilkatVersion)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)

		Local $aChilkatVersion = StringSplit($sChilkatVersion, ".", $STR_NOCOUNT)
		If @error Or Not UBound($aChilkatVersion) Then Return SetError(@error, @extended, False)
		If UBound($aChilkatVersion) = 3 Then ReDim $aChilkatVersion[4]

		Local $iCurrentVersion = Number(StringFormat("%03i%03i%03i%03i", $aChilkatVersion[0], $aChilkatVersion[1], $aChilkatVersion[2], $aChilkatVersion[3]))

		Local $aVersionNumberToCompare = StringSplit($sRequiredVersion, ".", $STR_NOCOUNT)
		Local $iVersionNumberToCompare = Number(StringFormat("%03i%03i%03i%03i", $aVersionNumberToCompare[0], $aVersionNumberToCompare[1], $aVersionNumberToCompare[2], $aVersionNumberToCompare[3]))

		$b_IsRequiredVersion = ($iCurrentVersion >= $iVersionNumberToCompare)
		__Chilkat_Log(@ScriptLineNumber & ' _Chilkat_IsAtLeastThisVersion("' & $sRequiredVersion & '", "' & $_Comment & '")   > COMPARE:    CURRENT>=REQUIRED (' & $iCurrentVersion & ' >= ' & $iVersionNumberToCompare & ')    RESULT: ' & $b_IsRequiredVersion)
	EndIf

	Return $b_IsRequiredVersion
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
