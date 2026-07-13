#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_33_FTP2_ListDirectoryItems_AsArray()
If @error Then MsgBox($MB_ICONERROR, "_Example_33_FTP2_ListDirectoryItems_AsArray", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_33_FTP2_ListDirectoryItems_AsArray
; Description ...: Demonstrates FTP directory listing returned as a native AutoIt array.
; Syntax ........: _Example_33_FTP2_ListDirectoryItems_AsArray()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires FTP connection settings before running.
; ===============================================================================================================================
Func _Example_33_FTP2_ListDirectoryItems_AsArray()
	_Log_ChilkatExample('_Example_33_FTP2_ListDirectoryItems_AsArray')
	; This example demonstrates FTP directory listing returned as a native AutoIt array.

	Local $sHostName = ''
	Local $sUsername = ''
	Local $sPassword = ''
	Local $sRemoteDir = '/'

	If $sHostName = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_33_FTP2_ListDirectoryItems_AsArray', 'Set FTP credentials in the example before running it.')
		Return
	EndIf

	; Connect to the FTP server using the credentials configured above.
	Local $oFTP = _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	; List remote directory items as a native AutoIt array.
	Local $aItems = _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, '*', _
			$CHILKAT_FTP2_LIST_RETURN_ALL, _
			$CHILKAT_FTP2_LIST_RECUR_RECUR, _
			$CHILKAT_FTP2_LIST_SORT_ASC, _
			$CHILKAT_FTP2_LIST_RELPATH)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_ArrayDisplay($aItems, 'FTP directory items')
	_Chilkat_FTP2_Disconnect($oFTP)

EndFunc   ;==>_Example_33_FTP2_ListDirectoryItems_AsArray
