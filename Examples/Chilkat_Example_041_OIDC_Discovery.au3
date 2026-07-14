#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

Local $oDiscovery = _Chilkat_OIDC_Discover_AsJson('https://accounts.google.com')
If @error Then
	MsgBox($MB_ICONERROR, 'OIDC discovery', 'Discovery failed. @error=' & @error & ', @extended=' & @extended)
Else
	$oDiscovery.EmitCompact = 0
	_Log_ChilkatExample($oDiscovery.Emit())
EndIf

_Chilkat_ShutDown()
