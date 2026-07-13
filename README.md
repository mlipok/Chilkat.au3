# Chilkat.au3

Chilkat.au3 is an AutoIt UDF for working with Chilkat ActiveX components from AutoIt scripts.

This repository preserves and continues the public **Chilkat.au3 UDF** work originally published through the AutoIt community and maintained by **mLipok**.

## Current release

Current tagged GitHub release:

- `v0.2.12-BETA`
- https://github.com/mlipok/Chilkat.au3/releases/tag/v0.2.12-BETA

Active development for the modular `0.3.x` line is performed on:

- branch: `the_way_to_0.3.x`
- current UDF header version: `v0.3.0 BETA - Work in progress`
- current UDF header date: `2026/07/13`

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
- RSA key-pair generation compatible with Chilkat 10 and Chilkat 11+;
- private-key and public-key PEM export helpers;
- CSR generation and X.509 certificate export helpers;
- GUI examples for generating and inspecting PEM, KEY, PUB, CSR, CERT, CER, and CRT files;
- array-returning helpers for ZIP, FTP2, PC/SC, PKCS11, and certificate metadata;
- explicit smart-card certificate selection for signing workflows.

Detailed RSA, PEM, KEY, CSR, and certificate documentation is available in [PEM, keys, CSR, and certificates](docs/pem-key-csr-cert.md).

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

See [Examples and initialization](docs/examples-and-initialization.md) for the common example model and development defaults.

## Requirements

- AutoIt 3.3.10.2 or newer;
- the complete `0.3.x` UDF file set;
- a compatible Chilkat ActiveX component;
- matching process architecture between AutoIt and Chilkat;
- a Chilkat unlock code or trial mode where applicable.

For registered COM, Registration-Free COM / SxS, ProgID, CLSID, IID, DLL loading, and deployment details, see [Object creation and deployment](docs/object-creation-and-deployment.md).

## Documentation

The documentation index is available at [`docs/README.md`](docs/README.md).

Main topics:

- [Getting started](docs/getting-started.md)
- [Architecture and modules](docs/architecture-and-modules.md)
- [Object creation and deployment](docs/object-creation-and-deployment.md)
- [Examples and initialization](docs/examples-and-initialization.md)
- [PEM, keys, CSR, and certificates](docs/pem-key-csr-cert.md)
- [Certificates, PKI, and smart cards](docs/certificates-pki-and-smart-cards.md)
- [Digital signatures](docs/digital-signatures.md)
- [API overview](docs/api-overview.md)
- [Troubleshooting](docs/troubleshooting.md)
- [References and support](docs/links.md)

The current UDF function headers and `ChilkatConstants.au3` metadata remain authoritative for exact signatures, return values, `@error`, `@extended`, ProgIDs, CLSIDs, IIDs, and supported object-version metadata.

## Release Notes

Release Notes are currently maintained in the `#Region ; Release Notes` section of `Chilkat.au3`.

From `v0.3.0` onward, every new UDF function must be documented in the current Release Notes entry as part of the same change. While a version remains under development, its latest entry should be revised and expanded rather than duplicated.

## Authors and support

Chilkat.au3 is maintained by **mLipok**. The `0.2.x` and `0.3.x` development lines include implementation and documentation assistance from ChatGPT AI, reviewed and integrated by mLipok.

AutoIt Forum support topic:

- https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/

Original AutoIt Forum download:

- https://www.autoitscript.com/forum/files/file/433-chilkat-udf
