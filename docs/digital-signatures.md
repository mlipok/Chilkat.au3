# Digital signatures

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_DigitalSignatures.au3` contains digital-signature formats, PDF signing, XML signing, and token-backed signing workflows.

## Implemented public UDF scope

- JWE and JWS object creation;
- JWT decoding and inspection;
- PDF signatures and PAdES;
- XAdES external-file and binary-reference workflows;
- XML Digital Signature object creation and verification workflows.

CAdES and Cloud Signature Consortium workflows are not currently exposed through dedicated public UDF wrappers in this module.

## JWT inspection

The JWT helpers accept any of the following inputs:

- a raw compact token;
- `Bearer <token>`;
- `Authorization: Bearer <token>`.

`_Chilkat_JWT_DecodeHeader_AsJson()` returns the decoded JOSE header, while `_Chilkat_JWT_DecodePayload_AsJson()` returns the decoded claims payload. `_Chilkat_JWT_DecodeToken_AsJson()` combines both objects and explicitly reports `signatureVerified: false`.

These helpers use Chilkat `Jwt.GetHeader()` and `Jwt.GetPayload()`, available since Chilkat 9.5.0.58 and therefore compatible with Chilkat 10.1.2.0. Decoding only exposes token contents. It does not verify the signature, issuer, audience, nonce, expiration, not-before time, or authorization context.

Never make an authentication or authorization decision from decoded claims until the token has been verified against trusted keys and the application's validation policy.

## PAdES

File and binary-data helpers support signing with:

- a supplied Chilkat `Cert` object;
- a selected smart-card certificate;
- a certificate/private key accessed through PKCS11.

Verification helpers return booleans, Chilkat JSON, or selected AutoIt-array information depending on the function.

## XAdES and XML signatures

The module includes external-file and binary-reference workflows as well as verification helpers.

## Certificate selection

Smart-card signing should use the interactive valid-certificate workflow described in [Certificates, PKI, and smart cards](certificates-pki-and-smart-cards.md), rather than relying on arbitrary certificate selection.

## Security

Signature verification is not equivalent to a complete trust decision. Applications may also need certificate-chain validation, revocation checks, policy evaluation, trusted timestamps, and business-rule validation.

## PAdES with TSA timestamp

`_Chilkat_PDF_PAdES_CreateTsaOptions()` creates LTV/OCSP and RFC 3161 timestamp-token options. File and binary signing variants are available for direct certificates, smart cards and PKCS11. Verification wrappers return the Chilkat JSON produced by PDF signature verification.

Authenticode wrappers located in `Chilkat_Certificates_PKI.au3` support signing, verification, and signature removal for EXE and DLL files. See [Code signing, PAdES TSA timestamps, and SCard](codesign-pades-tsa-scard.md).
