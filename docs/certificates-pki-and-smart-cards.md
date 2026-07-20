# Certificates, PKI, and smart cards

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_Certificates_PKI.au3` contains certificate, certificate-store, key-container, PKCS11, PC/SC, smart-card, and code-signing object support.

## Safe smart-card selection

The preferred signing workflow:

1. Opens the smart-card certificate store.
2. Enumerates certificates into a native AutoIt array.
3. Filters for certificates with private-key access.
4. Rejects expired and not-yet-valid certificates by default.
5. Displays certificate identity, issuer, validity, serial number, and full SHA-1 fingerprint.
6. Lets the user choose a certificate.
7. Resolves the certificate by the complete normalized fingerprint.
8. Requests the PIN only after selection.

The legacy `Cert.LoadFromSmartcard()` path may arbitrarily select a certificate when several are present. It remains available for compatibility but is not the default safe path.

## PKCS11

The module supports slot/token discovery, session opening and closing, certificate enumeration, private-key filtering, and certificate selection for signing workflows.

## PC/SC

`_Chilkat_SCARD_ListReaders_AsArray()` lists available PC/SC readers and returns a native AutoIt array.

## Qualified-certificate metadata

Policy-OID helpers recognize known EU qualified certificate policies. This is metadata recognition only and is not a substitute for full trust-list, chain, and revocation validation.

See [PEM, keys, CSR, and certificates](pem-key-csr-cert.md) for key generation and PEM/CSR helpers.

## CertStore FindCert and SmartCardFailReason

`_Chilkat_CertStore_FindCert()` supports CN, issuer CN, serial number, SHA-1 fingerprint, subject DN and issuer DN. It uses native `CertStore.FindCert()` on Chilkat 10.1.2+ and the existing valid-certificate array workflow as a compatibility and validation path.

Legacy `Cert.LoadFromSmartcard()` failures expose `SmartCardFailReason` in `@extended` on Chilkat 10.1.0+. Use `_Chilkat_Cert_SmartCardFailReasonToText()` to convert the code to a readable message.

The expanded SCard wrapper set supports context management, reader connection, status checks, reconnect/disconnect, inserted-card discovery and context release. See [Code signing, PAdES TSA timestamps, and SCard](codesign-pades-tsa-scard.md).
