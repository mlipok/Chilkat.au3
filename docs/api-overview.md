# API overview

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Naming convention

Public functions generally follow:

```text
_Chilkat_<Object>_<Operation>()
```

Functions returning a Chilkat JSON object commonly use the `_AsJson` suffix. Functions returning native AutoIt arrays commonly use `_AsArray`.

## Return and error conventions

- Success values are described in each function header.
- Failure normally returns `$CHILKAT_RET_FAILURE`, `0`, or an empty string as documented.
- `@error` identifies the UDF-level error category.
- `@extended` identifies the parameter or additional result, and for REST wrappers may contain the HTTP status code.

Capture `@error` and `@extended` immediately after the call.

## Object creators

`_Chilkat_*_ObjCreate()` functions delegate to `__Chilkat_ObjCreate_Wrapper()` and use metadata in `ChilkatConstants.au3`.

## Structured results

The UDF uses:

- Chilkat `JsonObject` for provider/API JSON responses;
- native AutoIt arrays for listings and metadata intended for direct AutoIt use;
- binary AutoIt variants and Chilkat `BinData` for in-memory file workflows.

## Authoritative source

Function headers in the current `.au3` source remain authoritative for exact signatures, compatibility notes, return values, and `@error/@extended` behavior.

## CertStore search and Authenticode

The PKI module now includes CertStore criteria search, SmartCardFailReason diagnostics, full basic SCard connection lifecycle helpers and Authenticode CodeSign wrappers. The digital-signature module adds PAdES TSA timestamp option, signing and verification helpers.
