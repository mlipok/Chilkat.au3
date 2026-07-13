#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_31_PDF()
If @error Then MsgBox($MB_ICONERROR, "_Example_31_PDF", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_31_PDF
; Description ...: Demonstrates basic PDF loading and information retrieval.
; Syntax ........: _Example_31_PDF()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a local PDF file selected by the user.
; ===============================================================================================================================
Func _Example_31_PDF()
;~ 	z:\!!!_SVN_AU3\PROGRAMY\KK_ePUAP\DOKUMENTY\TEST_PODPISU\TEST PODPISU - CERTUM.pdf
	Local $s_PDF_FileFullPath = FileOpenDialog('ChooseFile', '', 'PDF (*.pdf)')

	Local $oPDF = _Chilkat_Pdf_ObjCreate()
	If @error Then Return SetError(@error, @extended, $oPDF)

	Local $bSuccess = $oPDF.LoadFile($s_PDF_FileFullPath)
	#forceref $bSuccess
	If @error Then
		MsgBox($MB_ICONERROR, '$oPdf.LoadFile', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
		Exit
	EndIf
	MsgBox($MB_TOPMOST, "Success", '$oPdf.LoadFile($s_PDF_FileFullPath)')

	Local $dFileContent = _File_ReadHexData($s_PDF_FileFullPath)
	If @error Then Return SetError(@error, @extended, '')

	Local $bVerification = _Chilkat_PDF_VerifySignatureInBd_AsBool($dFileContent, 0)
	#forceref $bVerification
	If @error Then
		MsgBox($MB_ICONERROR, '_Chilkat_PDF_VerifySignatureInBd_AsBool', '@error = ' & @error & @CRLF & '@extended = ' & @extended)
		Exit
	EndIf
	MsgBox($MB_TOPMOST, "Success", '$oPDF.LoadBd($oBinData)')

EndFunc   ;==>_Example_31_PDF
