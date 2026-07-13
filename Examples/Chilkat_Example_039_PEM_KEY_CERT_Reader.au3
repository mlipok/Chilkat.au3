#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <MsgBoxConstants.au3>
#include <String.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>

#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

Global Const $EXAMPLE_39_TITLE = 'Chilkat PEM / KEY / CERT reader'
Global $g_aExample39Details[0]

_Example_Init()
If @error Then Exit

_Example_39_PEM_KEY_CERT_Reader_GUI()

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_39_PEM_KEY_CERT_Reader_GUI
; Description ...: Displays a GUI for loading PEM, KEY, PUB, CSR and CERT files and listing the objects and metadata they contain.
; Syntax ........: _Example_39_PEM_KEY_CERT_Reader_GUI()
; Parameters ....: None
; Return values .: None.
; Remarks .......: Chilkat 11 uses Pem.CertAt/PrivateKeyAt/PublicKeyAt. Chilkat 10 uses the deprecated GetCert/GetPrivateKey/GetPublicKey compatibility methods.
;                  Private-key values are not displayed unless the user explicitly enables raw source text.
; ===============================================================================================================================
Func _Example_39_PEM_KEY_CERT_Reader_GUI()
	Local $hGUI = GUICreate($EXAMPLE_39_TITLE, 1100, 760)

	GUICtrlCreateLabel('Source file(s):', 15, 18, 90, 20)
	Local $idFiles = GUICtrlCreateInput('', 105, 14, 785, 24)
	Local $idBrowse = GUICtrlCreateButton('Browse...', 900, 13, 85, 26)
	Local $idLoad = GUICtrlCreateButton('Load and inspect', 990, 13, 100, 26, $BS_DEFPUSHBUTTON)

	GUICtrlCreateLabel('Password:', 15, 52, 90, 20)
	Local $idPassword = GUICtrlCreateInput('', 105, 48, 250, 24, $ES_PASSWORD)
	Local $idRawSource = GUICtrlCreateCheckbox('Include raw text source in details (may expose private-key material)', 380, 49, 430, 22)
	Local $idClear = GUICtrlCreateButton('Clear', 900, 47, 85, 26)
	Local $idClose = GUICtrlCreateButton('Close', 990, 47, 100, 26)

	GUICtrlCreateLabel('Detected objects:', 15, 84, 120, 20)
	Local $idList = GUICtrlCreateListView('File|Type|Index|Algorithm|Bits|Summary', 15, 105, 1075, 315, _
			BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $LVS_SINGLESEL), $WS_EX_CLIENTEDGE)
	Local $hList = GUICtrlGetHandle($idList)
	_GUICtrlListView_SetExtendedListViewStyle($hList, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))
	_GUICtrlListView_SetColumnWidth($hList, 0, 245)
	_GUICtrlListView_SetColumnWidth($hList, 1, 125)
	_GUICtrlListView_SetColumnWidth($hList, 2, 55)
	_GUICtrlListView_SetColumnWidth($hList, 3, 85)
	_GUICtrlListView_SetColumnWidth($hList, 4, 65)
	_GUICtrlListView_SetColumnWidth($hList, 5, 475)

	GUICtrlCreateLabel('Selected item details:', 15, 432, 140, 20)
	Local $idDetails = GUICtrlCreateEdit('', 15, 453, 1075, 290, _
			BitOR($ES_AUTOVSCROLL, $ES_MULTILINE, $ES_READONLY, $WS_HSCROLL, $WS_VSCROLL))

	GUISetState(@SW_SHOW, $hGUI)

	Local $iPreviousSelection = -2
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idClose
				ExitLoop

			Case $idBrowse
				Local $sSelected = FileOpenDialog( _
						'Select PEM, KEY, PUB, CSR or CERT files', _
						'', _
						'PKI files (*.pem;*.key;*.pub;*.csr;*.cert;*.cer;*.crt)|PEM files (*.pem)|Key files (*.key;*.pub)|Certificates (*.cert;*.cer;*.crt)|CSR files (*.csr)|All files (*.*)', _
						BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
				If Not @error And $sSelected <> '' Then GUICtrlSetData($idFiles, $sSelected)

			Case $idLoad
				__Example_39_ClearResults($idList, $idDetails)
				Local $aFiles = __Example_39_ParseFileSelection(GUICtrlRead($idFiles))
				If @error Or UBound($aFiles) = 0 Then
					MsgBox($MB_ICONWARNING, $EXAMPLE_39_TITLE, 'Select at least one source file.')
					ContinueLoop
				EndIf

				Local $bIncludeRaw = BitAND(GUICtrlRead($idRawSource), $GUI_CHECKED) = $GUI_CHECKED
				For $iFile = 0 To UBound($aFiles) - 1
					__Example_39_InspectFile($aFiles[$iFile], GUICtrlRead($idPassword), $idList, $bIncludeRaw)
				Next

				If _GUICtrlListView_GetItemCount($hList) > 0 Then
					_GUICtrlListView_SetItemSelected($hList, 0, True, True)
					_GUICtrlListView_SetSelectionMark($hList, 0)
					$iPreviousSelection = -2
				EndIf

			Case $idClear
				__Example_39_ClearResults($idList, $idDetails)
				$iPreviousSelection = -2
		EndSwitch

		Local $iSelection = _GUICtrlListView_GetSelectionMark($hList)
		If $iSelection <> $iPreviousSelection Then
			$iPreviousSelection = $iSelection
			If $iSelection >= 0 And $iSelection < UBound($g_aExample39Details) Then
				GUICtrlSetData($idDetails, $g_aExample39Details[$iSelection])
			Else
				GUICtrlSetData($idDetails, '')
			EndIf
		EndIf
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>_Example_39_PEM_KEY_CERT_Reader_GUI

; #FUNCTION# ====================================================================================================================
; Name ..........: __Example_39_InspectFile
; Description ...: Detects and lists all supported PKI objects found in a source file.
; ===============================================================================================================================
Func __Example_39_InspectFile($sFileFullPath, $sPassword, $idList, $bIncludeRaw)
	If Not FileExists($sFileFullPath) Then
		__Example_39_AddResult($idList, $sFileFullPath, 'ERROR', '-', '', '', 'File does not exist.', 'File does not exist:' & @CRLF & $sFileFullPath)
		Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sFileName = StringRegExpReplace($sFileFullPath, '^.*[\\/]', '')
	Local $sSourceText = __Example_39_ReadTextFile($sFileFullPath)
	Local $sPemLabels = __Example_39_GetPemLabels($sSourceText)
	Local $sFileDetails = _
			'File: ' & $sFileFullPath & @CRLF & _
			'Size: ' & FileGetSize($sFileFullPath) & ' bytes' & @CRLF & _
			'PEM block labels: ' & (($sPemLabels = '') ? '(none detected)' : $sPemLabels)
	If $bIncludeRaw And $sSourceText <> '' Then _
			$sFileDetails &= @CRLF & @CRLF & 'WARNING: raw source text follows.' & @CRLF & _StringRepeat('-', 80) & @CRLF & $sSourceText

	__Example_39_AddResult($idList, $sFileName, 'SOURCE FILE', '-', '', '', _
			(($sPemLabels = '') ? 'No PEM labels detected; binary or other supported format may still load.' : $sPemLabels), $sFileDetails)

	Local $bFound = False
	Local $sErrors = ''

	; An encrypted private key requires a password, but this is an expected input condition rather than an AutoIt error.
	Local $bEncryptedPrivateKey = _
			StringInStr($sSourceText, '-----BEGIN ENCRYPTED PRIVATE KEY-----') Or _
			StringInStr($sSourceText, 'Proc-Type: 4,ENCRYPTED')
	If $bEncryptedPrivateKey And $sPassword = '' Then
		__Example_39_AddResult($idList, $sFileName, 'PASSWORD REQUIRED', '-', '', '', _
				'Encrypted private key detected. Enter the password and load the file again.', _
				'File: ' & $sFileFullPath & @CRLF & _
				'Format: ' & __Example_39_DetectFormat($sSourceText) & @CRLF & _
				'Status: The file was recognized, but its private key was not decrypted because no password was supplied.')
		Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
	EndIf

	; First use the PEM container because a single PEM file may contain multiple certificates, keys and CSRs.
	If StringInStr($sSourceText, '-----BEGIN ') Then
		Local $oPem = _Chilkat_Pem_ObjCreate()
		If Not @error And IsObj($oPem) Then
			Local $iPemSuccess = $oPem.LoadPemFile($sFileFullPath, $sPassword)
			If $iPemSuccess = 1 Then
				Local $iPemItems = $oPem.NumCerts + $oPem.NumPrivateKeys + $oPem.NumPublicKeys + $oPem.NumCsrs + $oPem.NumCrls
				If $iPemItems > 0 Then
					$bFound = True
					__Example_39_ListPemContents($oPem, $sFileName, $sFileFullPath, $sPemLabels, $idList)
				EndIf
			Else
				$sErrors &= 'Pem.LoadPemFile:' & @CRLF & $oPem.LastErrorText & @CRLF & @CRLF
			EndIf
		EndIf
	EndIf

	; Binary or standalone certificate files are loaded directly when the PEM container did not yield content.
	If Not $bFound Then
		Local $oCert = _Chilkat_Cert_ObjCreate()
		If Not @error And IsObj($oCert) Then
			If $oCert.LoadFromFile($sFileFullPath) = 1 Then
				$bFound = True
				__Example_39_AddCertificate($oCert, $sFileName, 0, $sFileFullPath, __Example_39_DetectFormat($sSourceText), $idList)
			Else
				$sErrors &= 'Cert.LoadFromFile:' & @CRLF & $oCert.LastErrorText & @CRLF & @CRLF
			EndIf
		EndIf
	EndIf

	; Load a standalone private key in PEM, DER, PKCS#1, PKCS#8, JWK, PVK or another supported key format.
	If Not $bFound Then
		Local $oPrivateKey = _Chilkat_PRIVATEKEY_ObjCreate()
		If Not @error And IsObj($oPrivateKey) Then
			Local $iPrivateSuccess = 0
			If _Chilkat_IsAtLeastThisVersion('9.5.0.83', '__Example_39_InspectFile PrivateKey.LoadAnyFormatFile') Then
				$iPrivateSuccess = $oPrivateKey.LoadAnyFormatFile($sFileFullPath, $sPassword)
			ElseIf StringInStr($sSourceText, 'ENCRYPTED PRIVATE KEY') Then
				$iPrivateSuccess = $oPrivateKey.LoadEncryptedPemFile($sFileFullPath, $sPassword)
			Else
				$iPrivateSuccess = $oPrivateKey.LoadPemFile($sFileFullPath)
			EndIf
			If $iPrivateSuccess = 1 Then
				$bFound = True
				__Example_39_AddPrivateKey($oPrivateKey, $sFileName, 0, $sFileFullPath, __Example_39_DetectFormat($sSourceText), $idList)
			Else
				$sErrors &= 'PrivateKey load:' & @CRLF & $oPrivateKey.LastErrorText & @CRLF & @CRLF
			EndIf
		EndIf
	EndIf

	; Finally try a standalone public key file.
	If Not $bFound Then
		Local $oPublicKey = _Chilkat_PublicKey_ObjCreate()
		If Not @error And IsObj($oPublicKey) Then
			If $oPublicKey.LoadFromFile($sFileFullPath) = 1 Then
				$bFound = True
				__Example_39_AddPublicKey($oPublicKey, $sFileName, 0, $sFileFullPath, __Example_39_DetectFormat($sSourceText), $idList)
			Else
				$sErrors &= 'PublicKey.LoadFromFile:' & @CRLF & $oPublicKey.LastErrorText & @CRLF & @CRLF
			EndIf
		EndIf
	EndIf

	If Not $bFound Then
		__Example_39_AddResult($idList, $sFileName, 'UNRECOGNIZED', '-', '', '', 'No supported certificate, private key, public key or CSR was found.', _
				'File: ' & $sFileFullPath & @CRLF & @CRLF & $sErrors)
		Return SetError($CHILKAT_ERR_LOADFILE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_39_InspectFile

; #FUNCTION# ====================================================================================================================
; Name ..........: __Example_39_ListPemContents
; Description ...: Enumerates every certificate, private key, public key, CSR and CRL reported by a Chilkat Pem object.
; ===============================================================================================================================
Func __Example_39_ListPemContents(ByRef $oPem, $sFileName, $sFileFullPath, $sPemLabels, $idList)
	Local $bNewPemApi = _Chilkat_IsAtLeastThisVersion('11.0.0', '__Example_39_ListPemContents')
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	For $i = 0 To $oPem.NumCerts - 1
		Local $oCert = Null
		If $bNewPemApi Then
			$oCert = _Chilkat_Cert_ObjCreate()
			If @error Or Not IsObj($oCert) Then ContinueLoop
			If $oPem.CertAt($i, $oCert) <> 1 Then ContinueLoop
		Else
			$oCert = $oPem.GetCert($i)
			If Not IsObj($oCert) Then ContinueLoop
		EndIf
		__Example_39_AddCertificate($oCert, $sFileName, $i, $sFileFullPath, __Example_39_FindObjectFormat($sPemLabels, 'CERTIFICATE'), $idList)
	Next

	For $i = 0 To $oPem.NumPrivateKeys - 1
		Local $oPrivateKey = Null
		If $bNewPemApi Then
			$oPrivateKey = _Chilkat_PRIVATEKEY_ObjCreate()
			If @error Or Not IsObj($oPrivateKey) Then ContinueLoop
			If $oPem.PrivateKeyAt($i, $oPrivateKey) <> 1 Then ContinueLoop
		Else
			$oPrivateKey = $oPem.GetPrivateKey($i)
			If Not IsObj($oPrivateKey) Then ContinueLoop
		EndIf
		__Example_39_AddPrivateKey($oPrivateKey, $sFileName, $i, $sFileFullPath, __Example_39_FindPrivateKeyFormat($sPemLabels), $idList)
	Next

	For $i = 0 To $oPem.NumPublicKeys - 1
		Local $oPublicKey = Null
		If $bNewPemApi Then
			$oPublicKey = _Chilkat_PublicKey_ObjCreate()
			If @error Or Not IsObj($oPublicKey) Then ContinueLoop
			If $oPem.PublicKeyAt($i, $oPublicKey) <> 1 Then ContinueLoop
		Else
			$oPublicKey = $oPem.GetPublicKey($i)
			If Not IsObj($oPublicKey) Then ContinueLoop
		EndIf
		__Example_39_AddPublicKey($oPublicKey, $sFileName, $i, $sFileFullPath, __Example_39_FindPublicKeyFormat($sPemLabels), $idList)
	Next

	For $i = 0 To $oPem.NumCsrs - 1
		__Example_39_AddCsr($oPem, $sFileName, $i, $sFileFullPath, $idList)
	Next

	For $i = 0 To $oPem.NumCrls - 1
		__Example_39_AddResult($idList, $sFileName, 'CRL', $i, '', '', 'Certificate revocation list detected.', _
				'File: ' & $sFileFullPath & @CRLF & 'Type: Certificate Revocation List' & @CRLF & 'Index: ' & $i)
	Next

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_39_ListPemContents

Func __Example_39_AddCertificate(ByRef $oCert, $sFileName, $iIndex, $sFileFullPath, $sFormat, $idList)
	Local $sAlgorithm = 'unknown', $sBits = '', $sPublicThumbprint = ''
	__Example_39_GetCertificatePublicKeyInfo($oCert, $sAlgorithm, $sBits, $sPublicThumbprint)

	Local $sSummary = $oCert.SubjectCN
	If $sSummary = '' Then $sSummary = $oCert.SubjectDN

	Local $sDetails = _
			'File: ' & $sFileFullPath & @CRLF & _
			'Type: X.509 certificate' & @CRLF & _
			'Index: ' & $iIndex & @CRLF & _
			'Format: ' & $sFormat & @CRLF & _
			'Subject CN: ' & $oCert.SubjectCN & @CRLF & _
			'Subject DN: ' & $oCert.SubjectDN & @CRLF & _
			'Issuer CN: ' & $oCert.IssuerCN & @CRLF & _
			'Issuer DN: ' & $oCert.IssuerDN & @CRLF & _
			'Serial number (hex): ' & $oCert.SerialNumber & @CRLF & _
			'SHA-1 certificate thumbprint: ' & $oCert.Sha1Thumbprint & @CRLF & _
			'SPKI/JWK SHA-256 thumbprint: ' & $sPublicThumbprint & @CRLF & _
			'Public-key algorithm: ' & $sAlgorithm & @CRLF & _
			'Public-key size: ' & $sBits & ' bits' & @CRLF & _
			'Valid from (UTC): ' & $oCert.ValidFromStr & @CRLF & _
			'Valid to (UTC): ' & $oCert.ValidToStr & @CRLF & _
			'Expired: ' & __Example_39_BoolText($oCert.Expired) & @CRLF & _
			'Self-signed: ' & __Example_39_BoolText($oCert.SelfSigned) & @CRLF & _
			'Root certificate: ' & __Example_39_BoolText($oCert.IsRoot) & @CRLF & _
			'Has associated private key: ' & __Example_39_BoolText($oCert.HasPrivateKey()) & @CRLF & _
			'Intended key usage flags: 0x' & Hex($oCert.IntendedKeyUsage, 2)

	If _Chilkat_IsAtLeastThisVersion('9.5.0.85', '__Example_39_AddCertificate ExtendedKeyUsage') Then _
			$sDetails &= @CRLF & 'Extended key usage: ' & $oCert.ExtendedKeyUsage

	__Example_39_AddResult($idList, $sFileName, 'CERTIFICATE', $iIndex, StringUpper($sAlgorithm), $sBits, $sSummary, $sDetails)
EndFunc   ;==>__Example_39_AddCertificate

Func __Example_39_AddPrivateKey(ByRef $oPrivateKey, $sFileName, $iIndex, $sFileFullPath, $sFormat, $idList)
	Local $sThumbprint = $oPrivateKey.GetJwkThumbprint('SHA256')
	Local $sDetails = _
			'File: ' & $sFileFullPath & @CRLF & _
			'Type: Private key' & @CRLF & _
			'Index: ' & $iIndex & @CRLF & _
			'Format: ' & $sFormat & @CRLF & _
			'Key type: ' & $oPrivateKey.KeyType & @CRLF & _
			'Bit length: ' & $oPrivateKey.BitLength & @CRLF & _
			'JWK SHA-256 thumbprint: ' & $sThumbprint & @CRLF & @CRLF & _
			'Private-key numerical values are intentionally not printed in this metadata view.' & @CRLF & _
			'Enable the raw source option before loading to display the original text file.'

	__Example_39_AddResult($idList, $sFileName, 'PRIVATE KEY', $iIndex, StringUpper($oPrivateKey.KeyType), $oPrivateKey.BitLength, $sFormat, $sDetails)
EndFunc   ;==>__Example_39_AddPrivateKey

Func __Example_39_AddPublicKey(ByRef $oPublicKey, $sFileName, $iIndex, $sFileFullPath, $sFormat, $idList)
	Local $sThumbprint = $oPublicKey.GetJwkThumbprint('SHA256')
	Local $sDetails = _
			'File: ' & $sFileFullPath & @CRLF & _
			'Type: Public key' & @CRLF & _
			'Index: ' & $iIndex & @CRLF & _
			'Format: ' & $sFormat & @CRLF & _
			'Key type: ' & $oPublicKey.KeyType & @CRLF & _
			'Key size: ' & $oPublicKey.KeySize & ' bits' & @CRLF & _
			'JWK SHA-256 thumbprint: ' & $sThumbprint

	__Example_39_AddResult($idList, $sFileName, 'PUBLIC KEY', $iIndex, StringUpper($oPublicKey.KeyType), $oPublicKey.KeySize, $sFormat, $sDetails)
EndFunc   ;==>__Example_39_AddPublicKey

Func __Example_39_AddCsr(ByRef $oPem, $sFileName, $iIndex, $sFileFullPath, $idList)
	Local $sBase64 = $oPem.GetEncodedItem('csr', '', 'base64', $iIndex)
	If Not IsString($sBase64) Or $sBase64 = '' Then
		__Example_39_AddResult($idList, $sFileName, 'CSR', $iIndex, '', '', 'CSR detected; detailed decoding failed.', _
				'File: ' & $sFileFullPath & @CRLF & 'CSR index: ' & $iIndex & @CRLF & $oPem.LastErrorText)
		Return
	EndIf

	Local $sCsrPem = '-----BEGIN CERTIFICATE REQUEST-----' & @CRLF & __Example_39_WrapBase64($sBase64) & @CRLF & '-----END CERTIFICATE REQUEST-----' & @CRLF
	Local $oCsr = _Chilkat_Csr_ObjCreate()
	Local $sCsrError = ''
	If Not @error And IsObj($oCsr) Then
		If $oCsr.LoadCsrPem($sCsrPem) <> 1 Then $sCsrError = $oCsr.LastErrorText
	EndIf
	If @error Or Not IsObj($oCsr) Or $sCsrError <> '' Then
		__Example_39_AddResult($idList, $sFileName, 'CSR', $iIndex, '', '', 'CSR detected; detailed decoding failed.', _
				'File: ' & $sFileFullPath & @CRLF & 'CSR index: ' & $iIndex & @CRLF & $sCsrError)
		Return
	EndIf

	Local $sAlgorithm = 'unknown', $sBits = '', $sThumbprint = ''
	Local $oPublicKey = _Chilkat_PublicKey_ObjCreate()
	If Not @error And IsObj($oPublicKey) And $oCsr.GetPublicKey($oPublicKey) = 1 Then
		$sAlgorithm = $oPublicKey.KeyType
		$sBits = $oPublicKey.KeySize
		$sThumbprint = $oPublicKey.GetJwkThumbprint('SHA256')
	EndIf

	Local $sSans = ''
	If _Chilkat_IsAtLeastThisVersion('9.5.0.91', '__Example_39_AddCsr GetSans') Then
		Local $oSans = _Chilkat_StringTable_ObjCreate()
		If Not @error And IsObj($oSans) And $oCsr.GetSans($oSans) = 1 Then
			For $iSan = 0 To $oSans.Count - 1
				If $sSans <> '' Then $sSans &= ', '
				$sSans &= $oSans.StringAt($iSan)
			Next
		EndIf
	EndIf

	Local $sDetails = _
			'File: ' & $sFileFullPath & @CRLF & _
			'Type: PKCS#10 Certificate Signing Request' & @CRLF & _
			'Index: ' & $iIndex & @CRLF & _
			'Common name (CN): ' & $oCsr.CommonName & @CRLF & _
			'Organization (O): ' & $oCsr.Company & @CRLF & _
			'Organizational unit (OU): ' & $oCsr.CompanyDivision & @CRLF & _
			'Country (C): ' & $oCsr.Country & @CRLF & _
			'Email: ' & $oCsr.EmailAddress & @CRLF & _
			'Subject alternative names: ' & $sSans & @CRLF & _
			'Hash algorithm: ' & $oCsr.HashAlgorithm & @CRLF & _
			'Public-key algorithm: ' & $sAlgorithm & @CRLF & _
			'Public-key size: ' & $sBits & ' bits' & @CRLF & _
			'JWK SHA-256 thumbprint: ' & $sThumbprint & @CRLF & _
			'CSR signature valid: ' & __Example_39_BoolText($oCsr.VerifyCsr())

	__Example_39_AddResult($idList, $sFileName, 'CSR', $iIndex, StringUpper($sAlgorithm), $sBits, $oCsr.CommonName, $sDetails)
EndFunc   ;==>__Example_39_AddCsr

Func __Example_39_GetCertificatePublicKeyInfo(ByRef $oCert, ByRef $sAlgorithm, ByRef $sBits, ByRef $sThumbprint)
	Local $oPublicKey = Null
	If _Chilkat_IsAtLeastThisVersion('11.0.0', '__Example_39_GetCertificatePublicKeyInfo') Then
		$oPublicKey = _Chilkat_PublicKey_ObjCreate()
		If @error Or Not IsObj($oPublicKey) Then Return
		If $oCert.GetPublicKey($oPublicKey) <> 1 Then Return
	Else
		$oPublicKey = $oCert.ExportPublicKey()
		If Not IsObj($oPublicKey) Then Return
	EndIf

	$sAlgorithm = $oPublicKey.KeyType
	$sBits = $oPublicKey.KeySize
	$sThumbprint = $oPublicKey.GetJwkThumbprint('SHA256')
EndFunc   ;==>__Example_39_GetCertificatePublicKeyInfo

Func __Example_39_AddResult($idList, $sFileName, $sType, $vIndex, $sAlgorithm, $vBits, $sSummary, $sDetails)
	$sFileName = StringReplace($sFileName, '|', '/')
	$sType = StringReplace($sType, '|', '/')
	$sAlgorithm = StringReplace($sAlgorithm, '|', '/')
	$sSummary = StringReplace(StringReplace($sSummary, '|', '/'), @CRLF, ' ')

	GUICtrlCreateListViewItem($sFileName & '|' & $sType & '|' & $vIndex & '|' & $sAlgorithm & '|' & $vBits & '|' & $sSummary, $idList)
	Local $iCount = UBound($g_aExample39Details)
	ReDim $g_aExample39Details[$iCount + 1]
	$g_aExample39Details[$iCount] = $sDetails
EndFunc   ;==>__Example_39_AddResult

Func __Example_39_ClearResults($idList, $idDetails)
	_GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($idList))
	ReDim $g_aExample39Details[0]
	GUICtrlSetData($idDetails, '')
EndFunc   ;==>__Example_39_ClearResults

Func __Example_39_ParseFileSelection($sSelection)
	$sSelection = StringStripWS($sSelection, $STR_STRIPLEADING + $STR_STRIPTRAILING)
	If $sSelection = '' Then
		Local $aEmpty[0]
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $aEmpty)
	EndIf

	If StringInStr($sSelection, '|') Then
		Local $aParts = StringSplit($sSelection, '|', $STR_NOCOUNT)
		If UBound($aParts) = 1 Then Return $aParts
		Local $aFiles[UBound($aParts) - 1]
		For $i = 1 To UBound($aParts) - 1
			$aFiles[$i - 1] = __Example_39_JoinPath($aParts[0], $aParts[$i])
		Next
		Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aFiles)
	EndIf

	$sSelection = StringReplace($sSelection, @CRLF, ';')
	$sSelection = StringReplace($sSelection, @LF, ';')
	Local $aRaw = StringSplit($sSelection, ';', $STR_NOCOUNT)
	Local $aFiles[UBound($aRaw)]
	Local $iOut = 0
	For $i = 0 To UBound($aRaw) - 1
		Local $sPath = StringStripWS($aRaw[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
		If $sPath = '' Then ContinueLoop
		$aFiles[$iOut] = $sPath
		$iOut += 1
	Next
	ReDim $aFiles[$iOut]
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aFiles)
EndFunc   ;==>__Example_39_ParseFileSelection

Func __Example_39_ReadTextFile($sFileFullPath)
	Local $hFile = FileOpen($sFileFullPath, $FO_READ)
	If $hFile = -1 Then Return ''
	Local $sData = FileRead($hFile)
	FileClose($hFile)
	If Not IsString($sData) Then Return ''
	Return $sData
EndFunc   ;==>__Example_39_ReadTextFile

Func __Example_39_GetPemLabels($sSourceText)
	If $sSourceText = '' Then Return ''
	Local $aLabels = StringRegExp($sSourceText, '(?m)^-----BEGIN ([^-\r\n]+)-----', $STR_REGEXPARRAYGLOBALMATCH)
	If @error Or Not IsArray($aLabels) Then Return ''
	Local $sResult = ''
	For $i = 0 To UBound($aLabels) - 1
		If $sResult <> '' Then $sResult &= ', '
		$sResult &= $aLabels[$i]
	Next
	Return $sResult
EndFunc   ;==>__Example_39_GetPemLabels

Func __Example_39_DetectFormat($sSourceText)
	If StringInStr($sSourceText, '-----BEGIN ENCRYPTED PRIVATE KEY-----') Then Return 'PKCS#8 encrypted PEM'
	If StringInStr($sSourceText, '-----BEGIN RSA PRIVATE KEY-----') Then Return 'PKCS#1 PEM'
	If StringInStr($sSourceText, '-----BEGIN PRIVATE KEY-----') Then Return 'PKCS#8 PEM'
	If StringInStr($sSourceText, '-----BEGIN RSA PUBLIC KEY-----') Then Return 'PKCS#1 public-key PEM'
	If StringInStr($sSourceText, '-----BEGIN PUBLIC KEY-----') Then Return 'SPKI/PKCS#8 public-key PEM'
	If StringInStr($sSourceText, '-----BEGIN CERTIFICATE REQUEST-----') Or StringInStr($sSourceText, '-----BEGIN NEW CERTIFICATE REQUEST-----') Then Return 'PKCS#10 CSR PEM'
	If StringInStr($sSourceText, '-----BEGIN CERTIFICATE-----') Then Return 'X.509 PEM'
	If $sSourceText <> '' Then Return 'Text / auto-detected'
	Return 'Binary / auto-detected'
EndFunc   ;==>__Example_39_DetectFormat

Func __Example_39_FindObjectFormat($sPemLabels, $sObjectLabel)
	If StringInStr($sPemLabels, $sObjectLabel) Then Return $sObjectLabel & ' PEM'
	Return 'PEM'
EndFunc   ;==>__Example_39_FindObjectFormat

Func __Example_39_FindPrivateKeyFormat($sPemLabels)
	If StringInStr($sPemLabels, 'ENCRYPTED PRIVATE KEY') Then Return 'PKCS#8 encrypted PEM'
	If StringInStr($sPemLabels, 'RSA PRIVATE KEY') Then Return 'PKCS#1 PEM'
	If StringInStr($sPemLabels, 'EC PRIVATE KEY') Then Return 'SEC1 EC PEM'
	If StringInStr($sPemLabels, 'PRIVATE KEY') Then Return 'PKCS#8 PEM'
	Return 'Private-key PEM'
EndFunc   ;==>__Example_39_FindPrivateKeyFormat

Func __Example_39_FindPublicKeyFormat($sPemLabels)
	If StringInStr($sPemLabels, 'RSA PUBLIC KEY') Then Return 'PKCS#1 public-key PEM'
	If StringInStr($sPemLabels, 'PUBLIC KEY') Then Return 'SPKI/PKCS#8 public-key PEM'
	Return 'Public-key PEM'
EndFunc   ;==>__Example_39_FindPublicKeyFormat

Func __Example_39_WrapBase64($sBase64)
	$sBase64 = StringRegExpReplace($sBase64, '\s+', '')
	Local $sWrapped = ''
	For $i = 1 To StringLen($sBase64) Step 64
		If $sWrapped <> '' Then $sWrapped &= @CRLF
		$sWrapped &= StringMid($sBase64, $i, 64)
	Next
	Return $sWrapped
EndFunc   ;==>__Example_39_WrapBase64

Func __Example_39_JoinPath($sDirectory, $sName)
	If StringRight($sDirectory, 1) = '\\' Or StringRight($sDirectory, 1) = '/' Then Return $sDirectory & $sName
	Return $sDirectory & '\\' & $sName
EndFunc   ;==>__Example_39_JoinPath

Func __Example_39_BoolText($vValue)
	Return $vValue ? 'Yes' : 'No'
EndFunc   ;==>__Example_39_BoolText
