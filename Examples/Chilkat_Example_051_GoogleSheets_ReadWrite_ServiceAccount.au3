#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_51_GoogleSheets_ReadWrite_ServiceAccount()
If @error Then MsgBox($MB_ICONERROR, '_Example_51_GoogleSheets_ReadWrite_ServiceAccount', 'Example failed. @error=' & @error & ', @extended=' & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_51_GoogleSheets_ReadWrite_ServiceAccount
; Description ...: Demonstrates unattended Google Sheets access using a service-account JSON private key.
; Syntax ........: _Example_51_GoogleSheets_ReadWrite_ServiceAccount()
; Parameters ....: None
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Remarks .......: Save the downloaded service-account key as !!!_MY_SECRET_DATA\GoogleServiceAccount.json.
;                  Share the target spreadsheet with the client_email from that key; grant Editor access for writes.
;                  The private-key directory is protected by the repository .gitignore.
; ===============================================================================================================================
;
; MINI HOW TO - Google credentials
;
; The following small JSON file belongs to the GoogleOAuth2 example, not to this ServiceAccount example:
; {
;   "client_id": "YOUR_GOOGLE_OAUTH2_CLIENT_ID",
;   "client_secret": ""
; }
;
; To obtain client_id for Chilkat_Example_050_GoogleSheets_ReadWrite_GoogleOAuth2.au3:
; 1. Open Google Cloud Console and select or create a project.
; 2. Enable Google Sheets API in APIs & Services > Library.
; 3. Configure Google Auth Platform > Branding and Audience; add your account as a test user when required.
; 4. Open Google Auth Platform > Clients and select Create client.
; 5. Select Desktop app, create the client and copy its Client ID.
; 6. Save it in !!!_MY_SECRET_DATA\GoogleOAuth2_Client.json. client_secret may remain empty for a desktop client.
;
; To configure this ServiceAccount example instead:
; 1. Open Google Cloud Console > IAM & Admin > Service Accounts.
; 2. Create a service account, open it and select Keys > Add key > Create new key > JSON.
; 3. Save the downloaded key as !!!_MY_SECRET_DATA\GoogleServiceAccount.json.
; 4. Open the target spreadsheet and share it with client_email from the downloaded JSON key.
; 5. Grant Viewer access for reads or Editor access for writes.
;
Func _Example_51_GoogleSheets_ReadWrite_ServiceAccount()
	; Google Sheets operation parameters are intentionally kept in this example.
	Local Const $sSpreadsheetId = 'YOUR_GOOGLE_SHEET_ID'
	Local Const $sReadRange = 'Sheet1!A1:D20'
	Local Const $sAppendRange = 'Sheet1!A:B'
	Local Const $bWriteEnabled = False

	Local Const $sServiceAccountKeyFile = @ScriptDir & '\!!!_MY_SECRET_DATA\GoogleServiceAccount.json'
	If Not FileExists($sServiceAccountKeyFile) Then
		MsgBox($MB_ICONINFORMATION, 'Google Sheets Service Account', _
				'Download a Google service-account JSON key and save it as:' & @CRLF & $sServiceAccountKeyFile)
		Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oServiceAccountJson = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If $oServiceAccountJson.LoadFile($sServiceAccountKeyFile) = False Then
		__Chilkat_LogOnError('_Example_51_GoogleSheets_ReadWrite_ServiceAccount() JsonObject.LoadFile()', $oServiceAccountJson, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Local $sServiceAccountEmail = $oServiceAccountJson.StringOf('client_email')
	If $sServiceAccountEmail = '' Then
		MsgBox($MB_ICONERROR, 'Google Sheets Service Account', 'The JSON key does not contain client_email.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	If $sSpreadsheetId = '' Or $sSpreadsheetId = 'YOUR_GOOGLE_SHEET_ID' Then
		MsgBox($MB_ICONINFORMATION, 'Google Sheets Service Account', _
				'Share the spreadsheet with:' & @CRLF & $sServiceAccountEmail & @CRLF & @CRLF & _
				'Then set $sSpreadsheetId in this example.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local Const $sScope = 'https://www.googleapis.com/auth/spreadsheets'
	Local $sAccessToken = _Chilkat_GoogleServiceAccount_ObtainAccessToken($oServiceAccountJson.Emit(), $sScope)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oValues = _Chilkat_GoogleSheets_ReadValues_AsJson($sSpreadsheetId, $sReadRange, $sAccessToken)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oValues.EmitCompact = False
	_Log_ChilkatExample('Google Sheets values from ' & $sReadRange & ':' & @CRLF & $oValues.Emit())

	If $bWriteEnabled Then
		Local $oValueRange = _Chilkat_JSON_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		If $oValueRange.Load('{"majorDimension":"ROWS","values":[["Source","Value"],["Chilkat.au3","Google Sheets service-account example"]]}') = False Then _
				Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

		Local $oAppendResult = _Chilkat_GoogleSheets_AppendValues_AsJson($sSpreadsheetId, $sAppendRange, $sAccessToken, $oValueRange)
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		$oAppendResult.EmitCompact = False
		_Log_ChilkatExample('Append result:' & @CRLF & $oAppendResult.Emit())
	Else
		_Log_ChilkatExample('Write is disabled. Set $bWriteEnabled to True in this example to run the append operation.')
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Example_51_GoogleSheets_ReadWrite_ServiceAccount
