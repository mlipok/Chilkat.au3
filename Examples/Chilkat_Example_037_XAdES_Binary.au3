#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_37_XADES_Binary()
If @error Then MsgBox($MB_ICONERROR, "_Example_37_XADES_Binary", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_37_XADES_Binary
; Description ...: Demonstrates detached XAdES signing and verification using binary payload data.
; Syntax ........: _Example_37_XADES_Binary()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a file payload and a smart card PIN for signing.
; ===============================================================================================================================
Func _Example_37_XADES_Binary()
	_Log_ChilkatExample('_Example_37_XADES_Binary')
	; This example demonstrates detached XAdES signing and verification using binary payload data.

	; Ask the user to select the payload file used by this detached XAdES example.
	Local $sFileFullPath = FileOpenDialog('Choose file to sign with detached XAdES', '', 'All (*.*)')
	If @error Or $sFileFullPath = '' Then Return

	Local $dPayload = _File_ReadHexData($sFileFullPath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $s_PIN = __Chilkat_PIN_Request('', @ScriptLineNumber)
	If $s_PIN = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_37_XADES_Binary', 'Set smart card PIN in the example before running it.')
		Return
	EndIf

	Local $sReferenceUri = StringRegExpReplace($sFileFullPath, '^.*[\\/]', '')
	Local $dXadesXml = _Chilkat_XADES_SignExternalBinary_BES_BySmartCard($dPayload, $s_PIN, '', $sReferenceUri)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oVerifyJson = _Chilkat_XADES_VerifyBinary_AsJson($dXadesXml, $dPayload, $sReferenceUri)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	ConsoleWrite($oVerifyJson.Emit() & @CRLF)

	Local $sOutput = $sFileFullPath & '.xades.xml'
	Local $hFile = FileOpen($sOutput, $FO_BINARY + $FO_OVERWRITE)
	FileWrite($hFile, $dXadesXml)
	FileClose($hFile)

	MsgBox($MB_ICONINFORMATION, '_Example_37_XADES_Binary', 'XAdES XML saved to:' & @CRLF & $sOutput)

EndFunc   ;==>_Example_37_XADES_Binary
