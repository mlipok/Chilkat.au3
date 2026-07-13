#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_34_FTP2_ZIP_Binary_Workflow()
If @error Then MsgBox($MB_ICONERROR, "_Example_34_FTP2_ZIP_Binary_Workflow", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_34_FTP2_ZIP_Binary_Workflow
; Description ...: Demonstrates downloading a ZIP from FTP, editing it in memory and uploading it back.
; Syntax ........: _Example_34_FTP2_ZIP_Binary_Workflow()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires FTP connection settings and remote ZIP paths before running.
; ===============================================================================================================================
Func _Example_34_FTP2_ZIP_Binary_Workflow()
	_Log_ChilkatExample('_Example_34_FTP2_ZIP_Binary_Workflow')
	; This example demonstrates downloading a ZIP from FTP, editing it in memory and uploading it back.

	Local $sHostName = ''
	Local $sUsername = ''
	Local $sPassword = ''
	Local $sRemoteInputZip = '/in/archive.zip'
	Local $sRemoteOutputZip = '/out/archive.zip'

	If $sHostName = '' Then
		MsgBox($MB_ICONINFORMATION, '_Example_34_FTP2_ZIP_Binary_Workflow', 'Set FTP credentials and remote paths in the example before running it.')
		Return
	EndIf

	Local $oFTP = _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_FTP2_DownloadZipToObject($oFTP, $sRemoteInputZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $aBefore = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aBefore, 'ZIP downloaded from FTP')

	Local $dAdded = StringToBinary('Added without using a local ZIP file.', $SB_UTF8)
	_Chilkat_ZIP_AddEntryBinary($oZIP, 'added/from-memory.txt', $dAdded)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_Chilkat_FTP2_UploadZipObject($oFTP, $oZIP, $sRemoteOutputZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_Chilkat_FTP2_Disconnect($oFTP)

EndFunc   ;==>_Example_34_FTP2_ZIP_Binary_Workflow
