# Getting started

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Requirements

- AutoIt 3.3.10.2 or newer.
- A compatible Chilkat ActiveX installation or a Registration-Free COM/SxS DLL.
- Matching process architecture between AutoIt and the Chilkat DLL.
- A valid Chilkat unlock code or trial mode when required.
- The complete modular UDF file set stored beside `Chilkat.au3`.

## Include the UDF

Application scripts should include only the primary file:

```autoit
#include "Chilkat.au3"
```

The primary file loads every thematic module. Do not include individual modules instead of `Chilkat.au3` unless you are deliberately developing the UDF itself.

## Initialization

The examples initialize the selected Chilkat API and unlock the component through:

```autoit
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit
```

Registration-Free COM users must supply the correct Chilkat DLL path through the shared example configuration or call `_Chilkat_StartUp()` in their own application.

## Error handling

Check both `@error` and `@extended` immediately after a UDF call. Many wrappers also log the Chilkat `LastErrorText` through the shared logging layer.

Functions that call HTTP APIs generally return the HTTP status code in `@extended`. Structured API responses are returned as Chilkat `JsonObject` instances.

## Shutdown

Call `_Chilkat_ShutDown()` when the application finishes. The UDF also registers an exit callback as a fallback, but explicit shutdown is preferred in examples and long-running applications.
