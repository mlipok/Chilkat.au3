# Certificates, PKI, and smart cards

## Scope

Certificate and PKI helpers are primarily located in `Chilkat_Certificates_PKI.au3`.

The module covers:

- X.509 certificates and certificate stores;
- PEM and PFX/P12 containers;
- CSR generation;
- private and public keys;
- Java KeyStore;
- PKCS11 modules and tokens;
- PC/SC readers through `SCard`;
- smart-card and minidriver workflows.

## RSA and key export

The `0.3.x` line includes helpers such as:

- `_Chilkat_Rsa_GenerateKeyPair()`;
- `_Chilkat_PRIVATEKEY_SavePemFile()`;
- `_Chilkat_PublicKey_SavePemFile()`;
- `_Chilkat_Csr_GeneratePemFile()`;
- `_Chilkat_Cert_ExportFiles()`.

Supported private-key export forms include PKCS#1 PEM, unencrypted PKCS#8 PEM, and password-protected AES-256 PKCS#8 PEM.

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

## PEM reader and generator examples

- `Chilkat_Example_038_PEM_GENERATOR.au3` generates RSA keys, exports keys, creates CSRs, and exports certificates.
- `Chilkat_Example_039_PEM_KEY_CERT_Reader.au3` inspects PEM, KEY, PUB, CSR, CERT, CER, and CRT content.

The reader can enumerate multiple objects in a PEM container and uses Chilkat 11 `*At()` methods with a Chilkat 10 compatibility fallback.

## Security recommendations

- Never log PINs or private-key passwords.
- Avoid displaying raw private-key source unless explicitly required.
- Store generated private keys in a protected directory.
- Validate certificate purpose, validity, issuer, and policy outside simple presence checks.
- Treat successful key access as distinct from certificate trust validation.
