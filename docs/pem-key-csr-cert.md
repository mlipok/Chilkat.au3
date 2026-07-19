# PEM, keys, CSR, and certificates

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

This document covers the RSA, private-key, public-key, CSR, and certificate helpers added for the `0.3.x` development line.

## Functions

### `_Chilkat_Rsa_GenerateKeyPair()`

Generates a private/public RSA key pair and validates the requested modulus size. Chilkat 10 uses the legacy RSA export path; Chilkat 11+ uses `Rsa.GenKey()` and `PrivateKey.ToPublicKey()`.

### `_Chilkat_PRIVATEKEY_SavePemFile()`

Exports a private key as PKCS#1, unencrypted PKCS#8, or password-protected AES-256 PKCS#8 PEM.

### `_Chilkat_PublicKey_SavePemFile()`

Exports a public key in the standard public-key PEM representation or optional PKCS#1 RSA PUBLIC KEY form.

### `_Chilkat_Csr_GeneratePemFile()`

Creates a SHA-256-signed PEM CSR with CN, organization, organizational unit, country, state/province (ST), locality (L), email, and an optional DNS Subject Alternative Name. The ST and L parameters are appended to the function signature to preserve existing positional calls.

### `_Chilkat_Cert_ExportFiles()`

Exports an X.509 certificate to DER (`.cert`/`.cer`) and/or PEM.

## Example 038

`Chilkat_Example_038_PEM_GENERATOR.au3` provides a GUI for generating RSA key pairs, choosing output formats, creating CSRs, and importing/exporting certificates or PFX/P12 containers. Its CSR form includes CN, O, OU, C, ST, L, email, and DNS SAN fields. After a CSR is saved, the example reloads it in the background, verifies the CSR signature, reads the Subject DN and SAN values, compares them with the requested values, and displays a verification summary in a MsgBox.

## Example 039

`Chilkat_Example_039_PEM_KEY_CERT_Reader.au3` opens and inspects PEM, KEY, PUB, CSR, CERT, CER, and CRT files. It enumerates multiple objects in PEM containers, supports encrypted private-key passwords, and can display raw source text only after an explicit warning.

## Security

Private-key material and passwords must not be logged. Raw PEM display may expose private keys and should be enabled only for deliberate inspection in a controlled environment.
