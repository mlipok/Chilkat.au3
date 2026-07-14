# Chilkat.au3

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

Chilkat.au3 is an AutoIt UDF for working with Chilkat ActiveX components from AutoIt scripts.

This repository preserves and continues the public **Chilkat.au3 UDF** work originally published through the AutoIt community and maintained by **mLipok**.

## Current release

Current tagged GitHub release:

- `v0.2.12-BETA`
- https://github.com/mlipok/Chilkat.au3/releases/tag/v0.2.12-BETA

Active development for the modular `0.3.x` line is performed on:

- branch: `the_way_to_0.3.x`
- current UDF header version: `v0.3.0 BETA - Work in progress`
- current UDF header date: `2026/07/14`

The development branch may contain script-breaking changes compared with earlier public versions.

## Quick start

Applications should include only the primary UDF file:

```autoit
#include "Chilkat.au3"
```

`Chilkat.au3` automatically includes all thematic modules. Deployment must therefore include the complete UDF file set, not only `Chilkat.au3` and `ChilkatConstants.au3`.

See [Getting started](docs/getting-started.md) for initialization, version selection, architecture, and error-handling guidance.

## Modular UDF layout

The `0.3.x` line keeps `Chilkat.au3` as the public entry point and moves object-specific functions into thematic modules:

- `Chilkat_DataFormats.au3`
- `Chilkat_Authentication.au3`
- `Chilkat_TransferNetworking.au3`
- `Chilkat_CloudStorage.au3`
- `Chilkat_Google.au3`
- `Chilkat_Certificates_PKI.au3`
- `Chilkat_DigitalSignatures.au3`
- `Chilkat_Email.au3`
- `Chilkat_Cryptography.au3`
- `Chilkat_CompressionArchives.au3`

See [Architecture and modules](docs/architecture-and-modules.md) for module scope, dependencies, deployment layout, and naming conventions.

## Highlights of the 0.3.x development line

- modular source layout while preserving one primary include file;
- individual runnable example files instead of one monolithic example script;
- shared example initialization through `Examples/Chilkat_Example_Common.au3`;
- dedicated modules for data formats, authentication, transfer/networking, cloud storage, and Google APIs;
- standard Google API CRUD wrappers plus Calendar, Sheets, Tasks, Cloud SQL, and Firebase helpers;
- RSA key-pair generation compatible with Chilkat 10 and Chilkat 11+;
- private-key and public-key PEM export helpers;
- CSR generation and X.509 certificate export helpers;
- GUI examples for generating and inspecting PEM, KEY, PUB, CSR, CERT, CER, and CRT files;
- array-returning helpers for ZIP, FTP2, PC/SC, PKCS11, and certificate metadata;
- explicit smart-card certificate selection for signing workflows;
- CertStore search, full basic SCard connection lifecycle and SmartCardFailReason diagnostics;
- LTV-enabled PAdES signatures with RFC 3161 TSA timestamps;
- Authenticode signing, verification and signature removal for EXE/DLL files.

Detailed documentation is available for:

- [Data formats](docs/data-formats.md)
- [Authentication](docs/authentication.md)
- [Transfer and networking](docs/transfer-networking.md)
- [Cloud storage](docs/cloud-storage.md)
- [Google APIs and CRUD](docs/google.md)
- [PEM, keys, CSR, and certificates](docs/pem-key-csr-cert.md)
- [Code signing, PAdES TSA timestamps, and SCard](docs/codesign-pades-tsa-scard.md)

## Examples

The former `Examples/Chilkat_Examples.au3` file has been split into individual runnable files using this naming convention:

```text
Chilkat_Example_XXX_ShortDescription.au3
```

Examples use the shared initialization layer:

```autoit
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit
```

Notable additions include:

- `Examples/Chilkat_Example_038_PEM_GENERATOR.au3`
- `Examples/Chilkat_Example_039_PEM_KEY_CERT_Reader.au3`
- `Examples/Chilkat_Example_040_DataFormats_Base64_Markdown.au3`
- `Examples/Chilkat_Example_041_OIDC_Discovery.au3`
- `Examples/Chilkat_Example_042_Google_CRUD.au3`
- `Examples/Chilkat_Example_043_CloudStorage_S3.au3`
- `Examples/Chilkat_Example_044_CertStore_FindCert.au3`
- `Examples/Chilkat_Example_045_SCard_ConnectionStatus.au3`
- `Examples/Chilkat_Example_046_PDF_PAdES_TSA_Timestamp.au3`
- `Examples/Chilkat_Example_047_CodeSign_Authenticode.au3`
- `Examples/Chilkat_Example_048_SmartCardFailReason.au3`

See [Examples and initialization](docs/examples-and-initialization.md) for the common example model and development defaults.

## Requirements

- AutoIt 3.3.10.2 or newer;
- the complete `0.3.x` UDF file set;
- a compatible Chilkat ActiveX component;
- matching process architecture between AutoIt and Chilkat;
- a Chilkat unlock code or trial mode where applicable;
- provider credentials, OAuth scopes, certificates, or hardware tokens required by the selected service.

For registered COM, Registration-Free COM / SxS, ProgID, CLSID, IID, DLL loading, and deployment details, see [Object creation and deployment](docs/object-creation-and-deployment.md).

## Documentation

The documentation index is available at [`docs/README.md`](docs/README.md).

The current UDF function headers and `ChilkatConstants.au3` metadata remain authoritative for exact signatures, return values, `@error`, `@extended`, ProgIDs, CLSIDs, IIDs, and supported object-version metadata.

## Release Notes

Release Notes are maintained in [`RELEASE_NOTES.md`](RELEASE_NOTES.md).

From `v0.3.0` onward, every new UDF function must be documented in the current Release Notes entry as part of the same change. While a version remains under development, its latest entry should be revised and expanded rather than duplicated.

## Authors and support

Chilkat.au3 is maintained by **mLipok**. The `0.2.x` and `0.3.x` development lines include implementation and documentation assistance from ChatGPT AI, reviewed and integrated by mLipok.

AutoIt Forum support topic:

- https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/

Original AutoIt Forum download:

- https://www.autoitscript.com/forum/files/file/433-chilkat-udf
