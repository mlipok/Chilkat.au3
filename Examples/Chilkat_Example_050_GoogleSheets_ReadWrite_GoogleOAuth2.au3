#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_50_GoogleSheets_ReadWrite_GoogleOAuth2()
If @error Then MsgBox($MB_ICONERROR, '_Example_50_GoogleSheets_ReadWrite_GoogleOAuth2', 'Example failed. @error=' & @error & ', @extended=' & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_50_GoogleSheets_ReadWrite_GoogleOAuth2
; Description ...: Demonstrates Google Sheets OAuth2 authorization, token refresh, reading values and opt-in appending.
; Syntax ........: _Example_50_GoogleSheets_ReadWrite_GoogleOAuth2()
; Parameters ....: None
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Remarks .......: Set the spreadsheet and operation parameters in the local constants below.
;                  Fill in OAuth2 client data in !!!_MY_SECRET_DATA\GoogleOAuth2_Client.json.
;                  OAuth2 tokens are saved below !!!_MY_SECRET_DATA, which is protected by the repository .gitignore.
; ===============================================================================================================================
Func _Example_50_GoogleSheets_ReadWrite_GoogleOAuth2()
	; Google Sheets operation parameters are intentionally kept in this example.
	Local Const $sSpreadsheetId = 'YOUR_GOOGLE_SHEET_ID'
	Local Const $sReadRange = 'Sheet1!A1:D20'
	Local Const $sAppendRange = 'Sheet1!A:B'
	Local Const $bWriteEnabled = False
	Local Const $iListenPort = 3017

	Local Const $sSecretDirectory = @ScriptDir & '\!!!_MY_SECRET_DATA'
	Local Const $sClientConfigFile = $sSecretDirectory & '\GoogleOAuth2_Client.json'
	Local Const $sTokenFile = $sSecretDirectory & '\GoogleSheets_OAuth2.json'
	If Not FileExists($sClientConfigFile) Then
		MsgBox($MB_ICONINFORMATION, 'Google Sheets', _
				'Create and fill in this private OAuth2 client file first:' & @CRLF & $sClientConfigFile)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oConfig = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If $oConfig.LoadFile($sClientConfigFile) = False Then
		__Chilkat_LogOnError('_Example_50_GoogleSheets_ReadWrite_GoogleOAuth2() JsonObject.LoadFile()', $oConfig, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sClientId = $oConfig.StringOf('client_id')
	Local $sClientSecret = $oConfig.StringOf('client_secret')
	If $sClientId = '' Or $sClientId = 'YOUR_GOOGLE_OAUTH2_CLIENT_ID' Then
		MsgBox($MB_ICONERROR, 'Google Sheets', 'client_id is required in GoogleOAuth2_Client.json.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oTokenJson = __Example_50_GetGoogleToken($sClientId, $sClientSecret, $iListenPort, $sTokenFile, $sSecretDirectory)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sAccessToken = $oTokenJson.StringOf('access_token')
	If $sAccessToken = '' Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	If $sSpreadsheetId = '' Or $sSpreadsheetId = 'YOUR_GOOGLE_SHEET_ID' Then
		MsgBox($MB_ICONINFORMATION, 'Google Sheets OAuth2', _
				'Google authorization completed successfully.' & @CRLF & @CRLF & _
				'Set $sSpreadsheetId in this example before running the Google Sheets operations.')
		Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
	EndIf

	Local $oValues = _Chilkat_GoogleSheets_ReadValues_AsJson($sSpreadsheetId, $sReadRange, $sAccessToken)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oValues.EmitCompact = False
	_Log_ChilkatExample('Google Sheets values from ' & $sReadRange & ':' & @CRLF & $oValues.Emit())

	If $bWriteEnabled Then
		Local $oValueRange = _Chilkat_JSON_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		If $oValueRange.Load('{"majorDimension":"ROWS","values":[["Source","Value"],["Chilkat.au3","Google Sheets OAuth2 example"]]}') = False Then _
				Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

		Local $oAppendResult = _Chilkat_GoogleSheets_AppendValues_AsJson($sSpreadsheetId, $sAppendRange, $sAccessToken, $oValueRange)
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		$oAppendResult.EmitCompact = False
		_Log_ChilkatExample('Append result:' & @CRLF & $oAppendResult.Emit())
	Else
		_Log_ChilkatExample('Write is disabled. Set $bWriteEnabled to True in this example to run the append operation.')
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Example_50_GoogleSheets_ReadWrite_GoogleOAuth2

; #INTERNAL_USE_ONLY# ===========================================================================================================
; Name ..........: __Example_50_GetGoogleToken
; Description ...: Loads and refreshes a saved token or starts the interactive authorization flow.
; ===============================================================================================================================
Func __Example_50_GetGoogleToken($sClientId, $sClientSecret, $iListenPort, $sTokenFile, $sSecretDirectory)
	Local $oTokenJson = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If FileExists($sTokenFile) And $oTokenJson.LoadFile($sTokenFile) Then
		Local $oRefreshedToken
		If $sClientSecret = '' Then
			$oRefreshedToken = _Chilkat_GoogleOAuth2_Refresh_AsJson($sClientId, $oTokenJson)
		Else
			$oRefreshedToken = _Chilkat_GoogleOAuth2_Refresh_AsJson($sClientId, $oTokenJson, $sClientSecret)
		EndIf
		If Not @error Then
			If Not __Example_50_SaveToken($oRefreshedToken, $sTokenFile, $sSecretDirectory) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oRefreshedToken)
		EndIf
		_Log_ChilkatExample('The saved token could not be refreshed. Starting interactive authorization.')
	EndIf

	Local Const $sScope = 'https://www.googleapis.com/auth/spreadsheets'
	Local $oAuthorizedToken
	If $sClientSecret = '' Then
		$oAuthorizedToken = _Chilkat_GoogleOAuth2_Authorize_AsJson($sClientId, $sScope, $iListenPort)
	Else
		$oAuthorizedToken = _Chilkat_GoogleOAuth2_Authorize_AsJson($sClientId, $sScope, $iListenPort, 90000, $sClientSecret)
	EndIf
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If Not __Example_50_SaveToken($oAuthorizedToken, $sTokenFile, $sSecretDirectory) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oAuthorizedToken)
EndFunc   ;==>__Example_50_GetGoogleToken

; #INTERNAL_USE_ONLY# ===========================================================================================================
; Name ..........: __Example_50_SaveToken
; Description ...: Saves sensitive token JSON in the ignored private example directory.
; ===============================================================================================================================
Func __Example_50_SaveToken($oTokenJson, $sTokenFile, $sSecretDirectory)
	If Not FileExists($sSecretDirectory) And Not DirCreate($sSecretDirectory) Then _
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Local $hTokenFile = FileOpen($sTokenFile, BitOR($FO_OVERWRITE, $FO_UTF8_NOBOM))
	If $hTokenFile = -1 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	$oTokenJson.EmitCompact = False
	Local $iWritten = FileWrite($hTokenFile, $oTokenJson.Emit())
	FileClose($hTokenFile)
	If $iWritten = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_50_SaveToken
