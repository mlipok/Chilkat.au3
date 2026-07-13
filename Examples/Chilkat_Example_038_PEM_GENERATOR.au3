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
; ===============================================================================================================================
Func _Example_38_RSA_GeneratePEM_GUI()
	Local $hGUI = GUICreate($EXAMPLE_38_TITLE, 760, 700)

	GUICtrlCreateGroup('RSA key pair and CSR generation', 10, 10, 740, 430)

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
	Local $idCountry = GUICtrlCreateInput('PL', 575, 180, 160, 23)

	GUICtrlCreateLabel('Email:', 25, 218, 150, 20)
	Local $idEmail = GUICtrlCreateInput('', 180, 214, 270, 23)

	GUICtrlCreateLabel('DNS SAN:', 470, 218, 100, 20)
	Local $idDnsSan = GUICtrlCreateInput('example.local', 575, 214, 160, 23)

	GUICtrlCreateLabel('Files to generate:', 25, 258, 120, 20)
	Local $idPrivatePem = GUICtrlCreateCheckbox('Private key: <name>-private.pem', 40, 286, 260, 22)
	Local $idPrivateKey = GUICtrlCreateCheckbox('Private key: <name>-private.key', 40, 314, 260, 22)
	Local $idPublicPem = GUICtrlCreateCheckbox('Public key: <name>-public.pem', 330, 286, 250, 22)
	Local $idPublicPub = GUICtrlCreateCheckbox('Public key: <name>-public.pub', 330, 314, 250, 22)
	Local $idCsr = GUICtrlCreateCheckbox('Certificate signing request: <name>.csr', 40, 342, 320, 22)

	GUICtrlSetState($idPrivatePem, $GUI_CHECKED)
	GUICtrlSetState($idPrivateKey, $GUI_CHECKED)
	GUICtrlSetState($idPublicPem, $GUI_CHECKED)
	GUICtrlSetState($idPublicPub, $GUI_CHECKED)
	GUICtrlSetState($idCsr, $GUI_CHECKED)

	GUICtrlCreateLabel('The .key extension does not define the key encoding; the selected private-key PEM format is used.', 40, 374, 680, 20)
	Local $idGenerate = GUICtrlCreateButton('Generate RSA files', 540, 398, 195, 30, $BS_DEFPUSHBUTTON)
	GUICtrlCreateGroup('', -99, -99, 1, 1)

	GUICtrlCreateGroup('Export an existing or CA-issued X.509 certificate', 10, 450, 740, 130)
	GUICtrlCreateLabel('Source certificate:', 25, 480, 110, 20)
	Local $idSourceCert = GUICtrlCreateInput('', 140, 476, 515, 23)
	Local $idBrowseCert = GUICtrlCreateButton('Browse...', 665, 475, 70, 25)

	GUICtrlCreateLabel('PFX password:', 25, 514, 110, 20)
	Local $idPfxPassword = GUICtrlCreateInput('', 140, 510, 220, 23, $ES_PASSWORD)
	Local $idExportCertDer = GUICtrlCreateCheckbox('DER certificate: <name>.cert', 390, 510, 200, 22)
	Local $idExportCertPem = GUICtrlCreateCheckbox('PEM certificate: <name>.cert.pem', 390, 538, 235, 22)
	GUICtrlSetState($idExportCertDer, $GUI_CHECKED)
	GUICtrlSetState($idExportCertPem, $GUI_CHECKED)
	Local $idExportCertificate = GUICtrlCreateButton('Export certificate', 630, 520, 105, 35)
	GUICtrlCreateGroup('', -99, -99, 1, 1)

	Local $idLog = GUICtrlCreateEdit('', 10, 590, 740, 70, BitOR($ES_AUTOVSCROLL, $ES_MULTILINE, $ES_READONLY, $WS_VSCROLL))
	Local $idClose = GUICtrlCreateButton('Close', 650, 668, 100, 25)

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
						BitAND(GUICtrlRead($idPrivatePem), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idPrivateKey), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idPublicPem), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idPublicPub), $GUI_CHECKED) = $GUI_CHECKED, _
						BitAND(GUICtrlRead($idCsr), $GUI_CHECKED) = $GUI_CHECKED, _
						$idLog)
				If $iGenerateResult = $CHILKAT_RET_SUCCESS Then _
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


Func __Example_38_GenerateFiles($sOutputDir, $sBaseName, $iBits, $sPrivateFormatLabel, $sPassword, $sCommonName, $sOrganization, $sOrganizationUnit, $sCountry, $sEmail, $sDnsSan, $bPrivatePem, $bPrivateKey, $bPublicPem, $bPublicPub, $bCsr, $idLog)
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
		$iResult = _Chilkat_Csr_GeneratePemFile($oPrivateKey, $sCsrPath, $sCommonName, $sOrganization, $sOrganizationUnit, $sCountry, $sEmail, $sDnsSan)
		If @error Then Return __Example_38_LogFailure($idLog, $sCsrPath)
		__Example_38_Log($idLog, 'Created: ' & $sCsrPath)
	EndIf

	__Example_38_Log($idLog, 'Completed successfully.')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Example_38_GenerateFiles

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

Func __Example_38_SanitizeBaseName($sBaseName)
	$sBaseName = StringStripWS($sBaseName, $STR_STRIPLEADING + $STR_STRIPTRAILING)
	Return StringRegExpReplace($sBaseName, '[\\/:*?"<>|]', '_')
EndFunc   ;==>__Example_38_SanitizeBaseName

