# Examples and initialization

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Individual example files

The former monolithic `Examples/Chilkat_Examples.au3` file has been split into individual runnable scripts.

The naming convention is:

```text
Chilkat_Example_XXX_ShortDescription.au3
```

Examples cover JSON, CSV, strings, Atom, SMTP, IMAP, ZIP, HTTP, smart cards, PDF, FTP2, PKCS11, PAdES, XAdES, PEM generation, and PEM/key/certificate inspection.

Detailed documentation for `Chilkat_Example_038_PEM_GENERATOR.au3` and `Chilkat_Example_039_PEM_KEY_CERT_Reader.au3` is available in [PEM, keys, CSR, and certificates](pem-key-csr-cert.md).

## Shared initialization

Numbered examples include:

```autoit
#include "..\Chilkat.au3"
#include "Chilkat_Example_Common.au3"

_Example_Init()
If @error Then Exit
```

`Examples/Chilkat_Example_Common.au3` centralizes:

- Chilkat object-version selection;
- ActiveX DLL startup;
- global object creation;
- `UnlockBundle` initialization;
- common error logging;
- binary file helper functions.

## Development defaults

The common example file currently contains explicit development DLL names and enables one selected version while leaving alternatives commented out. Adapt these values to the local environment before running examples.

Do not commit a real Chilkat unlock code. The example attempts to read a local secret file and otherwise uses a trial string.

## Example-specific helpers

A helper that is used by only one example should remain in that example rather than being moved into `Chilkat_Example_Common.au3`. This keeps the common layer limited to shared initialization and utilities.

## Production use

The example initialization layer is intended as a reference and test harness. Production applications should define their own:

- DLL discovery or registered-COM policy;
- version selection;
- secure unlock-code retrieval;
- logging destination;
- failure handling;
- cleanup and shutdown behavior.

## Sensitive examples

Examples involving smart cards, PKCS11, signing, PFX/P12, PEM, private keys, SMTP, IMAP, or FTP may require credentials, PINs, tokens, certificates, or network access. Use controlled test data and avoid committing generated private-key material or account credentials.
