# Certificates, PKI, and smart cards

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Scope

Certificate and PKI helpers are primarily located in `Chilkat_Certificates_PKI.au3`.

The module covers:

- X.509 certificates and certificate stores;
- PEM and PFX/P12 containers;
- CSR generation;
- Java KeyStore;
- PKCS11 modules and tokens;
- PC/SC readers through `SCard`;
- smart-card and minidriver workflows.

RSA key generation and private/public key export helpers are located in `Chilkat_Cryptography.au3`.

Detailed documentation for RSA, PEM, private keys, public keys, CSR, certificate export, and examples 038/039 is available in [PEM, keys, CSR, and certificates](pem-key-csr-cert.md).

## Smart-card discovery

The UDF provides array-returning helpers for PC/SC readers, PKCS11 slots/tokens, and certificates. Prefer these helpers over directly selecting the first returned object.

A signing workflow should:

1. Enumerate available certificates.
2. Reject expired or not-yet-valid certificates.
3. Require access to a private key.
4. Show certificate metadata to the user.
5. Let the user select the certificate explicitly.
6. Identify the selected certificate consistently, for example by its full SHA-1 fingerprint.
7. Request the PIN only after the certificate is selected.
8. Reuse the same selected `Chilkat.Cert` object for signing.

The SHA-1 fingerprint in this workflow is an identifier, not a trust or cryptographic-strength assessment.

## PKCS11 module path

PKCS11 workflows require the vendor's PKCS11 library path. The correct DLL depends on the token or smart-card middleware installed on the system. Do not assume one universal filename.

The PKCS11 DLL architecture must match the AutoIt process architecture.

## Security recommendations

- Never log PINs or private-key passwords.
- Avoid displaying raw private-key source unless explicitly required.
- Store generated private keys in a protected directory.
- Validate certificate purpose, validity, issuer, and policy outside simple presence checks.
- Treat successful key access as distinct from certificate trust validation.
