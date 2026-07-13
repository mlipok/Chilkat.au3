# Architecture and modules

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Primary include file

`Chilkat.au3` remains the public entry point:

```autoit
#include "Chilkat.au3"
```

The primary file contains shared constants usage, object creation infrastructure, common helpers, and functions that have not been moved into a thematic module. It also includes the module files required by the `0.3.x` layout.

## Thematic modules

### `Chilkat_Certificates_PKI.au3`

Contains certificate and public-key infrastructure functionality, including certificate stores, X.509 certificates, CSR, JKS, PEM, PFX/P12, PKCS11, PC/SC `SCard`, smart cards, and `ScMinidriver` workflows.

### `Chilkat_DigitalSignatures.au3`

Contains digital-signature functionality, including PDF/PAdES, XAdES, XMLDSig, CAdES-related workflows, code signing, JWS, JWE, JWT, and cloud-signing components.

### `Chilkat_Email.au3`

Contains email-related functionality, including MailMan/SMTP, IMAP, POP3, MIME, DKIM, Gmail, Microsoft 365, Outlook, and related message objects.

### `Chilkat_Cryptography.au3`

Contains general cryptography and key functionality, including RSA, DSA, Diffie-Hellman, ECC, Ed25519/EdDSA, symmetric encryption, PRNG, private keys, and public keys.

### `Chilkat_CompressionArchives.au3`

Contains compression and archive functionality, including ZIP, Gzip, Tar, general compression, and in-memory binary archive workflows.

## Deployment rule

Although application scripts include only `Chilkat.au3`, the module files are runtime source dependencies and must be deployed beside it or in a valid AutoIt include path.

A minimal source layout is:

```text
project/
  Chilkat.au3
  ChilkatConstants.au3
  Chilkat_Certificates_PKI.au3
  Chilkat_DigitalSignatures.au3
  Chilkat_Email.au3
  Chilkat_Cryptography.au3
  Chilkat_CompressionArchives.au3
```

## Public and internal naming

- Public UDF functions normally use the `_Chilkat_` prefix.
- Internal implementation functions use the `__Chilkat_` prefix.
- Object creator wrappers normally follow `_Chilkat_<OBJECT>_ObjCreate()`.
- Object metadata is stored in `$CHILKATOBJ_API` and indexed by `$CHILKATOBJ_NAME_*` constants.

Application code should not depend on double-underscore functions unless the function is explicitly documented as a supported extension point.

## Compatibility

The modular split is a source-layout change. Existing scripts should continue to include `Chilkat.au3`, but packaging processes that previously copied only two UDF files must be updated to include all thematic modules.
