#AutoIt3Wrapper_UseX64=n
#include <AutoItConstants.au3>
#include <StringConstants.au3>
#include <Array.au3>

#Region - HEADER
; This generator builds the object metadata used by ChilkatConstants.au3.
; The generated data is consumed by __Chilkat_ObjCreate_Wrapper(),
; which centralizes Chilkat COM object creation for all supported versions.
;
; Architecture:
;   Chilkat manifest / object list
;       -> generator
;       -> $CHILKATOBJ_API[version][object_name][PROGID/CLSID/IID]
;       -> ChilkatConstants.au3
;       -> __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_...)
;       -> public _Chilkat_*_ObjCreate() wrappers
;
; ProgID rule:
;   The manifest stores COM versioned ProgIDs, for example:
;       Chilkat_9_5_0.Global.1
;       Chilkat.Global.1
;   The UDF object ProgID must omit the final COM class version suffix:
;       Chilkat_9_5_0.Global.1 -> Chilkat_9_5_0.Global
;       Chilkat.Global.1       -> Chilkat.Global
;
; Version rule:
;   Chilkat 9.5.0 uses versioned ProgIDs such as Chilkat_9_5_0.Global.
;   Chilkat 10.x and 11.x use version-independent ProgIDs such as Chilkat.Global.
;   Therefore, the generator must not infer $CHILKATOBJ_VERSION_* from ProgID.
;   The generic _Chilkat_Generator() receives the target $CHILKATOBJ_VERSION_* constant and ProgID prefix explicitly.
;
; Compatibility rule:
;   Existing $CHILKATOBJ_NAME_* constants are stable API and must not be
;   renamed, removed or reordered if external code may depend on them.
;   New object names should be added additively.
;
; Ordering rule:
;   $CHILKATOBJ_NAME_GLOBAL must be first.
;   Remaining object names should be sorted alphabetically unless legacy
;   compatibility requires otherwise.
;
; Error handling rule:
;   Some classes may be present in documentation or a manifest but may not be
;   creatable in the currently registered ActiveX installation. The generator
;   skips such objects, does not emit incomplete constants, and prints a summary
;   error list at the end of processing.
;
; Required after changes:
;   AU3Check validation and runtime validation.

#EndRegion - HEADER


; Error monitoring. This will trap all COM errors while alive.
Global $oErrorHandler = ObjEvent("AutoIt.Error", _ErrFunc)

Global $__g_sChilkat_Generator_ErrorList = ''
Global $__g_iChilkat_Generator_ErrorCount = 0
Global $__g_iChilkat_Generator_SuccessCount = 0
Global $__g_iChilkat_Generator_ManifestCount = 0
Global $__g_sChilkat_Generator_CurrentVersionConst = ''
Global $__g_bChilkat_Generator_CurrentGlobalIidMissing = False
Global $__g_sChilkat_Generator_RegisteredDllPathList = ''
Global $__g_sChilkat_Generator_RegisteredVersionList = ''
Global $__g_sChilkat_Generator_DocDiagnosticObjectList = ''
Global $__g_sChilkat_Generator_GlobalRegistrationMismatchList = ''

; Select the generator calls required for your registered Chilkat ActiveX versions.
; Manifest file paths should be used when generating final constants.
; The generic _Chilkat_Generator() receives the version constant, manifest path and ProgID prefix.

__Chilkat_Generator_Reset()
;~ _Chilkat_Generator("$CHILKATOBJ_VERSION_950", "z:\!!!_SVN_AU3\DOC_INSTALL\Chilkat\9\9.5.0\chilkat.manifest", "Chilkat_9_5_0")
;~ _Chilkat_Generator("$CHILKATOBJ_VERSION_10", "z:\!!!_SVN_AU3\DOC_INSTALL\Chilkat\10.0\10.1.2.0\chilkat.manifest", "Chilkat")
_Chilkat_Generator("$CHILKATOBJ_VERSION_11", "z:\!!!_SVN_AU3\DOC_INSTALL\Chilkat\11\11.5.0\chilkatax-win32\chilkat.manifest", "Chilkat")
_Chilkat_Generator_ShowSummary()

Func _Chilkat_Generator($sChilkatObjVersionConst, $sManifestFileFullPath, $sProgIdPrefix)
	$__g_sChilkat_Generator_CurrentVersionConst = $sChilkatObjVersionConst
	$__g_bChilkat_Generator_CurrentGlobalIidMissing = False
	ConsoleWrite("> GENERATOR: START: " & $sChilkatObjVersionConst & @CRLF)

	If Not IsString($sProgIdPrefix) Or $sProgIdPrefix = '' Then
		__Chilkat_Generator_ErrorList_Add('Parameter', 'sProgIdPrefix', 0, 0, 'Invalid ProgID prefix.')
		ConsoleWrite("> GENERATOR: END: " & $sChilkatObjVersionConst & @CRLF)
		Return SetError(1, 0, 0)
	EndIf
	__Chilkat_ReportGlobalObject($sProgIdPrefix & '.Global')

	Local $iResult = 0
	If __Chilkat_IsUsableFilePath($sManifestFileFullPath) Then
		$__g_iChilkat_Generator_ManifestCount += 1
		$iResult = __Chilkat_GenerateObjectFlagsFromManifest($sManifestFileFullPath, $sChilkatObjVersionConst)
	Else
		; Fallback list. Prefer passing a manifest path when generating final constants.
		$iResult = __Chilkat_GenerateObjectFlagsFromList($sProgIdPrefix, $sChilkatObjVersionConst)
	EndIf

	ConsoleWrite("> GENERATOR: END: " & $sChilkatObjVersionConst & @CRLF)
	Return SetError(@error, @extended, $iResult)
EndFunc   ;==>_Chilkat_Generator

Func __Chilkat_GenerateObjectFlagsFromManifest($sManifestFileFullPath, $sChilkatObjVersionConst)
	Local $oXmlDom = __Chilkat_Manifest_LoadXmlDom($sManifestFileFullPath)
	If @error Then Return SetError(@error, @extended, 0)

	Local $oComClassNodes = $oXmlDom.selectNodes("//*[local-name()='comClass' and @progid]")
	If @error Or Not IsObj($oComClassNodes) Then
		__Chilkat_Generator_ErrorList_Add('XML.DOM', $sManifestFileFullPath, @error, @extended, 'Unable to select comClass nodes from manifest.')
		Return SetError(2, @extended, 0)
	EndIf

	If $oComClassNodes.length = 0 Then
		__Chilkat_Generator_ErrorList_Add('XML.DOM', $sManifestFileFullPath, 0, 0, 'No comClass/progid entries found in manifest.')
		Return SetError(3, 0, 0)
	EndIf

	Local $sObjectList = ''
	For $i = 0 To $oComClassNodes.length - 1
		Local $oComClassNode = $oComClassNodes.item($i)
		Local $sManifestProgId = $oComClassNode.getAttribute('progid')
		Local $sObjectProgId = __Chilkat_NormalizeManifestProgId($sManifestProgId)
		If $sObjectProgId = '' Then ContinueLoop

		Local $sClassName = __Chilkat_GetClassNameFromProgId($sObjectProgId)
		If $sClassName = '' Then ContinueLoop

		Local $sNameSuffix = __Chilkat_GetObjectNameSuffix($sClassName)
		Local $sItem = $sClassName & '=' & $sObjectProgId & '=' & $sNameSuffix
		If StringInStr('|' & $sObjectList & '|', '|' & $sItem & '|', $STR_CASESENSE) = 0 Then
			If $sObjectList <> '' Then $sObjectList &= '|'
			$sObjectList &= $sItem
		EndIf
	Next

	Return __Chilkat_GenerateObjectFlagsFromManifestList($sObjectList, $sChilkatObjVersionConst)
EndFunc   ;==>__Chilkat_GenerateObjectFlagsFromManifest

Func __Chilkat_Manifest_LoadXmlDom($sManifestFileFullPath)
	Local $oXmlDom = ObjCreate('Msxml2.DOMDocument.6.0')
	If @error Or Not IsObj($oXmlDom) Then
		__Chilkat_Generator_ErrorList_Add('ObjCreate', 'Msxml2.DOMDocument.6.0', @error, @extended, 'Unable to create XML DOM parser.')
		Return SetError(1, @extended, 0)
	EndIf

	$oXmlDom.async = False
	$oXmlDom.validateOnParse = False
	$oXmlDom.resolveExternals = False
	$oXmlDom.setProperty('SelectionLanguage', 'XPath')

	Local $bLoaded = $oXmlDom.load($sManifestFileFullPath)
	If Not $bLoaded Then
		__Chilkat_Generator_ErrorList_Add('XML.DOM.Load', $sManifestFileFullPath, 0, 0, __Chilkat_Manifest_GetXmlParseError($oXmlDom))
		Return SetError(2, 0, 0)
	EndIf

	Return SetError(0, 0, $oXmlDom)
EndFunc   ;==>__Chilkat_Manifest_LoadXmlDom

Func __Chilkat_Manifest_GetXmlParseError(ByRef $oXmlDom)
	If Not IsObj($oXmlDom) Then Return 'XML parse error details are unavailable.'
	Local $oParseError = $oXmlDom.parseError
	If Not IsObj($oParseError) Then Return 'XML parse error details are unavailable.'
	Return 'XML parse error | line=' & $oParseError.line & ' | linepos=' & $oParseError.linepos & ' | reason=' & $oParseError.reason
EndFunc   ;==>__Chilkat_Manifest_GetXmlParseError

Func __Chilkat_GenerateObjectFlagsFromList($sProgIdPrefix, $sChilkatObjVersionConst)
	Local $sObjectList = __Chilkat_GetFallbackObjectList()
	Local $aObjectList = __Chilkat_SortObjectList($sObjectList)
	If @error Then Return SetError(@error, @extended, 0)

	For $i = 0 To UBound($aObjectList) - 1
		Local $aObjectInfo = StringSplit($aObjectList[$i], '=', $STR_NOCOUNT)
		If @error Or UBound($aObjectInfo) < 1 Or UBound($aObjectInfo) > 2 Then
			ConsoleWrite('! ---> invalid object list item: ' & $aObjectList[$i] & @CRLF)
			__Chilkat_Generator_ErrorList_Add('ObjectList', $aObjectList[$i], 0, 0, 'Invalid object list item.')
			ContinueLoop
		EndIf

		Local $sClassName = $aObjectInfo[0]
		Local $sNameSuffix = __Chilkat_GetObjectNameSuffix($sClassName)
		If UBound($aObjectInfo) = 2 And $aObjectInfo[1] <> '' Then $sNameSuffix = $aObjectInfo[1]

		_Chilkat_GetObjectFlags($sProgIdPrefix & '.' & $sClassName, $sNameSuffix, $sChilkatObjVersionConst)
	Next

	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_GenerateObjectFlagsFromList

Func __Chilkat_GenerateObjectFlagsFromManifestList($sObjectList, $sChilkatObjVersionConst)
	Local $aObjectList = __Chilkat_SortObjectList($sObjectList)
	If @error Then Return SetError(@error, @extended, 0)

	For $i = 0 To UBound($aObjectList) - 1
		Local $aObjectInfo = StringSplit($aObjectList[$i], '=', $STR_NOCOUNT)
		If @error Or UBound($aObjectInfo) <> 3 Then
			ConsoleWrite('! ---> invalid manifest object list item: ' & $aObjectList[$i] & @CRLF)
			__Chilkat_Generator_ErrorList_Add('ManifestList', $aObjectList[$i], 0, 0, 'Invalid manifest object list item.')
			ContinueLoop
		EndIf

		_Chilkat_GetObjectFlags($aObjectInfo[1], $aObjectInfo[2], $sChilkatObjVersionConst)
	Next

	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_GenerateObjectFlagsFromManifestList

Func __Chilkat_SortObjectList($sObjectList)
	Local $aObjectList = StringSplit($sObjectList, '|', $STR_NOCOUNT)
	If @error Then Return SetError(1, @extended, 0)

	Local $sGlobal = ''
	Local $aSorted[0]

	For $i = 0 To UBound($aObjectList) - 1
		If $aObjectList[$i] = '' Then ContinueLoop
		Local $aItemInfo = StringSplit($aObjectList[$i], '=', $STR_NOCOUNT)
		If @error Or UBound($aItemInfo) < 1 Then ContinueLoop
		Local $sClassName = $aItemInfo[0]
		If $sClassName = 'Global' Then
			$sGlobal = $aObjectList[$i]
		Else
			ReDim $aSorted[UBound($aSorted) + 1]
			$aSorted[UBound($aSorted) - 1] = $aObjectList[$i]
		EndIf
	Next

	If UBound($aSorted) > 1 Then _ArraySort($aSorted)

	Local $iOffset = 0
	Local $iResultSize = UBound($aSorted)
	If $sGlobal <> '' Then $iResultSize += 1
	Local $aResult[$iResultSize]
	If $sGlobal <> '' Then
		$aResult[0] = $sGlobal
		$iOffset = 1
	EndIf

	For $i = 0 To UBound($aSorted) - 1
		$aResult[$i + $iOffset] = $aSorted[$i]
	Next

	Return SetError(0, 0, $aResult)
EndFunc   ;==>__Chilkat_SortObjectList

Func __Chilkat_NormalizeManifestProgId($sManifestProgId)
	; The manifest uses COM class version ProgIDs such as Chilkat.Global.1.
	; The UDF stores the object ProgID without the final COM class version suffix.
	Return StringRegExpReplace($sManifestProgId, '\.[0-9]+$', '')
EndFunc   ;==>__Chilkat_NormalizeManifestProgId

Func __Chilkat_GetClassNameFromProgId($sObjectProgId)
	Return StringRegExpReplace($sObjectProgId, '^.*\.', '')
EndFunc   ;==>__Chilkat_GetClassNameFromProgId

Func __Chilkat_GetObjectNameSuffix($sClassName)
	Switch $sClassName
		Case 'CkString'
			Return 'CKSTRING'
		Case 'Csv'
			Return 'CSV'
		Case 'JsonObject'
			Return 'JSONOBJECT'
		Case 'SshTunnel'
			Return 'SSHTUNEL'
		Case 'Xml'
			Return 'XML'
		Case Else
			Return StringUpper($sClassName)
	EndSwitch
EndFunc   ;==>__Chilkat_GetObjectNameSuffix

Func __Chilkat_IsUsableFilePath($sFileFullPath)
	If IsKeyword($sFileFullPath) Then Return 0
	If Not IsString($sFileFullPath) Then Return 0
	If $sFileFullPath = '' Then Return 0
	Return FileExists($sFileFullPath)
EndFunc   ;==>__Chilkat_IsUsableFilePath

Func __Chilkat_ReportGlobalObject($sGlobalProgId)
	Local $o_GLOBAL = ObjCreate($sGlobalProgId)
	If @error Then
;~ 		ConsoleWrite('! ---> @error=' & @error & '  @extended=' & @extended & ' : ObjCreate("' & $sGlobalProgId & '")' & @CRLF)
		$__g_bChilkat_Generator_CurrentGlobalIidMissing = True
		__Chilkat_Generator_ErrorList_Add('ObjCreate', $sGlobalProgId, @error, @extended, 'Global object could not be created. Global IID is unavailable for this version.')
		Return SetError(@error, @extended, 0)
	EndIf

	Local $sGlobalVersion = $o_GLOBAL.Version
	ConsoleWrite($sGlobalVersion & @CRLF)

	Local $sGlobalObjectFile = ObjName($o_GLOBAL, $OBJ_FILE)
	If @error Then $sGlobalObjectFile = ''

	Local $sExpectedVersionPrefix = __Chilkat_Generator_GetExpectedVersionPrefixFromConst($__g_sChilkat_Generator_CurrentVersionConst)
	Local $bGlobalVersionMatchesExpected = __Chilkat_Generator_RegisteredVersionMatchesExpected($sGlobalVersion, $sExpectedVersionPrefix)
	If Not $bGlobalVersionMatchesExpected Then __Chilkat_Generator_GlobalRegistrationMismatchList_Add($__g_sChilkat_Generator_CurrentVersionConst, $sGlobalProgId, $sGlobalVersion, $sExpectedVersionPrefix, $sGlobalObjectFile)

	If $sGlobalVersion <> '' Then __Chilkat_Generator_RegisteredVersionList_Add($__g_sChilkat_Generator_CurrentVersionConst, $sGlobalVersion, $sGlobalProgId, $sGlobalObjectFile, $sExpectedVersionPrefix, $bGlobalVersionMatchesExpected)
	If $sGlobalObjectFile <> '' Then __Chilkat_Generator_RegisteredDllPathList_Add($sGlobalObjectFile, $__g_sChilkat_Generator_CurrentVersionConst)

	ObjName_FlagsValue($o_GLOBAL)

	Local $sGlobalIID = ObjName($o_GLOBAL, $OBJ_IID)
	If @error Or $sGlobalIID = '' Then
		$__g_bChilkat_Generator_CurrentGlobalIidMissing = True
		__Chilkat_Generator_ErrorList_Add('ObjName', $sGlobalProgId, @error, @extended, 'Global IID unavailable through ObjName(). Successful non-Global objects will print ObjName($oObj, 4) diagnostics.')
	Else
		$__g_bChilkat_Generator_CurrentGlobalIidMissing = False
	EndIf

	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_ReportGlobalObject

Func _Chilkat_GetObjectFlags($sObject_classname, $sChilkatObjNameSuffix, $sChilkatObjVersionConst)
	Local $oObj = ObjCreate($sObject_classname)
	If @error Then
;~ 		ConsoleWrite('! ---> @error=' & @error & '  @extended=' & @extended & ' : ObjCreate("' & $sObject_classname & '")' & @CRLF)
		__Chilkat_Generator_ErrorList_Add('ObjCreate', $sObject_classname, @error, @extended, 'Object skipped. No constants were emitted for this ProgID.')
		Return SetError(@error, @extended, 0)
	EndIf

	ObjName_FlagsValue_Chillkat($oObj, $sObject_classname, $sChilkatObjNameSuffix, $sChilkatObjVersionConst)
	If @error Then
		ConsoleWrite('! ---> @error=' & @error & '  @extended=' & @extended & ' : $sObject_classname= ' & $sObject_classname & @CRLF)
		__Chilkat_Generator_ErrorList_Add('ObjName', $sObject_classname, @error, @extended, 'ObjName metadata extraction failed.')
		__Chilkat_Generator_DocDiagnosticObjectList_Add($sObject_classname, $sChilkatObjVersionConst)
	EndIf
	Return SetError(@error, @extended, $oObj)
EndFunc   ;==>_Chilkat_GetObjectFlags

Func __Chilkat_Generator_PrintObjectFileDiagnosticIfGlobalIidMissing(ByRef $oObj, $sObject_classname)
	If Not $__g_bChilkat_Generator_CurrentGlobalIidMissing Then Return SetError(0, 0, 0)
	If Not IsObj($oObj) Then Return SetError(1, 0, 0)

	Local $sObjectFile = ObjName($oObj, $OBJ_FILE)
	If @error Then
		ConsoleWrite('+> ' & $__g_sChilkat_Generator_CurrentVersionConst & ' : ObjName($oObj,4) {The file that is associated with the object in the Registry} for ' & $sObject_classname & ' =' & @CRLF & @TAB & '@error = ' & @error & @CRLF & @CRLF)
		Sleep(3 * 1000)
		Return SetError(@error, @extended, 0)
	EndIf

	__Chilkat_Generator_RegisteredDllPathList_Add($sObjectFile)
	ConsoleWrite('+> ' & $__g_sChilkat_Generator_CurrentVersionConst & ' : ObjName($oObj,4) {The file that is associated with the object in the Registry} for ' & $sObject_classname & ' =' & @CRLF & @TAB & $sObjectFile & @CRLF & @CRLF)
	Sleep(3 * 1000)
	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_Generator_PrintObjectFileDiagnosticIfGlobalIidMissing

Func ObjName_FlagsValue_Chillkat(ByRef $oObj, $sObject_classname, $sChilkatObjNameSuffix, $sChilkatObjVersionConst)
	If Not IsObj($oObj) Then Return SetError(1, 0, 0)

	Local $sCLSID = ObjName($oObj, $OBJ_CLSID)
	If @error Then Return SetError(@error, @extended, 0)

	Local $sIID = ObjName($oObj, $OBJ_IID)
	If @error Then Return SetError(@error, @extended, 0)

	__Chilkat_Generator_PrintObjectFileDiagnosticIfGlobalIidMissing($oObj, $sObject_classname)

	Local $sObjectNameConst = '$CHILKATOBJ_NAME_' & StringUpper($sChilkatObjNameSuffix)
	Local $sResult = _
			'$CHILKATOBJ_API[' & $sChilkatObjVersionConst & '][' & $sObjectNameConst & '][$CHILKATOBJ_ID_PROGID] = ' & "'" & $sObject_classname & "'" & @CRLF & _
			'$CHILKATOBJ_API[' & $sChilkatObjVersionConst & '][' & $sObjectNameConst & '][$CHILKATOBJ_ID_CLSID] = ' & "'" & $sCLSID & "'" & @CRLF & _
			'$CHILKATOBJ_API[' & $sChilkatObjVersionConst & '][' & $sObjectNameConst & '][$CHILKATOBJ_ID_IID] = ' & "'" & $sIID & "'" & @CRLF & _
			@CRLF

	ConsoleWrite($sResult)
	$__g_iChilkat_Generator_SuccessCount += 1
	Return SetError(0, 0, 1)
EndFunc   ;==>ObjName_FlagsValue_Chillkat

Func ObjName_FlagsValue(ByRef $oObj)
	Local $sInfo = ''

	$sInfo &= '+>' & @TAB & 'ObjName($oObj,1) {The name of the Object} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_NAME) & @CRLF

	; HELPFILE REMARKS: Not all Objects support flags 2 to 7. Always test for @error in these cases.
	$sInfo &= '+>' & @TAB & 'ObjName($oObj,2) {Description string of the Object} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_STRING)
	If @error Then $sInfo &= '@error = ' & @error
	$sInfo &= @CRLF & @CRLF

	$sInfo &= '+>' & @TAB & 'ObjName($oObj,3) {The ProgID of the Object} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_PROGID)
	If @error Then $sInfo &= '@error = ' & @error
	$sInfo &= @CRLF & @CRLF

	$sInfo &= '+>' & @TAB & 'ObjName($oObj,4) {The file that is associated with the object in the Registry} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_FILE)
	If @error Then $sInfo &= '@error = ' & @error
	$sInfo &= @CRLF & @CRLF

	$sInfo &= '+>' & @TAB & 'ObjName($oObj,5) {Module name in which the object runs (WIN XP And above). Marshaller for non-inproc objects.} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_MODULE)
	If @error Then $sInfo &= '@error = ' & @error
	$sInfo &= @CRLF & @CRLF

	$sInfo &= '+>' & @TAB & 'ObjName($oObj,6) {CLSID of the object''s coclass} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_CLSID)
	If @error Then $sInfo &= '@error = ' & @error
	$sInfo &= @CRLF & @CRLF

	$sInfo &= '+>' & @TAB & 'ObjName($oObj,7) {IID of the object''s interface} =' & @CRLF & @TAB & ObjName($oObj, $OBJ_IID)
	If @error Then $sInfo &= '@error = ' & @error
	$sInfo &= @CRLF & @CRLF

	ConsoleWrite($sInfo & @CRLF)
EndFunc   ;==>ObjName_FlagsValue

Func __Chilkat_Generator_Reset()
	$__g_sChilkat_Generator_ErrorList = ''
	$__g_iChilkat_Generator_ErrorCount = 0
	$__g_iChilkat_Generator_SuccessCount = 0
	$__g_iChilkat_Generator_ManifestCount = 0
	$__g_sChilkat_Generator_CurrentVersionConst = ''
	$__g_bChilkat_Generator_CurrentGlobalIidMissing = False
	$__g_sChilkat_Generator_RegisteredDllPathList = ''
	$__g_sChilkat_Generator_RegisteredVersionList = ''
	$__g_sChilkat_Generator_DocDiagnosticObjectList = ''
	$__g_sChilkat_Generator_GlobalRegistrationMismatchList = ''
EndFunc   ;==>__Chilkat_Generator_Reset

Func __Chilkat_Generator_RegisteredDllPathList_Add($sFileFullPath, $sChilkatObjVersionConst = Default)
	If Not IsString($sFileFullPath) Or $sFileFullPath = '' Then Return SetError(1, 0, 0)
	If IsKeyword($sChilkatObjVersionConst) Or $sChilkatObjVersionConst = '' Then $sChilkatObjVersionConst = $__g_sChilkat_Generator_CurrentVersionConst

	Local $sListItem = $sChilkatObjVersionConst & '|' & $sFileFullPath
	Local $sSearch = @LF & $__g_sChilkat_Generator_RegisteredDllPathList & @LF
	If StringInStr($sSearch, @LF & $sListItem & @LF, $STR_NOCASESENSE) > 0 Then Return SetError(0, 0, 0)

	If $__g_sChilkat_Generator_RegisteredDllPathList <> '' Then $__g_sChilkat_Generator_RegisteredDllPathList &= @LF
	$__g_sChilkat_Generator_RegisteredDllPathList &= $sListItem
	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_Generator_RegisteredDllPathList_Add



Func __Chilkat_Generator_GetExpectedVersionPrefixFromConst($sChilkatObjVersionConst)
	Switch $sChilkatObjVersionConst
		Case '$CHILKATOBJ_VERSION_950'
			Return '9.5.0'
		Case '$CHILKATOBJ_VERSION_10'
			Return '10.'
		Case '$CHILKATOBJ_VERSION_11'
			Return '11.'
		Case Else
			Return ''
	EndSwitch
EndFunc   ;==>__Chilkat_Generator_GetExpectedVersionPrefixFromConst

Func __Chilkat_Generator_RegisteredVersionMatchesExpected($sRegisteredVersion, $sExpectedVersionPrefix)
	If Not IsString($sExpectedVersionPrefix) Or $sExpectedVersionPrefix = '' Then Return True
	If Not IsString($sRegisteredVersion) Or $sRegisteredVersion = '' Then Return False
	If StringRight($sExpectedVersionPrefix, 1) = '.' Then Return StringLeft($sRegisteredVersion, StringLen($sExpectedVersionPrefix)) = $sExpectedVersionPrefix
	Return ($sRegisteredVersion = $sExpectedVersionPrefix Or StringLeft($sRegisteredVersion, StringLen($sExpectedVersionPrefix) + 1) = $sExpectedVersionPrefix & '.')
EndFunc   ;==>__Chilkat_Generator_RegisteredVersionMatchesExpected

Func __Chilkat_Generator_GlobalRegistrationMismatchList_Add($sChilkatObjVersionConst, $sGlobalProgId, $sRegisteredVersion, $sExpectedVersionPrefix, $sGlobalObjectFile = '')
	If Not IsString($sChilkatObjVersionConst) Or $sChilkatObjVersionConst = '' Then Return SetError(1, 0, 0)
	If Not IsString($sGlobalProgId) Then $sGlobalProgId = ''
	If Not IsString($sRegisteredVersion) Then $sRegisteredVersion = ''
	If Not IsString($sExpectedVersionPrefix) Then $sExpectedVersionPrefix = ''
	If Not IsString($sGlobalObjectFile) Then $sGlobalObjectFile = ''

	Local $sListItem = $sChilkatObjVersionConst & '|' & $sGlobalProgId & '|' & $sRegisteredVersion & '|' & $sExpectedVersionPrefix & '|' & $sGlobalObjectFile
	Local $sSearch = @LF & $__g_sChilkat_Generator_GlobalRegistrationMismatchList & @LF
	If StringInStr($sSearch, @LF & $sListItem & @LF, $STR_NOCASESENSE) > 0 Then Return SetError(0, 0, 0)

	If $__g_sChilkat_Generator_GlobalRegistrationMismatchList <> '' Then $__g_sChilkat_Generator_GlobalRegistrationMismatchList &= @LF
	$__g_sChilkat_Generator_GlobalRegistrationMismatchList &= $sListItem
	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_Generator_GlobalRegistrationMismatchList_Add

Func __Chilkat_Generator_ShowGlobalRegistrationMismatchSummary()
	If $__g_sChilkat_Generator_GlobalRegistrationMismatchList = '' Then Return SetError(0, 0, 0)

	ConsoleWrite(@CRLF & '; =====================================' & @CRLF)
	ConsoleWrite('; Global registration mismatch diagnostics:' & @CRLF)
	ConsoleWrite('; These entries indicate that the requested Global ProgID resolves to a DLL/version that does not match the requested $CHILKATOBJ_VERSION_* constant.' & @CRLF)
	ConsoleWrite(';' & @CRLF)

	Local $aListItem = StringSplit($__g_sChilkat_Generator_GlobalRegistrationMismatchList, @LF, $STR_NOCOUNT)
	For $i = 0 To UBound($aListItem) - 1
		If $aListItem[$i] = '' Then ContinueLoop
		Local $aItem = StringSplit($aListItem[$i], '|', $STR_NOCOUNT)
		If UBound($aItem) < 4 Then ContinueLoop
		ConsoleWrite(';   ' & $aItem[0] & @CRLF)
		ConsoleWrite(';     Global ProgID source : ' & $aItem[1] & @CRLF)
		ConsoleWrite(';     expected version prefix : ' & $aItem[3] & @CRLF)
		ConsoleWrite(';     registered version : ' & $aItem[2] & @CRLF)
		If UBound($aItem) > 4 And $aItem[4] <> '' Then ConsoleWrite(';     registered DLL path : ' & $aItem[4] & @CRLF)
		ConsoleWrite(';     conclusion : COM registration mismatch. Documentation version comparison for this version is not reliable until registration is fixed.' & @CRLF)
		ConsoleWrite(';' & @CRLF)
	Next

	ConsoleWrite('; =====================================' & @CRLF)
	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_Generator_ShowGlobalRegistrationMismatchSummary

Func __Chilkat_Generator_RegisteredVersionList_Add($sChilkatObjVersionConst, $sRegisteredVersion, $sGlobalProgId = '', $sGlobalObjectFile = '', $sExpectedVersionPrefix = '', $bVersionMatchesExpected = True)
	If Not IsString($sChilkatObjVersionConst) Or $sChilkatObjVersionConst = '' Then Return SetError(1, 0, 0)
	If Not IsString($sRegisteredVersion) Or $sRegisteredVersion = '' Then Return SetError(2, 0, 0)
	If Not IsString($sGlobalProgId) Then $sGlobalProgId = ''
	If Not IsString($sGlobalObjectFile) Then $sGlobalObjectFile = ''
	If Not IsString($sExpectedVersionPrefix) Then $sExpectedVersionPrefix = ''

	Local $sListItem = $sChilkatObjVersionConst & '|' & $sRegisteredVersion & '|' & $sGlobalProgId & '|' & $sGlobalObjectFile & '|' & $sExpectedVersionPrefix & '|' & Number($bVersionMatchesExpected)
	If $__g_sChilkat_Generator_RegisteredVersionList = '' Then
		$__g_sChilkat_Generator_RegisteredVersionList = $sListItem
		Return SetError(0, 0, 1)
	EndIf

	Local $aListItem = StringSplit($__g_sChilkat_Generator_RegisteredVersionList, @LF, $STR_NOCOUNT)
	Local $sNewList = ''
	Local $bUpdated = False
	For $i = 0 To UBound($aListItem) - 1
		If $aListItem[$i] = '' Then ContinueLoop
		Local $aItem = StringSplit($aListItem[$i], '|', $STR_NOCOUNT)
		If UBound($aItem) > 0 And $aItem[0] = $sChilkatObjVersionConst Then
			If $sNewList <> '' Then $sNewList &= @LF
			$sNewList &= $sListItem
			$bUpdated = True
		Else
			If $sNewList <> '' Then $sNewList &= @LF
			$sNewList &= $aListItem[$i]
		EndIf
	Next

	If Not $bUpdated Then
		If $sNewList <> '' Then $sNewList &= @LF
		$sNewList &= $sListItem
	EndIf

	$__g_sChilkat_Generator_RegisteredVersionList = $sNewList
	Return SetError(0, Number($bUpdated), 1)
EndFunc   ;==>__Chilkat_Generator_RegisteredVersionList_Add

Func __Chilkat_Generator_GetRegisteredVersionRecordForConst($sChilkatObjVersionConst)
	Local $aResult[6] = ['', '', '', '', '', ''] ; version const, registered version, Global ProgID, Global DLL path, expected version prefix, matches expected
	If $__g_sChilkat_Generator_RegisteredVersionList = '' Then Return $aResult

	Local $aListItem = StringSplit($__g_sChilkat_Generator_RegisteredVersionList, @LF, $STR_NOCOUNT)
	For $i = 0 To UBound($aListItem) - 1
		If $aListItem[$i] = '' Then ContinueLoop
		Local $aItem = StringSplit($aListItem[$i], '|', $STR_NOCOUNT)
		If UBound($aItem) < 2 Then ContinueLoop
		If $aItem[0] = $sChilkatObjVersionConst Then
			$aResult[0] = $aItem[0]
			$aResult[1] = $aItem[1]
			If UBound($aItem) > 2 Then $aResult[2] = $aItem[2]
			If UBound($aItem) > 3 Then $aResult[3] = $aItem[3]
			If UBound($aItem) > 4 Then $aResult[4] = $aItem[4]
			If UBound($aItem) > 5 Then $aResult[5] = $aItem[5]
			Return $aResult
		EndIf
	Next
	Return $aResult
EndFunc   ;==>__Chilkat_Generator_GetRegisteredVersionRecordForConst

Func __Chilkat_Generator_DocDiagnosticObjectList_Add($sObjectProgId, $sChilkatObjVersionConst = Default)
	If Not IsString($sObjectProgId) Or $sObjectProgId = '' Then Return SetError(1, 0, 0)
	If IsKeyword($sChilkatObjVersionConst) Or $sChilkatObjVersionConst = '' Then $sChilkatObjVersionConst = $__g_sChilkat_Generator_CurrentVersionConst

	Local $sClassName = __Chilkat_GetClassNameFromProgId($sObjectProgId)
	If $sClassName = '' Then Return SetError(2, 0, 0)

	Local $sListItem = $sChilkatObjVersionConst & '|' & $sObjectProgId & '|' & $sClassName
	Local $sSearch = @LF & $__g_sChilkat_Generator_DocDiagnosticObjectList & @LF
	If StringInStr($sSearch, @LF & $sListItem & @LF, $STR_NOCASESENSE) > 0 Then Return SetError(0, 0, 0)

	If $__g_sChilkat_Generator_DocDiagnosticObjectList <> '' Then $__g_sChilkat_Generator_DocDiagnosticObjectList &= @LF
	$__g_sChilkat_Generator_DocDiagnosticObjectList &= $sListItem
	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_Generator_DocDiagnosticObjectList_Add

Func __Chilkat_Generator_GetRegisteredVersionForConst($sChilkatObjVersionConst)
	Local $aRecord = __Chilkat_Generator_GetRegisteredVersionRecordForConst($sChilkatObjVersionConst)
	Return $aRecord[1]
EndFunc   ;==>__Chilkat_Generator_GetRegisteredVersionForConst

Func __Chilkat_Generator_ShowRegisteredVersionSummary()
	ConsoleWrite('; Registered Chilkat versions detected through Global.Version:' & @CRLF)
	If $__g_sChilkat_Generator_RegisteredVersionList = '' Then
		ConsoleWrite(';   none' & @CRLF)
		Return SetError(0, 0, 0)
	EndIf

	Local $aListItem = StringSplit($__g_sChilkat_Generator_RegisteredVersionList, @LF, $STR_NOCOUNT)
	For $i = 0 To UBound($aListItem) - 1
		If $aListItem[$i] = '' Then ContinueLoop
		Local $aItem = StringSplit($aListItem[$i], '|', $STR_NOCOUNT)
		If UBound($aItem) < 2 Then ContinueLoop
		ConsoleWrite(';   ' & $aItem[0] & ' - registered version is :  ' & $aItem[1] & @CRLF)
		If UBound($aItem) > 2 And $aItem[2] <> '' Then ConsoleWrite(';      Global ProgID source : ' & $aItem[2] & @CRLF)
		If UBound($aItem) > 3 And $aItem[3] <> '' Then ConsoleWrite(';      Global DLL path     : ' & $aItem[3] & @CRLF)
		If UBound($aItem) > 4 And $aItem[4] <> '' Then ConsoleWrite(';      Expected version prefix : ' & $aItem[4] & @CRLF)
		If UBound($aItem) > 5 And $aItem[5] = '0' Then ConsoleWrite(';      Registration status : MISMATCH - this Global ProgID resolved to a different registered Chilkat version.' & @CRLF)
	Next
	Return SetError(0, 0, UBound($aListItem))
EndFunc   ;==>__Chilkat_Generator_ShowRegisteredVersionSummary

Func __Chilkat_Generator_ShowDocumentationDiagnostics()
	If $__g_sChilkat_Generator_DocDiagnosticObjectList = '' Then Return SetError(0, 0, 0)

	ConsoleWrite(@CRLF & '; =====================================' & @CRLF)
	ConsoleWrite('; Documentation diagnostics for skipped objects:' & @CRLF)
	ConsoleWrite('; Source: https://www.chilkatsoft.com/refdoc/activex.asp' & @CRLF)
	ConsoleWrite(';' & @CRLF)

	Local $aListItem = StringSplit($__g_sChilkat_Generator_DocDiagnosticObjectList, @LF, $STR_NOCOUNT)
	For $i = 0 To UBound($aListItem) - 1
		If $aListItem[$i] = '' Then ContinueLoop
		Local $aItem = StringSplit($aListItem[$i], '|', $STR_NOCOUNT)
		If UBound($aItem) < 3 Then ContinueLoop

		Local $sVersionConst = $aItem[0]
		Local $sObjectProgId = $aItem[1]
		Local $sClassName = $aItem[2]
		Local $aRegisteredVersionRecord = __Chilkat_Generator_GetRegisteredVersionRecordForConst($sVersionConst)
		Local $sRegisteredVersion = $aRegisteredVersionRecord[1]
		Local $aDocInfo = __Chilkat_Generator_GetChilkatDocInfo($sClassName)

		ConsoleWrite(';   ' & $sVersionConst & ' : ' & $sObjectProgId & @CRLF)
		If $sRegisteredVersion <> '' Then ConsoleWrite(';     registered version : ' & $sRegisteredVersion & @CRLF)
		If $aRegisteredVersionRecord[2] <> '' Then ConsoleWrite(';     registered version source : ' & $aRegisteredVersionRecord[2] & @CRLF)
		If $aRegisteredVersionRecord[3] <> '' Then ConsoleWrite(';     registered DLL path : ' & $aRegisteredVersionRecord[3] & @CRLF)
		If $aRegisteredVersionRecord[4] <> '' Then ConsoleWrite(';     expected version prefix : ' & $aRegisteredVersionRecord[4] & @CRLF)
		Local $bRegisteredVersionMatchesExpected = True
		If $aRegisteredVersionRecord[5] = '0' Then $bRegisteredVersionMatchesExpected = False
		If Not $bRegisteredVersionMatchesExpected Then ConsoleWrite(';     registration status : MISMATCH - documentation comparison is skipped for this object.' & @CRLF)
		ConsoleWrite(';     documentation URL  : ' & $aDocInfo[0] & @CRLF)
		If $aDocInfo[1] <> '' Then ConsoleWrite(';     minimum documented version : ' & $aDocInfo[1] & @CRLF)
		If $aDocInfo[2] <> '' Then ConsoleWrite(';     note : ' & $aDocInfo[2] & @CRLF)
		If Not $bRegisteredVersionMatchesExpected Then
			ConsoleWrite(';     conclusion : COM registration mismatch. Fix registration before comparing installed version with documented minimum version.' & @CRLF)
		ElseIf $sRegisteredVersion <> '' And $aDocInfo[1] <> '' Then
			Local $iCompare = __Chilkat_Generator_VersionCompare($sRegisteredVersion, $aDocInfo[1])
			If $iCompare < 0 Then
				ConsoleWrite(';     conclusion : registered version is older than the documented minimum version.' & @CRLF)
			Else
				ConsoleWrite(';     conclusion : registered version is not older than the documented minimum version.' & @CRLF)
			EndIf
		ElseIf $aDocInfo[1] = '' Then
			ConsoleWrite(';     conclusion : no "Introduced in version" value found on the documentation page.' & @CRLF)
		EndIf
		ConsoleWrite(';' & @CRLF)
	Next
	Return SetError(0, 0, UBound($aListItem))
EndFunc   ;==>__Chilkat_Generator_ShowDocumentationDiagnostics

Func __Chilkat_Generator_GetChilkatDocInfo($sClassName)
	Local $aResult[3] = ['', '', ''] ; URL, minimum introduced version, note
	Local $aUrlList = __Chilkat_Generator_GetChilkatDocUrlCandidates($sClassName)

	For $i = 0 To UBound($aUrlList) - 1
		Local $sUrl = $aUrlList[$i]
		Local $sHtml = __Chilkat_Generator_InetReadText($sUrl)
		If @error Or $sHtml = '' Then ContinueLoop
		If StringInStr($sHtml, 'Reference Documentation', $STR_NOCASESENSE) = 0 Then ContinueLoop
		If StringInStr($sHtml, $sClassName, $STR_NOCASESENSE) = 0 Then ContinueLoop

		$aResult[0] = $sUrl
		$aResult[1] = __Chilkat_Generator_GetMinimumIntroducedVersion($sHtml)
		If StringInStr($sHtml, 'deprecated', $STR_NOCASESENSE) > 0 Then
			$aResult[2] = 'This class or at least part of its API is marked as deprecated in current Chilkat documentation.'
		EndIf
		Return SetError(0, 0, $aResult)
	Next

	$aResult[0] = 'not found in checked URL candidates'
	$aResult[2] = 'Documentation page was not found or could not be downloaded.'
	Return SetError(1, 0, $aResult)
EndFunc   ;==>__Chilkat_Generator_GetChilkatDocInfo

Func __Chilkat_Generator_GetChilkatDocUrlCandidates($sClassName)
	Local $aUrlList[0]
	Switch $sClassName
		Case 'Csp'
			__Chilkat_Generator_ArrayAdd($aUrlList, 'https://www.chilkatsoft.com/refdoc/xChilkatCSPRef.html')
		Case 'CreateCS'
			__Chilkat_Generator_ArrayAdd($aUrlList, 'https://www.chilkatsoft.com/refdoc/xChilkatCreateCSRef.html')
	EndSwitch
	__Chilkat_Generator_ArrayAdd($aUrlList, 'https://www.chilkatsoft.com/refdoc/x' & $sClassName & 'Ref.html')
	__Chilkat_Generator_ArrayAdd($aUrlList, 'https://www.chilkatsoft.com/refdoc/xChilkat' & $sClassName & 'Ref.html')
	Return $aUrlList
EndFunc   ;==>__Chilkat_Generator_GetChilkatDocUrlCandidates

Func __Chilkat_Generator_ArrayAdd(ByRef $aArray, $sValue)
	If Not IsArray($aArray) Then Return SetError(1, 0, 0)
	If Not IsString($sValue) Or $sValue = '' Then Return SetError(2, 0, 0)
	For $i = 0 To UBound($aArray) - 1
		If $aArray[$i] = $sValue Then Return SetError(0, 0, 0)
	Next
	ReDim $aArray[UBound($aArray) + 1]
	$aArray[UBound($aArray) - 1] = $sValue
	Return SetError(0, 0, 1)
EndFunc   ;==>__Chilkat_Generator_ArrayAdd

Func __Chilkat_Generator_InetReadText($sUrl)
	Local $vData = InetRead($sUrl, 1)
	If @error Then Return SetError(@error, @extended, '')
	Return SetError(0, 0, BinaryToString($vData, 4))
EndFunc   ;==>__Chilkat_Generator_InetReadText

Func __Chilkat_Generator_GetMinimumIntroducedVersion($sHtml)
	Local $aVersionList = StringRegExp($sHtml, '(?i)Introduced\s+in\s+version\s+([0-9]+\.[0-9]+\.[0-9]+(?:\.[0-9]+)?)', 3)
	If @error Or Not IsArray($aVersionList) Then Return ''

	Local $sMinimumVersion = ''
	For $i = 0 To UBound($aVersionList) - 1
		If $sMinimumVersion = '' Or __Chilkat_Generator_VersionCompare($aVersionList[$i], $sMinimumVersion) < 0 Then $sMinimumVersion = $aVersionList[$i]
	Next
	Return $sMinimumVersion
EndFunc   ;==>__Chilkat_Generator_GetMinimumIntroducedVersion

Func __Chilkat_Generator_VersionCompare($sVersionA, $sVersionB)
	Local $aVersionA = StringSplit($sVersionA, '.', $STR_NOCOUNT)
	Local $aVersionB = StringSplit($sVersionB, '.', $STR_NOCOUNT)
	Local $iMax = UBound($aVersionA)
	If UBound($aVersionB) > $iMax Then $iMax = UBound($aVersionB)

	For $i = 0 To $iMax - 1
		Local $iPartA = 0
		Local $iPartB = 0
		If $i < UBound($aVersionA) Then $iPartA = Number($aVersionA[$i])
		If $i < UBound($aVersionB) Then $iPartB = Number($aVersionB[$i])
		If $iPartA < $iPartB Then Return -1
		If $iPartA > $iPartB Then Return 1
	Next
	Return 0
EndFunc   ;==>__Chilkat_Generator_VersionCompare

Func __Chilkat_Generator_ErrorList_Add($sOperation, $sTarget, $iError, $iExtended, $sComment = '')
	$__g_iChilkat_Generator_ErrorCount += 1
	$__g_sChilkat_Generator_ErrorList &= _
			$__g_iChilkat_Generator_ErrorCount & '. ' & _
			$__g_sChilkat_Generator_CurrentVersionConst & ' : ' & _
			$sOperation & ' | ' & _
			'target="' & $sTarget & '" | ' & _
			'@error=' & $iError

	Local $sHResultDescription = __Chilkat_Generator_HResultToText($iError)
	If $sHResultDescription <> '' Then $__g_sChilkat_Generator_ErrorList &= ' | ' & $sHResultDescription

	$__g_sChilkat_Generator_ErrorList &= ' | @extended=' & $iExtended
	If $sComment <> '' Then $__g_sChilkat_Generator_ErrorList &= ' | ' & $sComment
	$__g_sChilkat_Generator_ErrorList &= @CRLF
EndFunc   ;==>__Chilkat_Generator_ErrorList_Add

Func __Chilkat_Generator_HResultToText($iHResult)
	If Not IsInt($iHResult) Then Return ''
	If $iHResult >= 0 Then Return ''

	Local $sHResultHex = 'HRESULT=0x' & Hex($iHResult, 8)
	Switch $iHResult
		Case -2147221005 ; 0x800401F3
			Return $sHResultHex & ' | CO_E_CLASSSTRING - Invalid class string'
		Case -2147221164 ; 0x80040154
			Return $sHResultHex & ' | REGDB_E_CLASSNOTREG - Class not registered'
		Case -2147221021 ; 0x800401E3
			Return $sHResultHex & ' | MK_E_UNAVAILABLE - Operation unavailable'
		Case -2147221231 ; 0x80040111
			Return $sHResultHex & ' | CLASS_E_CLASSNOTAVAILABLE - ClassFactory cannot supply requested class'
		Case -2147221230 ; 0x80040112
			Return $sHResultHex & ' | CLASS_E_NOTLICENSED - Class is not licensed for use'
		Case Else
			Return $sHResultHex
	EndSwitch
EndFunc   ;==>__Chilkat_Generator_HResultToText

Func __Chilkat_Generator_ShowRegistrationDiagnosticSuggestions()
	ConsoleWrite('; =====================================' & @CRLF)
	If $__g_sChilkat_Generator_RegisteredDllPathList = '' Then
		ConsoleWrite('; Registration diagnostic suggestion:' & @CRLF)
		ConsoleWrite(';   No registered Chilkat ActiveX DLL path was detected by ObjName($oObj,4).' & @CRLF)
		ConsoleWrite(';   If an incorrect 32-bit Chilkat ActiveX DLL is registered, unregister it with:' & @CRLF)
		ConsoleWrite(';   c:\windows\syswow64\regsvr32.exe /u "<full-path-to-ChilkatAx-win32.dll>"' & @CRLF)
		ConsoleWrite(';   Then register the intended DLL with:' & @CRLF)
		ConsoleWrite(';   c:\windows\syswow64\regsvr32.exe "<full-path-to-ChilkatAx-win32.dll>"' & @CRLF)
		Return SetError(0, 0, 0)
	EndIf

	ConsoleWrite('; Registration diagnostic suggestions for detected 32-bit Chilkat ActiveX DLL paths:' & @CRLF)
	ConsoleWrite(';' & @CRLF)
	Local $aListItem = StringSplit($__g_sChilkat_Generator_RegisteredDllPathList, @LF, $STR_NOCOUNT)
	Local $sPreviousVersionConst = ''
	For $i = 0 To UBound($aListItem) - 1
		If $aListItem[$i] = '' Then ContinueLoop
		Local $aItem = StringSplit($aListItem[$i], '|', $STR_NOCOUNT)
		If UBound($aItem) < 2 Then ContinueLoop

		Local $sVersionConst = $aItem[0]
		Local $sFilePath = $aItem[1]
		If $sVersionConst <> $sPreviousVersionConst Then
			If $sPreviousVersionConst <> '' Then ConsoleWrite(';' & @CRLF)
			ConsoleWrite(';   ' & $sVersionConst & @CRLF)
			$sPreviousVersionConst = $sVersionConst
		EndIf

		ConsoleWrite(';   Detected DLL path:' & @CRLF)
		ConsoleWrite(';   ' & $sFilePath & @CRLF)
		ConsoleWrite(';   If this 32-bit Chilkat ActiveX DLL is incorrect, unregister it with:' & @CRLF)
		ConsoleWrite(';   c:\windows\syswow64\regsvr32.exe /u "' & $sFilePath & '"' & @CRLF)
		ConsoleWrite(';   Then register the intended DLL with:' & @CRLF)
		ConsoleWrite(';   c:\windows\syswow64\regsvr32.exe "' & $sFilePath & '"' & @CRLF)
	Next
	Return SetError(0, 0, UBound($aListItem))
EndFunc   ;==>__Chilkat_Generator_ShowRegistrationDiagnosticSuggestions

Func _Chilkat_Generator_ShowSummary()
	ConsoleWrite(@CRLF & '; ===== Chilkat generator summary =====' & @CRLF)
	ConsoleWrite('; Processed manifest files: ' & $__g_iChilkat_Generator_ManifestCount & @CRLF)
	ConsoleWrite('; Successfully emitted objects: ' & $__g_iChilkat_Generator_SuccessCount & @CRLF)
	ConsoleWrite('; Errors / skipped objects: ' & $__g_iChilkat_Generator_ErrorCount & @CRLF)
	If $__g_iChilkat_Generator_ErrorCount > 0 Then
		ConsoleWrite('; Error list:' & @CRLF)
		ConsoleWrite($__g_sChilkat_Generator_ErrorList)
	Else
		ConsoleWrite('; Error list: none' & @CRLF)
	EndIf
	ConsoleWrite(@CRLF)
	__Chilkat_Generator_ShowRegisteredVersionSummary()
	__Chilkat_Generator_ShowGlobalRegistrationMismatchSummary()
	__Chilkat_Generator_ShowDocumentationDiagnostics()
	ConsoleWrite('; Required: AU3Check validation and runtime validation.' & @CRLF & @CRLF)
	__Chilkat_Generator_ShowRegistrationDiagnosticSuggestions()
	ConsoleWrite('; =====================================' & @CRLF & @CRLF)
EndFunc   ;==>_Chilkat_Generator_ShowSummary

Func __Chilkat_GetFallbackObjectList()
	; Unified fallback list for all supported Chilkat versions.
	; The manifest remains the preferred source of truth. This list is only a
	; diagnostic/test fallback used when a manifest path is not provided.
	; Ordering rule: Global first, then object names alphabetically.
	Return _
			'Global=GLOBAL|' & _
			'Ai=AI|Asn=ASN|Atom=ATOM|AuthAws=AUTHAWS|AuthAzureSAS=AUTHAZURESAS|' & _
			'AuthAzureStorage=AUTHAZURESTORAGE|AuthGoogle=AUTHGOOGLE|BinData=BINDATA|Bounce=BOUNCE|' & _
			'Bz2=BZ2|Cache=CACHE|Cert=CERT|CertChain=CERTCHAIN|CertStore=CERTSTORE|' & _
			'Cgi=CGI|Charset=CHARSET|CkDateTime=CKDATETIME|CkString=CKSTRING|CodeSign=CODESIGN|' & _
			'Compression=COMPRESSION|Crypt2=CRYPT2|Csp=CSP|Csr=CSR|Csv=CSV|' & _
			'Dh=DH|DirTree=DIRTREE|Dkim=DKIM|Dns=DNS|Dsa=DSA|DtObj=DTOBJ|' & _
			'Ecc=ECC|EdDSA=EDDSA|Email=EMAIL|EmailBundle=EMAILBUNDLE|FileAccess=FILEACCESS|' & _
			'Ftp2=FTP2|Gzip=GZIP|Hashtable=HASHTABLE|HtmlToText=HTMLTOTEXT|HtmlToXml=HTMLTOXML|' & _
			'Http=HTTP|HttpCurl=HTTPCURL|HttpRequest=HTTPREQUEST|HttpResponse=HTTPRESPONSE|' & _
			'Imap=IMAP|JavaKeyStore=JAVAKEYSTORE|Js=JS|JsonArray=JSONARRAY|JsonObject=JSONOBJECT|' & _
			'Jwe=JWE|Jws=JWS|Jwt=JWT|Log=LOG|Mailboxes=MAILBOXES|MailMan=MAILMAN|' & _
			'MessageSet=MESSAGESET|Mht=MHT|Mime=MIME|Ntlm=NTLM|OAuth1=OAUTH1|OAuth2=OAUTH2|' & _
			'Pdf=PDF|Pem=PEM|Pfx=PFX|Pkcs11=PKCS11|PrivateKey=PRIVATEKEY|Prng=PRNG|' & _
			'PublicKey=PUBLICKEY|Rest=REST|Rsa=RSA|Rss=RSS|SCard=SCARD|ScMinidriver=SCMINIDRIVER|' & _
			'Scp=SCP|Secrets=SECRETS|SecureString=SECURESTRING|ServerSentEvent=SERVERSENTEVENT|' & _
			'SFtp=SFTP|SFtpDir=SFTPDIR|SFtpFile=SFTPFILE|Socket=SOCKET|Spider=SPIDER|' & _
			'Ssh=SSH|SshKey=SSHKEY|SshTunnel=SSHTUNEL|Stream=STREAM|StringArray=STRINGARRAY|' & _
			'StringBuilder=STRINGBUILDER|StringTable=STRINGTABLE|Tar=TAR|Task=TASK|TaskChain=TASKCHAIN|' & _
			'TrustedRoots=TRUSTEDROOTS|UnixCompress=UNIXCOMPRESS|Upload=UPLOAD|Url=URL|' & _
			'WebSocket=WEBSOCKET|Xml=XML|XmlCertVault=XMLCERTVAULT|XmlDSig=XMLDSIG|' & _
			'XmlDSigGen=XMLDSIGGEN|Xmp=XMP|Zip=ZIP|ZipCrc=ZIPCRC|ZipEntry=ZIPENTRY'
EndFunc   ;==>__Chilkat_GetFallbackObjectList

; User's COM error function. Will be called if COM error occurs
Func _ErrFunc($oError)
	#forceref $oError
	; Do nothing here.
EndFunc   ;==>_ErrFunc
