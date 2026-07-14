#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

Local Const $sAccessKey = ''
Local Const $sSecretKey = ''
Local Const $sBucketPath = ''

If $sAccessKey = '' Or $sSecretKey = '' Or $sBucketPath = '' Then
	MsgBox($MB_ICONINFORMATION, 'Cloud storage S3', 'Set S3 credentials and a bucket path before running this example.')
	_Chilkat_ShutDown()
	Exit
EndIf

Local $sXml = _Chilkat_S3_ListBucketObjects_AsXml($sBucketPath, $sAccessKey, $sSecretKey)
If @error Then
	MsgBox($MB_ICONERROR, 'Cloud storage S3', 'Listing failed. @error=' & @error & ', @extended=' & @extended)
Else
	_Log_ChilkatExample($sXml)
EndIf

_Chilkat_ShutDown()
