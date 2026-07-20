#include-once

#Region - Chilkat_CloudStorage.au3 - Header
; Title .........: Chilkat_CloudStorage.au3
; Language ......: English
; Description ...: Cloud object storage, file storage and provider authentication support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/14
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: Amazon Glacier; Amazon S3; Amazon S3 (new); Azure Cloud Storage; Box; Dropbox; Google Cloud Storage; Google Drive; Google Photos; OneDrive; SharePoint
#EndRegion - Chilkat_CloudStorage.au3 - Header

#Region - Chilkat_CloudStorage.au3 - Object Functions
#Region ; _Chilkat_AuthAws_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAws_ObjCreate
; Description ...: Creates a Chilkat AuthAws COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAws_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAws object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAwsRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAws_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAWS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAws_ObjCreate

#EndRegion ; _Chilkat_AuthAws_**

#Region ; _Chilkat_AuthAzureAD_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAzureAD_ObjCreate
; Description ...: Creates a Chilkat AuthAzureAD COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAzureAD_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAzureAD object introduction version is not explicitly documented in the current Chilkat ActiveX refdoc.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAzureADRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAzureAD_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAZUREAD)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAzureAD_ObjCreate

#EndRegion ; _Chilkat_AuthAzureAD_**

#Region ; _Chilkat_AuthAzureSAS_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAzureSAS_ObjCreate
; Description ...: Creates a Chilkat AuthAzureSAS COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAzureSAS_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAzureSAS object was introduced in version 9.5.0.65.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAzureSASRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAzureSAS_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAZURESAS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAzureSAS_ObjCreate

#EndRegion ; _Chilkat_AuthAzureSAS_**

#Region ; _Chilkat_AuthAzureStorage_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_AuthAzureStorage_ObjCreate
; Description ...: Creates a Chilkat AuthAzureStorage COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_AuthAzureStorage_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat AuthAzureStorage object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatAuthAzureStorageRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_AuthAzureStorage_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_AUTHAZURESTORAGE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_AuthAzureStorage_ObjCreate

#EndRegion ; _Chilkat_AuthAzureStorage_**


#Region ; _Chilkat_CloudStorage_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_CloudStorage_Request_AsJson
; Description ...: Sends a bearer-authenticated JSON request to a cloud-storage REST endpoint.
; Syntax ........: _Chilkat_CloudStorage_Request_AsJson($sMethod, $sUrl, $sAccessToken = Default, $oJsonBody = Default)
; Parameters ....: $sMethod               - [in] HTTP method.
;                  $sUrl                  - [in] complete provider endpoint URL.
;                  $sAccessToken          - [in] optional OAuth2 bearer access token.
;                  $oJsonBody             - [in] optional JsonObject or JSON string.
; Return values .: Success: Chilkat JsonObject. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Intended for Box, Dropbox, Google Cloud Storage/Drive/Photos, OneDrive, SharePoint and other JSON REST APIs.
; Related .......: _Chilkat_HTTP_Request_AsJson
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_CloudStorage_Request_AsJson($sMethod, $sUrl, $sAccessToken = Default, $oJsonBody = Default)
	Local $oJson = _Chilkat_HTTP_Request_AsJson($sMethod, $sUrl, $sAccessToken, $oJsonBody)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_CloudStorage_Request_AsJson

#EndRegion ; _Chilkat_CloudStorage_**

#Region ; _Chilkat_S3_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_S3_CreateHttp
; Description ...: Creates and configures a Chilkat Http object for Amazon S3 or an S3-compatible provider.
; Syntax ........: _Chilkat_S3_CreateHttp($sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
; Parameters ....: $sAccessKey            - [in] AWS access key ID.
;                  $sSecretKey            - [in] AWS secret access key.
;                  $sRegion               - [in] AWS region. Default is us-east-1.
;                  $sEndpoint             - [in] S3 endpoint. Default is s3.amazonaws.com.
;                  $sSessionToken         - [in] optional temporary session token.
; Return values .: Success: configured Chilkat Http object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The returned object can call the built-in S3_* methods.
; Related .......: _Chilkat_S3_UploadFile, _Chilkat_S3_DownloadFile, _Chilkat_S3_DeleteObject
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_S3_CreateHttp($sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
	If Not IsString($sAccessKey) Or $sAccessKey = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sSecretKey) Or $sSecretKey = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sRegion) Or $sRegion = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	If Not IsString($sEndpoint) Or $sEndpoint = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM4, $CHILKAT_RET_FAILURE)
	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oHttp.AwsAccessKey = $sAccessKey
	$oHttp.AwsSecretKey = $sSecretKey
	$oHttp.AwsRegion = $sRegion
	$oHttp.AwsEndpoint = $sEndpoint
	If $sSessionToken <> Default And $sSessionToken <> '' Then $oHttp.AwsSessionToken = $sSessionToken
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oHttp)
EndFunc   ;==>_Chilkat_S3_CreateHttp

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_S3_UploadFile
; Description ...: Uploads a local file to Amazon S3 or an S3-compatible provider.
; Syntax ........: _Chilkat_S3_UploadFile($sLocalFilePath, $sContentType, $sBucketPath, $sObjectName, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Http.S3_UploadFile().
; Related .......: _Chilkat_S3_CreateHttp
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_S3_UploadFile($sLocalFilePath, $sContentType, $sBucketPath, $sObjectName, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
	If Not FileExists($sLocalFilePath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $oHttp = _Chilkat_S3_CreateHttp($sAccessKey, $sSecretKey, $sRegion, $sEndpoint, $sSessionToken)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oHttp.S3_UploadFile($sLocalFilePath, $sContentType, $sBucketPath, $sObjectName)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_S3_UploadFile

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_S3_DownloadFile
; Description ...: Downloads an object from Amazon S3 or an S3-compatible provider.
; Syntax ........: _Chilkat_S3_DownloadFile($sBucketPath, $sObjectName, $sLocalFilePath, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Http.S3_DownloadFile().
; Related .......: _Chilkat_S3_CreateHttp
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_S3_DownloadFile($sBucketPath, $sObjectName, $sLocalFilePath, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
	Local $oHttp = _Chilkat_S3_CreateHttp($sAccessKey, $sSecretKey, $sRegion, $sEndpoint, $sSessionToken)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oHttp.S3_DownloadFile($sBucketPath, $sObjectName, $sLocalFilePath)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_S3_DownloadFile

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_S3_DeleteObject
; Description ...: Deletes an object from Amazon S3 or an S3-compatible provider.
; Syntax ........: _Chilkat_S3_DeleteObject($sBucketPath, $sObjectName, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Http.S3_DeleteObject().
; Related .......: _Chilkat_S3_CreateHttp
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_S3_DeleteObject($sBucketPath, $sObjectName, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
	Local $oHttp = _Chilkat_S3_CreateHttp($sAccessKey, $sSecretKey, $sRegion, $sEndpoint, $sSessionToken)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oHttp.S3_DeleteObject($sBucketPath, $sObjectName)
	If $iSuccess = 0 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_S3_DeleteObject

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_S3_ListBucketObjects_AsXml
; Description ...: Returns the XML object listing for an Amazon S3 bucket path.
; Syntax ........: _Chilkat_S3_ListBucketObjects_AsXml($sBucketPath, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
; Return values .: Success: XML string. Failure: empty string and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Http.S3_ListBucketObjects().
; Related .......: _Chilkat_S3_CreateHttp
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_S3_ListBucketObjects_AsXml($sBucketPath, $sAccessKey, $sSecretKey, $sRegion = 'us-east-1', $sEndpoint = 's3.amazonaws.com', $sSessionToken = Default)
	Local $oHttp = _Chilkat_S3_CreateHttp($sAccessKey, $sSecretKey, $sRegion, $sEndpoint, $sSessionToken)
	If @error Then Return SetError(@error, @extended, '')
	Local $sXml = $oHttp.S3_ListBucketObjects($sBucketPath)
	If $oHttp.LastMethodSuccess <> 1 Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $sXml)
EndFunc   ;==>_Chilkat_S3_ListBucketObjects_AsXml

#EndRegion ; _Chilkat_S3_**

#EndRegion - Chilkat_CloudStorage.au3 - Object Functions
