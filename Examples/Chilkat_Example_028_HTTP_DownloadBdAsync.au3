#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example_28_HTTP_DownloadBdAsync()
If @error Then MsgBox($MB_ICONERROR, "_Example_28_HTTP_DownloadBdAsync", "Example failed. @error=" & @error & ", @extended=" & @extended)
_Chilkat_ShutDown()
Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _Example_28_HTTP_DownloadBdAsync
; Description ...: Demonstrates asynchronous HTTP download into Chilkat BinData.
; Syntax ........: _Example_28_HTTP_DownloadBdAsync()
; Parameters ....: None
; Return values .: Success - None.
;                  Failure - Sets @error/@extended when a called UDF function fails.
; Remarks .......: Shows task startup, waiting and final binary data handling.
; ===============================================================================================================================
Func _Example_28_HTTP_DownloadBdAsync()
	_Log_ChilkatExample('_Example_28_HTTP_DownloadBdAsync')
	; This example demonstrates asynchronous HTTP download into Chilkat BinData.

;~ 	https://www.example-code.com/vbscript/box_download_binary_to_memory.asp

	Local $oHttp = _Chilkat_HTTP_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oHttp.LastErrorText)

	Local $oBinData = _Chilkat_BINDATA_ObjCreate()
	__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oBinData.LastErrorText)

	Local $hTimer = TimerInit() ; Begin the timer and store the handle in a variable.
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-setup.exe", $oBinData)
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://upgrades.michaelo.pl/ML_Programy/KK_ePUAP_2020-05-07_v2.exe", $oBinData)
;~ 	Local $oTask = $oHttp.DownloadBdAsync("https://upgrades.michaelo.pl/ML_Downloader/KK_Upgrades/2018-08-03__36_41_Small.zip", $oBinData)
	ConsoleWrite('! 11111' & @CRLF)
;~ 	Local $oTaskMy = _Chilkat_TASK_ObjCreate()
;~ 	_Chilkat_ObjName_FlagsValue($oTaskMy)

	Local $oTask = $oHttp.DownloadBdAsync("https://upgrades.michaelo.pl/ByteScout_OCRData/pol_fast.traineddata", $oBinData)
	_Chilkat_ObjName_FlagsValue($oTask)
	ConsoleWrite(@ScriptLineNumber & @CRLF & $oHttp.LastErrorText)

	Local $iSuccess = $oTask.Run()
	If $iSuccess <> 1 Then
		__Chilkat_LogOnError(@ScriptLineNumber & @CRLF & $__g_oChilkat_GLOBAL.LastErrorText)
	Else
		Local $iCurPctDone = 0
		While $oTask.Finished <> 1 And $oTask.StatusInt < 5

			If ($oTask.PercentDone <> $iCurPctDone) Then
				$iCurPctDone = $oTask.PercentDone
				ConsoleWrite("+ Downloading progress = " & $iCurPctDone & '%' & ' Status = ' & $oTask.Status & @CRLF)
			EndIf

			$oTask.SleepMs(100)
		WEnd
		__Chilkat_LogOnError("Downloaded into an object holding the binary data.")
		__Chilkat_LogOnError("Number of bytes: " & $oBinData.NumBytes)

		Local $hFileOpen = FileOpen("z:\TOOLs\Macro\PROGRAMY\Skaner\OCRData\pol_fast.traineddata", $FO_BINARY + $FO_OVERWRITE)
		FileWrite($hFileOpen, $oBinData.GetBinary())
		FileClose($hFileOpen)

		Local $fDiff = TimerDiff($hTimer) ; Find the difference in time from the previous call of TimerInit. The variable we stored the TimerInit handlem is passed as the "handle" to TimerDiff.

		MsgBox($MB_OK + $MB_TOPMOST + $MB_ICONINFORMATION, 'DownloadBdAsync speed', _
				'Downloaded: ' & $oBinData.NumBytes & ' bytes' & @CRLF & _
				'Time: ' & $fDiff / 1000 & ' seconds' & @CRLF & _
				@CRLF & _
				'Speed: ' & ($oBinData.NumBytes / 1024) / ($fDiff / 1000) & ' KBytes/seconds' & @CRLF & _
				@CRLF & _
				'')

	EndIf

EndFunc   ;==>_Example_28_HTTP_DownloadBdAsync
