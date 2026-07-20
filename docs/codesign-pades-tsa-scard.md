# Code signing, PAdES TSA timestamps, and smart-card diagnostics

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

This document covers the Authenticode, PAdES timestamp, CertStore search, SCard connection, and SmartCardFailReason helpers added to the `0.3.x` development line.

## CertStore search

`_Chilkat_CertStore_FindCert()` searches an already opened `CertStore` using `CN`, `issuerCN`, `serial`, `sha1`, `subjectDN`, or `issuerDN`. On Chilkat 10.1.2 and newer it first uses the native `CertStore.FindCert()` method. The result is validated for current certificate dates and optional private-key availability; a compatibility fallback uses `_Chilkat_CertStore_ListValidCertificates_AsArray()` and resolves the selected certificate by its complete SHA-1 fingerprint.

## SCard connection lifecycle

The public PC/SC wrapper set is:

- `_Chilkat_SCARD_EstablishContext()`
- `_Chilkat_SCARD_GetConnectedReader()`
- `_Chilkat_SCARD_Connect()`
- `_Chilkat_SCARD_CheckStatus()`
- `_Chilkat_SCARD_Reconnect()`
- `_Chilkat_SCARD_Disconnect()`
- `_Chilkat_SCARD_FindSmartcards_AsJson()`
- `_Chilkat_SCARD_ReleaseContext()`

A normal lifecycle is: establish context, list readers, connect, check status or communicate, disconnect, then release the context.

## SmartCardFailReason

Chilkat 10.1.0 introduced `Cert.SmartCardFailReason`. `_Chilkat_Cert_LoadFromSmartCard()` and the legacy path in `_Chilkat_Cert_LoadFromSmartCardEx()` now place this code in `@extended` when `LoadFromSmartcard()` fails.

- `0`: no failure;
- `1`: no smart card or USB token detected;
- `2`: PIN authentication failed;
- `3`: matching certificate not found;
- `99`: undefined failure; inspect `LastErrorText`.

Use `_Chilkat_Cert_SmartCardFailReasonToText()` for a readable description and `_Chilkat_Cert_GetSmartCardFailReason()` when a `Cert` object is available.

## PAdES with TSA timestamp

`_Chilkat_PDF_PAdES_CreateTsaOptions()` enables `signingCertificateV2`, `signingTime`, OCSP-based LTV information, and an RFC 3161 timestamp token. File and binary variants are provided for direct certificates, smart cards, and PKCS11:

- `_Chilkat_PDF_SignPAdES_TSA_File_ByCert()`
- `_Chilkat_PDF_SignPAdES_TSA_Binary_ByCert()`
- `_Chilkat_PDF_SignPAdES_TSA_File_BySmartCard()`
- `_Chilkat_PDF_SignPAdES_TSA_Binary_BySmartCard()`
- `_Chilkat_PDF_SignPAdES_TSA_File_ByPkcs11()`
- `_Chilkat_PDF_SignPAdES_TSA_Binary_ByPkcs11()`

Verification wrappers return Chilkat JSON containing the signature and embedded timestamp information:

- `_Chilkat_PDF_VerifyPAdES_TSA_File_AsJson()`
- `_Chilkat_PDF_VerifyPAdES_TSA_Binary_AsJson()`

The TSA URL, availability, credentials, certificate chain, OCSP responders, and network access determine whether the result is fully LTV-enabled.

## Authenticode CodeSign

The `CodeSign` wrapper set is:

- `_Chilkat_CodeSign_AddSignature()`
- `_Chilkat_CodeSign_VerifySignature_AsJson()`
- `_Chilkat_CodeSign_RemoveSignature()`
- `_Chilkat_CodeSign_SignFile_BySmartCard()`
- `_Chilkat_CodeSign_SignFile_ByPkcs11()`

`AddSignature()` and `RemoveSignature()` modify the target EXE or DLL in place. Production workflows should sign a controlled build artifact or a verified copy and should validate the returned JSON after signing.

## Examples

- `Examples/Chilkat_Example_044_CertStore_FindCert.au3`
- `Examples/Chilkat_Example_045_SCard_ConnectionStatus.au3`
- `Examples/Chilkat_Example_046_PDF_PAdES_TSA_Timestamp.au3`
- `Examples/Chilkat_Example_047_CodeSign_Authenticode.au3`
- `Examples/Chilkat_Example_048_SmartCardFailReason.au3`

## References

- https://www.chilkatsoft.com/refdoc/xChilkatCertStoreRef.html
- https://www.chilkatsoft.com/refdoc/xChilkatSCardRef.html
- https://www.chilkatsoft.com/refdoc/xChilkatCertRef.html
- https://www.chilkatsoft.com/refdoc/xChilkatCodeSignRef.html
- https://www.example-code.com/autoit/pdf_sign_with_tsa_timestamp.asp
