#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_24_Simple_SMTP_Send()
If @error Then MsgBox($MB_ICONERROR, "_Example_24_Simple_SMTP_Send", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_24_Simple_SMTP_Send
; Description ...: Demonstrates sending a simple email message via SMTP.
; Syntax ........: _Example_24_Simple_SMTP_Send()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Requires SMTP configuration values before running.
; ===============================================================================================================================
Func _Example_24_Simple_SMTP_Send()
	_Log_ChilkatExample('_Example_24_Simple_SMTP_Send')
	; This example demonstrates sending a simple email message via SMTP.

;~ 	http://www.chilkatsoft.com/refdoc/xChilkatMailManRef.html
;~ https://www.example-code.com/vbscript/smtp_send_email_with_attachments.asp

	; we will use __Chilkat_LogOnError instead following reporting model
	; Set outFile = fso.CreateTextFile("output.txt", True)

	;  The mailman object is used for sending (SMTP) and receiving (POP3) email.
	Local $oMailMan = _Chilkat_MailMan_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $sMyEmail = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'MyEmail', '')
	If $sMyEmail = '' Then $sMyEmail = "youremail@domain.com"

	Local $sSmtpHost = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpHost', '')
	If $sSmtpHost = '' Then $sSmtpHost = "smtp.my-tls-mail-server.com"

	Local $sSmtpUserName = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpUserName', '')
	If $sSmtpUserName = '' Then $sSmtpUserName = "MY_SMTP_USER"

	Local $sSmtpPassword = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpPassword', '')
	If $sSmtpPassword = '' Then $sSmtpPassword = "MY_SMTP_PASSWORD"

	Local $iSmtpSsl = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpSsl', '')
	If $iSmtpSsl = '' Then $iSmtpSsl = "1"

	Local $iSmtpPort = IniRead(@ScriptDir & '\MyChilkatConfig.ini', 'SMTP', 'SmtpPort', '')
	If $iSmtpPort = '' Then $iSmtpPort = "465"

	;  Any string argument automatically begins the 30-day trial.

	#cs
		; this is already unlocked on begining of this example
		success = $oMailMan.UnlockComponent("30-day trial")
		If (success <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
		EndIf

	#ce

	;  Set the SMTP server.
	$oMailMan.SmtpHost = $sSmtpHost

	;  Set the SMTP login/password (if required)
	$oMailMan.SmtpUsername = $sSmtpUserName
	$oMailMan.SmtpPassword = $sSmtpPassword

	;  Connect to SMTP port 465 using TLS.
	$oMailMan.SmtpSsl = $iSmtpSsl
	$oMailMan.SmtpPort = $iSmtpPort

	;  Create a new email object
	Local $oEmail = _Chilkat_Email_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oEmail.Subject = "This is a test"
	$oEmail.Body = "This is a test from: " & @ComputerName
	$oEmail.From = $sMyEmail
	Local $iSuccess = $oEmail.AddTo("My Email Testing", $sMyEmail)
	;  To add more recipients, call AddTo, AddCC, or AddBcc once per recipient.

	;  Add some attachments.
	;  The AddFileAttachment method returns the value of the content-type it chose for the attachment.
;~ 	Local $iContentType = $oEmail.AddFileAttachment(@ScriptFullPath)
;~ 	#forceref $iContentType
	If ($oEmail.LastMethodSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

;~ 	$iContentType = $oEmail.AddFileAttachment(@ScriptFullPath)
	If ($oEmail.LastMethodSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	;  Call SendEmail to connect to the SMTP server and send.
	;  The connection (i.e. session) to the SMTP server remains
	;  open so that subsequent SendEmail calls may use the
	;  same connection.
	$iSuccess = $oMailMan.SendEmail($oEmail)
	_DebugOut('--- $iSuccess = ' & $iSuccess)
	_DebugOut('$__g_oChilkat_GLOBAL.LastErrorText = ' & $__g_oChilkat_GLOBAL.LastErrorText)
	__Chilkat_LogOnError('$iSuccess = ' & $iSuccess)
	__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
	If ($iSuccess <> 1) Then
		__Chilkat_LogOnError($__g_oChilkat_GLOBAL.LastErrorText)
		Return ; @TODO - refactoring
	EndIf

	$iSuccess = $oMailMan.CloseSmtpConnection()
	If ($iSuccess <> 1) Then
		__Chilkat_LogOnError("Connection to SMTP server not closed cleanly.")
	EndIf

	__Chilkat_LogOnError("Mail with attachments sent!")

EndFunc   ;==>_Example_24_Simple_SMTP_Send
