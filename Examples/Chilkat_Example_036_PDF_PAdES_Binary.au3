#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_36_PDF_PAdES_Binary()
If @error Then MsgBox($MB_ICONERROR, "_Example_36_PDF_PAdES_Binary", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_36_PDF_PAdES_Binary
; Description ...: Demonstrates PAdES signing and verification using binary PDF data and a user-selected smart-card certificate.
; Syntax ........: _Example_36_PDF_PAdES_Binary()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: The UDF lists currently valid smart-card certificates with private keys, lets the user select one, and then requests its PIN.
; ===============================================================================================================================
Func _Example_36_PDF_PAdES_Binary()
	_Log_ChilkatExample('_Example_36_PDF_PAdES_Binary')
	; This example demonstrates PAdES signing and verification using binary PDF data.

	; Ask the user to select the PDF file used by this example.
	Local $sPDF_FileFullPath = FileOpenDialog('Choose PDF', '', 'PDF (*.pdf)')
	If @error Or $sPDF_FileFullPath = '' Then Return

	Local $dPDF = _File_ReadHexData($sPDF_FileFullPath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oOptions = _Chilkat_PDF_PAdES_CreateOptions()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; Passing Default as the PIN activates the safe smart-card workflow:
	; 1. Build an AutoIt array containing currently valid certificates with private keys.
	; 2. Display certificate name, issuer, validity dates and fingerprint.
	; 3. Let the user select the certificate; the full fingerprint identifies the selection.
	; 4. Display the selected certificate summary and request its PIN.
	Local $dSignedPDF = _Chilkat_PDF_SignPAdES_Binary_BySmartCard($dPDF, Default, '', $oOptions, Default, 1)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sOutput = StringTrimRight($sPDF_FileFullPath, 4) & '.pades.pdf'
	Local $hFile = FileOpen($sOutput, $FO_BINARY + $FO_OVERWRITE)
	If $hFile = -1 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	FileWrite($hFile, $dSignedPDF)
	FileClose($hFile)

	MsgBox($MB_ICONINFORMATION, '_Example_36_PDF_PAdES_Binary', 'Signed PDF saved to:' & @CRLF & $sOutput)
EndFunc   ;==>_Example_36_PDF_PAdES_Binary
