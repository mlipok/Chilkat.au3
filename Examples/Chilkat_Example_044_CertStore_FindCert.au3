#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_44_CertStore_FindCert()
If @error Then MsgBox($MB_ICONERROR, '_Example_44_CertStore_FindCert', 'Example failed. @error=' & @error & ', @extended=' & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_44_CertStore_FindCert
; Description ...: Finds a currently valid smart-card certificate by subject common name.
; Syntax ........: _Example_44_CertStore_FindCert()
; Parameters ....: None
; Return values .: Success - None. Failure - sets @error/@extended.
; Remarks .......: Requires a configured smart card or USB token.
; ===============================================================================================================================
Func _Example_44_CertStore_FindCert()
	Local $oStore = _Chilkat_CertStore_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $oStore.OpenSmartcard('') = 0 Then
		_Log_ChilkatExample($oStore.LastErrorText)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sCN = InputBox('CertStore.FindCert', 'Enter the certificate Subject CN to find:')
	If @error Or $sCN = '' Then Return

	Local $oCert = _Chilkat_CertStore_FindCert($oStore, 'CN', $sCN, 1)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	MsgBox($MB_ICONINFORMATION, 'Certificate found', _
			'Subject: ' & $oCert.SubjectDN & @CRLF & _
			'Issuer: ' & $oCert.IssuerDN & @CRLF & _
			'Fingerprint: ' & $oCert.Sha1Thumbprint)
EndFunc   ;==>_Example_44_CertStore_FindCert
