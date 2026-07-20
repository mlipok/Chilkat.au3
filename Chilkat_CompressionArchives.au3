#include-once

#Region - Chilkat_CompressionArchives.au3 - Header
; Title .........: Chilkat_CompressionArchives.au3
; Language ......: English
; Description ...: Compression and archive-format support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/13
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: BZip2; Compression; Gzip; Tar Archive; Unix Compress; Zip
#EndRegion - Chilkat_CompressionArchives.au3 - Header

#Region ; _Chilkat_ZIP_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ObjCreate
; Description ...: Creates a Chilkat Zip COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ZIP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Zip object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIP_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_AddEntryBinary
; Description ...: Adds or replaces one ZIP entry from an AutoIt binary Variant in an already-open Zip object.
; Syntax ........: _Chilkat_ZIP_AddEntryBinary(ByRef $oZIP, $sPathInZip, ByRef $dEntryBinaryData, $bReplaceExisting = 1)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] path/name to store inside the ZIP.
;                  $dEntryBinaryData      - [in/out] bytes to store in the ZIP entry.
;                  $bReplaceExisting      - [in] when 1, replace existing entry contents if the same path exists. Default is 1.
; Return values .: Success: Chilkat ZipEntry object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses ZipEntry.ReplaceData() when replacing; uses Zip.AppendBd() for Chilkat v10-compatible in-memory append.
; Related .......: _Chilkat_ZIP_NewInMemory, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_AddEntryBinary(ByRef $oZIP, $sPathInZip, ByRef $dEntryBinaryData, $bReplaceExisting = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPathInZip) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sPathInZip, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oEntry = 0
	If $bReplaceExisting Then
		$oEntry = $oZIP.GetEntryByName($sPathInZip)
		If IsObj($oEntry) Then
			Local $iReplaced = $oEntry.ReplaceData($dEntryBinaryData)
			If $iReplaced = 0 Then
				__Chilkat_LogOnError('_Chilkat_ZIP_AddEntryBinary() ZipEntry.ReplaceData()', $oEntry, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
				Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
			EndIf
			Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oEntry)
		EndIf
	EndIf

	Local $oEntryData = _Chilkat_BINDATA_FromBinary($dEntryBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oEntry = $oZIP.AppendBd($sPathInZip, $oEntryData)
	If Not IsObj($oEntry) Then
		__Chilkat_LogOnError('_Chilkat_ZIP_AddEntryBinary() Zip.AppendBd()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oEntry)
EndFunc   ;==>_Chilkat_ZIP_AddEntryBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_AddFiles
; Description ...: Appends files matched by a pattern to an already-open Chilkat Zip object.
; Syntax ........: _Chilkat_ZIP_AddFiles(ByRef $oZIP, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sFilePattern          - [in] wildcard pattern.
;                  $bRecurse              - [in] include subdirectories. Default is 0.
;                  $sAppendFromDir        - [in] optional base directory to strip from stored names.
;                  $bDiscardPaths         - [in] optional discard stored paths flag.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The ZIP is not written until _Chilkat_ZIP_SaveAndClose() or a Chilkat Write* method is called.
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_SaveAndClose
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_AddFiles(ByRef $oZIP, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFilePattern) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sFilePattern, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	If $sAppendFromDir <> Default Then $oZIP.AppendFromDir = $sAppendFromDir
	If $bDiscardPaths <> Default Then $oZIP.DiscardPaths = $bDiscardPaths ? 1 : 0

	Local $iSuccess = $oZIP.AppendFiles($sFilePattern, $bRecurse ? 1 : 0)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_AddFiles() Zip.AppendFiles()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_AddFiles

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Binary_AddEntry
; Description ...: Convenience wrapper that adds/replaces one entry in binary ZIP data and returns modified ZIP bytes.
; Syntax ........: _Chilkat_ZIP_Binary_AddEntry(ByRef $dZipBinaryData, $sPathInZip, ByRef $dEntryBinaryData, $sDecryptPassword = Default, $bReplaceExisting = 1)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sPathInZip            - [in] path/name to store inside the ZIP.
;                  $dEntryBinaryData      - [in/out] bytes to store in the ZIP entry.
;                  $sDecryptPassword      - [in] optional ZIP password.
;                  $bReplaceExisting      - [in] when 1, replace existing entry contents. Default is 1.
; Return values .: Success: modified ZIP bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> add/replace -> Binary.
; Related .......: _Chilkat_ZIP_AddEntryBinary, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Binary_AddEntry(ByRef $dZipBinaryData, $sPathInZip, ByRef $dEntryBinaryData, $sDecryptPassword = Default, $bReplaceExisting = 1)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oEntry = _Chilkat_ZIP_AddEntryBinary($oZIP, $sPathInZip, $dEntryBinaryData, $bReplaceExisting)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	#forceref $oEntry

	Local $dModifiedZipBinaryData = _Chilkat_ZIP_ObjectToBinary($oZIP)
	Return SetError(@error, @extended, $dModifiedZipBinaryData)
EndFunc   ;==>_Chilkat_ZIP_Binary_AddEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Binary_DeleteEntry
; Description ...: Convenience wrapper that removes one entry from binary ZIP data and returns modified ZIP bytes.
; Syntax ........: _Chilkat_ZIP_Binary_DeleteEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: modified ZIP bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> delete -> Binary.
; Related .......: _Chilkat_ZIP_DeleteEntry, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Binary_DeleteEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = _Chilkat_ZIP_DeleteEntry($oZIP, $sPathInZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	#forceref $iSuccess

	Local $dModifiedZipBinaryData = _Chilkat_ZIP_ObjectToBinary($oZIP)
	Return SetError(@error, @extended, $dModifiedZipBinaryData)
EndFunc   ;==>_Chilkat_ZIP_Binary_DeleteEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Binary_GetEntry
; Description ...: Convenience wrapper that extracts one entry from binary ZIP data and returns the entry bytes.
; Syntax ........: _Chilkat_ZIP_Binary_GetEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: uncompressed entry bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> entry binary.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_GetEntryBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipEntryRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Binary_GetEntry(ByRef $dZipBinaryData, $sPathInZip, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $dEntryBinaryData = _Chilkat_ZIP_GetEntryBinary($oZIP, $sPathInZip)
	Return SetError(@error, @extended, $dEntryBinaryData)
EndFunc   ;==>_Chilkat_ZIP_Binary_GetEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_CreateFromPattern
; Description ...: Creates a ZIP archive from one or more files matched by a file pattern.
; Syntax ........: _Chilkat_ZIP_CreateFromPattern($sZipFileFullPath, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default, $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
; Parameters ....: $sZipFileFullPath      - [in] output ZIP file path.
;                  $sFilePattern          - [in] wildcard pattern, for example "C:\data\*.pdf".
;                  $bRecurse              - [in] include subdirectories. Default is 0.
;                  $sAppendFromDir        - [in] optional base directory to strip from stored names.
;                  $bDiscardPaths         - [in] optional discard stored paths flag.
;                  $sEncryptPassword      - [in] optional password. When set, AES encryption is enabled by default.
;                  $iEncryption           - [in] optional Chilkat ZIP encryption mode. Default is 4 (AES) when a password is supplied.
;                  $iEncryptKeyLength     - [in] optional encryption key length. Default is 256.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses NewZip, AppendFiles and WriteZipAndClose.
; Related .......: _Chilkat_ZIP_ObjCreate, _Chilkat_ZIP_Open
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_CreateFromPattern($sZipFileFullPath, $sFilePattern, $bRecurse = 0, $sAppendFromDir = Default, $bDiscardPaths = Default, $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sZipFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sFilePattern) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sZipFileFullPath, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If StringStripWS($sFilePattern, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.NewZip($sZipFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_CreateFromPattern() Zip.NewZip()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	If $sAppendFromDir <> Default Then $oZIP.AppendFromDir = $sAppendFromDir
	If $bDiscardPaths <> Default Then $oZIP.DiscardPaths = $bDiscardPaths ? 1 : 0

	If $sEncryptPassword <> Default And $sEncryptPassword <> '' Then
		$oZIP.EncryptPassword = $sEncryptPassword
		$oZIP.Encryption = ($iEncryption = Default) ? 4 : $iEncryption
		$oZIP.EncryptKeyLength = $iEncryptKeyLength
	EndIf

	$iSuccess = $oZIP.AppendFiles($sFilePattern, $bRecurse ? 1 : 0)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_CreateFromPattern() Zip.AppendFiles()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$iSuccess = $oZIP.WriteZipAndClose()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_CreateFromPattern() Zip.WriteZipAndClose()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_CreateFromPattern

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_DeleteEntry
; Description ...: Removes one ZIP entry from an already-open Zip object.
; Syntax ........: _Chilkat_ZIP_DeleteEntry(ByRef $oZIP, $sPathInZip)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The modified ZIP is not serialized until _Chilkat_ZIP_ObjectToBinary() or Write* is called.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_DeleteEntry(ByRef $oZIP, $sPathInZip)
	Local $oEntry = _Chilkat_ZIP_GetEntry($oZIP, $sPathInZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.DeleteEntry($oEntry)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_DeleteEntry() Zip.DeleteEntry()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_DeleteEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ExtractAll
; Description ...: Extracts all files from a ZIP archive.
; Syntax ........: _Chilkat_ZIP_ExtractAll($sZipFileFullPath, $sDestDir, $sDecryptPassword = Default, $bFlatten = 0)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDestDir              - [in] destination directory.
;                  $sDecryptPassword      - [in] optional ZIP password.
;                  $bFlatten              - [in] when 1, extracts into one directory without recreating stored paths.
; Return values .: Success: number of files extracted. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Unzip() or UnzipInto().
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_ExtractMatching
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ExtractAll($sZipFileFullPath, $sDestDir, $sDecryptPassword = Default, $bFlatten = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sDestDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not FileExists($sDestDir) Then DirCreate($sDestDir)
	If Not FileExists($sDestDir) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iUnzipped = $bFlatten ? $oZIP.UnzipInto($sDestDir) : $oZIP.Unzip($sDestDir)
	If $iUnzipped < 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_ExtractAll() Zip.Unzip/UnzipInto()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $iUnzipped)
EndFunc   ;==>_Chilkat_ZIP_ExtractAll

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ExtractMatching
; Description ...: Extracts files matching a pattern from a ZIP archive.
; Syntax ........: _Chilkat_ZIP_ExtractMatching($sZipFileFullPath, $sDestDir, $sPattern = "*", $sDecryptPassword = Default, $bFlatten = 0, $bVerbose = 0)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDestDir              - [in] destination directory.
;                  $sPattern              - [in] wildcard pattern inside ZIP. Default is "*".
;                  $sDecryptPassword      - [in] optional ZIP password.
;                  $bFlatten              - [in] when 1, extracts into one directory without recreating stored paths.
;                  $bVerbose              - [in] Chilkat verbose flag for matching extraction.
; Return values .: Success: number of files extracted. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses UnzipMatching().
; Related .......: _Chilkat_ZIP_ExtractAll
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ExtractMatching($sZipFileFullPath, $sDestDir, $sPattern = "*", $sDecryptPassword = Default, $bFlatten = 0, $bVerbose = 0)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sDestDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sPattern) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	If Not FileExists($sDestDir) Then DirCreate($sDestDir)
	If Not FileExists($sDestDir) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iUnzipped = $oZIP.UnzipMatching($sDestDir, $sPattern, $bFlatten ? 1 : 0, $bVerbose ? 1 : 0)
	If $iUnzipped < 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_ExtractMatching() Zip.UnzipMatching()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $iUnzipped)
EndFunc   ;==>_Chilkat_ZIP_ExtractMatching

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_GetEntry
; Description ...: Returns a ZipEntry object by exact stored path from an already-open Zip object.
; Syntax ........: _Chilkat_ZIP_GetEntry(ByRef $oZIP, $sPathInZip)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
; Return values .: Success: Chilkat ZipEntry object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses GetEntryByName for Chilkat v10 compatibility; Chilkat v11 also provides EntryOf.
; Related .......: _Chilkat_ZIP_GetEntryBinary, _Chilkat_ZIP_DeleteEntry
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_GetEntry(ByRef $oZIP, $sPathInZip)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sPathInZip) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If StringStripWS($sPathInZip, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oEntry = $oZIP.GetEntryByName($sPathInZip)
	If Not IsObj($oEntry) Then Return SetError($CHILKAT_ERR_NOTFOUND, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oEntry)
EndFunc   ;==>_Chilkat_ZIP_GetEntry

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_GetEntryBinary
; Description ...: Extracts one ZIP entry from an already-open Zip object directly to an AutoIt binary Variant.
; Syntax ........: _Chilkat_ZIP_GetEntryBinary(ByRef $oZIP, $sPathInZip)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
;                  $sPathInZip            - [in] exact path/name stored inside the ZIP.
; Return values .: Success: uncompressed entry bytes as binary Variant. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses ZipEntry.UnzipToBd(), no filesystem output.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_GetEntry
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipEntryRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_GetEntryBinary(ByRef $oZIP, $sPathInZip)
	Local $oEntry = _Chilkat_ZIP_GetEntry($oZIP, $sPathInZip)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oEntry.UnzipToBd($oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_GetEntryBinary() ZipEntry.UnzipToBd()', $oEntry, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf

	Local $dEntryBinaryData = _Chilkat_BINDATA_ToBinary($oBinData)
	Return SetError(@error, @extended, $dEntryBinaryData)
EndFunc   ;==>_Chilkat_ZIP_GetEntryBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ListEntriesFromBinary_AsArray
; Description ...: Opens binary ZIP data and returns ZIP entries as a native AutoIt 2D array.
; Syntax ........: _Chilkat_ZIP_ListEntriesFromBinary_AsArray(ByRef $dZipBinaryData, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: 2D array [n][$CHILKAT_ZIP_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Short path for Binary -> Zip object -> native AutoIt array listing.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ListEntriesFromObject_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ListEntriesFromBinary_AsArray(ByRef $dZipBinaryData, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	Local $aList = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	Return SetError(@error, @extended, $aList)
EndFunc   ;==>_Chilkat_ZIP_ListEntriesFromBinary_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ListEntriesFromFile_AsArray
; Description ...: Opens a ZIP archive from a filesystem path and returns ZIP entries as a native AutoIt 2D array.
; Syntax ........: _Chilkat_ZIP_ListEntriesFromFile_AsArray($sZipFileFullPath, $sDecryptPassword = Default)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: 2D array [n][$CHILKAT_ZIP_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns are described by $CHILKAT_ZIP_LIST_COL_* constants. No XML/JSON parsing is needed.
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_ListEntriesFromObject_AsArray, _Chilkat_ZIP_ListEntriesFromBinary_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ListEntriesFromFile_AsArray($sZipFileFullPath, $sDecryptPassword = Default)
	Local $oZIP = _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $aList = _Chilkat_ZIP_ListEntriesFromObject_AsArray($oZIP)
	Return SetError(@error, @extended, $aList)
EndFunc   ;==>_Chilkat_ZIP_ListEntriesFromFile_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ListEntriesFromObject_AsArray
; Description ...: Returns entries from an already-open Chilkat Zip object as a native AutoIt 2D array.
; Syntax ........: _Chilkat_ZIP_ListEntriesFromObject_AsArray(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: 2D array [n][$CHILKAT_ZIP_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Columns: INDEX, PATH, ISDIR, UNCOMPRESSED_SIZE, COMPRESSED_SIZE, MODIFIED, CRC, AES, ENTRY_TYPE, COMMENT.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ListEntriesFromFile_AsArray, _Chilkat_ZIP_ListEntriesFromBinary_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ListEntriesFromObject_AsArray(ByRef $oZIP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $iCount = $oZIP.NumEntries
	Local $aList[$iCount][$CHILKAT_ZIP_LIST_COL_COUNT]
	For $i = 0 To $iCount - 1
		Local $oEntry = $oZIP.GetEntryByIndex($i)
		If Not IsObj($oEntry) Then
			__Chilkat_LogOnError('_Chilkat_ZIP_ListEntriesFromObject_AsArray() Zip.GetEntryByIndex()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		$aList[$i][$CHILKAT_ZIP_LIST_COL_INDEX] = $i
		$aList[$i][$CHILKAT_ZIP_LIST_COL_PATH] = $oEntry.FileName
		$aList[$i][$CHILKAT_ZIP_LIST_COL_ISDIR] = $oEntry.IsDirectory
		$aList[$i][$CHILKAT_ZIP_LIST_COL_UNCOMPRESSED_SIZE] = $oEntry.UncompressedLengthStr
		$aList[$i][$CHILKAT_ZIP_LIST_COL_COMPRESSED_SIZE] = $oEntry.CompressedLengthStr
		$aList[$i][$CHILKAT_ZIP_LIST_COL_MODIFIED] = $oEntry.FileDateTimeStr
		$aList[$i][$CHILKAT_ZIP_LIST_COL_CRC] = $oEntry.Crc
		$aList[$i][$CHILKAT_ZIP_LIST_COL_AES] = $oEntry.IsAesEncrypted
		$aList[$i][$CHILKAT_ZIP_LIST_COL_ENTRY_TYPE] = $oEntry.EntryType
		$aList[$i][$CHILKAT_ZIP_LIST_COL_COMMENT] = $oEntry.Comment
	Next

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aList)
EndFunc   ;==>_Chilkat_ZIP_ListEntriesFromObject_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_NewInMemory
; Description ...: Creates a new empty ZIP object intended to be written to BinData/binary instead of a filesystem file.
; Syntax ........: _Chilkat_ZIP_NewInMemory($sVirtualZipName = "memory.zip", $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
; Parameters ....: $sVirtualZipName       - [in] virtual ZIP filename used by Chilkat metadata. Default is "memory.zip".
;                  $sEncryptPassword      - [in] optional password for new entries.
;                  $iEncryption           - [in] optional Chilkat ZIP encryption mode. Default is 4 (AES) when password is supplied.
;                  $iEncryptKeyLength     - [in] optional encryption key length. Default is 256.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Use _Chilkat_ZIP_ObjectToBinary() or _Chilkat_ZIP_ObjectToBinData() to obtain final bytes.
; Related .......: _Chilkat_ZIP_AddEntryBinary, _Chilkat_ZIP_ObjectToBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_NewInMemory($sVirtualZipName = "memory.zip", $sEncryptPassword = Default, $iEncryption = Default, $iEncryptKeyLength = 256)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sVirtualZipName) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If StringStripWS($sVirtualZipName, $STR_STRIPLEADING + $STR_STRIPTRAILING) = '' Then $sVirtualZipName = 'memory.zip'

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.NewZip($sVirtualZipName)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_NewInMemory() Zip.NewZip()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	If $sEncryptPassword <> Default And $sEncryptPassword <> '' Then
		$oZIP.EncryptPassword = $sEncryptPassword
		$oZIP.Encryption = ($iEncryption = Default) ? 4 : $iEncryption
		$oZIP.EncryptKeyLength = $iEncryptKeyLength
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oZIP)
EndFunc   ;==>_Chilkat_ZIP_NewInMemory

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ObjectToBinary
; Description ...: Writes a Chilkat Zip object to an AutoIt binary Variant without using a filesystem file.
; Syntax ........: _Chilkat_ZIP_ObjectToBinary(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: binary ZIP bytes. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the ZIP Object -> Binary step.
; Related .......: _Chilkat_ZIP_OpenFromBinary, _Chilkat_ZIP_ObjectToBinData
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ObjectToBinary(ByRef $oZIP)
	Local $oBinData = _Chilkat_ZIP_ObjectToBinData($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dZipBinaryData = _Chilkat_BINDATA_ToBinary($oBinData)
	Return SetError(@error, @extended, $dZipBinaryData)
EndFunc   ;==>_Chilkat_ZIP_ObjectToBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_ObjectToBinData
; Description ...: Writes a Chilkat Zip object to a Chilkat BinData object without using a filesystem file.
; Syntax ........: _Chilkat_ZIP_ObjectToBinData(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: Chilkat BinData object with ZIP bytes. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the ZIP Object -> BinData step. The ZIP object remains usable after WriteBd().
; Related .......: _Chilkat_ZIP_ObjectToBinary, _Chilkat_ZIP_OpenFromBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_ObjectToBinData(ByRef $oZIP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oZIP.WriteBd($oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_ObjectToBinData() Zip.WriteBd()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oBinData)
EndFunc   ;==>_Chilkat_ZIP_ObjectToBinData

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_Open
; Description ...: Opens an existing ZIP archive and optionally sets the decryption password.
; Syntax ........: _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword = Default)
; Parameters ....: $sZipFileFullPath      - [in] ZIP file path.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Caller is responsible for Save/Close when modifying the archive.
; Related .......: _Chilkat_ZIP_SaveAndClose, _Chilkat_ZIP_AddFiles
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_Open($sZipFileFullPath, $sDecryptPassword = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sZipFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not FileExists($sZipFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $sDecryptPassword <> Default And $sDecryptPassword <> '' Then $oZIP.DecryptPassword = $sDecryptPassword
	Local $iSuccess = $oZIP.OpenZip($sZipFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_Open() Zip.OpenZip()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oZIP)
EndFunc   ;==>_Chilkat_ZIP_Open

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_OpenFromBinary
; Description ...: Opens a ZIP archive from an AutoIt binary Variant and returns a Chilkat Zip object.
; Syntax ........: _Chilkat_ZIP_OpenFromBinary(ByRef $dZipBinaryData, $sDecryptPassword = Default)
; Parameters ....: $dZipBinaryData        - [in/out] binary ZIP bytes from database, HTTP, FTP, etc.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: This is the Binary -> ZIP Object step. The ZIP is processed in memory through BinData/OpenBd.
; Related .......: _Chilkat_ZIP_ObjectToBinary, _Chilkat_ZIP_ListEntriesFromObject_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_OpenFromBinary(ByRef $dZipBinaryData, $sDecryptPassword = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oBinData = _Chilkat_BINDATA_FromBinary($dZipBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	If $sDecryptPassword <> Default And $sDecryptPassword <> '' Then
		$oZIP.DecryptPassword = $sDecryptPassword
		$oZIP.EncryptPassword = $sDecryptPassword
	EndIf

	Local $iSuccess = $oZIP.OpenBd($oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_OpenFromBinary() Zip.OpenBd()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oZIP)
EndFunc   ;==>_Chilkat_ZIP_OpenFromBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIP_SaveAndClose
; Description ...: Writes ZIP changes to disk and closes the archive.
; Syntax ........: _Chilkat_ZIP_SaveAndClose(ByRef $oZIP)
; Parameters ....: $oZIP                  - [in/out] Chilkat Zip object.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses WriteZipAndClose().
; Related .......: _Chilkat_ZIP_Open, _Chilkat_ZIP_AddFiles
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIP_SaveAndClose(ByRef $oZIP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oZIP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	Local $iSuccess = $oZIP.WriteZipAndClose()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_ZIP_SaveAndClose() Zip.WriteZipAndClose()', $oZIP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_ZIP_SaveAndClose

#EndRegion ; _Chilkat_ZIP_**

#Region ; _Chilkat_ZIPCRC_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIPCRC_ObjCreate
; Description ...: Creates a Chilkat ZipCrc COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ZIPCRC_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat ZipCrc object was introduced in version 9.5.0.75.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipCrcRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIPCRC_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIPCRC)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIPCRC_ObjCreate

#EndRegion ; _Chilkat_ZIPCRC_**

#Region ; _Chilkat_ZIPENTRY_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_ZIPENTRY_ObjCreate
; Description ...: Creates a Chilkat ZipEntry COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_ZIPENTRY_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat ZipEntry object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatZipEntryRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_ZIPENTRY_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_ZIPENTRY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_ZIPENTRY_ObjCreate

#EndRegion ; _Chilkat_ZIPENTRY_**

#Region ; _Chilkat_Bz2_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Bz2_ObjCreate
; Description ...: Creates a Chilkat Bz2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Bz2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Bz2 object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatBz2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Bz2_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_BZ2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Bz2_ObjCreate

#EndRegion ; _Chilkat_Bz2_**

#Region ; _Chilkat_Compression_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Compression_ObjCreate
; Description ...: Creates a Chilkat Compression COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Compression_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Compression object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatCompressionRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Compression_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_COMPRESSION)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Compression_ObjCreate

#EndRegion ; _Chilkat_Compression_**

#Region ; _Chilkat_Gzip_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Gzip_ObjCreate
; Description ...: Creates a Chilkat Gzip COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Gzip_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Gzip object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatGzipRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Gzip_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_GZIP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Gzip_ObjCreate

#EndRegion ; _Chilkat_Gzip_**

#Region ; _Chilkat_Tar_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Tar_ObjCreate
; Description ...: Creates a Chilkat Tar COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Tar_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Tar object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatTarRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Tar_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_TAR)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Tar_ObjCreate

#EndRegion ; _Chilkat_Tar_**

#Region ; _Chilkat_UnixCompress_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_UnixCompress_ObjCreate
; Description ...: Creates a Chilkat UnixCompress COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_UnixCompress_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat UnixCompress object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatUnixCompressRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_UnixCompress_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_UNIXCOMPRESS)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_UnixCompress_ObjCreate

#EndRegion ; _Chilkat_UnixCompress_**
