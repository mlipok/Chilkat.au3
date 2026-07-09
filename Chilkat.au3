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
; Date ..........: 2026/02/09
; Version .......: 0.1.4 BETA - Work in progress
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

	0.1.4
	2026/02/09
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

	@LAST

	;~	https://www.chilkatsoft.com/refdoc/xChilkatJsonObjectRef.html
#ce
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
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>

#include "IE.au3"
#include "ChilkatConstants.au3"
#EndRegion - Chilkat.au3 - Include

Global $__g_oChilkat_GLOBAL = Null
Global $__g_sChilkat_LastCOMError = ''

OnAutoItExitRegister(_Chilkat_ShutDown) ; in case the script exit without calling _Chilkat_ShutDown()

#Region - Chilkat.au3 - Function - INIT
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

Func _Chilkat_ShutDown()
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	__Chilkat_Log('Closing opened Chilkat instances')
	If IsObj($__g_oChilkat_GLOBAL) Then
		If _Chilkat_IsAtLeastThisVersion('9.5.0.56') Then $__g_oChilkat_GLOBAL.FinalizeThreadPool()
		$__g_oChilkat_GLOBAL = Null
	EndIf
	DllClose($__g_hDll_CHILKAT)
	$__g_hDll_CHILKAT = 0
EndFunc   ;==>_Chilkat_ShutDown

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

#Region - Chilkat.au3 - Function - ObjCreate

Func __Chilkat_ObjCreate_Wrapper($iChilkatObjectName_IDX)
	; Try to use registered ActiveX object
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Fake_COM_ERROR_HANDLER__for_Chilkat)
	If $__g_iChilkat_DLLVersion = -1 Then
		If Not @compiled Then
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
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " REGISTERED COM OBJECT")
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " PROGID=" & $CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_PROGID])
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " IsObj=" & IsObj($oObject))
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " VarType=" & VarGetType($oObject))
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " IDX=" & $iChilkatObjectName_IDX & ' > Using registered ActiveX component NAME=' & ObjName($oObject, $OBJ_NAME) & ' located: ' & ObjName($oObject, $OBJ_FILE))
		If Not @Compiled And IsObj($oObject) Then __Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & " Object Version=" & $oObject.Version)

		If Not @Compiled Then _Chilkat_ObjName_FlagsValue($oObject, @ScriptLineNumber)
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
		$oObject = ObjCreate( _
				$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_CLSID], _
				$CHILKATOBJ_API[$__g_iChilkat_DLLVersion][$iChilkatObjectName_IDX][$CHILKATOBJ_ID_IID], _
				$__g_hDll_CHILKAT)
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

Func _Chilkat_ATOM_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatAtomRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ATOM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ATOM_ObjCreate

Func _Chilkat_BINDATA_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_BINDATA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_BINDATA_ObjCreate

Func _Chilkat_Cert_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CERT)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Cert_ObjCreate

Func _Chilkat_CertStore_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CERTSTORE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CertStore_ObjCreate

Func _Chilkat_CKSTRING_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CKSTRING)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CKSTRING_ObjCreate

Func _Chilkat_CodeSign_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CODESIGN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CodeSign_ObjCreate

Func _Chilkat_Csp_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CSP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Csp_ObjCreate

Func _Chilkat_CSV_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CSV)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_CSV_ObjCreate

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

Func _Chilkat_FTP2_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatFTP2Ref.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_FTP2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_FTP2_ObjCreate

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
	If _Chilkat_IsAtLeastThisVersion('9.5.0.78') Then $__g_oChilkat_GLOBAL.VerboseTls = $iVerboseTls
	$__g_oChilkat_GLOBAL.DefaultUtf8 = $iDefaultUtf8
	$__g_oChilkat_GLOBAL.DefaultNtlmVersion = $iDefaultNtlmVersion
	If IsString($sAnsiCodePage) Then _
			$__g_oChilkat_GLOBAL.AnsiCodePage = $sAnsiCodePage
	Return SetError(@error, @extended, $__g_oChilkat_GLOBAL)
EndFunc   ;==>_Chilkat_GLOBAL_ObjCreate

Func _Chilkat_HTTP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HTTP_ObjCreate

Func _Chilkat_IMAP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_IMAP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_IMAP_ObjCreate

Func _Chilkat_JSON_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_JSON)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_JSON_ObjCreate

Func _Chilkat_MAILBOXES_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_MAILBOXES)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_MAILBOXES_ObjCreate

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

Func _Chilkat_Pdf_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PDF)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Pdf_ObjCreate

Func _Chilkat_SCP_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSCPRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SCP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SCP_ObjCreate

Func _Chilkat_SFTP_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTP_ObjCreate

Func _Chilkat_SFTPDIR_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPDIRRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTPDIR)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTPDIR_ObjCreate

Func _Chilkat_SFTPFILE_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPFILERef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTPFILE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTPFILE_ObjCreate

Func _Chilkat_SSHTunel_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSHTUNEL)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SSHTunel_ObjCreate

Func _Chilkat_StringBuilder_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STRINGBUILDER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_StringBuilder_ObjCreate

Func _Chilkat_StringTable_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STRINGTABLE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_StringTable_ObjCreate

Func _Chilkat_TASK_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TASK)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_TASK_ObjCreate

Func _Chilkat_TASKCHAIN_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TASKCHAIN)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_TASKCHAIN_ObjCreate

Func _Chilkat_XML_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_XML)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_XML_ObjCreate

Func _Chilkat_ZIP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIP_ObjCreate

Func _Chilkat_ZIPCRC_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIPCRC)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIPCRC_ObjCreate

Func _Chilkat_ZIPENTRY_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIPENTRY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIPENTRY_ObjCreate
#EndRegion - Chilkat.au3 - Function - ObjCreate

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

Func _Chilkat_ErrorLogWrapper($fnFunction = Default, $iError = @error, $iExtended = @extended)
	Local Static $fnFunction_static = ConsoleWrite
	If $fnFunction = Default Then Return SetError($iError, $iExtended, $fnFunction_static)
	If $fnFunction = Null And Not IsFunc($fnFunction) Then Return SetError(1)

	$fnFunction_static = $fnFunction
	Return SetError($iError, $iExtended, $fnFunction_static)
EndFunc   ;==>_Chilkat_ErrorLogWrapper

Func _Chilkat_GetVersion()
	__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber & ' VERSION: ' & $__g_oChilkat_GLOBAL.Version & ' :: TYPE :: ' & VarGetType($__g_oChilkat_GLOBAL))

	If IsObj($__g_oChilkat_GLOBAL) And VarGetType($__g_oChilkat_GLOBAL) = 'Object' Then _
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $__g_oChilkat_GLOBAL.Version)

	Return SetError($CHILKAT_ERR_GENERAL, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_FAILURE)
EndFunc   ;==>_Chilkat_GetVersion

Func _Chilkat_IsAtLeastThisVersion($sVersionNumberToCompare)
;~ https://www.autoitscript.com/forum/topic/166640-how-to-format-the-output-of-the-autoitversion-macro/?do=findComment&comment=1218031
	Local Static $b_IsRequiredVersion = Default
	Local Static $sVersionNumberToCompare_Last_static = Default
	__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)
	If $b_IsRequiredVersion = Default Or $sVersionNumberToCompare_Last_static <> $sVersionNumberToCompare Then
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)
		$sVersionNumberToCompare_Last_static = $sVersionNumberToCompare
		Local $sChilkatVersion = _Chilkat_GetVersion()
		If @error Then Return SetError(@error, @extended, $sChilkatVersion)
		__Chilkat_ConsoleWrite_IFNC(@ScriptLineNumber)

		Local $aChilkatVersion = StringSplit($sChilkatVersion, ".", $STR_NOCOUNT)
		If @error Or Not UBound($aChilkatVersion) Then Return SetError(@error, @extended, False)
		If UBound($aChilkatVersion) = 3 Then ReDim $aChilkatVersion[4]

		Local $iCurrentVersion = Number(StringFormat("%03i%03i%03i%03i", $aChilkatVersion[0], $aChilkatVersion[1], $aChilkatVersion[2], $aChilkatVersion[3]))

		Local $aVersionNumberToCompare = StringSplit($sVersionNumberToCompare, ".", $STR_NOCOUNT)
		Local $iVersionNumberToCompare = Number(StringFormat("%03i%03i%03i%03i", $aVersionNumberToCompare[0], $aVersionNumberToCompare[1], $aVersionNumberToCompare[2], $aVersionNumberToCompare[3]))

		$b_IsRequiredVersion = ($iCurrentVersion >= $iVersionNumberToCompare)
		__Chilkat_Log(@ScriptLineNumber & ' COMPARE:    (' & $iCurrentVersion & ' >= ' & $iVersionNumberToCompare & ')    RESULT: ' & $b_IsRequiredVersion)
	EndIf

	Return $b_IsRequiredVersion
EndFunc   ;==>_Chilkat_IsAtLeastThisVersion

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

#Region - _Chilkat_CSV_* functions
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
#EndRegion - _Chilkat_CSV_* functions

#Region - _Chilkat_JSON_* functions
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

Func _Chilkat_JSON_StringPretty(ByRef $sJSON_String)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oJSON = _Chilkat_JSON_ObjFromString($sJSON_String)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJSON.Emit())
EndFunc   ;==>_Chilkat_JSON_StringPretty
#EndRegion - _Chilkat_JSON_* functions

#Region - _Chilkat_HTTP_* functions
Func __Chilkat_GetAndSaveFileToDisc_Progress($iProgress)
	__Chilkat_Log("Progres: " & $iProgress & "%")
EndFunc   ;==>__Chilkat_GetAndSaveFileToDisc_Progress

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
#EndRegion - _Chilkat_HTTP_* functions

#Region - _Chilkat_EMAIL_* functions

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
#EndRegion - _Chilkat_EMAIL_* functions

#Region - _Chilkat_IMAP_* functions

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
;~ _Log_Info(@ScriptLineNumber & ' IMAP wysłane: ListMailboxes::' )
;~ 	_log(_Chilkat_IMAP_ListMailboxes($oIMAP, '', '*'))

	Local $iSuccess = $oIMAP.AppendMail($sMailbox_name, $oEmail)
;~ _Log_Info(@ScriptLineNumber & ' IMAP wysłane: ' & $sMailbox_name & '  == '  & $iSuccess & ' :: ' & $oIMAP.AppendUid)
	If @error Or $iSuccess <> 1 Then
		If $sMailbox_name = 'INBOX.Sent' Then
			$sMailbox_name = 'Sent'
			$oIMAP.AppendMail($sMailbox_name, $oEmail)
;~ _Log_Info(@ScriptLineNumber & ' IMAP wysłane: ' & $sMailbox_name & '  == '  & $iSuccess & ' :: ' & $oIMAP.AppendUid)
			__Chilkat_LogOnError(@ScriptLineNumber & ' Changing: INBOX.Sent > Sent', $oIMAP)
		ElseIf $sMailbox_name = 'Sent' Then
			$sMailbox_name = 'INBOX.Sent'
			$oIMAP.AppendMail($sMailbox_name, $oEmail)
;~ _Log_Info(@ScriptLineNumber & ' IMAP wysłane: ' & $sMailbox_name & '  == '  & $iSuccess & ' :: ' & $oIMAP.AppendUid)
			__Chilkat_LogOnError(@ScriptLineNumber & ' Changing: Sent > INBOX.Sent', $oIMAP)
		EndIf
	EndIf
;~ _Log_Info(@ScriptLineNumber & ' IMAP wysłane')
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' IMAP.AppendMail ', $oIMAP)
		Return SetError(@error, @extended, $iSuccess)
	EndIf

;~ _Log_Info(@ScriptLineNumber & ' IMAP wysłane')
	__Chilkat_Log(@ScriptLineNumber & " Mail saved to Mailbox=" & $sMailbox_name)
EndFunc   ;==>_Chilkat_IMAP_ApendEmail

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
; Description ...: Get "Sent" Mailbox name
; Syntax ........: _Chilkat_IMAP_GetSentMailboxName(ByRef $oIMAP)
; Parameters ....: $oIMAP               - [in/out] an object.
; Return values .: found "Sent" Mailbox name
; Author ........: mLipok
; Modified ......:
; Remarks .......:
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
#EndRegion - _Chilkat_IMAP_* functions

#Region - _Chilkat_Cert_* functions

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

Func _Chilkat_Csp_FindCertificate_OnSmartCard_InReader()
	#REMARK ABOUT:   SmartCardNoDialog    https://www.chilkatsoft.com/refdoc/csCertRef.html#prop42

;~ 	https://www.example-code.com/autoit/find_certificate_on_smartcard_in_reader.asp
EndFunc   ;==>_Chilkat_Csp_FindCertificate_OnSmartCard_InReader

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
#EndRegion - _Chilkat_Cert_* functions

#Region - _Chilkat_PDF_* functions ; https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html
;~ 	https://www.example-code.com/autoit/pdf_sign_using_hsm_or_smartcard.asp
;~	https://www.example-code.com/autoit/pdf_invisible_signature.asp

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

Func _Chilkat_PDF_GetDSS_AsArray($sPDF_FileFullPath)
;~ 	https://www.example-code.com/vbscript/pdf_dss.asp
	Local $oJSON = _Chilkat_PDF_GetDSS_AsJson($sPDF_FileFullPath)
	#forceref $oJSON
	#TODO Danyfirex
	Local $a_DSS_Result
	Return $a_DSS_Result
	#forceref $a_DSS_Result
EndFunc   ;==>_Chilkat_PDF_GetDSS_AsArray

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
; Description ...:
; Syntax ........: _Chilkat_PDF_HasCertificationSig(ByRef $oPDF)
; Parameters ....: $oPDF                - [in/out] an object.
; Return values .: Returns 1 if the currently open PDF has a certification signature.
; Author ........: mLipok
; Modified ......:
; Remarks .......: PDF defines two types of signatures: approval and certification.
;                  The differences are as follows:
;                  Approval: There can be any number of approval signatures in a document.
;                  Certification: There can be only one certification signature and it must be the first one in a document.
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
; Description ...:
; Syntax ........: _Chilkat_PDF_HasCertificationSig_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData         - [in/out] a binary variant value contains PDF
; Return values .: Returns 1 if the currently open PDF has a certification signature.
; Author ........: mLipok
; Modified ......:
; Remarks .......: PDF defines two types of signatures: approval and certification.
;                  The differences are as follows:
;                  Approval: There can be any number of approval signatures in a document.
;                  Certification: There can be only one certification signature and it must be the first one in a document.
; Related .......:
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

Func _Chilkat_PDF_NumEmbeddedFiles(ByRef $oPDF)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Return $oPDF.NumEmbeddedFiles
EndFunc   ;==>_Chilkat_PDF_NumEmbeddedFiles

Func _Chilkat_PDF_NumEmbeddedFiles_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Return $oPDF.NumEmbeddedFiles
EndFunc   ;==>_Chilkat_PDF_NumEmbeddedFiles_FromBinary

Func _Chilkat_PDF_NumPages(ByRef $oPDF)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Return $oPDF.NumPages
EndFunc   ;==>_Chilkat_PDF_NumPages

Func _Chilkat_PDF_NumPages_FromBinary(ByRef $dBinaryData)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oPDF = _Chilkat_PDF_CreateFromBD($dBinaryData)
	If @error Then Return SetError(@error, @extended, 0)

	Return $oPDF.NumPages
EndFunc   ;==>_Chilkat_PDF_NumPages_FromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PDF_NumSignatures
; Description ...:
; Syntax ........: _Chilkat_PDF_NumSignatures(ByRef $oPDF)
; Parameters ....: $oPDF                - [in/out] an object.
; Return values .: The number of digital signatures present in the currently open PDF.
; Author ........: mLipok
; Modified ......:
; Remarks .......:
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
; Description ...:
; Syntax ........: _Chilkat_PDF_NumSignatures_FromBinary(ByRef $dBinaryData)
; Parameters ....: $dBinaryData         - [in/out] a binary variant value contains PDF
; Return values .: The number of digital signatures present in the currently open PDF.
; Author ........: mLipok
; Modified ......:
; Remarks .......:
; Related .......:
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

Func _Chilkat_PDF_VerifySignatureInBd_AsBool(ByRef $dBinaryData, $iSingature = 0)
	Local $vResult = _Chilkat_PDF_VerifySignatureInBd_AsJson($dBinaryData, $iSingature)
	__Chilkat_ConsoleWrite_IFNC('_Chilkat_PDF_VerifySignatureInBd_AsJson:' & @CRLF & $vResult)

	Return SetError(@error, @extended, ($vResult <> 0))
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInBd_AsBool

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

Func _Chilkat_PDF_VerifySignatureInFile_AsBool($sPDF_FileFullPath, $iSingature = 0)
	Local $vResult = _Chilkat_PDF_VerifySignatureInFile_AsJson($sPDF_FileFullPath, $iSingature)

	Return SetError(@error, @extended, ($vResult <> 0))
EndFunc   ;==>_Chilkat_PDF_VerifySignatureInFile_AsBool
;~ 	https://www.example-code.com/autoit/pdf_sign_using_hsm_or_smartcard.asp
;~	https://www.example-code.com/autoit/pdf_invisible_signature.asp

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
#EndRegion - _Chilkat_PDF_* functions ; https://www.chilkatsoft.com/refdoc/xChilkatPdfRef.html

Func __Chilkat_ConsoleWrite_IFNC($sData, $iError = @error, $iExtended = @extended)
	If Not @Compiled Then ConsoleWrite('- IFNC: Chilkat.au3 ' & $sData & @CRLF)
	Return SetError($iError, $iExtended)
EndFunc   ;==>__Chilkat_ConsoleWrite_IFNC

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
