# Examples and initialization

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## File organization

Each numbered example is a standalone `.au3` file named:

```text
Chilkat_Example_XXX_ShortDescription.au3
```

The former monolithic `Chilkat_Examples.au3` file is no longer used.

## Required prologue

Every numbered example starts with:

```autoit
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit
```

Shared initialization, DLL selection, `UnlockBundle`, logging, and common file helpers belong in `Chilkat_Example_Common.au3`. Functions used by only one example should remain in that example file.

## Shutdown

Examples call `_Chilkat_ShutDown()` before exiting after their primary workflow.

## Added examples

- Example 038 — PEM/key/CSR/certificate generator.
- Example 039 — PEM/KEY/PUB/CSR/CERT reader and inspector.
- Example 040 — Base64 and Markdown conversion.
- Example 041 — OIDC discovery.
- Example 042 — Google CRUD structure and safe read operations.
- Example 043 — Amazon S3 setup and listing.

## Credentials and destructive operations

Examples must not contain real credentials, PINs, private keys, bearer tokens, or production resource IDs. Create/update/delete examples use placeholders and should avoid executing destructive operations until the user explicitly supplies valid values.

## Certificate, SCard, TSA, and CodeSign examples

- `Chilkat_Example_044_CertStore_FindCert.au3`
- `Chilkat_Example_045_SCard_ConnectionStatus.au3`
- `Chilkat_Example_046_PDF_PAdES_TSA_Timestamp.au3`
- `Chilkat_Example_047_CodeSign_Authenticode.au3`
- `Chilkat_Example_048_SmartCardFailReason.au3`
