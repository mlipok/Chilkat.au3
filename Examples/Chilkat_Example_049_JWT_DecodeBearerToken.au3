#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example()
Func _Example()
	; Replace this sample with the Authorization header received by the application.
	; Do not log production tokens or decoded claims unless the output is protected.
	Local $sAuthorization = 'Authorization: Bearer ' & _
			'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.' & _
			'eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.' & _
			'SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'

	Local $oDecoded = _Chilkat_JWT_DecodeToken_AsJson($sAuthorization)
	If @error Then
		Local $iError = @error, $iExtended = @extended
		_Log_ChilkatExample('_Chilkat_JWT_DecodeToken_AsJson() failed.')
		_Log_ChilkatExample('@error = ' & $iError & '; @extended = ' & $iExtended)
		Return
	EndIf

	_Log_ChilkatExample('Decoded JWT - inspection only, signature not verified:')
	_Log_ChilkatExample($oDecoded.Emit())
EndFunc   ;==>_Example

_Chilkat_ShutDown()
