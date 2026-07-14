# Troubleshooting

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Object creation fails

Check:

- selected Chilkat API version;
- registered ProgID or Registration-Free COM startup;
- CLSID/IID metadata;
- 32-bit versus 64-bit architecture;
- DLL path and file existence.

## Unlock fails

Verify the unlock code, component version, and whether trial mode is expected. Read `LastErrorText` and the UDF log.

## HTTP API call fails

Check:

- endpoint URL and API version;
- HTTP status returned in `@extended`;
- OAuth access-token validity and required scopes;
- API enablement and IAM permissions;
- JSON request body and content type;
- system clock and TLS configuration.

## Smart card or PKCS11 fails

Check reader/token presence, provider/CSP name, PKCS11 DLL architecture, slot discovery, PIN, certificate validity, and private-key availability.

## Include errors

Deploy the complete modular file set beside `Chilkat.au3`. Application scripts should not copy only the main and constants files.

## Example does not run

Review `Examples/Chilkat_Example_Common.au3`, configure the DLL/unlock settings, and confirm that the example's external resource, credential, or hardware prerequisite is available.

## Validation scope of this package

The package received static validation for balanced functions/regions, duplicate definitions, include targets, documentation notices, release-note coverage, and ZIP integrity. Runtime access to external providers, credentials, smart cards, network services, and the Chilkat ActiveX component was not exercised during package generation.
