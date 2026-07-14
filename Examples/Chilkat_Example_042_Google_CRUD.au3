#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

Local Const $sAccessToken = ''
Local Const $sCalendarId = 'primary'
Local Const $sSpreadsheetId = ''
Local Const $sTaskListId = '@default'
Local Const $sCloudSqlProjectId = ''

If $sAccessToken = '' Then
	MsgBox($MB_ICONINFORMATION, 'Google CRUD', 'Set an OAuth2 access token and resource identifiers before running this example.')
	_Chilkat_ShutDown()
	Exit
EndIf

; READ examples are safe starting points. CREATE, UPDATE and DELETE require API-specific JSON bodies and IDs.
Local $oEvents = _Chilkat_GoogleCalendar_ListEvents_AsJson($sCalendarId, $sAccessToken, 'maxResults=10&singleEvents=true')
If Not @error Then ConsoleWrite($oEvents.Emit() & @CRLF)

If $sSpreadsheetId <> '' Then
	Local $oValues = _Chilkat_GoogleSheets_ReadValues_AsJson($sSpreadsheetId, 'Sheet1!A1:D20', $sAccessToken)
	If Not @error Then ConsoleWrite($oValues.Emit() & @CRLF)
EndIf

Local $oTasks = _Chilkat_GoogleTasks_ListTasks_AsJson($sTaskListId, $sAccessToken, 'maxResults=20')
If Not @error Then ConsoleWrite($oTasks.Emit() & @CRLF)

If $sCloudSqlProjectId <> '' Then
	Local $oInstances = _Chilkat_GoogleCloudSQL_ListInstances_AsJson($sCloudSqlProjectId, $sAccessToken)
	If Not @error Then ConsoleWrite($oInstances.Emit() & @CRLF)
EndIf

_Chilkat_ShutDown()
