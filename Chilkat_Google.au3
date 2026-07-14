#include-once

#Region - Chilkat_Google.au3 - Header
; Title .........: Chilkat_Google.au3
; Language ......: English
; Description ...: Google authentication and REST API support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/14
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: Firebase; Google APIs; Google Calendar; Google Cloud SQL; Google Sheets; Google Tasks
#EndRegion - Chilkat_Google.au3 - Header

#Region - Chilkat_Google.au3 - Object Functions
#Region ; _Chilkat_AuthGoogle_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthGoogle_ObjCreate
; Description ...: Creates a Chilkat AuthGoogle COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthGoogle_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthGoogle object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthGoogleRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthGoogle_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHGOOGLE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthGoogle_ObjCreate

#EndRegion ; _Chilkat_AuthGoogle_**

#Region ; _Chilkat_GoogleAPI_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleAPI_Create_AsJson
; Description ...: Creates a Google API resource with an authenticated HTTP POST request.
; Syntax ........: _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oJsonBody)
; Parameters ....: $sUrl                  - [in] complete Google API endpoint URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oJsonBody             - [in] Chilkat JsonObject or JSON string containing the resource.
; Return values .: Success: Chilkat JsonObject response and HTTP status in @extended. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the common Create operation used by service-specific wrappers.
; Related .......: _Chilkat_HTTP_Request_AsJson
; Link ..........: https://developers.google.com/apis-explorer
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oJsonBody)
	Local $oJson = _Chilkat_HTTP_Request_AsJson('POST', $sUrl, $sAccessToken, $oJsonBody)
	Local $iError = @error, $iExtended = @extended
	Return SetError($iError, $iExtended, $oJson)
EndFunc   ;==>_Chilkat_GoogleAPI_Create_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleAPI_Read_AsJson
; Description ...: Reads a Google API resource with an authenticated HTTP GET request.
; Syntax ........: _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
; Parameters ....: $sUrl                  - [in] complete Google API endpoint URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject response and HTTP status in @extended. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the common Read operation used by service-specific wrappers.
; Related .......: _Chilkat_HTTP_Request_AsJson
; Link ..........: https://developers.google.com/apis-explorer
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Local $oJson = _Chilkat_HTTP_Request_AsJson('GET', $sUrl, $sAccessToken)
	Local $iError = @error, $iExtended = @extended
	Return SetError($iError, $iExtended, $oJson)
EndFunc   ;==>_Chilkat_GoogleAPI_Read_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleAPI_Update_AsJson
; Description ...: Updates a Google API resource with an authenticated PATCH or PUT request.
; Syntax ........: _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oJsonBody, $sMethod = 'PATCH')
; Parameters ....: $sUrl                  - [in] complete Google API endpoint URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oJsonBody             - [in] Chilkat JsonObject or JSON string containing the update.
;                  $sMethod               - [in] HTTP update method: PATCH or PUT. Default is PATCH.
; Return values .: Success: Chilkat JsonObject response and HTTP status in @extended. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the common Update operation used by service-specific wrappers.
; Related .......: _Chilkat_HTTP_Request_AsJson
; Link ..........: https://developers.google.com/apis-explorer
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oJsonBody, $sMethod = 'PATCH')
	If Not IsString($sMethod) Or (StringUpper($sMethod) <> 'PATCH' And StringUpper($sMethod) <> 'PUT') Then _
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM4, $CHILKAT_RET_FAILURE)
	Local $oJson = _Chilkat_HTTP_Request_AsJson(StringUpper($sMethod), $sUrl, $sAccessToken, $oJsonBody)
	Local $iError = @error, $iExtended = @extended
	Return SetError($iError, $iExtended, $oJson)
EndFunc   ;==>_Chilkat_GoogleAPI_Update_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleAPI_Delete
; Description ...: Deletes a Google API resource with an authenticated HTTP DELETE request.
; Syntax ........: _Chilkat_GoogleAPI_Delete($sUrl, $sAccessToken)
; Parameters ....: $sUrl                  - [in] complete Google API endpoint URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: $CHILKAT_RET_SUCCESS and HTTP status in @extended. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: A successful empty response is accepted and normalized by _Chilkat_HTTP_Request_AsJson().
; Related .......: _Chilkat_HTTP_Request_AsJson
; Link ..........: https://developers.google.com/apis-explorer
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleAPI_Delete($sUrl, $sAccessToken)
	Local $oJson = _Chilkat_HTTP_Request_AsJson('DELETE', $sUrl, $sAccessToken)
	Local $iError = @error, $iExtended = @extended
	#forceref $oJson
	If $iError Then Return SetError($iError, $iExtended, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $iExtended, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_GoogleAPI_Delete

#EndRegion ; _Chilkat_GoogleAPI_**

#Region ; _Chilkat_GoogleCalendar_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCalendar_CreateEvent_AsJson
; Description ...: Creates a Google Calendar event.
; Syntax ........: _Chilkat_GoogleCalendar_CreateEvent_AsJson($sCalendarId, $sAccessToken, $oEventJson)
; Parameters ....: $sCalendarId           - [in] calendar identifier, commonly primary.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oEventJson            - [in] event resource as a Chilkat JsonObject or JSON string.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Calendar API v3 events resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/workspace/calendar/api/v3/reference/events/insert
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCalendar_CreateEvent_AsJson($sCalendarId, $sAccessToken, $oEventJson)
	Local $sEncodedCalendarId = _Chilkat_HTTP_UrlEncode($sCalendarId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://www.googleapis.com/calendar/v3/calendars/' & $sEncodedCalendarId & '/events'
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oEventJson)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCalendar_CreateEvent_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCalendar_ReadEvent_AsJson
; Description ...: Reads a Google Calendar event.
; Syntax ........: _Chilkat_GoogleCalendar_ReadEvent_AsJson($sCalendarId, $sEventId, $sAccessToken)
; Parameters ....: $sCalendarId           - [in] calendar identifier.
;                  $sEventId              - [in] event identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Calendar API v3 events resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/workspace/calendar/api/v3/reference/events/get
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCalendar_ReadEvent_AsJson($sCalendarId, $sEventId, $sAccessToken)
	Local $sEncodedCalendarId = _Chilkat_HTTP_UrlEncode($sCalendarId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedEventId = _Chilkat_HTTP_UrlEncode($sEventId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://www.googleapis.com/calendar/v3/calendars/' & $sEncodedCalendarId & '/events/' & $sEncodedEventId
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCalendar_ReadEvent_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCalendar_UpdateEvent_AsJson
; Description ...: Updates a Google Calendar event with PATCH semantics.
; Syntax ........: _Chilkat_GoogleCalendar_UpdateEvent_AsJson($sCalendarId, $sEventId, $sAccessToken, $oEventJson)
; Parameters ....: $sCalendarId           - [in] calendar identifier.
;                  $sEventId              - [in] event identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oEventJson            - [in] event fields to update.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Calendar API v3 events resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/workspace/calendar/api/v3/reference/events/patch
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCalendar_UpdateEvent_AsJson($sCalendarId, $sEventId, $sAccessToken, $oEventJson)
	Local $sEncodedCalendarId = _Chilkat_HTTP_UrlEncode($sCalendarId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedEventId = _Chilkat_HTTP_UrlEncode($sEventId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://www.googleapis.com/calendar/v3/calendars/' & $sEncodedCalendarId & '/events/' & $sEncodedEventId
	Local $oJson = _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oEventJson, 'PATCH')
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCalendar_UpdateEvent_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCalendar_DeleteEvent
; Description ...: Deletes a Google Calendar event.
; Syntax ........: _Chilkat_GoogleCalendar_DeleteEvent($sCalendarId, $sEventId, $sAccessToken)
; Parameters ....: $sCalendarId           - [in] calendar identifier.
;                  $sEventId              - [in] event identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Calendar API v3 events resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/workspace/calendar/api/v3/reference/events/delete
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCalendar_DeleteEvent($sCalendarId, $sEventId, $sAccessToken)
	Local $sEncodedCalendarId = _Chilkat_HTTP_UrlEncode($sCalendarId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedEventId = _Chilkat_HTTP_UrlEncode($sEventId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://www.googleapis.com/calendar/v3/calendars/' & $sEncodedCalendarId & '/events/' & $sEncodedEventId
	Local $iResult = _Chilkat_GoogleAPI_Delete($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $iResult)
EndFunc   ;==>_Chilkat_GoogleCalendar_DeleteEvent

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCalendar_ListEvents_AsJson
; Description ...: Lists Google Calendar events.
; Syntax ........: _Chilkat_GoogleCalendar_ListEvents_AsJson($sCalendarId, $sAccessToken, $sQuery = '')
; Parameters ....: $sCalendarId           - [in] calendar identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $sQuery                - [in] optional preformatted query string without a leading question mark.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Calendar API v3 events resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/workspace/calendar/api/v3/reference/events/list
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCalendar_ListEvents_AsJson($sCalendarId, $sAccessToken, $sQuery = '')
	Local $sEncodedCalendarId = _Chilkat_HTTP_UrlEncode($sCalendarId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If Not IsString($sQuery) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://www.googleapis.com/calendar/v3/calendars/' & $sEncodedCalendarId & '/events'
	If $sQuery <> '' Then $sUrl &= '?' & $sQuery
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCalendar_ListEvents_AsJson

#EndRegion ; _Chilkat_GoogleCalendar_**

#Region ; _Chilkat_GoogleSheets_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleSheets_CreateValues_AsJson
; Description ...: Appends values to a Google Sheets range as the Create operation.
; Syntax ........: _Chilkat_GoogleSheets_CreateValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken, $oValueRangeJson, $sValueInputOption = 'USER_ENTERED')
; Parameters ....: $sSpreadsheetId        - [in] spreadsheet identifier.
;                  $sRange                - [in] A1 notation range.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oValueRangeJson       - [in] ValueRange resource.
;                  $sValueInputOption     - [in] RAW or USER_ENTERED. Default is USER_ENTERED.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Sheets API v4.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson
; Link ..........: https://developers.google.com/workspace/sheets/api/reference/rest/v4/spreadsheets.values/append
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleSheets_CreateValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken, $oValueRangeJson, $sValueInputOption = 'USER_ENTERED')
	Local $sEncodedSpreadsheetId = _Chilkat_HTTP_UrlEncode($sSpreadsheetId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedRange = _Chilkat_HTTP_UrlEncode($sRange)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedInputOption = _Chilkat_HTTP_UrlEncode($sValueInputOption)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sheets.googleapis.com/v4/spreadsheets/' & $sEncodedSpreadsheetId & '/values/' & $sEncodedRange & ':append?valueInputOption=' & $sEncodedInputOption & '&insertDataOption=INSERT_ROWS'
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oValueRangeJson)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleSheets_CreateValues_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleSheets_ReadValues_AsJson
; Description ...: Reads values from a Google Sheets range.
; Syntax ........: _Chilkat_GoogleSheets_ReadValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken)
; Parameters ....: $sSpreadsheetId        - [in] spreadsheet identifier.
;                  $sRange                - [in] A1 notation range.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Sheets API v4.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson
; Link ..........: https://developers.google.com/workspace/sheets/api/reference/rest/v4/spreadsheets.values/get
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleSheets_ReadValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken)
	Local $sEncodedSpreadsheetId = _Chilkat_HTTP_UrlEncode($sSpreadsheetId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedRange = _Chilkat_HTTP_UrlEncode($sRange)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sheets.googleapis.com/v4/spreadsheets/' & $sEncodedSpreadsheetId & '/values/' & $sEncodedRange
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleSheets_ReadValues_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleSheets_UpdateValues_AsJson
; Description ...: Updates values in a Google Sheets range.
; Syntax ........: _Chilkat_GoogleSheets_UpdateValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken, $oValueRangeJson, $sValueInputOption = 'USER_ENTERED')
; Parameters ....: $sSpreadsheetId        - [in] spreadsheet identifier.
;                  $sRange                - [in] A1 notation range.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oValueRangeJson       - [in] ValueRange resource.
;                  $sValueInputOption     - [in] RAW or USER_ENTERED. Default is USER_ENTERED.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Sheets API v4.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson
; Link ..........: https://developers.google.com/workspace/sheets/api/reference/rest/v4/spreadsheets.values/update
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleSheets_UpdateValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken, $oValueRangeJson, $sValueInputOption = 'USER_ENTERED')
	Local $sEncodedSpreadsheetId = _Chilkat_HTTP_UrlEncode($sSpreadsheetId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedRange = _Chilkat_HTTP_UrlEncode($sRange)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedInputOption = _Chilkat_HTTP_UrlEncode($sValueInputOption)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sheets.googleapis.com/v4/spreadsheets/' & $sEncodedSpreadsheetId & '/values/' & $sEncodedRange & '?valueInputOption=' & $sEncodedInputOption
	Local $oJson = _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oValueRangeJson, 'PUT')
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleSheets_UpdateValues_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleSheets_DeleteValues_AsJson
; Description ...: Clears values in a Google Sheets range as the Delete operation.
; Syntax ........: _Chilkat_GoogleSheets_DeleteValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken)
; Parameters ....: $sSpreadsheetId        - [in] spreadsheet identifier.
;                  $sRange                - [in] A1 notation range to clear.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Sheets API v4.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson
; Link ..........: https://developers.google.com/workspace/sheets/api/reference/rest/v4/spreadsheets.values/clear
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleSheets_DeleteValues_AsJson($sSpreadsheetId, $sRange, $sAccessToken)
	Local $sEncodedSpreadsheetId = _Chilkat_HTTP_UrlEncode($sSpreadsheetId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedRange = _Chilkat_HTTP_UrlEncode($sRange)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $oEmpty = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sheets.googleapis.com/v4/spreadsheets/' & $sEncodedSpreadsheetId & '/values/' & $sEncodedRange & ':clear'
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oEmpty)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleSheets_DeleteValues_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleSheets_CreateSpreadsheet_AsJson
; Description ...: Creates a Google spreadsheet.
; Syntax ........: _Chilkat_GoogleSheets_CreateSpreadsheet_AsJson($sAccessToken, $oSpreadsheetJson)
; Parameters ....: $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oSpreadsheetJson      - [in] Spreadsheet resource.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Sheets API v4.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson
; Link ..........: https://developers.google.com/workspace/sheets/api/reference/rest/v4/spreadsheets/create
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleSheets_CreateSpreadsheet_AsJson($sAccessToken, $oSpreadsheetJson)
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson('https://sheets.googleapis.com/v4/spreadsheets', $sAccessToken, $oSpreadsheetJson)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleSheets_CreateSpreadsheet_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleSheets_ReadSpreadsheet_AsJson
; Description ...: Reads spreadsheet metadata and optionally grid data.
; Syntax ........: _Chilkat_GoogleSheets_ReadSpreadsheet_AsJson($sSpreadsheetId, $sAccessToken, $bIncludeGridData = 0)
; Parameters ....: $sSpreadsheetId        - [in] spreadsheet identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $bIncludeGridData      - [in] include grid data when nonzero. Default is 0.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Sheets API v4.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson
; Link ..........: https://developers.google.com/workspace/sheets/api/reference/rest/v4/spreadsheets/get
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleSheets_ReadSpreadsheet_AsJson($sSpreadsheetId, $sAccessToken, $bIncludeGridData = 0)
	Local $sEncodedSpreadsheetId = _Chilkat_HTTP_UrlEncode($sSpreadsheetId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sheets.googleapis.com/v4/spreadsheets/' & $sEncodedSpreadsheetId & '?includeGridData=' & ($bIncludeGridData ? 'true' : 'false')
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleSheets_ReadSpreadsheet_AsJson

#EndRegion ; _Chilkat_GoogleSheets_**

#Region ; _Chilkat_GoogleTasks_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleTasks_CreateTask_AsJson
; Description ...: Creates a Google Task.
; Syntax ........: _Chilkat_GoogleTasks_CreateTask_AsJson($sTaskListId, $sAccessToken, $oTaskJson)
; Parameters ....: $sTaskListId           - [in] task-list identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oTaskJson             - [in] Task resource or fields to update.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Tasks API v1 tasks resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/tasks/reference/rest/v1/tasks/insert
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleTasks_CreateTask_AsJson($sTaskListId, $sAccessToken, $oTaskJson)
	Local $sEncodedTaskListId = _Chilkat_HTTP_UrlEncode($sTaskListId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://tasks.googleapis.com/tasks/v1/lists/' & $sEncodedTaskListId & '/tasks'
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oTaskJson)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleTasks_CreateTask_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleTasks_ReadTask_AsJson
; Description ...: Reads a Google Task.
; Syntax ........: _Chilkat_GoogleTasks_ReadTask_AsJson($sTaskListId, $sTaskId, $sAccessToken)
; Parameters ....: $sTaskListId           - [in] task-list identifier.
;                  $sTaskId               - [in] task identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Tasks API v1 tasks resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/tasks/reference/rest/v1/tasks/get
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleTasks_ReadTask_AsJson($sTaskListId, $sTaskId, $sAccessToken)
	Local $sEncodedTaskListId = _Chilkat_HTTP_UrlEncode($sTaskListId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedTaskId = _Chilkat_HTTP_UrlEncode($sTaskId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://tasks.googleapis.com/tasks/v1/lists/' & $sEncodedTaskListId & '/tasks/' & $sEncodedTaskId
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleTasks_ReadTask_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleTasks_UpdateTask_AsJson
; Description ...: Updates a Google Task with PATCH semantics.
; Syntax ........: _Chilkat_GoogleTasks_UpdateTask_AsJson($sTaskListId, $sTaskId, $sAccessToken, $oTaskJson)
; Parameters ....: $sTaskListId           - [in] task-list identifier.
;                  $sTaskId               - [in] task identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oTaskJson             - [in] Task resource or fields to update.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Tasks API v1 tasks resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/tasks/reference/rest/v1/tasks/patch
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleTasks_UpdateTask_AsJson($sTaskListId, $sTaskId, $sAccessToken, $oTaskJson)
	Local $sEncodedTaskListId = _Chilkat_HTTP_UrlEncode($sTaskListId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedTaskId = _Chilkat_HTTP_UrlEncode($sTaskId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://tasks.googleapis.com/tasks/v1/lists/' & $sEncodedTaskListId & '/tasks/' & $sEncodedTaskId
	Local $oJson = _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oTaskJson, 'PATCH')
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleTasks_UpdateTask_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleTasks_DeleteTask
; Description ...: Deletes a Google Task.
; Syntax ........: _Chilkat_GoogleTasks_DeleteTask($sTaskListId, $sTaskId, $sAccessToken)
; Parameters ....: $sTaskListId           - [in] task-list identifier.
;                  $sTaskId               - [in] task identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Tasks API v1 tasks resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/tasks/reference/rest/v1/tasks/delete
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleTasks_DeleteTask($sTaskListId, $sTaskId, $sAccessToken)
	Local $sEncodedTaskListId = _Chilkat_HTTP_UrlEncode($sTaskListId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedTaskId = _Chilkat_HTTP_UrlEncode($sTaskId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://tasks.googleapis.com/tasks/v1/lists/' & $sEncodedTaskListId & '/tasks/' & $sEncodedTaskId
	Local $iResult = _Chilkat_GoogleAPI_Delete($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $iResult)
EndFunc   ;==>_Chilkat_GoogleTasks_DeleteTask

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleTasks_ListTasks_AsJson
; Description ...: Lists tasks in a Google task list.
; Syntax ........: _Chilkat_GoogleTasks_ListTasks_AsJson($sTaskListId, $sAccessToken, $sQuery = '')
; Parameters ....: $sTaskListId           - [in] task-list identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $sQuery                - [in] optional preformatted query string without a leading question mark.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses the Google Tasks API v1 tasks resource.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://developers.google.com/tasks/reference/rest/v1/tasks/list
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleTasks_ListTasks_AsJson($sTaskListId, $sAccessToken, $sQuery = '')
	Local $sEncodedTaskListId = _Chilkat_HTTP_UrlEncode($sTaskListId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If Not IsString($sQuery) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://tasks.googleapis.com/tasks/v1/lists/' & $sEncodedTaskListId & '/tasks'
	If $sQuery <> '' Then $sUrl &= '?' & $sQuery
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleTasks_ListTasks_AsJson

#EndRegion ; _Chilkat_GoogleTasks_**

#Region ; _Chilkat_GoogleCloudSQL_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCloudSQL_CreateInstance_AsJson
; Description ...: Creates a Cloud SQL instance.
; Syntax ........: _Chilkat_GoogleCloudSQL_CreateInstance_AsJson($sProjectId, $sAccessToken, $oInstanceJson)
; Parameters ....: $sProjectId            - [in] Google Cloud project identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oInstanceJson         - [in] DatabaseInstance resource or fields to update.
; Return values .: Success: Chilkat JsonObject operation/resource response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Cloud SQL CRUD in this UDF is administrative CRUD for Cloud SQL instances, not row-level SQL data operations.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/instances/insert
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCloudSQL_CreateInstance_AsJson($sProjectId, $sAccessToken, $oInstanceJson)
	Local $sEncodedProjectId = _Chilkat_HTTP_UrlEncode($sProjectId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sqladmin.googleapis.com/sql/v1beta4/projects/' & $sEncodedProjectId & '/instances'
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oInstanceJson)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCloudSQL_CreateInstance_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCloudSQL_ReadInstance_AsJson
; Description ...: Reads Cloud SQL instance metadata.
; Syntax ........: _Chilkat_GoogleCloudSQL_ReadInstance_AsJson($sProjectId, $sInstanceId, $sAccessToken)
; Parameters ....: $sProjectId            - [in] Google Cloud project identifier.
;                  $sInstanceId           - [in] Cloud SQL instance identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject operation/resource response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Cloud SQL CRUD in this UDF is administrative CRUD for Cloud SQL instances, not row-level SQL data operations.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/instances/get
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCloudSQL_ReadInstance_AsJson($sProjectId, $sInstanceId, $sAccessToken)
	Local $sEncodedProjectId = _Chilkat_HTTP_UrlEncode($sProjectId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedInstanceId = _Chilkat_HTTP_UrlEncode($sInstanceId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sqladmin.googleapis.com/sql/v1beta4/projects/' & $sEncodedProjectId & '/instances' & '/' & $sEncodedInstanceId
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCloudSQL_ReadInstance_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCloudSQL_UpdateInstance_AsJson
; Description ...: Updates a Cloud SQL instance with PATCH semantics.
; Syntax ........: _Chilkat_GoogleCloudSQL_UpdateInstance_AsJson($sProjectId, $sInstanceId, $sAccessToken, $oInstanceJson)
; Parameters ....: $sProjectId            - [in] Google Cloud project identifier.
;                  $sInstanceId           - [in] Cloud SQL instance identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
;                  $oInstanceJson         - [in] DatabaseInstance resource or fields to update.
; Return values .: Success: Chilkat JsonObject operation/resource response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Cloud SQL CRUD in this UDF is administrative CRUD for Cloud SQL instances, not row-level SQL data operations.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/instances/patch
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCloudSQL_UpdateInstance_AsJson($sProjectId, $sInstanceId, $sAccessToken, $oInstanceJson)
	Local $sEncodedProjectId = _Chilkat_HTTP_UrlEncode($sProjectId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedInstanceId = _Chilkat_HTTP_UrlEncode($sInstanceId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sqladmin.googleapis.com/sql/v1beta4/projects/' & $sEncodedProjectId & '/instances' & '/' & $sEncodedInstanceId
	Local $oJson = _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oInstanceJson, 'PATCH')
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCloudSQL_UpdateInstance_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCloudSQL_DeleteInstance
; Description ...: Deletes a Cloud SQL instance.
; Syntax ........: _Chilkat_GoogleCloudSQL_DeleteInstance($sProjectId, $sInstanceId, $sAccessToken)
; Parameters ....: $sProjectId            - [in] Google Cloud project identifier.
;                  $sInstanceId           - [in] Cloud SQL instance identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Cloud SQL CRUD in this UDF is administrative CRUD for Cloud SQL instances, not row-level SQL data operations.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/instances/delete
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCloudSQL_DeleteInstance($sProjectId, $sInstanceId, $sAccessToken)
	Local $sEncodedProjectId = _Chilkat_HTTP_UrlEncode($sProjectId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sEncodedInstanceId = _Chilkat_HTTP_UrlEncode($sInstanceId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sqladmin.googleapis.com/sql/v1beta4/projects/' & $sEncodedProjectId & '/instances' & '/' & $sEncodedInstanceId
	Local $iResult = _Chilkat_GoogleAPI_Delete($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $iResult)
EndFunc   ;==>_Chilkat_GoogleCloudSQL_DeleteInstance

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_GoogleCloudSQL_ListInstances_AsJson
; Description ...: Lists Cloud SQL instances in a project.
; Syntax ........: _Chilkat_GoogleCloudSQL_ListInstances_AsJson($sProjectId, $sAccessToken)
; Parameters ....: $sProjectId            - [in] Google Cloud project identifier.
;                  $sAccessToken          - [in] OAuth2 bearer access token.
; Return values .: Success: Chilkat JsonObject operation/resource response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Cloud SQL CRUD in this UDF is administrative CRUD for Cloud SQL instances, not row-level SQL data operations.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/instances/list
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_GoogleCloudSQL_ListInstances_AsJson($sProjectId, $sAccessToken)
	Local $sEncodedProjectId = _Chilkat_HTTP_UrlEncode($sProjectId)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $sUrl = 'https://sqladmin.googleapis.com/sql/v1beta4/projects/' & $sEncodedProjectId & '/instances'
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_GoogleCloudSQL_ListInstances_AsJson

#EndRegion ; _Chilkat_GoogleCloudSQL_**

#Region ; _Chilkat_Firebase_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Firebase_Create_AsJson
; Description ...: Creates a child resource in Firebase Realtime Database using POST.
; Syntax ........: _Chilkat_Firebase_Create_AsJson($sDatabaseUrl, $sPath, $sAccessToken, $oJsonBody)
; Parameters ....: $sDatabaseUrl          - [in] Firebase Realtime Database base URL.
;                  $sPath                 - [in] database path relative to the base URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token or empty string when another authorization mechanism is embedded in the URL.
;                  $oJsonBody             - [in] JSON object or JSON string request body.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Normalizes leading and trailing slashes and appends the required .json suffix.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://firebase.google.com/docs/reference/rest/database
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Firebase_Create_AsJson($sDatabaseUrl, $sPath, $sAccessToken, $oJsonBody)
	If Not IsString($sDatabaseUrl) Or $sDatabaseUrl = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $sUrl = StringRight($sDatabaseUrl, 1) = '/' ? StringTrimRight($sDatabaseUrl, 1) : $sDatabaseUrl
	Local $sNormalizedPath = StringStripWS($sPath, BitOR($STR_STRIPLEADING, $STR_STRIPTRAILING))
	While StringLeft($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimLeft($sNormalizedPath, 1)
	WEnd
	While StringRight($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimRight($sNormalizedPath, 1)
	WEnd
	If $sNormalizedPath <> '' Then $sUrl &= '/' & $sNormalizedPath
	$sUrl &= '.json'
	Local $oJson = _Chilkat_GoogleAPI_Create_AsJson($sUrl, $sAccessToken, $oJsonBody)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_Firebase_Create_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Firebase_Read_AsJson
; Description ...: Reads Firebase Realtime Database data using GET.
; Syntax ........: _Chilkat_Firebase_Read_AsJson($sDatabaseUrl, $sPath, $sAccessToken)
; Parameters ....: $sDatabaseUrl          - [in] Firebase Realtime Database base URL.
;                  $sPath                 - [in] database path relative to the base URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token or empty string when another authorization mechanism is embedded in the URL.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Normalizes leading and trailing slashes and appends the required .json suffix.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://firebase.google.com/docs/reference/rest/database
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Firebase_Read_AsJson($sDatabaseUrl, $sPath, $sAccessToken)
	If Not IsString($sDatabaseUrl) Or $sDatabaseUrl = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $sUrl = StringRight($sDatabaseUrl, 1) = '/' ? StringTrimRight($sDatabaseUrl, 1) : $sDatabaseUrl
	Local $sNormalizedPath = StringStripWS($sPath, BitOR($STR_STRIPLEADING, $STR_STRIPTRAILING))
	While StringLeft($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimLeft($sNormalizedPath, 1)
	WEnd
	While StringRight($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimRight($sNormalizedPath, 1)
	WEnd
	If $sNormalizedPath <> '' Then $sUrl &= '/' & $sNormalizedPath
	$sUrl &= '.json'
	Local $oJson = _Chilkat_GoogleAPI_Read_AsJson($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_Firebase_Read_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Firebase_Update_AsJson
; Description ...: Updates Firebase Realtime Database data using PATCH.
; Syntax ........: _Chilkat_Firebase_Update_AsJson($sDatabaseUrl, $sPath, $sAccessToken, $oJsonBody)
; Parameters ....: $sDatabaseUrl          - [in] Firebase Realtime Database base URL.
;                  $sPath                 - [in] database path relative to the base URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token or empty string when another authorization mechanism is embedded in the URL.
;                  $oJsonBody             - [in] JSON object or JSON string request body.
; Return values .: Success: Chilkat JsonObject response. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Normalizes leading and trailing slashes and appends the required .json suffix.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://firebase.google.com/docs/reference/rest/database
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Firebase_Update_AsJson($sDatabaseUrl, $sPath, $sAccessToken, $oJsonBody)
	If Not IsString($sDatabaseUrl) Or $sDatabaseUrl = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $sUrl = StringRight($sDatabaseUrl, 1) = '/' ? StringTrimRight($sDatabaseUrl, 1) : $sDatabaseUrl
	Local $sNormalizedPath = StringStripWS($sPath, BitOR($STR_STRIPLEADING, $STR_STRIPTRAILING))
	While StringLeft($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimLeft($sNormalizedPath, 1)
	WEnd
	While StringRight($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimRight($sNormalizedPath, 1)
	WEnd
	If $sNormalizedPath <> '' Then $sUrl &= '/' & $sNormalizedPath
	$sUrl &= '.json'
	Local $oJson = _Chilkat_GoogleAPI_Update_AsJson($sUrl, $sAccessToken, $oJsonBody, 'PATCH')
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_Firebase_Update_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Firebase_Delete
; Description ...: Deletes Firebase Realtime Database data.
; Syntax ........: _Chilkat_Firebase_Delete($sDatabaseUrl, $sPath, $sAccessToken)
; Parameters ....: $sDatabaseUrl          - [in] Firebase Realtime Database base URL.
;                  $sPath                 - [in] database path relative to the base URL.
;                  $sAccessToken          - [in] OAuth2 bearer access token or empty string when another authorization mechanism is embedded in the URL.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Normalizes leading and trailing slashes and appends the required .json suffix.
; Related .......: _Chilkat_GoogleAPI_Create_AsJson, _Chilkat_GoogleAPI_Read_AsJson, _Chilkat_GoogleAPI_Update_AsJson, _Chilkat_GoogleAPI_Delete
; Link ..........: https://firebase.google.com/docs/reference/rest/database
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Firebase_Delete($sDatabaseUrl, $sPath, $sAccessToken)
	If Not IsString($sDatabaseUrl) Or $sDatabaseUrl = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $sUrl = StringRight($sDatabaseUrl, 1) = '/' ? StringTrimRight($sDatabaseUrl, 1) : $sDatabaseUrl
	Local $sNormalizedPath = StringStripWS($sPath, BitOR($STR_STRIPLEADING, $STR_STRIPTRAILING))
	While StringLeft($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimLeft($sNormalizedPath, 1)
	WEnd
	While StringRight($sNormalizedPath, 1) = '/'
		$sNormalizedPath = StringTrimRight($sNormalizedPath, 1)
	WEnd
	If $sNormalizedPath <> '' Then $sUrl &= '/' & $sNormalizedPath
	$sUrl &= '.json'
	Local $iResult = _Chilkat_GoogleAPI_Delete($sUrl, $sAccessToken)
	Return SetError(@error, @extended, $iResult)
EndFunc   ;==>_Chilkat_Firebase_Delete

#EndRegion ; _Chilkat_Firebase_**

#EndRegion - Chilkat_Google.au3 - Object Functions
