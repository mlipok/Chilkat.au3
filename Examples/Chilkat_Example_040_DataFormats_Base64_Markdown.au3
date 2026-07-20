#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7

#include <MsgBoxConstants.au3>
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit

_Example()
Func _Example()
	Local $sText = 'Chilkat.au3 data formats example'
	Local $sBase64 = _Chilkat_Base64_EncodeString($sText)
	If @error Then Exit MsgBox($MB_ICONERROR, 'Data formats', 'Base64 encoding failed.')
	Local $sDecoded = _Chilkat_Base64_DecodeString($sBase64)
	If @error Then Exit MsgBox($MB_ICONERROR, 'Data formats', 'Base64 decoding failed.')
	_Log_ChilkatExample('Base64: ' & $sBase64)
	_Log_ChilkatExample('Decoded: ' & $sDecoded)

	If _Chilkat_IsAtLeastThisVersion('11.2.0', 'StringBuilder.MarkdownToHtml') Then
		Local $sHtml = _Chilkat_Markdown_ToHtml('# Chilkat.au3' & @LF & @LF & '- Data formats' & @LF & '- Markdown')
		If @error Then
			_Log_ChilkatExample('! ERROR in _Chilkat_Markdown_ToHtml(); @error=' & @error & '; @extended=' & @extended)
		Else
			_Log_ChilkatExample('> $sHtml:')
			_Log_ChilkatExample($sHtml)
		EndIf
	Else
		_Log_ChilkatExample('Markdown example skipped: requires Chilkat 11.2.0 or newer.')
	EndIf
EndFunc   ;==>_Example

_Chilkat_ShutDown()
