# Digital signatures

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

Digital-signature helpers are primarily located in `Chilkat_DigitalSignatures.au3`.

## Supported areas

The module includes workflows related to:

- PDF signatures and PAdES;
- XAdES;
- XML digital signatures;
- CAdES-related operations;
- code signing;
- JWS, JWE, and JWT;
- local certificates, smart cards, and PKCS11-backed keys;
- cloud-signing and Cloud Signature Consortium components where supported by Chilkat.

## PDF and PAdES

The UDF contains helpers for signing PDF files and binary PDF data with certificates obtained from files, smart cards, or PKCS11 modules. Aggregate verification helpers expose signature and certificate-related details.

For binary workflows, use Chilkat `BinData` conversion helpers rather than unnecessary temporary files.

## XAdES

XAdES helpers support external-file and binary-reference workflows. Confirm the intended profile, reference URI, digest method, canonicalization settings, and certificate source before treating a generated signature as interoperable.

## Certificate selection

Smart-card signing must use explicit certificate selection. Do not silently use the first certificate returned by a card, store, or token. Verify validity dates and private-key availability before prompting for a PIN.

## Verification boundaries

A cryptographically valid signature does not automatically establish:

- certificate-chain trust;
- revocation status;
- qualified-signature status;
- timestamp trust;
- signer authorization;
- document-policy compliance.

Applications must define these checks according to their legal and operational requirements.

## Diagnostics

On failure, preserve:

- UDF `@error` and `@extended`;
- the Chilkat object's `LastErrorText`;
- the selected certificate summary;
- the signing profile and input type;
- PKCS11 or smart-card middleware information.

Never include PINs, private keys, passwords, or sensitive document contents in logs.
