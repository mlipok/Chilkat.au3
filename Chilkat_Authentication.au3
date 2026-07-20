#include-once

#Region - Chilkat_Authentication.au3 - Header
; Title .........: Chilkat_Authentication.au3
; Language ......: English
; Description ...: Authentication protocol and identity-provider support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/14
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: NTLM; OAuth1; OAuth2; OIDC
#EndRegion - Chilkat_Authentication.au3 - Header

#Region - Chilkat_Authentication.au3 - Object Functions
#Region ; _Chilkat_Ntlm_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Ntlm_ObjCreate
; Description ...: Creates a Chilkat Ntlm COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Ntlm_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ntlm object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatNtlmRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Ntlm_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_NTLM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Ntlm_ObjCreate

#EndRegion ; _Chilkat_Ntlm_**

#Region ; _Chilkat_OAuth1_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_OAuth1_ObjCreate
; Description ...: Creates a Chilkat OAuth1 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_OAuth1_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat OAuth1 object was introduced in version 9.5.0.53.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatOAuth1Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_OAuth1_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_OAUTH1)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_OAuth1_ObjCreate

#EndRegion ; _Chilkat_OAuth1_**

#Region ; _Chilkat_OAuth2_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_OAuth2_ObjCreate
; Description ...: Creates a Chilkat OAuth2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_OAuth2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat OAuth2 object was introduced in version 9.5.0.59.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatOAuth2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_OAuth2_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_OAUTH2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_OAuth2_ObjCreate

#EndRegion ; _Chilkat_OAuth2_**


#Region ; _Chilkat_OIDC_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_OIDC_Discover_AsJson
; Description ...: Downloads an OpenID Connect discovery document.
; Syntax ........: _Chilkat_OIDC_Discover_AsJson($sIssuerUrl)
; Parameters ....: $sIssuerUrl            - [in] OIDC issuer URL.
; Return values .: Success: Chilkat JsonObject discovery document. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Appends /.well-known/openid-configuration to the normalized issuer URL.
; Related .......: _Chilkat_HTTP_Request_AsJson
; Link ..........: https://openid.net/specs/openid-connect-discovery-1_0.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_OIDC_Discover_AsJson($sIssuerUrl)
	If Not IsString($sIssuerUrl) Or $sIssuerUrl = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $sUrl = StringRight($sIssuerUrl, 1) = '/' ? StringTrimRight($sIssuerUrl, 1) : $sIssuerUrl
	Local $oJson = _Chilkat_HTTP_Request_AsJson('GET', $sUrl & '/.well-known/openid-configuration')
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_OIDC_Discover_AsJson

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_OIDC_UserInfo_AsJson
; Description ...: Calls an OpenID Connect UserInfo endpoint using a bearer access token.
; Syntax ........: _Chilkat_OIDC_UserInfo_AsJson($sUserInfoEndpoint, $sAccessToken)
; Parameters ....: $sUserInfoEndpoint     - [in] UserInfo endpoint URL from the OIDC discovery document.
;                  $sAccessToken          - [in] OAuth2 access token.
; Return values .: Success: Chilkat JsonObject user information. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The caller is responsible for requesting scopes that allow UserInfo access.
; Related .......: _Chilkat_OIDC_Discover_AsJson, _Chilkat_HTTP_Request_AsJson
; Link ..........: https://openid.net/specs/openid-connect-core-1_0.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_OIDC_UserInfo_AsJson($sUserInfoEndpoint, $sAccessToken)
	If Not IsString($sUserInfoEndpoint) Or $sUserInfoEndpoint = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sAccessToken) Or $sAccessToken = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	Local $oJson = _Chilkat_HTTP_Request_AsJson('GET', $sUserInfoEndpoint, $sAccessToken)
	Return SetError(@error, @extended, $oJson)
EndFunc   ;==>_Chilkat_OIDC_UserInfo_AsJson

#EndRegion ; _Chilkat_OIDC_**

#EndRegion - Chilkat_Authentication.au3 - Object Functions
