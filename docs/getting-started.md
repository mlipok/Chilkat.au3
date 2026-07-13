# Getting started

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Requirements

- AutoIt 3.3.10.2 or newer.
- The complete `0.3.x` UDF file set located together.
- A compatible Chilkat ActiveX component.
- Matching process architecture between AutoIt and the Chilkat DLL or registered component.
- A Chilkat unlock code, or the Chilkat trial mode where applicable.

## Include model

Applications should include only the primary UDF file:

```autoit
#include "Chilkat.au3"
```

`Chilkat.au3` loads the thematic modules automatically. Do not copy only the primary file; deployment must include every module referenced by it.

## Basic initialization

A typical workflow is:

1. Select the Chilkat object-version metadata with `_Chilkat_DllVersion()`.
2. Load or identify the Chilkat ActiveX component with `_Chilkat_StartUp()` when using the DLL-based path.
3. Create the global Chilkat object with `_Chilkat_GLOBAL_ObjCreate()`.
4. Unlock the component with `_Chilkat_GLOBAL_UnlockBundle()`.
5. Create the required object through the corresponding `_Chilkat_*_ObjCreate()` wrapper.
6. Check the return value, `@error`, and `@extended` after each UDF operation.

## Version selection

The constants currently include metadata sets for:

- `$CHILKATOBJ_VERSION_950`
- `$CHILKATOBJ_VERSION_10`
- `$CHILKATOBJ_VERSION_11`

The selected metadata must match the ActiveX component used by the process. The helper `_Chilkat_IsAtLeastThisVersion()` is used where the Chilkat 10 and Chilkat 11 APIs differ.

## Error handling

The UDF uses:

- `$CHILKAT_RET_SUCCESS` and `$CHILKAT_RET_FAILURE` for common result values;
- `$CHILKAT_ERR_*` values in `@error`;
- `$CHILKAT_EXT_*` values or operation-specific details in `@extended`.

Use `_Chilkat_ErrorLogWrapper()` to configure application logging. Chilkat object failures should also be diagnosed from the object's `LastErrorText` information where exposed by the wrapper.

## Start with an example

The numbered scripts in `Examples/` demonstrate the intended initialization pattern. Review `Examples/Chilkat_Example_Common.au3` before adapting an example to a production deployment, because its DLL path and version selection are development defaults rather than universal settings.
