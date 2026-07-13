# Chilkat.au3

Chilkat.au3 is an AutoIt UDF for working with Chilkat ActiveX components from AutoIt scripts.

This repository preserves and continues the public **Chilkat.au3 UDF** work originally published through the AutoIt community and maintained by **mLipok**.

## Current release

Current tagged GitHub release:

- `v0.2.12-BETA`
- https://github.com/mlipok/Chilkat.au3/releases/tag/v0.2.12-BETA

This release should be treated as a beta development baseline.

## Current development branch

Active development for the modular `0.3.x` line is performed on:

- branch: `the_way_to_0.3.x`
- current UDF header version: `v0.3.0 BETA - Work in progress`
- current UDF header date: `2026/07/13`
- latest Release Notes entry: `v0.3.0`

The `0.3.x` line introduces a modular source layout while preserving `Chilkat.au3` as the primary include file and the single entry point for existing scripts.

```autoit
#include "Chilkat.au3"
```

`Chilkat.au3` automatically includes all thematic modules, so applications do not need to include each module separately.

## Modular UDF layout

### `Chilkat_Certificates_PKI.au3`

Certificate and public-key infrastructure support, including:

- CSR;
- certificate stores;
- X.509 certificates;
- code-signing certificate operations;
- Java KeyStore (JKS);
- PEM;
- PFX/P12;
- PKCS11;
- PC/SC smart cards through SCard;
- ScMinidriver.

### `Chilkat_DigitalSignatures.au3`

Digital-signature and token support, including:

- CAdES;
- Cloud Signature Consortium and cloud-signing workflows;
- general digital signatures;
- JSON Web Encryption (JWE);
- JSON Web Signatures (JWS);
- JSON Web Token (JWT);
- PDF signatures and PAdES;
- XAdES;
- XML digital signatures.

### `Chilkat_Email.au3`

Email-related support, including:

- DKIM and DomainKey;
- Email objects;
- Gmail REST API;
- Gmail SMTP, IMAP and POP;
- IMAP;
- MHT and HTML email;
- MIME;
- Microsoft 365 / Office 365;
- Outlook mail, calendar and contacts;
- POP3;
- SMTP.

### `Chilkat_Cryptography.au3`

General cryptography support, including:

- DSA;
- Diffie-Hellman;
- ECC;
- Ed25519;
- symmetric encryption;
- OpenSSL-compatible key formats;
- PRNG;
- RSA;
- private-key and public-key export helpers.

### `Chilkat_CompressionArchives.au3`

Compression and archive support, including:

- general compression;
- Gzip;
- Tar archives;
- ZIP archives;
- file-based and in-memory binary ZIP workflows.

## RSA, PEM, KEY, CSR and CERT support

The `0.3.x` line adds the following UDF functions:

### `_Chilkat_Rsa_GenerateKeyPair()`

Generates an RSA private/public key pair and returns Chilkat `PrivateKey` and `PublicKey` objects.

The function uses `_Chilkat_IsAtLeastThisVersion()` to select the appropriate API:

- Chilkat 10 compatibility path: `Rsa.GenerateKey()`, `ExportPrivateKeyObj()` and `ExportPublicKeyObj()`;
- Chilkat 11 and newer: `Rsa.GenKey()` and `PrivateKey.ToPublicKey()`.

### `_Chilkat_PRIVATEKEY_SavePemFile()`

Exports a private key to a PEM or KEY file as:

- PKCS#1 PEM;
- unencrypted PKCS#8 PEM;
- password-protected AES-256 PKCS#8 PEM.

### `_Chilkat_PublicKey_SavePemFile()`

Exports a public key to a PEM or PUB file using either:

- the standard public-key PEM representation;
- PKCS#1 `RSA PUBLIC KEY` format when requested.

### `_Chilkat_Csr_GeneratePemFile()`

Creates a SHA-256-signed PEM certificate signing request using a private key. Supported subject fields include CN, organization, organizational unit, country, email address and an optional DNS Subject Alternative Name.

### `_Chilkat_Cert_ExportFiles()`

Exports an X.509 certificate to:

- binary DER `.cert` / `.cer` files;
- PEM certificate files.

## PEM generator example

`Examples/Chilkat_Example_038_PEM_GENERATOR.au3` provides a GUI for:

- selecting the RSA modulus size;
- generating an RSA private/public key pair;
- exporting private keys as PKCS#1, PKCS#8 or encrypted PKCS#8;
- exporting public keys to PEM/PUB files;
- generating a certificate signing request;
- importing an existing certificate or PFX/P12 container;
- exporting certificates to DER CERT and PEM files;
- selecting the destination directory and output base name.

## PEM, KEY and CERT reader example

`Examples/Chilkat_Example_039_PEM_KEY_CERT_Reader.au3` provides a GUI for opening and inspecting:

- PEM;
- KEY;
- PUB;
- CSR;
- CERT;
- CER;
- CRT files.

The reader can enumerate multiple certificates, private keys, public keys, CSRs and CRLs stored in one PEM container.

Displayed certificate information includes subject, issuer, serial number, fingerprints, validity dates, key type and size, key usage, private-key availability, and self-signed/root status.

Displayed key information includes key type, key size, PEM representation and SHA-256 JWK/SPKI thumbprints where available.

Displayed CSR information includes subject fields, SAN values, hash algorithm, public-key information and the CSR signature-verification result.

Encrypted private keys are supported through an optional password. When a password is required but was not supplied, the reader reports `PASSWORD REQUIRED` instead of terminating with an AutoIt error.

Raw source text can optionally be appended to the details view. This option should be used carefully because it can expose private-key material.

The reader uses Chilkat 11 `*At()` PEM enumeration methods when available and automatically falls back to the Chilkat 10 `Get*()` methods.

## Examples

The former monolithic `Examples/Chilkat_Examples.au3` file has been split into one runnable file per example.

The naming convention is:

```text
Chilkat_Example_XXX_ShortDescription.au3
```

Examples use one shared initialization layer:

```autoit
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit
```

`Examples/Chilkat_Example_Common.au3` centralizes:

- Chilkat version selection;
- DLL loading;
- `UnlockBundle` initialization;
- error logging;
- common example helpers.

Functions that are specific to only one example remain in that example file. For example, `__Example_19b_API()` is defined in `Chilkat_Example_019b_CSV_CreateFile_Alternative.au3`, not in the common initialization file.

## Smart-card certificate selection

The smart-card signing workflow avoids silently selecting the first certificate returned by a card or certificate store.

The workflow:

1. Reads available certificates into a native AutoIt array.
2. Rejects certificates that are expired, not yet valid or do not provide access to a private key.
3. Displays valid certificates in a `ListView` with certificate metadata.
4. Lets the user explicitly select the signing certificate.
5. Identifies the selected certificate internally by its complete SHA-1 fingerprint.
6. Displays a readable certificate summary before requesting the PIN.
7. Uses the same selected `Chilkat.Cert` object for the signing operation.

The SHA-1 fingerprint is used only as a stable certificate identifier, not as a trust assessment or signature algorithm.

## Object creation model

The UDF supports two object creation paths:

1. **Registered COM ProgID path** — uses a registered Chilkat ActiveX ProgID such as `Chilkat.Http.10`.
2. **Registration-Free COM / SxS path** — creates objects directly from a loaded Chilkat ActiveX DLL using CLSID, IID and the stored DLL handle.

For Chilkat 10 and newer, the preferred ProgID pattern is:

```text
Chilkat.<ObjectName>.<MajorVersion>
```

Examples:

```text
Chilkat.Http.10
Chilkat.BinData.10
Chilkat.Pdf.10
```

For the legacy Chilkat 9.5 object-version setting, the existing naming style is preserved:

```text
Chilkat_9_5_0.<ObjectName>
```

## Repository contents

The principal files are:

- `Chilkat.au3` — primary UDF include file and shared/core functionality;
- `ChilkatConstants.au3` — constants and object metadata;
- `Chilkat_Certificates_PKI.au3` — certificates and PKI;
- `Chilkat_DigitalSignatures.au3` — signature-related functionality;
- `Chilkat_Email.au3` — email functionality;
- `Chilkat_Cryptography.au3` — cryptography, RSA and key handling;
- `Chilkat_CompressionArchives.au3` — compression and archive functionality;
- `Examples/Chilkat_Example_Common.au3` — shared example initialization;
- `Examples/Chilkat_Example_XXX_*.au3` — individual runnable examples;
- `Examples/Chilkat_GetObjectFlags_GENERATOR_FOR___$CHILKATOBJ_NAME_template.au3` — helper template for maintaining Chilkat object metadata.

## Requirements

To use this UDF, you need:

- AutoIt;
- Chilkat ActiveX installed or an accessible compatible ActiveX DLL;
- a Chilkat version compatible with the selected `$CHILKATOBJ_VERSION_*` setting;
- compatible architecture between AutoIt and the Chilkat ActiveX component;
- for registered COM creation: Chilkat ActiveX registered in Windows;
- for Registration-Free COM / SxS: compatible CLSID/IID metadata and access to the selected DLL.

Useful Chilkat references:

- https://www.chilkatsoft.com/refdoc/activex.asp
- https://www.chilkatsoft.com/downloads_ActiveX.asp
- https://chilkatsoft.com/activex_dll_registration_tutorial.asp
- https://cknotes.com/category/release-notes/
- https://cknotes.com/chilkat-v10-0-0-activex-registration-and-object-creation/

## Compatibility notes

The `the_way_to_0.3.x` branch is a beta development branch and may contain script-breaking changes compared with earlier public versions.

Compatibility-sensitive changes include:

- splitting the UDF into multiple source files;
- splitting the monolithic examples file into individual examples;
- renamed internal and logging helpers introduced in earlier `0.2.x` development;
- refactored Chilkat object creation;
- expanded `$CHILKATOBJ_NAME_*` and `$CHILKATOBJ_API` metadata;
- updated ProgID handling for Chilkat 10 and newer;
- renamed ZIP and FTP2 helper functions;
- explicit user-driven smart-card certificate selection.

Existing scripts should continue to include only `Chilkat.au3`, but deployments must now include the thematic module files located beside it.

## Release Notes maintenance

Release Notes are currently maintained in the `#Region ; Release Notes` section of `Chilkat.au3`.

From `v0.3.0` onward:

- every new UDF function must be documented in the current Release Notes entry as part of the same change;
- while a version is still under development, its latest entry should be revised and expanded instead of leaving an incomplete summary.

A future iteration may move the complete history to a separate `RELEASE_NOTES.md` file.

## Original AutoIt Forum references

Original AutoIt Forum topic:

- https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/

Original AutoIt Forum file download:

- https://www.autoitscript.com/forum/files/file/433-chilkat-udf

## Authors and contributors

Chilkat.au3 is maintained by **mLipok** and preserves the AutoIt community work and discussion related to the UDF.

The `0.2.x` and `0.3.x` development lines include implementation and documentation assistance from ChatGPT AI, reviewed and integrated by mLipok.

## Discussion and support

Discussion, questions and support can continue in the AutoIt Forum support topic:

- https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/
