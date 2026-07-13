# Chilkat.au3 documentation

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

This directory contains project documentation for the **Chilkat.au3 UDF** development line `0.3.x`.

The documentation reflects the modular source layout currently developed on the `the_way_to_0.3.x` branch. `Chilkat.au3` remains the primary include file and the single entry point for application scripts.

## Documentation index

- [Getting started](getting-started.md)
- [Architecture and modules](architecture-and-modules.md)
- [Object creation and deployment](object-creation-and-deployment.md)
- [Examples and initialization](examples-and-initialization.md)
- [PEM, keys, CSR, and certificates](pem-key-csr-cert.md)
- [Certificates, PKI, and smart cards](certificates-pki-and-smart-cards.md)
- [Digital signatures](digital-signatures.md)
- [API overview](api-overview.md)
- [Troubleshooting](troubleshooting.md)
- [References and support](links.md)

## Development status

The `0.3.x` line is marked `BETA - Work in progress`. It introduces a modular source layout and may contain script-breaking changes compared with earlier releases.

The current source branch remains authoritative for exact function signatures, return values, `@error`, `@extended`, supported Chilkat versions, and object metadata.

## Repository layout

The principal files are:

- `Chilkat.au3` — primary include file and shared/core functionality.
- `ChilkatConstants.au3` — return/error constants and Chilkat object metadata.
- `Chilkat_Certificates_PKI.au3` — certificates, key containers, PKI, PKCS11, PC/SC, and smart cards.
- `Chilkat_DigitalSignatures.au3` — PDF/PAdES, XAdES, XML signatures, JWS, JWE, JWT, and related signing workflows.
- `Chilkat_Email.au3` — SMTP, IMAP, POP3, MIME, Gmail, Microsoft 365, and other email-related functionality.
- `Chilkat_Cryptography.au3` — RSA, ECC, DSA, EdDSA, encryption, and key handling.
- `Chilkat_CompressionArchives.au3` — ZIP, Gzip, Tar, and compression workflows.
- `Examples/` — individual runnable examples and the shared initialization layer.

## Documentation baseline maintenance

Every repository `*.md` file must contain the standardized `AI_ASSISTED_DOCUMENTATION_NOTICE` block immediately after its top-level heading.

Before creating a final release, update the Chilkat.au3 version/tag in that notice in every `*.md` file. The value must be identical across the complete documentation set and must match the final release tag.

## Release Notes maintenance

Release Notes are currently maintained in the `#Region ; Release Notes` section of `Chilkat.au3`.

From `v0.3.0` onward:

- every new UDF function must be documented in the current Release Notes entry as part of the same change;
- while a version is still under development, revise and extend its latest entry instead of leaving an incomplete summary.

The complete history may be moved to a separate `RELEASE_NOTES.md` file in a later iteration.
