# Troubleshooting

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Object cannot be created

Check:

- the selected `$CHILKATOBJ_VERSION_*` value;
- whether the required object metadata exists in `ChilkatConstants.au3`;
- whether registered COM or Registration-Free COM is being used;
- ProgID, CLSID, and IID values;
- AutoIt and Chilkat architecture compatibility;
- the DLL path supplied to `_Chilkat_StartUp()`.

## DLL loads but object creation fails

The DLL may be the wrong architecture, the metadata may not match the DLL version, or the requested Chilkat class may not exist in that release. Confirm the actual component version and object introduction version.

## UnlockBundle fails

Verify that:

- the global object was created successfully;
- the unlock code is read correctly;
- no whitespace or encoding issue was introduced while reading the secret file;
- the installed component supports the requested operation.

Do not print the real unlock code in logs.

## Example uses a missing DLL

`Chilkat_Example_Common.au3` contains development-specific DLL filenames. Select an installed/available version and update the path for the local environment.

## Include file is missing

The `0.3.x` source is modular. Keep all thematic module files beside `Chilkat.au3` or in a valid include path. Including only the primary file and constants file is no longer sufficient.

## PKCS11 module cannot be loaded

Verify the vendor middleware, PKCS11 DLL path, architecture, token connection, and whether another process has locked the device. The library filename is vendor-specific.

## Smart-card certificate is not listed

Check reader visibility, card insertion, middleware, certificate validity dates, private-key availability, and whether the filtering options exclude the certificate.

## Signing fails after certificate selection

Confirm that the exact selected `Chilkat.Cert` object is passed to the signing operation, the private key remains accessible, and the PIN belongs to the selected token/card.

## Chilkat 10/11 method mismatch

Use `_Chilkat_IsAtLeastThisVersion()` for version-dependent paths. Confirm the actual loaded component version rather than relying only on the intended configuration.

## `@error` is not enough

Capture both `@error` and `@extended`, then inspect the relevant Chilkat object's `LastErrorText`. Preserve the original error state before calling unrelated functions that may overwrite AutoIt error macros.

## Binary workflow returns unexpected data

Confirm whether the function expects an AutoIt Binary variant, Chilkat `BinData`, a file path, or a Chilkat object. Use the dedicated conversion helpers and avoid implicit string conversion of binary values.
