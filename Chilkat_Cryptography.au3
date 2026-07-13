#include-once

#Region - Chilkat_Cryptography.au3 - Header
; Title .........: Chilkat_Cryptography.au3
; Language ......: English
; Description ...: Cryptographic algorithms, keys and encryption support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/13
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: DSA; Diffie-Hellman; ECC; Ed25519; Encryption; OpenSSL; PRNG; RSA
#EndRegion - Chilkat_Cryptography.au3 - Header

#Region ; _Chilkat_Crypt2_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Crypt2_ObjCreate
; Description ...: Creates a Chilkat Crypt2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Crypt2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Crypt2 object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCrypt2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Crypt2_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_CRYPT2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Crypt2_ObjCreate

#EndRegion ; _Chilkat_Crypt2_**

#Region ; _Chilkat_Dh_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Dh_ObjCreate
; Description ...: Creates a Chilkat Dh COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Dh_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Dh object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDhRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Dh_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DH)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Dh_ObjCreate

#EndRegion ; _Chilkat_Dh_**

#Region ; _Chilkat_Dsa_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Dsa_ObjCreate
; Description ...: Creates a Chilkat Dsa COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Dsa_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Dsa object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatDsaRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Dsa_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_DSA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Dsa_ObjCreate

#EndRegion ; _Chilkat_Dsa_**

#Region ; _Chilkat_Ecc_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Ecc_ObjCreate
; Description ...: Creates a Chilkat Ecc COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Ecc_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ecc object was introduced in version 9.5.0.52.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatEccRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Ecc_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ECC)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Ecc_ObjCreate

#EndRegion ; _Chilkat_Ecc_**

#Region ; _Chilkat_EdDSA_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_EdDSA_ObjCreate
; Description ...: Creates a Chilkat EdDSA COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_EdDSA_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat EdDSA object was introduced in version 9.5.0.83.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatEdDSARef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_EdDSA_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_EDDSA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_EdDSA_ObjCreate

#EndRegion ; _Chilkat_EdDSA_**

#Region ; _Chilkat_KeyContainer_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_KeyContainer_ObjCreate
; Description ...: Creates a Chilkat KeyContainer COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_KeyContainer_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat KeyContainer object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatKeyContainerRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_KeyContainer_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_KEYCONTAINER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_KeyContainer_ObjCreate

#EndRegion ; _Chilkat_KeyContainer_**

#Region ; _Chilkat_PRIVATEKEY_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PRIVATEKEY_ObjCreate
; Description ...: Creates a Chilkat PrivateKey COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_PRIVATEKEY_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat PrivateKey object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Chilkat PrivateKey object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPrivateKeyRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PRIVATEKEY_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PRIVATEKEY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_PRIVATEKEY_ObjCreate


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PRIVATEKEY_SavePemFile
; Description ...: Saves a Chilkat PrivateKey object as PKCS#1, PKCS#8 or encrypted PKCS#8 PEM.
; Syntax ........: _Chilkat_PRIVATEKEY_SavePemFile(ByRef $oPrivateKey, $sFileFullPath, $sFormat = 'pkcs8', $sPassword = Default)
; Parameters ....: $oPrivateKey            - [in/out] Chilkat PrivateKey object.
;                  $sFileFullPath          - [in] destination PEM or KEY file path.
;                  $sFormat                - [in] 'pkcs1', 'pkcs8' or 'pkcs8-encrypted'.
;                  $sPassword              - [in] password required for encrypted PKCS#8 output.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The file extension does not define the private-key encoding.
; Related .......: _Chilkat_Rsa_GenerateKeyPair
; Link ..........: https://www.chilkatsoft.com/refdoc/xPrivateKeyRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_PRIVATEKEY_SavePemFile(ByRef $oPrivateKey, $sFileFullPath, $sFormat = 'pkcs8', $sPassword = Default)
	If Not IsObj($oPrivateKey) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFileFullPath) Or $sFileFullPath = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sFormat) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)

	Local $iSuccess = 0
	Switch StringLower($sFormat)
		Case 'pkcs1'
			$iSuccess = $oPrivateKey.SavePemFile($sFileFullPath)
		Case 'pkcs8'
			$iSuccess = $oPrivateKey.SavePkcs8PemFile($sFileFullPath)
		Case 'pkcs8-encrypted'
			If Not IsString($sPassword) Or $sPassword = '' Then _
					Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM4, $CHILKAT_RET_FAILURE)
			$oPrivateKey.Pkcs8EncryptAlg = 'aes256'
			$iSuccess = $oPrivateKey.SavePkcs8EncryptedPemFile($sPassword, $sFileFullPath)
		Case Else
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	EndSwitch

	If @error Or $iSuccess <> 1 Then
		__Chilkat_LogOnError('_Chilkat_PRIVATEKEY_SavePemFile()', $oPrivateKey, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_PRIVATEKEY_SavePemFile

#EndRegion ; _Chilkat_PRIVATEKEY_**

#Region ; _Chilkat_Prng_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Prng_ObjCreate
; Description ...: Creates a Chilkat Prng COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Prng_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Prng object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPrngRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Prng_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PRNG)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Prng_ObjCreate

#EndRegion ; _Chilkat_Prng_**

#Region ; _Chilkat_PublicKey_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PublicKey_ObjCreate
; Description ...: Creates a Chilkat PublicKey COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_PublicKey_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat PublicKey object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatPublicKeyRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_PublicKey_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_PUBLICKEY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_PublicKey_ObjCreate


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_PublicKey_SavePemFile
; Description ...: Saves a Chilkat PublicKey object as PEM.
; Syntax ........: _Chilkat_PublicKey_SavePemFile(ByRef $oPublicKey, $sFileFullPath, $bPreferPkcs1 = 0)
; Parameters ....: $oPublicKey             - [in/out] Chilkat PublicKey object.
;                  $sFileFullPath          - [in] destination PEM or PUB file path.
;                  $bPreferPkcs1           - [in] when true, prefer PKCS#1 RSA PUBLIC KEY output.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: A public key is not an X.509 certificate.
; Related .......: _Chilkat_Rsa_GenerateKeyPair
; Link ..........: https://www.chilkatsoft.com/refdoc/xPublicKeyRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_PublicKey_SavePemFile(ByRef $oPublicKey, $sFileFullPath, $bPreferPkcs1 = 0)
	If Not IsObj($oPublicKey) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFileFullPath) Or $sFileFullPath = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oPublicKey.SavePemFile($bPreferPkcs1 ? 1 : 0, $sFileFullPath)
	If @error Or $iSuccess <> 1 Then
		__Chilkat_LogOnError('_Chilkat_PublicKey_SavePemFile()', $oPublicKey, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_PublicKey_SavePemFile

#EndRegion ; _Chilkat_PublicKey_**

#Region ; _Chilkat_Rsa_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Rsa_ObjCreate
; Description ...: Creates a Chilkat Rsa COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Rsa_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Rsa object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatRsaRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Rsa_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_RSA)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Rsa_ObjCreate


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Rsa_GenerateKeyPair
; Description ...: Generates an RSA private/public key pair.
; Syntax ........: _Chilkat_Rsa_GenerateKeyPair(ByRef $oPrivateKey, ByRef $oPublicKey, $iNumBits = 2048)
; Parameters ....: $oPrivateKey            - [out] generated Chilkat PrivateKey object.
;                  $oPublicKey             - [out] generated Chilkat PublicKey object.
;                  $iNumBits               - [in] RSA modulus size in bits. Default is 2048.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......: 2026/07/13 - added Chilkat 10/11 API compatibility selected by _Chilkat_IsAtLeastThisVersion().
; Remarks .......: Chilkat 11.0.0 and newer use Rsa.GenKey() and PrivateKey.ToPublicKey().
;                  Older Chilkat versions use the deprecated Rsa.GenerateKey(), ExportPrivateKeyObj() and ExportPublicKeyObj() API.
; Related .......: _Chilkat_IsAtLeastThisVersion, _Chilkat_PRIVATEKEY_SavePemFile, _Chilkat_PublicKey_SavePemFile, _Chilkat_Csr_GeneratePemFile
; Link ..........: https://www.example-code.com/autoit/rsa_generatePEM.asp
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_Rsa_GenerateKeyPair(ByRef $oPrivateKey, ByRef $oPublicKey, $iNumBits = 2048)
	$oPrivateKey = Null
	$oPublicKey = Null

	If Not IsInt($iNumBits) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	If $iNumBits < 512 Or $iNumBits > 8192 Or Mod($iNumBits, 8) <> 0 Then _
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)

	Local $oRsa = _Chilkat_Rsa_ObjCreate()
	If @error Or Not IsObj($oRsa) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $bUseNewApi = _Chilkat_IsAtLeastThisVersion('11.0.0', '_Chilkat_Rsa_GenerateKeyPair()')
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = 0
	If $bUseNewApi Then
		$oPrivateKey = _Chilkat_PRIVATEKEY_ObjCreate()
		If @error Or Not IsObj($oPrivateKey) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

		$iSuccess = $oRsa.GenKey($iNumBits, $oPrivateKey)
		If @error Or $iSuccess <> 1 Then
			__Chilkat_LogOnError('_Chilkat_Rsa_GenerateKeyPair() Rsa.GenKey()', $oRsa, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		$oPublicKey = _Chilkat_PublicKey_ObjCreate()
		If @error Or Not IsObj($oPublicKey) Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

		$iSuccess = $oPrivateKey.ToPublicKey($oPublicKey)
		If @error Or $iSuccess <> 1 Then
			__Chilkat_LogOnError('_Chilkat_Rsa_GenerateKeyPair() PrivateKey.ToPublicKey()', $oPrivateKey, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf
	Else
		$iSuccess = $oRsa.GenerateKey($iNumBits)
		If @error Or $iSuccess <> 1 Then
			__Chilkat_LogOnError('_Chilkat_Rsa_GenerateKeyPair() Rsa.GenerateKey()', $oRsa, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		$oPrivateKey = $oRsa.ExportPrivateKeyObj()
		If @error Or Not IsObj($oPrivateKey) Then
			__Chilkat_LogOnError('_Chilkat_Rsa_GenerateKeyPair() Rsa.ExportPrivateKeyObj()', $oRsa, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		$oPublicKey = $oRsa.ExportPublicKeyObj()
		If @error Or Not IsObj($oPublicKey) Then
			__Chilkat_LogOnError('_Chilkat_Rsa_GenerateKeyPair() Rsa.ExportPublicKeyObj()', $oRsa, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_Rsa_GenerateKeyPair

#EndRegion ; _Chilkat_Rsa_**

#Region ; _Chilkat_SecureString_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SecureString_ObjCreate
; Description ...: Creates a Chilkat SecureString COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SecureString_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SecureString object was introduced in version 9.5.0.71.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSecureStringRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SecureString_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SECURESTRING)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SecureString_ObjCreate

#EndRegion ; _Chilkat_SecureString_**
