#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_35_SmartCards_PKCS11_List()
If @error Then MsgBox($MB_ICONERROR, "_Example_35_SmartCards_PKCS11_List", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_35_SmartCards_PKCS11_List
; Description ...: Demonstrates listing PC/SC readers, PKCS#11 slots and certificates with private keys.
; Syntax ........: _Example_35_SmartCards_PKCS11_List()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires a PKCS#11 module path and optional PIN for the certificate part.
; ===============================================================================================================================
Func _Example_35_SmartCards_PKCS11_List()
	_Log_ChilkatExample('_Example_35_SmartCards_PKCS11_List')
	; This example demonstrates listing PC/SC readers, PKCS#11 slots and certificates with private keys.

	; List PC/SC readers available in the current system.
	Local $aReaders = _Chilkat_SCARD_ListReaders_AsArray()
	If Not @error Then
		_ArrayDisplay($aReaders, 'PC/SC readers')
	Else
		MsgBox($MB_ICONINFORMATION, '_Example_35_SmartCards_PKCS11_List', 'There is no readers found')
		Return
	EndIf

;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\aetpkss1.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\aetpkss1.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\eps2003csp11.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\eps2003csp11.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\CCGraphiteP1164p.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\CCGraphiteP1164p.dll'
;~ 	Local $sPkcs11DllFullPath = 'c:\Program Files\Krajowa Izba Rozliczeniowa S.A\Szafir 2.0\bin\CCGraphiteP11p.x64.dll'
;~ 	Local $sPkcs11DllFullPath = 'c:\Program Files\Krajowa Izba Rozliczeniowa S.A\Szafir 2.0\bin\libgraphite64.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\CCP1164p.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\CCP1164p.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\CloudSingerP1164.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\CloudSingerP1164.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\crypto3PKCS.dll'
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\crypto3PKCS.dll'
;~
;~ 	Local $sPkcs11DllFullPath = 'C:\Windows\System32\cryptoCertum3PKCS.dll'
	Local $sPkcs11DllFullPath = 'C:\Windows\SysWOW64\cryptoCertum3PKCS.dll'

	Local $s_PIN = __Chilkat_PIN_Request('', @ScriptLineNumber)
	If $sPkcs11DllFullPath = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_35_SmartCards_PKCS11_List', 'Set PKCS#11 DLL path and PIN in the example before running the PKCS#11 part.')
		Return
	EndIf

	Local $aSlots = _Chilkat_PKCS11_DiscoverSlots_AsArray($sPkcs11DllFullPath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aSlots, 'PKCS#11 slots')

	Local $aCerts = _Chilkat_PKCS11_ListCertsWithPrivateKey_AsArray($sPkcs11DllFullPath, $s_PIN)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aCerts, 'Certificates with private key', Default, Default, Default, _
			'Slot ID|Token Label|Certificate Label|Subject CN|Subject DN|Serial Number|Issuer CN|Issuer DN|Valid From|Valid To')

EndFunc   ;==>_Example_35_SmartCards_PKCS11_List
