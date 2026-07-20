#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_47_CodeSign_Authenticode()
If @error Then MsgBox($MB_ICONERROR, '_Example_47_CodeSign_Authenticode', 'Example failed. @error=' & @error & ', @extended=' & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_47_CodeSign_Authenticode
; Description ...: Signs a copy of an EXE or DLL with a smart-card certificate and verifies the Authenticode signature.
; Syntax ........: _Example_47_CodeSign_Authenticode()
; Parameters ....: None
; Return values .: Success - None. Failure - sets @error/@extended.
; Remarks .......: The original file is not modified; the example signs a copied file.
; ===============================================================================================================================
Func _Example_47_CodeSign_Authenticode()
	Local $sSource = FileOpenDialog('Choose EXE or DLL', '', 'Executable files (*.exe;*.dll)')
	If @error Or $sSource = '' Then Return
	Local $sTarget = $sSource & '.signed' & StringRight($sSource, 4)
	If Not FileCopy($sSource, $sTarget, 9) Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $vResult = _Chilkat_CodeSign_SignFile_BySmartCard($sTarget)
	If @error Or $vResult <> $CHILKAT_RET_SUCCESS Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oSignatureInfo = _Chilkat_CodeSign_VerifySignature_AsJson($sTarget)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	MsgBox($MB_ICONINFORMATION, 'Authenticode signature', 'Signed copy:' & @CRLF & $sTarget & @CRLF & @CRLF & $oSignatureInfo.Emit())
EndFunc   ;==>_Example_47_CodeSign_Authenticode
