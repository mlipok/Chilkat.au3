#include-once

#Region - Chilkat_Certificates_PKI.au3 - Header
; Title .........: Chilkat_Certificates_PKI.au3
; Language ......: English
; Description ...: Certificate and public-key infrastructure support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/13
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: CSR; Cert Store; Certificates; Code Signing; Java KeyStore; PEM; PFX/P12; PKCS11; SCard; ScMinidriver
#EndRegion - Chilkat_Certificates_PKI.au3 - Header

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
; Name ..........: _Chilkat_Cert_SmartCardFailReasonToText
; Description ...: Converts a Cert.SmartCardFailReason code to a readable description.
; Syntax ........: _Chilkat_Cert_SmartCardFailReasonToText($iReason)
; Parameters ....: $iReason               - [in] SmartCardFailReason numeric value.
; Return values .: Readable reason string.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat introduced Cert.SmartCardFailReason in version 10.1.0.
; Related .......: _Chilkat_Cert_GetSmartCardFailReason, _Chilkat_Cert_LoadFromSmartCard, _Chilkat_Cert_LoadFromSmartCardEx
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Cert_SmartCardFailReasonToText($iReason)
	If Not IsInt($iReason) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, '')
	Switch $iReason
		Case 0
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'No failure.')
		Case 1
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'No smart card or USB token was detected.')
		Case 2
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'The supplied smart-card PIN was rejected.')
		Case 3
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'A certificate matching the requested criteria was not found.')
		Case 99
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'An undefined smart-card failure occurred. Check LastErrorText.')
	EndSwitch
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, 'Unknown SmartCardFailReason value: ' & $iReason)
EndFunc   ;==>_Chilkat_Cert_SmartCardFailReasonToText

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_GetSmartCardFailReason
; Description ...: Returns Cert.SmartCardFailReason after a LoadFromSmartcard call.
; Syntax ........: _Chilkat_Cert_GetSmartCardFailReason(ByRef $oCert)
; Parameters ....: $oCert                 - [in/out] Chilkat Cert object.
; Return values .: Success: SmartCardFailReason numeric value. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Requires Chilkat 10.1.0 or newer.
; Related .......: _Chilkat_Cert_SmartCardFailReasonToText
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Cert_GetSmartCardFailReason(ByRef $oCert)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not _Chilkat_IsAtLeastThisVersion('10.1.0', 'Cert.SmartCardFailReason') Then _
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oCert.SmartCardFailReason)
EndFunc   ;==>_Chilkat_Cert_GetSmartCardFailReason

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
		Local $iSmartCardFailReason = 99
		If _Chilkat_IsAtLeastThisVersion('10.1.0', 'Cert.SmartCardFailReason') Then $iSmartCardFailReason = $oCert.SmartCardFailReason
		__Chilkat_LogOnError('_Chilkat_Cert_LoadFromSmartCard() Cert.LoadFromSmartcard()', $oCert, $CHILKAT_ERR_FAILURE, $iSmartCardFailReason)
		Return SetError($CHILKAT_ERR_FAILURE, $iSmartCardFailReason, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oCert)
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
		Local $iSmartCardFailReason = 99
		If _Chilkat_IsAtLeastThisVersion('10.1.0', 'Cert.SmartCardFailReason') Then $iSmartCardFailReason = $oCert.SmartCardFailReason
		__Chilkat_LogOnError('_Chilkat_Cert_LoadFromSmartCardEx() Cert.LoadFromSmartcard()', $oCert, $CHILKAT_ERR_FAILURE, $iSmartCardFailReason)
		Return SetError($CHILKAT_ERR_FAILURE, $iSmartCardFailReason, $CHILKAT_RET_FAILURE)
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


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Cert_ExportFiles
; Description ...: Exports a certificate to DER and/or PEM files.
; Syntax ........: _Chilkat_Cert_ExportFiles(ByRef $oCert, $sDerCertFileFullPath = Default, $sPemCertFileFullPath = Default)
; Parameters ....: $oCert                  - [in/out] Chilkat Cert object.
;                  $sDerCertFileFullPath   - [in] optional DER certificate destination path.
;                  $sPemCertFileFullPath   - [in] optional PEM certificate destination path.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: At least one destination path must be supplied.
; Related .......: _Chilkat_Cert_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Cert_ExportFiles(ByRef $oCert, $sDerCertFileFullPath = Default, $sPemCertFileFullPath = Default)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $sDerCertFileFullPath = Default And $sPemCertFileFullPath = Default Then _
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	If $sDerCertFileFullPath <> Default Then
		If Not IsString($sDerCertFileFullPath) Or $sDerCertFileFullPath = '' Then _
				Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
		Local $iDerSuccess = $oCert.ExportCertDerFile($sDerCertFileFullPath)
		If @error Or $iDerSuccess <> 1 Then
			__Chilkat_LogOnError('_Chilkat_Cert_ExportFiles() Cert.ExportCertDerFile()', $oCert, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf
	EndIf

	If $sPemCertFileFullPath <> Default Then
		If Not IsString($sPemCertFileFullPath) Or $sPemCertFileFullPath = '' Then _
				Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
		Local $iPemSuccess = $oCert.ExportCertPemFile($sPemCertFileFullPath)
		If @error Or $iPemSuccess <> 1 Then
			__Chilkat_LogOnError('_Chilkat_Cert_ExportFiles() Cert.ExportCertPemFile()', $oCert, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_Cert_ExportFiles

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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CertStore_FindCert
; Description ...: Finds a currently valid certificate in an open CertStore by common certificate criteria.
; Syntax ........: _Chilkat_CertStore_FindCert(ByRef $oCertStore, $sCriteria, $sValue, $bOnlyWithPrivateKey = 1)
; Parameters ....: $oCertStore            - [in/out] open Chilkat CertStore object.
;                  $sCriteria             - [in] CN, issuerCN, serial, sha1, subjectDN or issuerDN.
;                  $sValue                - [in] value to find.
;                  $bOnlyWithPrivateKey   - [in] when 1, return only certificates having an accessible private key. Default = 1.
; Return values .: Success: matching Chilkat Cert object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses CertStore.FindCert() on Chilkat 10.1.2+ and validates/falls back through _Chilkat_CertStore_ListValidCertificates_AsArray().
; Related .......: _Chilkat_CertStore_ListValidCertificates_AsArray, __Chilkat_CertStore_GetCertByFingerprint
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCertStoreRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CertStore_FindCert(ByRef $oCertStore, $sCriteria, $sValue, $bOnlyWithPrivateKey = 1)
	Local $oErrorHandler = ObjEvent('AutoIt.Error', __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oCertStore) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sCriteria) Or $sCriteria = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sValue) Or $sValue = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)

	Local $sKey = StringLower(StringStripWS($sCriteria, $STR_STRIPALL))
	Local $sNativeKey = ''
	Local $iColumn = -1
	Switch $sKey
		Case 'cn', 'subjectcn'
			$sNativeKey = 'CN'
			$iColumn = $CHILKAT_CERT_LIST_COL_SUBJECT_CN
		Case 'issuercn'
			$sNativeKey = 'issuerCN'
			$iColumn = $CHILKAT_CERT_LIST_COL_ISSUER_CN
		Case 'serial', 'serialnumber'
			$sNativeKey = 'serial'
			$iColumn = $CHILKAT_CERT_LIST_COL_SERIAL
		Case 'sha1', 'thumbprint', 'fingerprint'
			$sNativeKey = 'sha1'
			$iColumn = $CHILKAT_CERT_LIST_COL_SHA1
		Case 'subjectdn'
			$sNativeKey = 'subjectDN'
			$iColumn = $CHILKAT_CERT_LIST_COL_SUBJECT_DN
		Case 'issuerdn'
			$sNativeKey = 'issuerDN'
			$iColumn = $CHILKAT_CERT_LIST_COL_ISSUER_DN
		Case Else
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndSwitch

	If _Chilkat_IsAtLeastThisVersion('10.1.2', 'CertStore.FindCert') Then
		Local $oCriteria = _Chilkat_JSON_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		$oCriteria.UpdateString($sNativeKey, $sValue)

		Local $oNativeCert = _Chilkat_Cert_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		If $oCertStore.FindCert($oCriteria, $oNativeCert) = 1 Then
			If (Not $bOnlyWithPrivateKey Or $oNativeCert.HasPrivateKey() = 1) And _Chilkat_Cert_IsDateValidNow($oNativeCert) = 1 Then _
					Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oNativeCert)
		EndIf
	EndIf

	Local $aCerts = _Chilkat_CertStore_ListValidCertificates_AsArray($oCertStore, $bOnlyWithPrivateKey)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If UBound($aCerts, 1) = 0 Then Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	For $i = 0 To UBound($aCerts, 1) - 1
		Local $sCandidate = String($aCerts[$i][$iColumn])
		Local $bMatch = 0
		If $iColumn = $CHILKAT_CERT_LIST_COL_SHA1 Then
			$bMatch = (__Chilkat_Cert_NormalizeFingerprint($sCandidate) = __Chilkat_Cert_NormalizeFingerprint($sValue))
		Else
			$bMatch = (StringCompare($sCandidate, $sValue, 0) = 0)
		EndIf
		If $bMatch Then
			Local $oFoundCert = __Chilkat_CertStore_GetCertByFingerprint($oCertStore, $aCerts[$i][$CHILKAT_CERT_LIST_COL_SHA1])
			Return SetError(@error, @extended, $oFoundCert)
		EndIf
	Next

	Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
EndFunc   ;==>_Chilkat_CertStore_FindCert

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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CodeSign_AddSignature
; Description ...: Adds an Authenticode signature to a Windows EXE or DLL.
; Syntax ........: _Chilkat_CodeSign_AddSignature($sFileFullPath, ByRef $oCert, $oJsonOptions = Default)
; Parameters ....: $sFileFullPath         - [in] path to the EXE or DLL to sign.
;                  $oCert                 - [in/out] Chilkat Cert object with private-key access.
;                  $oJsonOptions          - [in] optional Chilkat JsonObject containing CodeSign options.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: CodeSign.AddSignature modifies the target file in place.
; Related .......: _Chilkat_CodeSign_VerifySignature_AsJson, _Chilkat_CodeSign_RemoveSignature
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CodeSign_AddSignature($sFileFullPath, ByRef $oCert, $oJsonOptions = Default)
	If Not FileExists($sFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsObj($oCert) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oOptions = 0
	If $oJsonOptions = Default Then
		$oOptions = _Chilkat_JSON_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	ElseIf Not IsObj($oJsonOptions) Then
		Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	Else
		$oOptions = $oJsonOptions
	EndIf

	Local $oCodeSign = _Chilkat_CodeSign_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oCodeSign.AddSignature($sFileFullPath, $oCert, $oOptions)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_CodeSign_AddSignature() CodeSign.AddSignature()', $oCodeSign, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_CodeSign_AddSignature

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CodeSign_VerifySignature_AsJson
; Description ...: Verifies an Authenticode signature and returns signature information as a Chilkat JsonObject.
; Syntax ........: _Chilkat_CodeSign_VerifySignature_AsJson($sFileFullPath)
; Parameters ....: $sFileFullPath         - [in] path to the signed EXE or DLL.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: A successful return means CodeSign.VerifySignature returned 1.
; Related .......: _Chilkat_CodeSign_AddSignature
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CodeSign_VerifySignature_AsJson($sFileFullPath)
	If Not FileExists($sFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oCodeSign = _Chilkat_CodeSign_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $oJson = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oJson.EmitCompact = 0
	If $oCodeSign.VerifySignature($sFileFullPath, $oJson) = 0 Then
		__Chilkat_LogOnError('_Chilkat_CodeSign_VerifySignature_AsJson() CodeSign.VerifySignature()', $oCodeSign, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJson)
EndFunc   ;==>_Chilkat_CodeSign_VerifySignature_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CodeSign_RemoveSignature
; Description ...: Removes an Authenticode signature from a Windows EXE or DLL.
; Syntax ........: _Chilkat_CodeSign_RemoveSignature($sFileFullPath)
; Parameters ....: $sFileFullPath         - [in] path to the EXE or DLL.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The target file is modified in place.
; Related .......: _Chilkat_CodeSign_AddSignature
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CodeSign_RemoveSignature($sFileFullPath)
	If Not FileExists($sFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oCodeSign = _Chilkat_CodeSign_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If $oCodeSign.RemoveSignature($sFileFullPath) = 0 Then
		__Chilkat_LogOnError('_Chilkat_CodeSign_RemoveSignature() CodeSign.RemoveSignature()', $oCodeSign, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_CodeSign_RemoveSignature

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CodeSign_SignFile_BySmartCard
; Description ...: Authenticode signs an EXE or DLL using a smart-card or USB-token certificate selected by the user.
; Syntax ........: _Chilkat_CodeSign_SignFile_BySmartCard($sFileFullPath, $sPIN = Default, $sCspName = '', $oJsonOptions = Default, $bNoDialog = Default, $bRejectExpired = 1)
; Parameters ....: $sFileFullPath         - [in] path to the EXE or DLL.
;                  $sPIN                  - [in] optional PIN. Default requests the PIN after certificate selection.
;                  $sCspName              - [in] optional CSP/provider name.
;                  $oJsonOptions          - [in] optional CodeSign options.
;                  $bNoDialog             - [in] optional SmartCardNoDialog value.
;                  $bRejectExpired        - [in] when 1, select only currently valid certificates. Default = 1.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The file is modified in place.
; Related .......: _Chilkat_Cert_LoadFromSmartCardEx, _Chilkat_CodeSign_AddSignature
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CodeSign_SignFile_BySmartCard($sFileFullPath, $sPin = Default, $sCspName = '', $oJsonOptions = Default, $bNoDialog = Default, $bRejectExpired = 1)
	Local $oCert = _Chilkat_Cert_LoadFromSmartCardEx($sCspName, $sPin, $bNoDialog, $bRejectExpired, 'Authenticode signing')
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $vResult = _Chilkat_CodeSign_AddSignature($sFileFullPath, $oCert, $oJsonOptions)
	Return SetError(@error, @extended, $vResult)
EndFunc   ;==>_Chilkat_CodeSign_SignFile_BySmartCard

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CodeSign_SignFile_ByPkcs11
; Description ...: Authenticode signs an EXE or DLL using a certificate/private key from PKCS11.
; Syntax ........: _Chilkat_CodeSign_SignFile_ByPkcs11($sFileFullPath, $sPkcs11DllFullPath, $sPIN, $iUserType = 1, $oJsonOptions = Default)
; Parameters ....: $sFileFullPath         - [in] path to the EXE or DLL.
;                  $sPkcs11DllFullPath    - [in] PKCS11 shared-library path.
;                  $sPIN                  - [in] PKCS11 user PIN.
;                  $iUserType             - [in] PKCS11 user type. Default = 1.
;                  $oJsonOptions          - [in] optional CodeSign options.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Opens a quick PKCS11 session and closes it after signing.
; Related .......: _Chilkat_PKCS11_OpenSession, _Chilkat_PKCS11_FindCertWithPrivateKey, _Chilkat_CodeSign_AddSignature
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CodeSign_SignFile_ByPkcs11($sFileFullPath, $sPkcs11DllFullPath, $sPin, $iUserType = 1, $oJsonOptions = Default)
	Local $oPkcs11 = _Chilkat_PKCS11_OpenSession($sPkcs11DllFullPath, $sPin, $iUserType)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $oCert = _Chilkat_PKCS11_FindCertWithPrivateKey($oPkcs11)
	If @error Then
		Local $iErr = @error, $iExt = @extended
		_Chilkat_PKCS11_CloseSession($oPkcs11)
		Return SetError($iErr, $iExt, $CHILKAT_RET_FAILURE)
	EndIf
	Local $vResult = _Chilkat_CodeSign_AddSignature($sFileFullPath, $oCert, $oJsonOptions)
	Local $iReturnError = @error, $iReturnExtended = @extended
	_Chilkat_PKCS11_CloseSession($oPkcs11)
	Return SetError($iReturnError, $iReturnExtended, $vResult)
EndFunc   ;==>_Chilkat_CodeSign_SignFile_ByPkcs11

#EndRegion ; _Chilkat_CodeSign_**

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


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Csr_GeneratePemFile
; Description ...: Generates a PEM certificate signing request from a private key.
; Syntax ........: _Chilkat_Csr_GeneratePemFile(ByRef $oPrivateKey, $sFileFullPath, $sCommonName, $sOrganization = '', $sOrganizationUnit = '', $sCountry = '', $sEmail = '', $sDnsSan = '')
; Parameters ....: $oPrivateKey            - [in/out] Chilkat PrivateKey used to sign the CSR.
;                  $sFileFullPath          - [in] destination CSR file path.
;                  $sCommonName            - [in] certificate subject common name.
;                  $sOrganization          - [in] optional organization name.
;                  $sOrganizationUnit      - [in] optional organizational unit.
;                  $sCountry               - [in] optional two-letter country code.
;                  $sEmail                 - [in] optional email address.
;                  $sDnsSan                - [in] optional DNS subject alternative name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The CSR is signed with SHA-256.
; Related .......: _Chilkat_Rsa_GenerateKeyPair
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCsrRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Csr_GeneratePemFile(ByRef $oPrivateKey, $sFileFullPath, $sCommonName, $sOrganization = '', $sOrganizationUnit = '', $sCountry = '', $sEmail = '', $sDnsSan = '')
	If Not IsObj($oPrivateKey) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFileFullPath) Or $sFileFullPath = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sCommonName) Or $sCommonName = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)

	Local $oCsr = _Chilkat_Csr_ObjCreate()
	If @error Or Not IsObj($oCsr) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oCsr.CommonName = $sCommonName
	$oCsr.Company = $sOrganization
	$oCsr.CompanyDivision = $sOrganizationUnit
	$oCsr.Country = StringUpper($sCountry)
	$oCsr.EmailAddress = $sEmail
	$oCsr.HashAlgorithm = 'sha256'

	If $sDnsSan <> '' Then
		Local $iSanSuccess = $oCsr.AddSan('dnsName', $sDnsSan)
		If @error Or $iSanSuccess <> 1 Then
			__Chilkat_LogOnError('_Chilkat_Csr_GeneratePemFile() Csr.AddSan()', $oCsr, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf
	EndIf

	Local $sCsrPem = $oCsr.GenCsrPem($oPrivateKey)
	If @error Or $oCsr.LastMethodSuccess <> 1 Or $sCsrPem = '' Then
		__Chilkat_LogOnError('_Chilkat_Csr_GeneratePemFile() Csr.GenCsrPem()', $oCsr, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $hFile = FileOpen($sFileFullPath, BitOR($FO_OVERWRITE, $FO_UTF8_NOBOM))
	If $hFile = -1 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $iWriteResult = FileWrite($hFile, $sCsrPem)
	FileClose($hFile)
	If $iWriteResult = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_Csr_GeneratePemFile

#EndRegion ; _Chilkat_Csr_**

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

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_EstablishContext
; Description ...: Establishes a PC/SC resource-manager context for an SCard object.
; Syntax ........: _Chilkat_SCARD_EstablishContext(ByRef $oSCard, $sScope = 'user')
; Parameters ....: $oSCard                - [in/out] Chilkat SCard object.
;                  $sScope                - [in] user or system. Default = user.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: EstablishContext must be called before reader operations that require a PC/SC context.
; Related .......: _Chilkat_SCARD_ReleaseContext
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_EstablishContext(ByRef $oSCard, $sScope = 'user')
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $sScope <> 'user' And $sScope <> 'system' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If $oSCard.EstablishContext($sScope) = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_EstablishContext() SCard.EstablishContext()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_SCARD_EstablishContext

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_GetConnectedReader
; Description ...: Returns the name of the reader currently connected to an SCard object.
; Syntax ........: _Chilkat_SCARD_GetConnectedReader(ByRef $oSCard)
; Parameters ....: $oSCard                - [in/out] Chilkat SCard object.
; Return values .: Success: reader name or empty string. Failure: empty string and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wraps the read-only ConnectedReader property.
; Related .......: _Chilkat_SCARD_Connect, _Chilkat_SCARD_Disconnect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html#ConnectedReader
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_GetConnectedReader(ByRef $oSCard)
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, '')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oSCard.ConnectedReader)
EndFunc   ;==>_Chilkat_SCARD_GetConnectedReader

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_Connect
; Description ...: Connects an SCard object to a smart-card reader.
; Syntax ........: _Chilkat_SCARD_Connect(ByRef $oSCard, $sReader, $sShareMode = 'shared', $sPreferredProtocol = 'no_preference')
; Parameters ....: $oSCard                - [in/out] Chilkat SCard object with an established context.
;                  $sReader               - [in] reader name returned by ListReaders.
;                  $sShareMode            - [in] shared, exclusive or direct. Default = shared.
;                  $sPreferredProtocol    - [in] 0, T0, T1, raw or no_preference. Default = no_preference.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The SCard object remains connected until Disconnect is called.
; Related .......: _Chilkat_SCARD_Disconnect, _Chilkat_SCARD_Reconnect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_Connect(ByRef $oSCard, $sReader, $sShareMode = 'shared', $sPreferredProtocol = 'no_preference')
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sReader) Or $sReader = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If $oSCard.Connect($sReader, $sShareMode, $sPreferredProtocol) = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_Connect() SCard.Connect()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_SCARD_Connect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_CheckStatus
; Description ...: Refreshes the status properties of the currently connected reader.
; Syntax ........: _Chilkat_SCARD_CheckStatus(ByRef $oSCard)
; Parameters ....: $oSCard                - [in/out] connected Chilkat SCard object.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Updates ReaderStatus, ActiveProtocol and CardAtr.
; Related .......: _Chilkat_SCARD_GetConnectedReader
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_CheckStatus(ByRef $oSCard)
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $oSCard.CheckStatus() = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_CheckStatus() SCard.CheckStatus()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_SCARD_CheckStatus

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_Reconnect
; Description ...: Reestablishes a connection to a previously connected smart-card reader.
; Syntax ........: _Chilkat_SCARD_Reconnect(ByRef $oSCard, $sShareMode = 'shared', $sPreferredProtocol = 'no_preference', $sAction = 'leave')
; Parameters ....: $oSCard                - [in/out] Chilkat SCard object.
;                  $sShareMode            - [in] shared, exclusive or direct.
;                  $sPreferredProtocol    - [in] 0, T0, T1, raw or no_preference.
;                  $sAction               - [in] leave, reset, unpower or eject.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Use after SCARD_W_RESET_CARD or when connection state must be renegotiated.
; Related .......: _Chilkat_SCARD_Connect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_Reconnect(ByRef $oSCard, $sShareMode = 'shared', $sPreferredProtocol = 'no_preference', $sAction = 'leave')
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $oSCard.Reconnect($sShareMode, $sPreferredProtocol, $sAction) = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_Reconnect() SCard.Reconnect()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_SCARD_Reconnect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_Disconnect
; Description ...: Disconnects an SCard object from its current reader.
; Syntax ........: _Chilkat_SCARD_Disconnect(ByRef $oSCard, $sDisposition = 'leave')
; Parameters ....: $oSCard                - [in/out] connected Chilkat SCard object.
;                  $sDisposition          - [in] leave, reset, unpower or eject. Default = leave.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Call before ReleaseContext.
; Related .......: _Chilkat_SCARD_ReleaseContext
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_Disconnect(ByRef $oSCard, $sDisposition = 'leave')
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $oSCard.Disconnect($sDisposition) = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_Disconnect() SCard.Disconnect()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_SCARD_Disconnect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_FindSmartcards_AsJson
; Description ...: Returns information about inserted smart cards as a Chilkat JsonObject.
; Syntax ........: _Chilkat_SCARD_FindSmartcards_AsJson(ByRef $oSCard)
; Parameters ....: $oSCard                - [in/out] Chilkat SCard object with an established context.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wraps SCard.FindSmartcards().
; Related .......: _Chilkat_SCARD_EstablishContext, _Chilkat_SCARD_ReleaseContext
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_FindSmartcards_AsJson(ByRef $oSCard)
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oJson = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oJson.EmitCompact = 0
	If $oSCard.FindSmartcards($oJson) = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_FindSmartcards_AsJson() SCard.FindSmartcards()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oJson)
EndFunc   ;==>_Chilkat_SCARD_FindSmartcards_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCARD_ReleaseContext
; Description ...: Releases the PC/SC resource-manager context of an SCard object.
; Syntax ........: _Chilkat_SCARD_ReleaseContext(ByRef $oSCard)
; Parameters ....: $oSCard                - [in/out] Chilkat SCard object.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Must be the last PC/SC operation for the object.
; Related .......: _Chilkat_SCARD_EstablishContext
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_SCARD_ReleaseContext(ByRef $oSCard)
	If Not IsObj($oSCard) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $oSCard.ReleaseContext() = 0 Then
		__Chilkat_LogOnError('_Chilkat_SCARD_ReleaseContext() SCard.ReleaseContext()', $oSCard, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_SCARD_ReleaseContext

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
