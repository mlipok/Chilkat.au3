#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>

#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

Global Const $EXAMPLE_38_TITLE = 'Chilkat RSA / PEM / KEY / CERT generator'
Global Const $EXAMPLE_38_PRIVATE_FORMAT_PKCS1 = 'PKCS#1 PEM (unencrypted)'
Global Const $EXAMPLE_38_PRIVATE_FORMAT_PKCS8 = 'PKCS#8 PEM (unencrypted)'
Global Const $EXAMPLE_38_PRIVATE_FORMAT_PKCS8_ENCRYPTED = 'PKCS#8 PEM (AES-256 encrypted)'

_Example_Init()
If @error Then Exit

_Example_38_RSA_GeneratePEM_GUI()

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_38_RSA_GeneratePEM_GUI
; Description ...: Displays a GUI for generating an RSA key pair, exporting PEM/KEY files, generating a CSR, and exporting an existing certificate.
; Syntax ........: _Example_38_RSA_GeneratePEM_GUI()
; Parameters ....: None
; Return values .: None.
; Remarks .......: Uses the Chilkat 11 GenKey/ToPublicKey API or the Chilkat 10 GenerateKey/Export*KeyObj compatibility API selected by the UDF.
;                  A public key is not an X.509 certificate. The certificate section exports a certificate that already exists or was issued from the CSR.
;                  Generated CSRs are reloaded and verified in the background; the verification summary is displayed in a MsgBox.
; ===============================================================================================================================
Func _Example_38_RSA_GeneratePEM_GUI()
	Local $hGUI = GUICreate($EXAMPLE_38_TITLE, 760, 740)

	GUICtrlCreateGroup('RSA key pair and CSR generation', 10, 10, 740, 464)

	GUICtrlCreateLabel('Output directory:', 25, 42, 110, 20)
	Local $idOutputDir = GUICtrlCreateInput(@ScriptDir & '\RSA_Output', 140, 38, 515, 23)
	Local $idBrowseOutput = GUICtrlCreateButton('Browse...', 665, 37, 70, 25)

	GUICtrlCreateLabel('Base file name:', 25, 76, 110, 20)
	Local $idBaseName = GUICtrlCreateInput('rsa-keypair', 140, 72, 220, 23)

	GUICtrlCreateLabel('RSA key size:', 390, 76, 90, 20)
	Local $idKeyBits = GUICtrlCreateCombo('', 485, 72, 170, 24, $CBS_DROPDOWNLIST)
	GUICtrlSetData($idKeyBits, '2048|3072|4096|8192', '2048')

	GUICtrlCreateLabel('Private-key format:', 25, 110, 110, 20)
	Local $idPrivateFormat = GUICtrlCreateCombo('', 140, 106, 310, 24, $CBS_DROPDOWNLIST)
	GUICtrlSetData($idPrivateFormat, _
			$EXAMPLE_38_PRIVATE_FORMAT_PKCS1 & '|' & _
			$EXAMPLE_38_PRIVATE_FORMAT_PKCS8 & '|' & _
			$EXAMPLE_38_PRIVATE_FORMAT_PKCS8_ENCRYPTED, _
			$EXAMPLE_38_PRIVATE_FORMAT_PKCS8)

	GUICtrlCreateLabel('Password:', 470, 110, 70, 20)
	Local $idPassword = GUICtrlCreateInput('', 540, 106, 195, 23, $ES_PASSWORD)
	GUICtrlSetState($idPassword, $GUI_DISABLE)

	GUICtrlCreateLabel('CSR common name (CN):', 25, 150, 150, 20)
	Local $idCommonName = GUICtrlCreateInput('example.local', 180, 146, 270, 23)

	GUICtrlCreateLabel('Organization (O):', 470, 150, 100, 20)
	Local $idOrganization = GUICtrlCreateInput('Example Organization', 575, 146, 160, 23)

	GUICtrlCreateLabel('Organization unit (OU):', 25, 184, 150, 20)
	Local $idOrganizationUnit = GUICtrlCreateInput('Development', 180, 180, 270, 23)

	GUICtrlCreateLabel('Country (C):', 470, 184, 100, 20)
	Local $idCountry = GUICtrlCreateInput(__Example_38_GetWindowsCountryCode(), 575, 180, 160, 23)

	GUICtrlCreateLabel('State or province (ST):', 25, 218, 150, 20)
	Local $idState = GUICtrlCreateInput('', 180, 214, 270, 23)

	GUICtrlCreateLabel('Locality (L):', 470, 218, 100, 20)
	Local $idLocality = GUICtrlCreateInput('', 575, 214, 160, 23)

	GUICtrlCreateLabel('Email:', 25, 252, 150, 20)
	Local $idEmail = GUICtrlCreateInput('', 180, 248, 270, 23)

	GUICtrlCreateLabel('DNS SAN:', 470, 252, 100, 20)
	Local $idDnsSan = GUICtrlCreateInput('example.local', 575, 248, 160, 23)

	GUICtrlCreateLabel('Files to generate:', 25, 292, 120, 20)
	Local $idPrivatePem = GUICtrlCreateCheckbox('Private key: <name>-private.pem', 40, 320, 260, 22)
	Local $idPrivateKey = GUICtrlCreateCheckbox('Private key: <name>-private.key', 40, 348, 260, 22)
	Local $idPublicPem = GUICtrlCreateCheckbox('Public key: <name>-public.pem', 330, 320, 250, 22)
	Local $idPublicPub = GUICtrlCreateCheckbox('Public key: <name>-public.pub', 330, 348, 250, 22)
	Local $idCsr = GUICtrlCreateCheckbox('Certificate signing request: <name>.csr', 40, 376, 320, 22)

	GUICtrlSetState($idPrivatePem, $GUI_CHECKED)
	GUICtrlSetState($idPrivateKey, $GUI_CHECKED)
	GUICtrlSetState($idPublicPem, $GUI_CHECKED)
	GUICtrlSetState($idPublicPub, $GUI_CHECKED)
	GUICtrlSetState($idCsr, $GUI_CHECKED)

	GUICtrlCreateLabel('The .key extension does not define the key encoding; the selected private-key PEM format is used.', 40, 408, 680, 20)
	Local $idGenerate = GUICtrlCreateButton('Generate RSA files', 540, 432, 195, 30, $BS_DEFPUSHBUTTON)
	GUICtrlCreateGroup('', -99, -99, 1, 1)

	GUICtrlCreateGroup('Export an existing or CA-issued X.509 certificate', 10, 490, 740, 130)
	GUICtrlCreateLabel('Source certificate:', 25, 520, 110, 20)
	Local $idSourceCert = GUICtrlCreateInput('', 140, 516, 515, 23)
	Local $idBrowseCert = GUICtrlCreateButton('Browse...', 665, 515, 70, 25)

	GUICtrlCreateLabel('PFX password:', 25, 554, 110, 20)
	Local $idPfxPassword = GUICtrlCreateInput('', 140, 550, 220, 23, $ES_PASSWORD)
	Local $idExportCertDer = GUICtrlCreateCheckbox('DER certificate: <name>.cert', 390, 550, 200, 22)
	Local $idExportCertPem = GUICtrlCreateCheckbox('PEM certificate: <name>.cert.pem', 390, 578, 235, 22)
	GUICtrlSetState($idExportCertDer, $GUI_CHECKED)
	GUICtrlSetState($idExportCertPem, $GUI_CHECKED)
	Local $idExportCertificate = GUICtrlCreateButton('Export certificate', 630, 560, 105, 35)
	GUICtrlCreateGroup('', -99, -99, 1, 1)

	Local $idLog = GUICtrlCreateEdit('', 10, 630, 740, 70, BitOR($ES_AUTOVSCROLL, $ES_MULTILINE, $ES_READONLY, $WS_VSCROLL))
	Local $idClose = GUICtrlCreateButton('Close', 650, 708, 100, 25)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idClose
				ExitLoop

			Case $idBrowseOutput
				Local $sSelectedFolder = FileSelectFolder('Select output directory', GUICtrlRead($idOutputDir), 7)
				If Not @error And $sSelectedFolder <> '' Then GUICtrlSetData($idOutputDir, $sSelectedFolder)

			Case $idBrowseCert
				Local $sSelectedCert = FileOpenDialog('Select certificate', '', 'Certificates (*.cer;*.crt;*.cert;*.pem;*.pfx;*.p12)|All files (*.*)', $FD_FILEMUSTEXIST)
				If Not @error And $sSelectedCert <> '' Then GUICtrlSetData($idSourceCert, $sSelectedCert)

			Case $idPrivateFormat
				If GUICtrlRead($idPrivateFormat) = $EXAMPLE_38_PRIVATE_FORMAT_PKCS8_ENCRYPTED Then
					GUICtrlSetState($idPassword, $GUI_ENABLE)
				Else
					GUICtrlSetState($idPassword, $GUI_DISABLE)
				EndIf

			Case $idGenerate
				GUICtrlSetData($idLog, '')
				Local $iGenerateResult = __Example_38_GenerateFiles( _
						GUICtrlRead($idOutputDir), _
						GUICtrlRead($idBaseName), _
						Number(GUICtrlRead($idKeyBits)), _
						GUICtrlRead($idPrivateFormat), _
						GUICtrlRead($idPassword), _
						GUICtrlRead($idCommonName), _
						GUICtrlRead($idOrganization), _
						GUICtrlRead($idOrganizationUnit), _
						GUICtrlRead($idCountry), _
						GUICtrlRead($idEmail), _
						GUICtrlRead($idDnsSan), _
						GUICtrlRead($idState), _
						GUICtrlRead($idLocality), _
						BitAND(GUICtrlRead($idPrivatePem), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idPrivateKey), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idPublicPem), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idPublicPub), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idCsr), $GUI_CHECKED) = $GUI_CHECKED, _
						$idLog)
				If $iGenerateResult = $CHILKAT_RET_SUCCESS And _
						BitAND(GUICtrlRead($idCsr), $GUI_CHECKED) <> $GUI_CHECKED Then _
						MsgBox($MB_ICONINFORMATION, $EXAMPLE_38_TITLE, 'RSA files generated successfully.')

			Case $idExportCertificate
				GUICtrlSetData($idLog, '')
				Local $iCertResult = __Example_38_ExportCertificate( _
						GUICtrlRead($idSourceCert), _
						GUICtrlRead($idPfxPassword), _
						GUICtrlRead($idOutputDir), _
						GUICtrlRead($idBaseName), _
						BitAND(GUICtrlRead($idExportCertDer), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idExportCertPem), $GUI_CHECKED) = $GUI_CHECKED, _
						$idLog)
				If $iCertResult = $CHILKAT_RET_SUCCESS Then _
						MsgBox($MB_ICONINFORMATION, $EXAMPLE_38_TITLE, 'Certificate exported successfully.')
		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>_Example_38_RSA_GeneratePEM_GUI


Func __Example_38_GenerateFiles($sOutputDir, $sBaseName, $iBits, $sPrivateFormatLabel, $sPassword, $sCommonName, $sOrganization, $sOrganizationUnit, $sCountry, $sEmail, $sDnsSan, $sState, $sLocality, $bPrivatePem, $bPrivateKey, $bPublicPem, $bPublicPub, $bCsr, $idLog)
	$sOutputDir = StringStripWS($sOutputDir, $STR_STRIPLEADING + $STR_STRIPTRAILING)
	$sBaseName = __Example_38_SanitizeBaseName($sBaseName)
	If $sOutputDir = '' Or $sBaseName = '' Then
		__Example_38_Log($idLog, 'Output directory and base file name are required.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	If Not ($bPrivatePem Or $bPrivateKey Or $bPublicPem Or $bPublicPub Or $bCsr) Then
		__Example_38_Log($idLog, 'Select at least one output file.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	If Not FileExists($sOutputDir) And Not DirCreate($sOutputDir) Then
		__Example_38_Log($idLog, 'Cannot create output directory: ' & $sOutputDir)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sPrivateFormat = 'pkcs8'
	Switch $sPrivateFormatLabel
		Case $EXAMPLE_38_PRIVATE_FORMAT_PKCS1
			$sPrivateFormat = 'pkcs1'
		Case $EXAMPLE_38_PRIVATE_FORMAT_PKCS8_ENCRYPTED
			$sPrivateFormat = 'pkcs8-encrypted'
	EndSwitch

	If $sPrivateFormat = 'pkcs8-encrypted' And $sPassword = '' Then
		__Example_38_Log($idLog, 'A password is required for encrypted PKCS#8 PEM.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	__Example_38_Log($idLog, 'Generating ' & $iBits & '-bit RSA key pair...')
	Local $oPrivateKey = Null, $oPublicKey = Null
	Local $iResult = _Chilkat_Rsa_GenerateKeyPair($oPrivateKey, $oPublicKey, $iBits)
	If @error Or $iResult <> $CHILKAT_RET_SUCCESS Then
		__Example_38_Log($idLog, 'RSA generation failed. @error=' & @error & ', @extended=' & @extended)
		Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	If $bPrivatePem Then
		Local $sPrivatePemPath = __Example_38_JoinPath($sOutputDir, $sBaseName & '-private.pem')
		$iResult = _Chilkat_PRIVATEKEY_SavePemFile($oPrivateKey, $sPrivatePemPath, $sPrivateFormat, $sPassword)
		If @error Then Return __Example_38_LogFailure($idLog, $sPrivatePemPath)
		__Example_38_Log($idLog, 'Created: ' & $sPrivatePemPath)
	EndIf

	If $bPrivateKey Then
		Local $sPrivateKeyPath = __Example_38_JoinPath($sOutputDir, $sBaseName & '-private.key')
		$iResult = _Chilkat_PRIVATEKEY_SavePemFile($oPrivateKey, $sPrivateKeyPath, $sPrivateFormat, $sPassword)
		If @error Then Return __Example_38_LogFailure($idLog, $sPrivateKeyPath)
		__Example_38_Log($idLog, 'Created: ' & $sPrivateKeyPath)
	EndIf

	If $bPublicPem Then
		Local $sPublicPemPath = __Example_38_JoinPath($sOutputDir, $sBaseName & '-public.pem')
		$iResult = _Chilkat_PublicKey_SavePemFile($oPublicKey, $sPublicPemPath, 0)
		If @error Then Return __Example_38_LogFailure($idLog, $sPublicPemPath)
		__Example_38_Log($idLog, 'Created: ' & $sPublicPemPath)
	EndIf

	If $bPublicPub Then
		Local $sPublicPubPath = __Example_38_JoinPath($sOutputDir, $sBaseName & '-public.pub')
		$iResult = _Chilkat_PublicKey_SavePemFile($oPublicKey, $sPublicPubPath, 0)
		If @error Then Return __Example_38_LogFailure($idLog, $sPublicPubPath)
		__Example_38_Log($idLog, 'Created: ' & $sPublicPubPath)
	EndIf

	If $bCsr Then
		Local $sCsrPath = __Example_38_JoinPath($sOutputDir, $sBaseName & '.csr')
		$iResult = _Chilkat_Csr_GeneratePemFile($oPrivateKey, $sCsrPath, $sCommonName, $sOrganization, $sOrganizationUnit, $sCountry, $sEmail, $sDnsSan, $sState, $sLocality)
		If @error Then Return __Example_38_LogFailure($idLog, $sCsrPath)
		__Example_38_Log($idLog, 'Created: ' & $sCsrPath)

		$iResult = __Example_38_VerifyGeneratedCsr($sCsrPath, $sCommonName, $sOrganization, $sOrganizationUnit, $sCountry, $sEmail, $sDnsSan, $sState, $sLocality, $idLog)
		If @error Or $iResult <> $CHILKAT_RET_SUCCESS Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	__Example_38_Log($idLog, 'Completed successfully.')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_38_GenerateFiles

Func __Example_38_VerifyGeneratedCsr($sCsrPath, $sCommonName, $sOrganization, $sOrganizationUnit, $sCountry, $sEmail, $sDnsSan, $sState, $sLocality, $idLog)
	Local $sCsrPem = FileRead($sCsrPath)
	If @error Or $sCsrPem = '' Then
		Local $sReadError = 'CSR verification failed: the generated file could not be read.' & @CRLF & @CRLF & 'File:' & @CRLF & $sCsrPath
		__Example_38_Log($idLog, 'CSR verification failed: cannot read the generated file.')
		MsgBox($MB_ICONERROR, $EXAMPLE_38_TITLE, $sReadError)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oCsr = _Chilkat_Csr_ObjCreate()
	If @error Or Not IsObj($oCsr) Then
		Local $iCreateError = @error, $iCreateExtended = @extended
		__Example_38_Log($idLog, 'CSR verification failed: cannot create the Chilkat Csr object.')
		MsgBox($MB_ICONERROR, $EXAMPLE_38_TITLE, _
				'CSR verification failed: cannot create the Chilkat Csr object.' & @CRLF & @CRLF & _
				'@error = ' & $iCreateError & @CRLF & _
				'@extended = ' & $iCreateExtended & @CRLF & @CRLF & _
				'File:' & @CRLF & $sCsrPath)
		Return SetError($iCreateError, $iCreateExtended, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iLoadSuccess = $oCsr.LoadCsrPem($sCsrPem)
	If @error Or $iLoadSuccess <> 1 Then
		__Chilkat_LogOnError('__Example_38_VerifyGeneratedCsr() Csr.LoadCsrPem()', $oCsr, $CHILKAT_ERR_LOAD, $CHILKAT_EXT_GENERAL)
		__Example_38_Log($idLog, 'CSR verification failed: Csr.LoadCsrPem() failed.')
		MsgBox($MB_ICONERROR, $EXAMPLE_38_TITLE, _
				'CSR verification failed: the generated CSR could not be loaded.' & @CRLF & @CRLF & _
				'File:' & @CRLF & $sCsrPath)
		Return SetError($CHILKAT_ERR_LOAD, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iSignatureValid = $oCsr.VerifyCsr()
	Local $sActualCN = $oCsr.GetSubjectField('2.5.4.3')
	Local $sActualO = $oCsr.GetSubjectField('2.5.4.10')
	Local $sActualOU = $oCsr.GetSubjectField('2.5.4.11')
	Local $sActualC = $oCsr.GetSubjectField('2.5.4.6')
	Local $sActualST = $oCsr.GetSubjectField('2.5.4.8')
	Local $sActualL = $oCsr.GetSubjectField('2.5.4.7')
	Local $sActualEmail = $oCsr.GetSubjectField('1.2.840.113549.1.9.1')

	Local $iSubjectMatches = _
			StringCompare($sActualCN, $sCommonName, 1) = 0 And _
			StringCompare($sActualO, $sOrganization, 1) = 0 And _
			StringCompare($sActualOU, $sOrganizationUnit, 1) = 0 And _
			StringCompare($sActualC, StringUpper($sCountry), 1) = 0 And _
			StringCompare($sActualST, $sState, 1) = 0 And _
			StringCompare($sActualL, $sLocality, 1) = 0 And _
			StringCompare($sActualEmail, $sEmail, 1) = 0

	Local $sSans = '(none)'
	Local $iDnsSanMatches = ($sDnsSan = '')
	Local $oSans = _Chilkat_StringTable_ObjCreate()
	If IsObj($oSans) Then
		Local $iGetSansSuccess = $oCsr.GetSans($oSans)
		If $iGetSansSuccess = 1 And $oSans.Count > 0 Then
			$sSans = ''
			For $i = 0 To $oSans.Count - 1
				Local $sSanEntry = $oSans.StringAt($i)
				If $sSans <> '' Then $sSans &= @CRLF
				$sSans &= $sSanEntry
				If $sDnsSan <> '' And StringInStr($sSanEntry, $sDnsSan, 2) Then $iDnsSanMatches = 1
			Next
		EndIf
	EndIf

	Local $sSignatureStatus = 'No'
	If $iSignatureValid = 1 Then $sSignatureStatus = 'Yes'
	Local $sSubjectStatus = 'No'
	If $iSubjectMatches Then $sSubjectStatus = 'Yes'
	Local $sDnsSanStatus = 'Not requested'
	Local $sDnsSanLogStatus = 'not requested'
	If $sDnsSan <> '' Then
		$sDnsSanStatus = 'No'
		$sDnsSanLogStatus = 'mismatch'
		If $iDnsSanMatches Then
			$sDnsSanStatus = 'Yes'
			$sDnsSanLogStatus = 'match'
		EndIf
	EndIf

	Local $sSummary = _
			'CSR verification completed.' & @CRLF & @CRLF & _
			'Signature valid: ' & $sSignatureStatus & @CRLF & _
			'Subject matches requested values: ' & $sSubjectStatus & @CRLF & _
			'DNS SAN matches requested value: ' & $sDnsSanStatus & @CRLF & @CRLF & _
			'Subject:' & @CRLF & _
			'C  = ' & $sActualC & @CRLF & _
			'ST = ' & $sActualST & @CRLF & _
			'L  = ' & $sActualL & @CRLF & _
			'O  = ' & $sActualO & @CRLF & _
			'OU = ' & $sActualOU & @CRLF & _
			'CN = ' & $sActualCN & @CRLF & _
			'Email = ' & $sActualEmail & @CRLF & @CRLF & _
			'DNS SAN:' & @CRLF & $sSans & @CRLF & @CRLF & _
			'File:' & @CRLF & $sCsrPath

	Local $iVerificationOk = ($iSignatureValid = 1 And $iSubjectMatches And $iDnsSanMatches)
	Local $sSignatureLogStatus = 'invalid'
	If $iSignatureValid = 1 Then $sSignatureLogStatus = 'valid'
	Local $sSubjectLogStatus = 'mismatch'
	If $iSubjectMatches Then $sSubjectLogStatus = 'match'
	__Example_38_Log($idLog, 'CSR verification: signature=' & $sSignatureLogStatus & _
			', subject=' & $sSubjectLogStatus & _
			', DNS SAN=' & $sDnsSanLogStatus & '.')
	Local $iMsgIcon = $MB_ICONERROR
	If $iVerificationOk Then $iMsgIcon = $MB_ICONINFORMATION
	MsgBox($iMsgIcon, $EXAMPLE_38_TITLE, $sSummary)

	If Not $iVerificationOk Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_38_VerifyGeneratedCsr

Func __Example_38_ExportCertificate($sSourcePath, $sPfxPassword, $sOutputDir, $sBaseName, $bExportDer, $bExportPem, $idLog)
	If Not FileExists($sSourcePath) Then
		__Example_38_Log($idLog, 'Certificate source file does not exist.')
		Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf
	If Not ($bExportDer Or $bExportPem) Then
		__Example_38_Log($idLog, 'Select at least one certificate output format.')
		Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	If Not FileExists($sOutputDir) And Not DirCreate($sOutputDir) Then
		__Example_38_Log($idLog, 'Cannot create output directory: ' & $sOutputDir)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$sBaseName = __Example_38_SanitizeBaseName($sBaseName)
	Local $oCert = _Chilkat_Cert_ObjCreate()
	If @error Or Not IsObj($oCert) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sExtension = StringLower(StringRegExpReplace($sSourcePath, '^.*\.', ''))
	Local $iLoadSuccess = 0
	If $sExtension = 'pfx' Or $sExtension = 'p12' Then
		$iLoadSuccess = $oCert.LoadPfxFile($sSourcePath, $sPfxPassword)
	Else
		$iLoadSuccess = $oCert.LoadFromFile($sSourcePath)
	EndIf
	If @error Or $iLoadSuccess <> 1 Then
		__Chilkat_LogOnError('__Example_38_ExportCertificate() certificate load', $oCert, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		__Example_38_Log($idLog, 'Certificate load failed.')
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sDerPath = $bExportDer ? __Example_38_JoinPath($sOutputDir, $sBaseName & '.cert') : Default
	Local $sPemPath = $bExportPem ? __Example_38_JoinPath($sOutputDir, $sBaseName & '.cert.pem') : Default
	Local $iResult = _Chilkat_Cert_ExportFiles($oCert, $sDerPath, $sPemPath)
	If @error Or $iResult <> $CHILKAT_RET_SUCCESS Then
		__Example_38_Log($idLog, 'Certificate export failed. @error=' & @error & ', @extended=' & @extended)
		Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	EndIf

	If $sDerPath <> Default Then __Example_38_Log($idLog, 'Created: ' & $sDerPath)
	If $sPemPath <> Default Then __Example_38_Log($idLog, 'Created: ' & $sPemPath)
	__Example_38_Log($idLog, 'Certificate export completed successfully.')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_38_ExportCertificate

Func __Example_38_LogFailure($idLog, $sFilePath)
	Local $iError = @error, $iExtended = @extended
	__Example_38_Log($idLog, 'Failed: ' & $sFilePath & ' | @error=' & $iError & ', @extended=' & $iExtended)
	Return SetError($iError, $iExtended, $CHILKAT_RET_FAILURE)
EndFunc   ;==>__Example_38_LogFailure

Func __Example_38_Log($idLog, $sMessage)
	GUICtrlSetData($idLog, GUICtrlRead($idLog) & $sMessage & @CRLF)
EndFunc   ;==>__Example_38_Log

Func __Example_38_JoinPath($sDirectory, $sFileName)
	If StringRight($sDirectory, 1) = '\' Or StringRight($sDirectory, 1) = '/' Then Return $sDirectory & $sFileName
	Return $sDirectory & '\' & $sFileName
EndFunc   ;==>__Example_38_JoinPath

Func __Example_38_GetWindowsCountryCode()
	Local Const $LOCALE_SISO3166CTRYNAME = 0x0000005A
	Local Const $COUNTRY_CODE_BUFFER_LENGTH = 3
	Local $tCountryCode = DllStructCreate('wchar[' & $COUNTRY_CODE_BUFFER_LENGTH & ']')
	Local $aResult = DllCall('kernel32.dll', 'int', 'GetLocaleInfoEx', _
			'ptr', 0, _
			'dword', $LOCALE_SISO3166CTRYNAME, _
			'ptr', DllStructGetPtr($tCountryCode), _
			'int', $COUNTRY_CODE_BUFFER_LENGTH)
	If @error Or Not IsArray($aResult) Or $aResult[0] = 0 Then Return ''

	Local $sCountryCode = StringUpper(DllStructGetData($tCountryCode, 1))
	If Not StringRegExp($sCountryCode, '^[A-Z]{2}$') Then Return ''
	Return $sCountryCode
EndFunc   ;==>__Example_38_GetWindowsCountryCode
Func __Example_38_SanitizeBaseName($sBaseName)
	$sBaseName = StringStripWS($sBaseName, $STR_STRIPLEADING + $STR_STRIPTRAILING)
	Return StringRegExpReplace($sBaseName, '[\\/:*?"<>|]', '_')
EndFunc   ;==>__Example_38_SanitizeBaseName

