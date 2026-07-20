#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <Array.au3>
#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_45_SCard_ConnectionStatus()
If @error Then MsgBox($MB_ICONERROR, '_Example_45_SCard_ConnectionStatus', 'Example failed. @error=' & @error & ', @extended=' & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_45_SCard_ConnectionStatus
; Description ...: Establishes a PC/SC context, connects to a selected reader and checks its status.
; Syntax ........: _Example_45_SCard_ConnectionStatus()
; Parameters ....: None
; Return values .: Success - None. Failure - sets @error/@extended.
; Remarks .......: Requires at least one PC/SC reader.
; ===============================================================================================================================
Func _Example_45_SCard_ConnectionStatus()
	Local $aReaders = _Chilkat_SCARD_ListReaders_AsArray()
	If @error Or UBound($aReaders, 1) = 0 Then Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	_ArrayDisplay($aReaders, 'Available PC/SC readers')

	Local $oSCard = _Chilkat_SCARD_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If _Chilkat_SCARD_EstablishContext($oSCard, 'user') <> $CHILKAT_RET_SUCCESS Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sReader = $aReaders[0][$CHILKAT_SCARD_READER_COL_NAME]
	If _Chilkat_SCARD_Connect($oSCard, $sReader, 'shared', 'no_preference') <> $CHILKAT_RET_SUCCESS Then
		Local $iConnectError = @error, $iConnectExtended = @extended
		_Chilkat_SCARD_ReleaseContext($oSCard)
		Return SetError($iConnectError, $iConnectExtended, $CHILKAT_RET_FAILURE)
	EndIf

	_Chilkat_SCARD_CheckStatus($oSCard)
	If @error Then
		Local $iCheckError = @error, $iCheckExtended = @extended
		_Chilkat_SCARD_Disconnect($oSCard, 'leave')
		_Chilkat_SCARD_ReleaseContext($oSCard)
		Return SetError($iCheckError, $iCheckExtended, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oInserted = _Chilkat_SCARD_FindSmartcards_AsJson($oSCard)
	Local $sInsertedJson = @error ? '(FindSmartcards failed)' : $oInserted.Emit()

	MsgBox($MB_ICONINFORMATION, 'SCard status', _
			'Connected reader: ' & _Chilkat_SCARD_GetConnectedReader($oSCard) & @CRLF & _
			'Reader status: ' & $oSCard.ReaderStatus & @CRLF & _
			'Protocol: ' & $oSCard.ActiveProtocol & @CRLF & _
			'ATR: ' & $oSCard.CardAtr & @CRLF & @CRLF & _
			'Inserted smart cards:' & @CRLF & $sInsertedJson)

	_Chilkat_SCARD_Disconnect($oSCard, 'leave')
	_Chilkat_SCARD_ReleaseContext($oSCard)
EndFunc   ;==>_Example_45_SCard_ConnectionStatus
