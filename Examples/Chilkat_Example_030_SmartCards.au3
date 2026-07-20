#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_30_SmartCards()
If @error Then MsgBox($MB_ICONERROR, "_Example_30_SmartCards", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_30_SmartCards
; Description ...: Demonstrates basic smart card certificate loading.
; Syntax ........: _Example_30_SmartCards()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a configured smart card environment.
; ===============================================================================================================================
Func _Example_30_SmartCards()
	; https://www.example-code.com/vbscript/list_cryptographic_service_providers.asp
	Local $aProvidersList = _Chilkat_Csp_GetProvidersList()
	_ArrayDisplay($aProvidersList, '$aProvidersList')

;~ 	https://www.example-code.com/vbscript/load_certificate_on_smartcard_in_reader.asp
;~ 	"CryptoCertum3 Csp"
	Local $s_CspName = "cryptoCertum3 CSP"
	Local $oCert = _Chilkat_Cert_LoadFromSmartCard($s_CspName)
	Local $oCert = _Chilkat_Cert_LoadFromSmartCardEx()
	#forceref $oCert

	Local $s_PIN = __Chilkat_PIN_Request('', @ScriptLineNumber)
	Local $i_pinValid = _Chilkat_Cert_ValidateSmartCard_PIN($s_CspName, $s_PIN)
	#forceref $i_pinValid

EndFunc   ;==>_Example_30_SmartCards
