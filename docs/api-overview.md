# API overview

This page groups the main public UDF areas. Function headers in the source files remain authoritative for exact signatures and return contracts.

## Core and object creation

`Chilkat.au3` contains shared initialization, object creation, version checks, logging, binary helpers, HTTP/FTP/SFTP-related functionality, JSON/CSV/string helpers, and other core areas that have not been moved to a thematic module.

Public object creators normally follow:

```text
_Chilkat_<OBJECT>_ObjCreate()
```

Examples include `_Chilkat_HTTP_ObjCreate()`, `_Chilkat_BINDATA_ObjCreate()`, `_Chilkat_FTP2_ObjCreate()`, and `_Chilkat_GLOBAL_ObjCreate()`.

## Certificates and PKI

See `Chilkat_Certificates_PKI.au3` for certificate stores, certificates, CSR, PEM, PFX/P12, PKCS11, SCard, smart cards, minidrivers, private keys, and public keys.

## Digital signatures

See `Chilkat_DigitalSignatures.au3` for PDF/PAdES, XAdES, XML signatures, code signing, JWS, JWE, JWT, and related signing workflows.

## Email

See `Chilkat_Email.au3` for SMTP/MailMan, IMAP, POP3, MIME, DKIM, Gmail, Microsoft 365, Outlook, and email object helpers.

## Cryptography

See `Chilkat_Cryptography.au3` for RSA, DSA, Diffie-Hellman, ECC, EdDSA, encryption, PRNG, and key operations.

## Compression and archives

See `Chilkat_CompressionArchives.au3` for ZIP, Gzip, Tar, compression, archive listing, extraction, and binary archive workflows.

## Native AutoIt arrays

Newer listing and discovery helpers return native AutoIt arrays for ZIP entries, FTP2 directory items, PC/SC readers, PKCS11 slots/tokens, and certificate metadata. Column indexes are defined as constants in the UDF.

Callers should use the named column constants rather than hard-coded numeric indexes.

## Error model

Common UDF results use:

- `$CHILKAT_RET_SUCCESS`;
- `$CHILKAT_RET_FAILURE`;
- `$CHILKAT_ERR_*` in `@error`;
- `$CHILKAT_EXT_*` or operation details in `@extended`.

Some functions return Chilkat COM objects, strings, binary data, or native arrays instead of the standard success constant. Always check the relevant function header.

## Internal API

Functions beginning with `__Chilkat_` are internal unless explicitly documented otherwise. Their names and behavior may change during the `0.3.x` beta line.
