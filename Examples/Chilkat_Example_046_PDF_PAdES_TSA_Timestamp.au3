#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_46_PDF_PAdES_TSA_Timestamp()
If @error Then MsgBox($MB_ICONERROR, '_Example_46_PDF_PAdES_TSA_Timestamp', 'Example failed. @error=' & @error & ', @extended=' & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_46_PDF_PAdES_TSA_Timestamp
; Description ...: Creates an LTV-enabled PAdES signature with an RFC 3161 TSA timestamp.
; Syntax ........: _Example_46_PDF_PAdES_TSA_Timestamp()
; Parameters ....: None
; Return values .: Success - None. Failure - sets @error/@extended.
; Remarks .......: Uses a user-selected smart-card certificate and the DigiCert public TSA endpoint as an example.
; ===============================================================================================================================
Func _Example_46_PDF_PAdES_TSA_Timestamp()
	Local $sInput = FileOpenDialog('Choose PDF to sign', '', 'PDF (*.pdf)')
	If @error Or $sInput = '' Then Return
	Local $sOutput = StringTrimRight($sInput, 4) & '.pades-tsa.pdf'
	Local $sTsaUrl = 'http://timestamp.digicert.com'

	Local $vResult = _Chilkat_PDF_SignPAdES_TSA_File_BySmartCard($sInput, $sOutput, $sTsaUrl)
	If @error Or $vResult <> $CHILKAT_RET_SUCCESS Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oVerify = _Chilkat_PDF_VerifyPAdES_TSA_File_AsJson($sOutput)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	MsgBox($MB_ICONINFORMATION, 'PAdES TSA timestamp', 'Signed PDF:' & @CRLF & $sOutput & @CRLF & @CRLF & $oVerify.Emit())
EndFunc   ;==>_Example_46_PDF_PAdES_TSA_Timestamp
