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
- Example 044 — certificate-store search.
- Example 045 — smart-card connection lifecycle and status.
- Example 046 — PAdES signature with TSA timestamp.
- Example 047 — Authenticode signing and verification.
- Example 048 — SmartCardFailReason diagnostics.
- Example 049 — JWT extraction and decoding from a bearer token.
- Example 050 — Google Sheets read/write using interactive Google OAuth2.
- Example 051 — Google Sheets read/write using a service account.

## Credentials and destructive operations

Examples must not contain real credentials, PINs, private keys, bearer tokens, or production resource IDs. Create/update/delete examples use placeholders and should avoid executing destructive operations until the user explicitly supplies valid values.

Private example configuration belongs below `Examples/!!!_MY_SECRET_DATA/`. The repository `.gitignore` excludes that entire directory to prevent accidental commits of OAuth client configuration, refresh tokens, service-account private keys, and similar secrets.

## Certificate, SCard, TSA, and CodeSign examples

- `Chilkat_Example_044_CertStore_FindCert.au3`
- `Chilkat_Example_045_SCard_ConnectionStatus.au3`
- `Chilkat_Example_046_PDF_PAdES_TSA_Timestamp.au3`
- `Chilkat_Example_047_CodeSign_Authenticode.au3`
- `Chilkat_Example_048_SmartCardFailReason.au3`

## Google Sheets authorization examples

- `Chilkat_Example_050_GoogleSheets_ReadWrite_GoogleOAuth2.au3` uses a desktop OAuth client, opens the Google authorization page in the default browser, and stores client configuration and tokens in the ignored private directory.
- `Chilkat_Example_051_GoogleSheets_ReadWrite_ServiceAccount.au3` uses an ignored service-account JSON key and requires the spreadsheet to be shared with the service account.

Spreadsheet IDs, ranges, write enablement, and listener ports remain local constants in the corresponding example instead of being stored in secret JSON files.
