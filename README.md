# Chilkat.au3

Chilkat.au3 is an AutoIt UDF for working with the Chilkat ActiveX components from AutoIt scripts.

This repository preserves and continues the public **Chilkat.au3 UDF** work originally published through the AutoIt community.

## Current release

Current tagged GitHub release:

* `v0.1.4-BETA`
* https://github.com/mlipok/Chilkat.au3/releases/tag/v0.1.4-BETA

This release should be treated as a beta / work-in-progress development baseline.

## Current development branch

Active development toward the next version is done on:

* branch: `the_way_to_0.2.0`
* current UDF header version on this branch: `0.2.10 BETA - Work in progress`
* current UDF header date on this branch: `2026/07/09`
* latest release-notes entry on this branch: `v0.2.11`

The `0.2.x` development line starts from the `v0.1.4-BETA` baseline and is intended for maintenance, documentation cleanup, compatibility-sensitive refactoring, and further UDF development.

The `0.2.x` changelog currently notes this line as modified with ChatGPT AI assistance.

Recent development work on this branch includes:

* expanded Chilkat ActiveX object metadata for the supported 9.5, 10 and 11 object-version settings, including ProgID / CLSID / IID entries used by wrapper-based object creation;
* major-version-specific ProgID support for Chilkat v10+ object creation, for example `Chilkat.Http.10` and future `Chilkat.Http.11`, while preserving the legacy `Chilkat_9_5_0.*` naming for the 9.5 object-version setting;
* clarified object creation paths for registered COM ProgID creation and Registration-Free COM / SxS creation through CLSID, IID and loaded DLL handle metadata;
* grouped Chilkat object functions into dedicated `#Region` blocks by object prefix;
* added missing `_Chilkat_*_ObjCreate()` wrapper functions based on `ChilkatConstants.au3` object metadata;
* standardized `_Chilkat_*_ObjCreate()` documentation remarks with Chilkat object introduction-version information from the Chilkat ActiveX reference documentation where available;
* additional ProgID fallback object creators, including PKCS11, SCard, ScMinidriver, XmlDSig, XmlDSigGen and PrivateKey;
* ZIP helper functions for file-based and binary/in-memory archive workflows;
* FTP2 helper functions for connection, upload/download, binary transfer and directory listing as native AutoIt arrays;
* smart-card, PC/SC and PKCS11 discovery helpers returning native AutoIt arrays;
* certificate helper functions, including qualified-policy detection and validity-date checks;
* smart-card certificate selection that can reject expired or not-yet-valid certificates when selecting a certificate for signing;
* PAdES PDF signing and aggregate verification helpers, including binary PDF workflows;
* XAdES-BES signing and verification helpers for external-file and binary XML workflows;
* expanded examples, standardized example function documentation headers, and standardized object-creator documentation.

## Object creation model

The UDF supports two object creation paths:

1. **Registered COM ProgID path** — uses a registered Chilkat ActiveX ProgID such as `Chilkat.Http.10`.
2. **Registration-Free COM / SxS path** — creates objects directly from the loaded Chilkat ActiveX DLL by using CLSID, IID and the DLL handle stored by the UDF.

The Registration-Free COM / SxS path is the reason `ChilkatConstants.au3` stores more than ProgID strings. The object metadata also includes CLSID and IID values used by wrapper-based object creation.

For Chilkat v10 and newer, the preferred ProgID pattern in this UDF development line is:

```text
Chilkat.<ObjectName>.<MajorVersion>
```

Examples:

```text
Chilkat.Http.10
Chilkat.BinData.10
Chilkat.Pdf.10
```

For the legacy 9.5 object-version setting, the existing naming style is preserved:

```text
Chilkat_9_5_0.<ObjectName>
```

## Repository contents

The repository contains:

* `Chilkat.au3` — main AutoIt UDF wrapper for Chilkat ActiveX components.
* `ChilkatConstants.au3` — constants and object metadata used by the UDF.
* `Examples/Chilkat_Examples.au3` — example scripts demonstrating selected UDF functionality.
* `Examples/Chilkat_GetObjectFlags_GENERATOR_FOR___$CHILKATOBJ_NAME_template.au3` — helper/generator template used for maintaining Chilkat object metadata.

## Requirements

To use this UDF, you need:

* AutoIt.
* Chilkat ActiveX installed on the target system.
* A Chilkat version compatible with the selected `$CHILKATOBJ_VERSION_*` setting used by the UDF.
* For the registered COM ProgID path: Chilkat ActiveX properly registered in the Windows registry.
* For the Registration-Free COM / SxS path: compatible CLSID / IID metadata in `ChilkatConstants.au3` and access to the correct Chilkat ActiveX DLL file loaded by the UDF.

Useful Chilkat references:

* https://www.chilkatsoft.com/refdoc/activex.asp
* https://www.chilkatsoft.com/downloads_ActiveX.asp
* https://chilkatsoft.com/activex_dll_registration_tutorial.asp
* https://cknotes.com/category/release-notes/
* https://cknotes.com/chilkat-v10-0-0-activex-registration-and-object-creation/

## Status

`v0.1.4-BETA` is the latest tagged GitHub release.

The `the_way_to_0.2.0` branch is the active development branch for the next `0.2.x` line and may include script-breaking changes compared to earlier public versions.

Known compatibility-sensitive changes include renamed internal/logging helper functions, refactoring around Chilkat object creation wrappers, expanded `$CHILKATOBJ_NAME_*` / `$CHILKATOBJ_API` metadata, updated ProgID naming for Chilkat v10+ objects, additional `_Chilkat_*_ObjCreate()` wrappers, and API renaming in newer ZIP and FTP2 helper functions.

Use the development branch for testing, maintenance, documentation cleanup, and further development rather than as an assumed drop-in replacement without verification.

## Original AutoIt Forum references

Original AutoIt Forum topic:

* https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/

Original AutoIt Forum file download:

* https://www.autoitscript.com/forum/files/file/433-chilkat-udf

## Authors and contributors

Chilkat.au3 is maintained by mLipok and preserves the AutoIt community work and discussion related to the Chilkat.au3 UDF.

## Discussion and support

Discussion, questions, and support for this UDF can continue in the AutoIt Forum support topic:

* https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/
