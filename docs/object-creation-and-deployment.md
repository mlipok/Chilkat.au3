# Object creation and deployment

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Object creation model

Object creators call `__Chilkat_ObjCreate_Wrapper()` and obtain ProgID, CLSID, IID, and version metadata from `ChilkatConstants.au3`.

## Registered COM

When the Chilkat ActiveX component is registered, the wrapper creates objects through the configured ProgID. Chilkat 10+ uses the modern ProgID form while older supported versions use the historical versioned form.

## Registration-Free COM / SxS

Registration-Free COM loads the Chilkat DLL directly and creates objects by CLSID/IID. Call `_Chilkat_StartUp()` before creating objects and `_Chilkat_ShutDown()` when finished.

## Architecture

The AutoIt process architecture must match the Chilkat DLL:

- 32-bit AutoIt requires a 32-bit Chilkat ActiveX DLL;
- 64-bit AutoIt requires a 64-bit Chilkat ActiveX DLL.

A DLL located in `System32` or `SysWOW64` does not by itself prove that it matches the running AutoIt process. Verify the actual binary and wrapper configuration.

## Deployment layout

Keep all of the following in the same UDF directory:

- `Chilkat.au3`
- `ChilkatConstants.au3`
- every `Chilkat_*.au3` thematic module

Examples remain in the `Examples/` subdirectory and include the parent UDF with `..\Chilkat.au3`.

## Version-dependent methods

Wrappers that use APIs introduced in newer Chilkat versions must call `_Chilkat_IsAtLeastThisVersion()` and either use a compatible older path or return a controlled error.
