#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_25_Simple_IMAP_List_MailBoxes()
If @error Then MsgBox($MB_ICONERROR, "_Example_25_Simple_IMAP_List_MailBoxes", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_25_Simple_IMAP_List_MailBoxes
; Description ...: Demonstrates connecting to IMAP and listing mailboxes.
; Syntax ........: _Example_25_Simple_IMAP_List_MailBoxes()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires IMAP credentials before running.
; ===============================================================================================================================
Func _Example_25_Simple_IMAP_List_MailBoxes()
	_Log_ChilkatExample('_Example_25_Simple_IMAP_List_MailBoxes')
	; This example demonstrates connecting to IMAP and listing mailboxes.

;~ 	https://www.example-code.com/vbscript/imap_listMailboxes.asp
;~ 	https://www.example-code.com/vbscript/imap_listMailboxes2.asp

	; we will use __Chilkat_LogOnError instead following reporting model
	; Set outFile = fso.CreateTextFile("output.txt", True)

	_Log_ChilkatExample(@ScriptLineNumber)
	Local $oImap = _Chilkat_Imap_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	_Log_ChilkatExample(@ScriptLineNumber)
	Local $sMyEmail = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'MyEmail', '')
	If $sMyEmail = '' Then $sMyEmail = "youremail@domain.com"

	Local $sImapServer = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapServer', '')
	If $sImapServer = '' Then $sImapServer = "imap.my-tls-mail-server.com"

	Local $sImapUserName = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapUserName', '')
	If $sImapUserName = '' Then $sImapUserName = "MY_SMTP_USER"

	Local $sImapPassword = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapPassword', '')
	If $sImapPassword = '' Then $sImapPassword = "MY_SMTP_PASSWORD"

	Local $iImapSsl = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapSsl', '')
	If $iImapSsl = '' Then $iImapSsl = "1"
	_Log_ChilkatExample("! " & $iImapSsl)

	Local $iImapPort = IniRead(@ScriptDir & '\!!!_MY_SECRET_DATA\MyChilkatConfig.ini', 'IMAP', 'ImapPort', '')
	If $iImapPort = '' Then $iImapPort = "143"
	_Log_ChilkatExample("! " & $iImapPort)

	_Log_ChilkatExample(@ScriptLineNumber)
	;  Any string argument automatically begins the 30-day trial.

	#CS
		; this is already unlocked on begining of this example
		success = $oImap.UnlockComponent("30-day trial")
		If (success <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
		EndIf

	#CE

	;  Connect to an IMAP server.
	;  Use TLS
	$oImap.ssl = $iImapSsl
	$oImap.Port = $iImapPort
	$oImap.Connect($sImapServer)
	If ($oImap.LastMethodSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	_Log_ChilkatExample(@ScriptLineNumber)
	;  Login using login/password
	$oImap.Login($sImapUserName, $sImapPassword)
	If ($oImap.LastMethodSuccess <> 1) Then
		_Log_ChilkatExample(@ScriptLineNumber & ' LOGIN: ' & $oImap.LastErrorText)
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf
	_Log_ChilkatExample(@ScriptLineNumber & ' LOGIN: ' & $oImap.LastErrorText)

	;  The ListMailboxes method returns a Mailboxes object that contains the collection of mailboxes.
	;  It accepts two arguments: a refName and a wildcardedMailbox.
	Local $s_refName = ''
	;  refName is usually set to an empty string.
	;  A non-empty reference name argument is the name of a mailbox or a level of mailbox hierarchy,
	;	and indicates the context in which the mailbox name is interpreted.

	;  Select all mailboxes matching this pattern:
	Local $s_wildcardedMailbox = '*'

	Local $oMBoxes = $oIMAP.ListMailboxes($s_refName, $s_wildcardedMailbox)
;~ 	If ($oImap.LastMethodSuccess <> 1) Or $oMBoxes = Null Then
;~ 		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
;~ 		Return ; @TODO - refactoring
;~ 	EndIf
	_Log_ChilkatExample(@ScriptLineNumber & ' ' & $oImap.LastErrorText)
	_Log_ChilkatExample('! ' & IsObj($oMBoxes))
	_Log_ChilkatExample('! ' & ObjName($oMBoxes, $OBJ_STRING))
	_Log_ChilkatExample('! ' & VarGetType($oMBoxes))

	_Log_ChilkatExample('! Count MBoxes = ' & $oMBoxes.Count)
	__Chilkat_LogOnError("Get ListMailboxes")
	__Chilkat_LogOnError("Mailboxes has been listed : " & $oMBoxes.Count)
	_Log_ChilkatExample(@ScriptLineNumber)
	_Log_ChilkatExample("Mailboxes has been listed : " & $oMBoxes.Count)

	; https://www.example-code.com/csharp/imap_find_sent_mailbox.asp

	For $iMailbox_idx = 0 To $oMBoxes.Count - 1
;~ 		_Log_ChilkatExample('! ' & $oMBoxes.GetName($iMailbox_idx))
;~         _Log_ChilkatExample(">> mboxes.GetNthFlag(i,0)=" & $oMBoxes.GetNthFlag($iMailbox_idx, 0))
;~         _Log_ChilkatExample(">> mboxes.GetNthFlag(i,1)=" & $oMBoxes.GetNthFlag($iMailbox_idx, 1))

		If $oMBoxes.GetName($iMailbox_idx) = "Sent" Then
			__Chilkat_LogOnError(@ScriptLineNumber & ' ' & $oMBoxes.GetName($iMailbox_idx))
		ElseIf $oMBoxes.HasFlag($iMailbox_idx, '\\Junk') Then
			__Chilkat_LogOnError(@ScriptLineNumber & ' ' & $oMBoxes.GetName($iMailbox_idx))
		ElseIf $oMBoxes.HasFlag($iMailbox_idx, '\Junk') Then
			__Chilkat_LogOnError(@ScriptLineNumber & ' ' & $oMBoxes.GetName($iMailbox_idx))
		EndIf
	Next
	__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)

	Local $iSuccess = $oImap.SelectMailbox('INBOX')
	If ($iSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	Local $bUid = 0
	Local $iNumMessages = $oImap.NumMessages

	__Chilkat_LogOnError('$oImap.NumMessages = ' & $iNumMessages)

	Local $oEmail = Null, $sHtml = ''
	For $iMessage_idx = $iNumMessages To 1 Step -1
		$oEmail = $oImap.FetchSingle($iMessage_idx, $bUid)
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
		$sHtml = $oEmail.GetHtmlBody()
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
		If IsString($sHtml) And $sHtml <> '' Then
			MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, '$sHtml', $sHtml)
			_Chilkat_ViewHTML($sHtml)
		EndIf
	Next

EndFunc   ;==>_Example_25_Simple_IMAP_List_MailBoxes
