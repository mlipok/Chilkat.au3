#include-once

#Region - Chilkat_TransferNetworking.au3 - Header
; Title .........: Chilkat_TransferNetworking.au3
; Language ......: English
; Description ...: Data transfer, remote access, HTTP, REST and network protocol support.
; Author ........: mLipok
; Modified ......: AI / mLipok
; Date ..........: 2026/07/14
; Version .......: v0.3.0 BETA - Work in progress
; Remarks .......: This module is linked and loaded by Chilkat.au3.
; Categories ....: CURL; FTP; HTTP; HTTP Misc; REST; REST Misc; SCP; SFTP; SSH; SSH Key; SSH Tunnel; Socket/SSL/TLS; Spider; Stream; Upload; WebSocket
#EndRegion - Chilkat_TransferNetworking.au3 - Header

#Region - Chilkat_TransferNetworking.au3 - Constants
Global Const $CHILKAT_FTP2_LIST_COL_INDEX = 0
Global Const $CHILKAT_FTP2_LIST_COL_NAME = 1
Global Const $CHILKAT_FTP2_LIST_COL_ISDIR = 2
Global Const $CHILKAT_FTP2_LIST_COL_SIZE = 3
Global Const $CHILKAT_FTP2_LIST_COL_MODIFIED = 4
Global Const $CHILKAT_FTP2_LIST_COL_CREATED = 5
Global Const $CHILKAT_FTP2_LIST_COL_OWNER = 6
Global Const $CHILKAT_FTP2_LIST_COL_GROUP = 7
Global Const $CHILKAT_FTP2_LIST_COL_PATH = 8
Global Const $CHILKAT_FTP2_LIST_COL_RELPATH = 9
Global Const $CHILKAT_FTP2_LIST_COL_TYPE = 10
Global Const $CHILKAT_FTP2_LIST_COL_ISLINK = 11
Global Const $CHILKAT_FTP2_LIST_COL_LEVEL = 12
Global Const $CHILKAT_FTP2_LIST_COL_COUNT = 13

Global Const $CHILKAT_FTP2_LIST_RETURN_FILES = 1
Global Const $CHILKAT_FTP2_LIST_RETURN_DIRS = 2
Global Const $CHILKAT_FTP2_LIST_RETURN_FILESFOLDERS = 3
Global Const $CHILKAT_FTP2_LIST_RETURN_LINKS = 4
Global Const $CHILKAT_FTP2_LIST_RETURN_ALL = 7

Global Const $CHILKAT_FTP2_LIST_RECUR_NORECUR = 0
Global Const $CHILKAT_FTP2_LIST_RECUR_RECUR = 1

Global Const $CHILKAT_FTP2_LIST_SORT_NOSORT = 0
Global Const $CHILKAT_FTP2_LIST_SORT_ASC = 1
Global Const $CHILKAT_FTP2_LIST_SORT_DESC = 2

Global Const $CHILKAT_FTP2_LIST_RELPATH = 0
Global Const $CHILKAT_FTP2_LIST_FULLPATH = 1

Global Const $CHILKAT_FTP2_ITEM_TYPE_FILE = 'FILE'
Global Const $CHILKAT_FTP2_ITEM_TYPE_DIR = 'DIR'
Global Const $CHILKAT_FTP2_ITEM_TYPE_LINK = 'LINK'
#EndRegion - Chilkat_TransferNetworking.au3 - Constants

#Region - Chilkat_TransferNetworking.au3 - Object Functions
#Region ; _Chilkat_SSHTunel_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SSHTunel_ObjCreate
; Description ...: Creates a Chilkat SshTunnel COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SSHTunel_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SshTunnel object was introduced in version 9.5.0.50.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSshTunnelRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SSHTunel_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSHTUNEL)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SSHTunel_ObjCreate

#EndRegion ; _Chilkat_SSHTunel_**

#Region ; _Chilkat_SFTP_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SFTP_ObjCreate
; Description ...: Creates a Chilkat SFtp COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SFTP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SFtp object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSFtpRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SFTP_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTP_ObjCreate

#EndRegion ; _Chilkat_SFTP_**

#Region ; _Chilkat_SFTPDIR_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SFTPDIR_ObjCreate
; Description ...: Creates a Chilkat SFtpDir COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SFTPDIR_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SFtpDir object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSFtpDirRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SFTPDIR_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPDIRRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTPDIR)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTPDIR_ObjCreate

#EndRegion ; _Chilkat_SFTPDIR_**

#Region ; _Chilkat_SFTPFILE_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SFTPFILE_ObjCreate
; Description ...: Creates a Chilkat SFtpFile COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SFTPFILE_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SFtpFile object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSFtpFileRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SFTPFILE_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSFTPFILERef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SFTPFILE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SFTPFILE_ObjCreate

#EndRegion ; _Chilkat_SFTPFILE_**

#Region ; _Chilkat_FTP2_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ObjCreate
; Description ...: Creates a Chilkat Ftp2 COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_FTP2_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ftp2 object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatFTP2Ref.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_FTP2)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_FTP2_ObjCreate

Func __Chilkat_FTP2_ListDirectoryItems_AddCurrent(ByRef $oFTP, $iIndex, $sBaseDir, $sRelDir, $iReturn, $iReturnPath, ByRef $aList, ByRef $iRows, $iLevel)
	Local $sName = $oFTP.GetFilename($iIndex)
	If $sName = '.' Or $sName = '..' Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	Local $bIsDir = $oFTP.GetIsDirectory($iIndex)
	Local $bIsLink = $oFTP.GetIsSymbolicLink($iIndex)
	Local $sType = $CHILKAT_FTP2_ITEM_TYPE_FILE
	If $bIsLink Then
		$sType = $CHILKAT_FTP2_ITEM_TYPE_LINK
	ElseIf $bIsDir Then
		$sType = $CHILKAT_FTP2_ITEM_TYPE_DIR
	EndIf

	If Not __Chilkat_FTP2_ListDirectoryItems_ShouldReturn($sType, $iReturn) Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	Local $sRelPath = __Chilkat_FTP2_RemotePathJoin($sRelDir, $sName)
	Local $sFullPath = __Chilkat_FTP2_RemotePathJoin($sBaseDir, $sRelPath)
	Local $sPath = $sRelPath
	If $iReturnPath = $CHILKAT_FTP2_LIST_FULLPATH Then $sPath = $sFullPath

	ReDim $aList[$iRows + 1][$CHILKAT_FTP2_LIST_COL_COUNT]
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_INDEX] = $iRows
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_NAME] = $sName
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_ISDIR] = $bIsDir
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_SIZE] = $oFTP.GetSizeStr($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_MODIFIED] = $oFTP.GetLastModifiedTimeStr($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_CREATED] = $oFTP.GetCreateTimeStr($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_OWNER] = $oFTP.GetOwner($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_GROUP] = $oFTP.GetGroup($iIndex)
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_PATH] = $sPath
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_RELPATH] = $sRelPath
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_TYPE] = $sType
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_ISLINK] = $bIsLink
	$aList[$iRows][$CHILKAT_FTP2_LIST_COL_LEVEL] = $iLevel
	$iRows += 1

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_AddCurrent

Func __Chilkat_FTP2_ListDirectoryItems_Collect(ByRef $oFTP, $sBaseDir, $sRelDir, $sMask, $iReturn, $iRecur, $iReturnPath, $bClearCachedDir, ByRef $aList, ByRef $iRows, $iLevel)
	Local $sRemoteDir = __Chilkat_FTP2_RemotePathJoin($sBaseDir, $sRelDir)
	If $oFTP.ChangeRemoteDir($sRemoteDir) = 0 Then
		__Chilkat_LogOnError('__Chilkat_FTP2_ListDirectoryItems_Collect() Ftp2.ChangeRemoteDir()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	$oFTP.ListPattern = $sMask
	If $bClearCachedDir Then $oFTP.ClearDirCache()

	Local $iCount = $oFTP.GetDirCount()
	If $iCount < 0 Then
		__Chilkat_LogOnError('__Chilkat_FTP2_ListDirectoryItems_Collect() Ftp2.GetDirCount()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	For $i = 0 To $iCount - 1
		__Chilkat_FTP2_ListDirectoryItems_AddCurrent($oFTP, $i, $sBaseDir, $sRelDir, $iReturn, $iReturnPath, $aList, $iRows, $iLevel)
	Next

	If $iRecur = $CHILKAT_FTP2_LIST_RECUR_RECUR Then
		$oFTP.ListPattern = '*'
		If $bClearCachedDir Then $oFTP.ClearDirCache()
		Local $iDirCount = $oFTP.GetDirCount()
		If $iDirCount < 0 Then
			__Chilkat_LogOnError('__Chilkat_FTP2_ListDirectoryItems_Collect() Ftp2.GetDirCount() for recursion', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
		EndIf

		Local $aDirs[0]
		Local $iDirs = 0
		For $i = 0 To $iDirCount - 1
			Local $sName = $oFTP.GetFilename($i)
			If $sName = '.' Or $sName = '..' Then ContinueLoop
			If $oFTP.GetIsDirectory($i) And Not $oFTP.GetIsSymbolicLink($i) Then
				ReDim $aDirs[$iDirs + 1]
				$aDirs[$iDirs] = __Chilkat_FTP2_RemotePathJoin($sRelDir, $sName)
				$iDirs += 1
			EndIf
		Next

		For $i = 0 To $iDirs - 1
			__Chilkat_FTP2_ListDirectoryItems_Collect($oFTP, $sBaseDir, $aDirs[$i], $sMask, $iReturn, $iRecur, $iReturnPath, $bClearCachedDir, $aList, $iRows, $iLevel + 1)
			If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		Next
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_Collect

Func __Chilkat_FTP2_ListDirectoryItems_ShouldReturn($sType, $iReturn)
	Switch $sType
		Case $CHILKAT_FTP2_ITEM_TYPE_FILE
			Return BitAND($iReturn, $CHILKAT_FTP2_LIST_RETURN_FILES) <> 0
		Case $CHILKAT_FTP2_ITEM_TYPE_DIR
			Return BitAND($iReturn, $CHILKAT_FTP2_LIST_RETURN_DIRS) <> 0
		Case $CHILKAT_FTP2_ITEM_TYPE_LINK
			Return BitAND($iReturn, $CHILKAT_FTP2_LIST_RETURN_LINKS) <> 0
	EndSwitch
	Return False
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_ShouldReturn

Func __Chilkat_FTP2_ListDirectoryItems_Sort(ByRef $aList, $iSort)
	Local $iRows = UBound($aList, 1)
	Local $iCols = UBound($aList, 2)
	If $iRows < 2 Then Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)

	For $i = 1 To $iRows - 1
		For $j = $i To 1 Step -1
			Local $bSwap = False
			If $iSort = $CHILKAT_FTP2_LIST_SORT_ASC Then
				$bSwap = StringCompare($aList[$j - 1][$CHILKAT_FTP2_LIST_COL_PATH], $aList[$j][$CHILKAT_FTP2_LIST_COL_PATH]) > 0
			ElseIf $iSort = $CHILKAT_FTP2_LIST_SORT_DESC Then
				$bSwap = StringCompare($aList[$j - 1][$CHILKAT_FTP2_LIST_COL_PATH], $aList[$j][$CHILKAT_FTP2_LIST_COL_PATH]) < 0
			EndIf
			If Not $bSwap Then ExitLoop
			For $c = 0 To $iCols - 1
				Local $vTmp = $aList[$j - 1][$c]
				$aList[$j - 1][$c] = $aList[$j][$c]
				$aList[$j][$c] = $vTmp
			Next
		Next
	Next

	For $i = 0 To $iRows - 1
		$aList[$i][$CHILKAT_FTP2_LIST_COL_INDEX] = $i
	Next
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>__Chilkat_FTP2_ListDirectoryItems_Sort

Func __Chilkat_FTP2_RemotePathJoin($sLeft, $sRight)
	If $sLeft = Default Then $sLeft = ''
	If $sRight = Default Then $sRight = ''
	If $sLeft = '' Then Return $sRight
	If $sRight = '' Then Return $sLeft
	While StringRight($sLeft, 1) = '/' And StringLen($sLeft) > 1
		$sLeft = StringTrimRight($sLeft, 1)
	WEnd
	While StringLeft($sRight, 1) = '/'
		$sRight = StringTrimLeft($sRight, 1)
	WEnd
	If $sLeft = '/' Then Return '/' & $sRight
	Return $sLeft & '/' & $sRight
EndFunc   ;==>__Chilkat_FTP2_RemotePathJoin

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_AppendFileBinary
; Description ...: Appends an AutoIt binary Variant to a remote FTP/FTPS file without using a local input file.
; Syntax ........: _Chilkat_FTP2_AppendFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $dBinaryData           - [in/out] bytes to append.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.AppendFileFromBinaryData() for v10-compatible append-from-memory behavior.
; Related .......: _Chilkat_FTP2_UploadFileBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_AppendFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.AppendFileFromBinaryData($sRemoteFilePath, $dBinaryData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_AppendFileBinary() Ftp2.AppendFileFromBinaryData()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_AppendFileBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ChangeRemoteDir
; Description ...: Changes the current FTP/FTPS remote directory.
; Syntax ........: _Chilkat_FTP2_ChangeRemoteDir(ByRef $oFTP, $sRemoteDir)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteDir            - [in] remote directory.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.ChangeRemoteDir().
; Related .......: _Chilkat_FTP2_Connect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ChangeRemoteDir(ByRef $oFTP, $sRemoteDir)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.ChangeRemoteDir($sRemoteDir)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_ChangeRemoteDir() Ftp2.ChangeRemoteDir()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_ChangeRemoteDir

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_Connect
; Description ...: Creates a Chilkat Ftp2 object, sets common connection options and connects/logs in.
; Syntax ........: _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword, $iPort = 21, $bAuthTls = 0, $bSsl = 0, $bPassive = 1, $iConnectTimeout = Default)
; Parameters ....: $sHostName             - [in] FTP/FTPS host.
;                  $sUsername             - [in] user name.
;                  $sPassword             - [in] password.
;                  $iPort                 - [in] port. Default is 21.
;                  $bAuthTls              - [in] explicit FTPS/TLS. Default is 0.
;                  $bSsl                  - [in] implicit SSL/TLS. Default is 0.
;                  $bPassive              - [in] passive mode. Default is 1.
;                  $iConnectTimeout       - [in] optional timeout in seconds.
; Return values .: Success: connected Chilkat Ftp2 object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.Connect().
; Related .......: _Chilkat_FTP2_UploadFile, _Chilkat_FTP2_DownloadFile, _Chilkat_FTP2_Disconnect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_Connect($sHostName, $sUsername, $sPassword, $iPort = 21, $bAuthTls = 0, $bSsl = 0, $bPassive = 1, $iConnectTimeout = Default)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sHostName) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sUsername) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sPassword) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $oFTP = _Chilkat_FTP2_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	$oFTP.Hostname = $sHostName
	$oFTP.Username = $sUsername
	$oFTP.Password = $sPassword
	$oFTP.Port = $iPort
	$oFTP.Passive = $bPassive ? 1 : 0
	$oFTP.AuthTls = $bAuthTls ? 1 : 0
	$oFTP.Ssl = $bSsl ? 1 : 0
	If $iConnectTimeout <> Default Then $oFTP.ConnectTimeout = $iConnectTimeout

	Local $iSuccess = $oFTP.Connect()
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_Connect() Ftp2.Connect()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $oFTP.ConnectFailReason, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oFTP)
EndFunc   ;==>_Chilkat_FTP2_Connect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_Disconnect
; Description ...: Disconnects a connected Chilkat Ftp2 object.
; Syntax ........: _Chilkat_FTP2_Disconnect(ByRef $oFTP)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Calls Ftp2.Disconnect().
; Related .......: _Chilkat_FTP2_Connect
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_Disconnect(ByRef $oFTP)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	$oFTP.Disconnect()
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_Disconnect

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadFile
; Description ...: Downloads a remote file from the connected FTP/FTPS server.
; Syntax ........: _Chilkat_FTP2_DownloadFile(ByRef $oFTP, $sRemoteFilePath, $sLocalFileFullPath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteFilePath       - [in] remote path/name.
;                  $sLocalFileFullPath    - [in] local output path.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.GetFile().
; Related .......: _Chilkat_FTP2_Connect, _Chilkat_FTP2_UploadFile
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadFile(ByRef $oFTP, $sRemoteFilePath, $sLocalFileFullPath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sLocalFileFullPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.GetFile($sRemoteFilePath, $sLocalFileFullPath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_DownloadFile() Ftp2.GetFile()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_DownloadFile

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadFileBd
; Description ...: Downloads a remote FTP/FTPS file directly into a Chilkat BinData object.
; Syntax ........: _Chilkat_FTP2_DownloadFileBd(ByRef $oFTP, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: Chilkat BinData object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.GetFileBd(), no local output file.
; Related .......: _Chilkat_FTP2_DownloadFileBinary, _Chilkat_FTP2_UploadFileBd
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadFileBd(ByRef $oFTP, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.GetFileBd($sRemoteFilePath, $oBinData)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_DownloadFileBd() Ftp2.GetFileBd()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $oBinData)
EndFunc   ;==>_Chilkat_FTP2_DownloadFileBd

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadFileBinary
; Description ...: Downloads a remote FTP/FTPS file directly into an AutoIt binary Variant.
; Syntax ........: _Chilkat_FTP2_DownloadFileBinary(ByRef $oFTP, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: binary bytes. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses BinData as the transfer buffer.
; Related .......: _Chilkat_FTP2_DownloadFileBd, _Chilkat_FTP2_UploadFileBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadFileBinary(ByRef $oFTP, $sRemoteFilePath)
	Local $oBinData = _Chilkat_FTP2_DownloadFileBd($oFTP, $sRemoteFilePath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $dBinaryData = _Chilkat_BINDATA_ToBinary($oBinData)
	Return SetError(@error, @extended, $dBinaryData)
EndFunc   ;==>_Chilkat_FTP2_DownloadFileBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_DownloadZipToObject
; Description ...: Downloads a remote ZIP file to memory and opens it as a Chilkat Zip object.
; Syntax ........: _Chilkat_FTP2_DownloadZipToObject(ByRef $oFTP, $sRemoteZipFilePath, $sDecryptPassword = Default)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteZipFilePath    - [in] remote ZIP path/name.
;                  $sDecryptPassword      - [in] optional ZIP password.
; Return values .: Success: Chilkat Zip object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: FTP remote file -> Binary -> ZIP object, without writing the ZIP to disk.
; Related .......: _Chilkat_FTP2_DownloadFileBinary, _Chilkat_ZIP_OpenFromBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_DownloadZipToObject(ByRef $oFTP, $sRemoteZipFilePath, $sDecryptPassword = Default)
	Local $dZipBinaryData = _Chilkat_FTP2_DownloadFileBinary($oFTP, $sRemoteZipFilePath)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $oZIP = _Chilkat_ZIP_OpenFromBinary($dZipBinaryData, $sDecryptPassword)
	Return SetError(@error, @extended, $oZIP)
EndFunc   ;==>_Chilkat_FTP2_DownloadZipToObject

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_List_AsArray
; Description ...: Legacy alias for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Syntax ........: _Chilkat_FTP2_List_AsArray(ByRef $oFTP, $sListPattern = Default, $bClearCachedDir = 1)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sListPattern          - [in] optional wildcard pattern. Default uses '*'.
;                  $bClearCachedDir       - [in] when 1, calls ClearDirCache before reading.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Kept for backward compatibility. New code should use _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_List_AsArray(ByRef $oFTP, $sListPattern = Default, $bClearCachedDir = 1)
	If $sListPattern = Default Then $sListPattern = '*'
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, Default, $sListPattern, $CHILKAT_FTP2_LIST_RETURN_ALL, $CHILKAT_FTP2_LIST_RECUR_NORECUR, $CHILKAT_FTP2_LIST_SORT_NOSORT, $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_List_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryDirs_AsArray
; Description ...: Convenience wrapper returning only remote FTP/FTPS directories.
; Syntax ........: _Chilkat_FTP2_ListDirectoryDirs_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]])
; Parameters ....: See _Chilkat_FTP2_ListDirectoryItems_AsArray.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wrapper for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryDirs_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, $sMask, $CHILKAT_FTP2_LIST_RETURN_DIRS, $iRecur, $iSort, $iReturnPath, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryDirs_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryFiles_AsArray
; Description ...: Convenience wrapper returning only remote FTP/FTPS files.
; Syntax ........: _Chilkat_FTP2_ListDirectoryFiles_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]])
; Parameters ....: See _Chilkat_FTP2_ListDirectoryItems_AsArray.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wrapper for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryFiles_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, $sMask, $CHILKAT_FTP2_LIST_RETURN_FILES, $iRecur, $iSort, $iReturnPath, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryFiles_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Description ...: Returns FTP/FTPS remote directory items as a native AutoIt 2D array.
; Syntax ........: _Chilkat_FTP2_ListDirectoryItems_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL[, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]]]])
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sRemoteDir            - [in] optional remote directory to list. Default means the current remote directory.
;                  $sMask                 - [in] wildcard pattern, for example '*', '*.pdf', '*.xml;*.txt'. See Remarks.
;                  $iReturn               - [in] item type filter: $CHILKAT_FTP2_LIST_RETURN_* constants.
;                  $iRecur                - [in] recursion mode: $CHILKAT_FTP2_LIST_RECUR_* constants.
;                  $iSort                 - [in] sorting mode: $CHILKAT_FTP2_LIST_SORT_* constants. Sorts by $CHILKAT_FTP2_LIST_COL_PATH.
;                  $iReturnPath           - [in] primary path mode for $CHILKAT_FTP2_LIST_COL_PATH: $CHILKAT_FTP2_LIST_RELPATH or $CHILKAT_FTP2_LIST_FULLPATH.
;                  $bClearCachedDir       - [in] when 1, calls ClearDirCache before reading each remote directory.
; Return values .: Success: 2D array [n][$CHILKAT_FTP2_LIST_COL_COUNT]. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: The array contains files, directories and symbolic links. Columns are described by $CHILKAT_FTP2_LIST_COL_* constants.
;                  $sMask maps to Chilkat Ftp2.ListPattern and must contain only a wildcard pattern, for example '*', '*.pdf' or '*.xml;*.txt'.
;                  Do not include a remote directory path in $sMask. Use $sRemoteDir or _Chilkat_FTP2_ChangeRemoteDir() to select the directory first.
;                  Recursion traverses directories found with ListPattern='*', so directories can be traversed even when $sMask filters files.
; Related .......: _Chilkat_FTP2_ListDirectoryFiles_AsArray, _Chilkat_FTP2_ListDirectoryDirs_AsArray, _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryItems_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL, $iRecur = $CHILKAT_FTP2_LIST_RECUR_NORECUR, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If $sRemoteDir <> Default And Not IsString($sRemoteDir) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sMask) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	If Not IsInt($iReturn) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM4, $CHILKAT_RET_FAILURE)
	If Not IsInt($iRecur) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM5, $CHILKAT_RET_FAILURE)
	If Not IsInt($iSort) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM6, $CHILKAT_RET_FAILURE)
	If Not IsInt($iReturnPath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM7, $CHILKAT_RET_FAILURE)

	Local $sOriginalDir = $oFTP.GetCurrentRemoteDir()
	If @error Then
		__Chilkat_LogOnError('_Chilkat_FTP2_ListDirectoryItems_AsArray() Ftp2.GetCurrentRemoteDir()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $sOriginalListPattern = $oFTP.ListPattern
	Local $sBaseDir = $sOriginalDir
	If $sRemoteDir <> Default Then $sBaseDir = $sRemoteDir

	Local $aList[0][$CHILKAT_FTP2_LIST_COL_COUNT]
	Local $iRows = 0
	Local $iCollect = __Chilkat_FTP2_ListDirectoryItems_Collect($oFTP, $sBaseDir, '', $sMask, $iReturn, $iRecur, $iReturnPath, $bClearCachedDir, $aList, $iRows, 0)
	#forceref $iCollect
	Local $iCollectError = @error
	Local $iCollectExtended = @extended

	$oFTP.ListPattern = $sOriginalListPattern
	If IsString($sOriginalDir) And $sOriginalDir <> '' Then $oFTP.ChangeRemoteDir($sOriginalDir)

	If $iCollectError Then Return SetError($iCollectError, $iCollectExtended, $CHILKAT_RET_FAILURE)

	If $iSort <> $CHILKAT_FTP2_LIST_SORT_NOSORT And $iRows > 1 Then __Chilkat_FTP2_ListDirectoryItems_Sort($aList, $iSort)

	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $aList)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryItems_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray
; Description ...: Convenience wrapper returning remote FTP/FTPS directory items recursively.
; Syntax ........: _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray(ByRef $oFTP[, $sRemoteDir = Default[, $sMask = '*'[, $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL[, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT[, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH[, $bClearCachedDir = 1]]]]])
; Parameters ....: See _Chilkat_FTP2_ListDirectoryItems_AsArray.
; Return values .: Success: 2D array. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Wrapper for _Chilkat_FTP2_ListDirectoryItems_AsArray().
; Related .......: _Chilkat_FTP2_ListDirectoryItems_AsArray
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray(ByRef $oFTP, $sRemoteDir = Default, $sMask = '*', $iReturn = $CHILKAT_FTP2_LIST_RETURN_ALL, $iSort = $CHILKAT_FTP2_LIST_SORT_NOSORT, $iReturnPath = $CHILKAT_FTP2_LIST_RELPATH, $bClearCachedDir = 1)
	Return _Chilkat_FTP2_ListDirectoryItems_AsArray($oFTP, $sRemoteDir, $sMask, $iReturn, $CHILKAT_FTP2_LIST_RECUR_RECUR, $iSort, $iReturnPath, $bClearCachedDir)
EndFunc   ;==>_Chilkat_FTP2_ListDirectoryItemsRecursive_AsArray

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadFile
; Description ...: Uploads a local file to the connected FTP/FTPS server.
; Syntax ........: _Chilkat_FTP2_UploadFile(ByRef $oFTP, $sLocalFileFullPath, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $sLocalFileFullPath    - [in] local file path.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.PutFile().
; Related .......: _Chilkat_FTP2_Connect, _Chilkat_FTP2_DownloadFile
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadFile(ByRef $oFTP, $sLocalFileFullPath, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not FileExists($sLocalFileFullPath) Then Return SetError($CHILKAT_ERR_FILENOTEXIST, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.PutFile($sLocalFileFullPath, $sRemoteFilePath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_UploadFile() Ftp2.PutFile()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_UploadFile

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadFileBd
; Description ...: Uploads a Chilkat BinData object to a remote FTP/FTPS file without using a local input file.
; Syntax ........: _Chilkat_FTP2_UploadFileBd(ByRef $oFTP, ByRef $oBinData, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $oBinData              - [in/out] Chilkat BinData object to upload.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses Ftp2.PutFileBd().
; Related .......: _Chilkat_FTP2_UploadFileBinary, _Chilkat_FTP2_DownloadFileBd
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadFileBd(ByRef $oFTP, ByRef $oBinData, $sRemoteFilePath)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsObj($oFTP) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsObj($oBinData) Then Return SetError($CHILKAT_ERR_ISNOTOBJ, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If Not IsString($sRemoteFilePath) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)

	Local $iSuccess = $oFTP.PutFileBd($oBinData, $sRemoteFilePath)
	If $iSuccess = 0 Then
		__Chilkat_LogOnError('_Chilkat_FTP2_UploadFileBd() Ftp2.PutFileBd()', $oFTP, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $CHILKAT_RET_SUCCESS)
EndFunc   ;==>_Chilkat_FTP2_UploadFileBd

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadFileBinary
; Description ...: Uploads an AutoIt binary Variant to a remote FTP/FTPS file without using a local input file.
; Syntax ........: _Chilkat_FTP2_UploadFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $dBinaryData           - [in/out] bytes to upload.
;                  $sRemoteFilePath       - [in] remote path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Binary -> BinData -> FTP remote file.
; Related .......: _Chilkat_FTP2_UploadFileBd, _Chilkat_FTP2_DownloadFileBinary
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadFileBinary(ByRef $oFTP, ByRef $dBinaryData, $sRemoteFilePath)
	Local $oBinData = _Chilkat_BINDATA_FromBinary($dBinaryData)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = _Chilkat_FTP2_UploadFileBd($oFTP, $oBinData, $sRemoteFilePath)
	Return SetError(@error, @extended, $iSuccess)
EndFunc   ;==>_Chilkat_FTP2_UploadFileBinary

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_FTP2_UploadZipObject
; Description ...: Serializes a Chilkat Zip object to memory and uploads it to a remote FTP/FTPS file.
; Syntax ........: _Chilkat_FTP2_UploadZipObject(ByRef $oFTP, ByRef $oZIP, $sRemoteZipFilePath)
; Parameters ....: $oFTP                  - [in/out] connected Chilkat Ftp2 object.
;                  $oZIP                  - [in/out] Chilkat Zip object.
;                  $sRemoteZipFilePath    - [in] remote ZIP path/name.
; Return values .: Success: $CHILKAT_RET_SUCCESS. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: ZIP object -> BinData -> FTP remote file, without writing a local ZIP file.
; Related .......: _Chilkat_ZIP_ObjectToBinData, _Chilkat_FTP2_UploadFileBd
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatFtp2Ref.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_FTP2_UploadZipObject(ByRef $oFTP, ByRef $oZIP, $sRemoteZipFilePath)
	Local $oZipBd = _Chilkat_ZIP_ObjectToBinData($oZIP)
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)

	Local $iSuccess = _Chilkat_FTP2_UploadFileBd($oFTP, $oZipBd, $sRemoteZipFilePath)
	Return SetError(@error, @extended, $iSuccess)
EndFunc   ;==>_Chilkat_FTP2_UploadZipObject

#EndRegion ; _Chilkat_FTP2_**

#Region ; _Chilkat_SCP_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SCP_ObjCreate
; Description ...: Creates a Chilkat Scp COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SCP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Scp object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatScpRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SCP_ObjCreate()
;~ 	https://www.chilkatsoft.com/refdoc/xChilkatSCPRef.html
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SCP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SCP_ObjCreate

#EndRegion ; _Chilkat_SCP_**

#Region ; _Chilkat_HTTP_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HTTP_ObjCreate
; Description ...: Creates a Chilkat Http COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HTTP_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Http object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_HTTP_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTP)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HTTP_ObjCreate

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Http_DownloadFile_Async
; Description ...: Downloads a file asynchronously by using Chilkat Http, BinData and Task objects.
; Syntax ........: _Chilkat_Http_DownloadFile_Async($sURL, $sDestination_FileFullPath, $fnProgressWrapper = __Chilkat_GetAndSaveFileToDisc_Progress)
; Parameters ....: $sURL                  - [in] HTTP URL to download.
;                  $sDestination_FileFullPath - [in] local destination file path.
;                  $fnProgressWrapper     - [in] optional progress callback called with percent done. Default is __Chilkat_GetAndSaveFileToDisc_Progress.
; Return values .: Success: no explicit return. Failure: sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Header generated by #AI
; Related .......: _Chilkat_HTTP_ObjCreate, __Chilkat_LogOnError, _Chilkat_BINDATA_ObjCreate
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Http_DownloadFile_Async($sURL, $sDestination_FileFullPath, $fnProgressWrapper = __Chilkat_GetAndSaveFileToDisc_Progress)
	Local $oErrorHandler = ObjEvent("AutoIt.Error", __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber, $oHttp)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber, $oBinData)

	Local $oTask = $oHttp.DownloadBdAsync($sURL, $oBinData)

	Local $iSuccess = $oTask.Run()
	If @error Or $iSuccess <> 1 Then
		If Not @error Then SetError($CHILKAT_ERR_FAILURE, @extended)
		__Chilkat_LogOnError(@ScriptLineNumber & ' Task.Run ', $oTask)
		Return SetError(@error, @extended, $iSuccess)
	EndIf

	Local $iCurPctDone = 0
	While $oTask.Finished <> 1 And $oTask.StatusInt < 5
		If ($oTask.PercentDone <> $iCurPctDone) Then
			If IsFunc($fnProgressWrapper) Then $fnProgressWrapper($oTask.PercentDone)
		EndIf
		$oTask.SleepMs(10)
	WEnd

	Local $hFileOpen = FileOpen($sDestination_FileFullPath, $FO_BINARY + $FO_OVERWRITE)
	FileWrite($hFileOpen, $oBinData.GetBinary())
	FileClose($hFileOpen)
EndFunc   ;==>_Chilkat_Http_DownloadFile_Async


; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HTTP_UrlEncode
; Description ...: URL-encodes a string by using the selected Chilkat Http object.
; Syntax ........: _Chilkat_HTTP_UrlEncode($sValue)
; Parameters ....: $sValue                - [in] string to encode.
; Return values .: Success: URL-encoded string. Failure: empty string and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Intended for individual path segments and query parameter values.
; Related .......: _Chilkat_HTTP_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_HTTP_UrlEncode($sValue)
	If Not IsString($sValue) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM1, '')
	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	If @error Then Return SetError(@error, @extended, '')
	Local $sEncoded = $oHttp.UrlEncode($sValue)
	If @error Or ($sEncoded = '' And $sValue <> '') Then Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, '')
	Return SetError($CHILKAT_ERR_SUCCESS, $CHILKAT_EXT_DEFAULT, $sEncoded)
EndFunc   ;==>_Chilkat_HTTP_UrlEncode

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HTTP_Request_AsJson
; Description ...: Sends an HTTP request and returns a successful JSON response as a Chilkat JsonObject.
; Syntax ........: _Chilkat_HTTP_Request_AsJson($sMethod, $sUrl, $sAccessToken = Default, $oJsonBody = Default, $sContentType = 'application/json')
; Parameters ....: $sMethod               - [in] HTTP method such as GET, POST, PUT, PATCH or DELETE.
;                  $sUrl                  - [in] complete HTTPS or HTTP URL.
;                  $sAccessToken          - [in] optional OAuth2 bearer access token.
;                  $oJsonBody             - [in] optional JsonObject or JSON string. Default sends no request body.
;                  $sContentType          - [in] request content type. Default is application/json.
; Return values .: Success: Chilkat JsonObject and HTTP status in @extended. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: Uses HttpNoBody/HttpStr on Chilkat 11+ and QuickRequest/PText on older supported Chilkat versions.
;                  An empty successful response is represented by a JsonObject containing _httpStatus.
; Related .......: _Chilkat_HTTP_ObjCreate, _Chilkat_HttpResponse_ObjCreate, _Chilkat_JSON_ObjCreate
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRef.html
; Example .......: Yes
; ===============================================================================================================================
Func _Chilkat_HTTP_Request_AsJson($sMethod, $sUrl, $sAccessToken = Default, $oJsonBody = Default, $sContentType = 'application/json')
	Local $oErrorHandler = ObjEvent('AutoIt.Error', __Internal_COM_ERROR_HANDLER__for_Chilkat)
	#forceref $oErrorHandler

	If Not IsString($sMethod) Or $sMethod = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM1, $CHILKAT_RET_FAILURE)
	If Not IsString($sUrl) Or $sUrl = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM2, $CHILKAT_RET_FAILURE)
	If $sAccessToken <> Default And Not IsString($sAccessToken) Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM3, $CHILKAT_RET_FAILURE)
	If Not IsString($sContentType) Or $sContentType = '' Then Return SetError($CHILKAT_ERR_INVALIDPARAMETERVALUE, $CHILKAT_EXT_PARAM5, $CHILKAT_RET_FAILURE)

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	$oHttp.Accept = 'application/json'
	If $sAccessToken <> Default And $sAccessToken <> '' Then $oHttp.AuthToken = $sAccessToken

	Local $sVerb = StringUpper($sMethod)
	Local $oResponse = 0
	Local $iSuccess = 0
	Local $sBody = ''

	If $oJsonBody <> Default Then
		If IsObj($oJsonBody) Then
			$sBody = $oJsonBody.Emit()
		ElseIf IsString($oJsonBody) Then
			$sBody = $oJsonBody
		Else
			Return SetError($CHILKAT_ERR_INVALIDPARAMETERTYPE, $CHILKAT_EXT_PARAM4, $CHILKAT_RET_FAILURE)
		EndIf
	EndIf

	If _Chilkat_IsAtLeastThisVersion('11.0.0', 'Http.HttpNoBody/Http.HttpStr') Then
		$oResponse = _Chilkat_HttpResponse_ObjCreate()
		If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
		If $oJsonBody = Default Then
			$iSuccess = $oHttp.HttpNoBody($sVerb, $sUrl, $oResponse)
		Else
			$iSuccess = $oHttp.HttpStr($sVerb, $sUrl, $sBody, 'utf-8', $sContentType, $oResponse)
		EndIf
	Else
		If $oJsonBody = Default Then
			$oResponse = $oHttp.QuickRequest($sVerb, $sUrl)
		Else
			$oResponse = $oHttp.PText($sVerb, $sUrl, $sBody, 'utf-8', $sContentType, 0, 0)
		EndIf
		$iSuccess = IsObj($oResponse) ? 1 : 0
	EndIf

	If Not IsObj($oResponse) Then
		__Chilkat_LogOnError('_Chilkat_HTTP_Request_AsJson() no HttpResponse', $oHttp, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $iStatusCode = $oResponse.StatusCode
	Local $sResponseBody = $oResponse.BodyStr
	If $iStatusCode < 200 Or $iStatusCode >= 300 Then
		__Chilkat_Log('_Chilkat_HTTP_Request_AsJson(): HTTP status ' & $iStatusCode & @CRLF & $sResponseBody)
		Return SetError($CHILKAT_ERR_FAILURE, $iStatusCode, $CHILKAT_RET_FAILURE)
	EndIf
	If $iSuccess = 0 And $iStatusCode = 0 Then
		__Chilkat_LogOnError('_Chilkat_HTTP_Request_AsJson()', $oHttp, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
		Return SetError($CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL, $CHILKAT_RET_FAILURE)
	EndIf

	Local $oResult = _Chilkat_JSON_ObjCreate()
	If @error Then Return SetError(@error, @extended, $CHILKAT_RET_FAILURE)
	If $sResponseBody = '' Then
		$oResult.UpdateInt('_httpStatus', $iStatusCode)
	Else
		$iSuccess = $oResult.Load($sResponseBody)
		If $iSuccess = 0 Then
			__Chilkat_LogOnError('_Chilkat_HTTP_Request_AsJson() JsonObject.Load()', $oResult, $CHILKAT_ERR_FAILURE, $CHILKAT_EXT_GENERAL)
			Return SetError($CHILKAT_ERR_FAILURE, $iStatusCode, $CHILKAT_RET_FAILURE)
		EndIf
	EndIf

	Return SetError($CHILKAT_ERR_SUCCESS, $iStatusCode, $oResult)
EndFunc   ;==>_Chilkat_HTTP_Request_AsJson

#EndRegion ; _Chilkat_HTTP_**

#Region ; _Chilkat_HTTPCURL_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HTTPCURL_ObjCreate
; Description ...: Creates a Chilkat HttpCurl COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HTTPCURL_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat HttpCurl object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: AI / mLipok
; Modified ......:
; Remarks .......: HttpCurl metadata is currently defined for the Chilkat 11 API in ChilkatConstants.au3.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HTTPCURL_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTPCURL)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HTTPCURL_ObjCreate

#EndRegion ; _Chilkat_HTTPCURL_**

#Region ; _Chilkat_HttpRequest_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HttpRequest_ObjCreate
; Description ...: Creates a Chilkat HttpRequest COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HttpRequest_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat HttpRequest object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpRequestRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HttpRequest_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTPREQUEST)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HttpRequest_ObjCreate

#EndRegion ; _Chilkat_HttpRequest_**

#Region ; _Chilkat_HttpResponse_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_HttpResponse_ObjCreate
; Description ...: Creates a Chilkat HttpResponse COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_HttpResponse_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat HttpResponse object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatHttpResponseRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_HttpResponse_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_HTTPRESPONSE)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_HttpResponse_ObjCreate

#EndRegion ; _Chilkat_HttpResponse_**

#Region ; _Chilkat_Rest_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Rest_ObjCreate
; Description ...: Creates a Chilkat Rest COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Rest_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Rest object was introduced in version 9.5.0.58.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatRestRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Rest_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_REST)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Rest_ObjCreate

#EndRegion ; _Chilkat_Rest_**

#Region ; _Chilkat_Socket_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Socket_ObjCreate
; Description ...: Creates a Chilkat Socket COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Socket_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Socket object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSocketRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Socket_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SOCKET)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Socket_ObjCreate

#EndRegion ; _Chilkat_Socket_**

#Region ; _Chilkat_Spider_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Spider_ObjCreate
; Description ...: Creates a Chilkat Spider COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Spider_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Spider object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSpiderRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Spider_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SPIDER)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Spider_ObjCreate

#EndRegion ; _Chilkat_Spider_**

#Region ; _Chilkat_Ssh_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Ssh_ObjCreate
; Description ...: Creates a Chilkat Ssh COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Ssh_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Ssh object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSshRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Ssh_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSH)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Ssh_ObjCreate

#EndRegion ; _Chilkat_Ssh_**

#Region ; _Chilkat_SshKey_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_SshKey_ObjCreate
; Description ...: Creates a Chilkat SshKey COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_SshKey_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat SshKey object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatSshKeyRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_SshKey_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_SSHKEY)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_SshKey_ObjCreate

#EndRegion ; _Chilkat_SshKey_**

#Region ; _Chilkat_Stream_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Stream_ObjCreate
; Description ...: Creates a Chilkat Stream COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Stream_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Stream object was introduced in version 9.5.0.56.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatStreamRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Stream_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_STREAM)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Stream_ObjCreate

#EndRegion ; _Chilkat_Stream_**

#Region ; _Chilkat_Upload_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_Upload_ObjCreate
; Description ...: Creates a Chilkat Upload COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_Upload_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat Upload object was introduced in version 9.5.0.44.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatUploadRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_Upload_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_UPLOAD)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_Upload_ObjCreate

#EndRegion ; _Chilkat_Upload_**

#Region ; _Chilkat_WebSocket_**

; #FUNCTION# ====================================================================================================================
; Name ..........: _Chilkat_WebSocket_ObjCreate
; Description ...: Creates a Chilkat WebSocket COM object for the selected Chilkat API version.
; Syntax ........: _Chilkat_WebSocket_ObjCreate()
; Parameters ....: None
; Return values .: Success: Chilkat COM object. Failure: $CHILKAT_RET_FAILURE and sets @error/@extended.
; Author ........: mLipok
; Modified ......:
; Remarks .......: Chilkat WebSocket object was introduced in version 9.5.0.70.
;                  Uses ChilkatConstants.au3 object metadata through __Chilkat_ObjCreate_Wrapper().
; Related .......: __Chilkat_ObjCreate_Wrapper
; Link ..........: https://www.chilkatsoft.com/refdoc/xChilkatWebSocketRef.html
; Example .......: No
; ===============================================================================================================================
Func _Chilkat_WebSocket_ObjCreate()
	Local $oObject = __Chilkat_ObjCreate_Wrapper($CHILKATOBJ_NAME_WEBSOCKET)
	Return SetError(@error, @extended, $oObject)
EndFunc   ;==>_Chilkat_WebSocket_ObjCreate

#EndRegion ; _Chilkat_WebSocket_**
#EndRegion - Chilkat_TransferNetworking.au3 - Object Functions
