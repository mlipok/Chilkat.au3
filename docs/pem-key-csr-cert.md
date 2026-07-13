# PEM, keys, CSR, and certificates

This document describes the RSA, private-key, public-key, CSR, and certificate helpers added for the `0.3.x` development line, together with the related generator and reader examples.

The function headers in the source files remain authoritative for exact signatures, return values, `@error`, and `@extended` behavior.

## Source modules

The helpers are divided between two thematic modules:

- `Chilkat_Cryptography.au3` — RSA key-pair generation and private/public key export.
- `Chilkat_Certificates_PKI.au3` — CSR generation and X.509 certificate export.

Application scripts should continue to include only:

```autoit
#include "Chilkat.au3"
```

`Chilkat.au3` loads both modules automatically.

## `_Chilkat_Rsa_GenerateKeyPair()`

```autoit
_Chilkat_Rsa_GenerateKeyPair(ByRef $oPrivateKey, ByRef $oPublicKey, $iNumBits = 2048)
```

Generates an RSA key pair and returns:

- a Chilkat `PrivateKey` object through `$oPrivateKey`;
- a Chilkat `PublicKey` object through `$oPublicKey`.

The requested modulus size must be an integer between 512 and 8192 bits and divisible by 8.

### Chilkat 10 and 11 compatibility

The function uses `_Chilkat_IsAtLeastThisVersion()` to select the correct underlying API.

For Chilkat 10, it uses the deprecated compatibility methods:

```text
Rsa.GenerateKey()
Rsa.ExportPrivateKeyObj()
Rsa.ExportPublicKeyObj()
```

For Chilkat 11 and newer, it uses:

```text
Rsa.GenKey()
PrivateKey.ToPublicKey()
```

This version selection is based on the actual Chilkat component version reported to the UDF. Incomplete version strings such as `11.0.0` are normalized to four numeric components before comparison.

## `_Chilkat_PRIVATEKEY_SavePemFile()`

```autoit
_Chilkat_PRIVATEKEY_SavePemFile(ByRef $oPrivateKey, $sFileFullPath, $sFormat = 'pkcs8', $sPassword = Default)
```

Exports a Chilkat `PrivateKey` object to a PEM or KEY file.

Supported `$sFormat` values:

- `pkcs1` — traditional PKCS#1 private-key PEM;
- `pkcs8` — unencrypted PKCS#8 private-key PEM;
- `pkcs8-encrypted` — password-protected PKCS#8 PEM using AES-256.

A non-empty password is mandatory for `pkcs8-encrypted`.

The filename extension does not define the private-key encoding. A `.pem` or `.key` file may contain any of the supported PEM structures, so callers should choose the format explicitly.

## `_Chilkat_PublicKey_SavePemFile()`

```autoit
_Chilkat_PublicKey_SavePemFile(ByRef $oPublicKey, $sFileFullPath, $bPreferPkcs1 = 0)
```

Exports a Chilkat `PublicKey` object to a PEM or PUB file.

When `$bPreferPkcs1` is false, the standard public-key PEM representation is used. When it is true, the function requests PKCS#1 `RSA PUBLIC KEY` output.

A public-key file is not an X.509 certificate. It does not contain certificate subject, issuer, validity, policy, or trust information.

## `_Chilkat_Csr_GeneratePemFile()`

```autoit
_Chilkat_Csr_GeneratePemFile( _
        ByRef $oPrivateKey, _
        $sFileFullPath, _
        $sCommonName, _
        $sOrganization = '', _
        $sOrganizationUnit = '', _
        $sCountry = '', _
        $sEmail = '', _
        $sDnsSan = '')
```

Creates a SHA-256-signed certificate signing request in PEM format using the supplied private key.

Supported subject data includes:

- common name;
- organization;
- organizational unit;
- country;
- email address;
- optional DNS Subject Alternative Name.

The generated CSR is a request, not a certificate. It must be submitted to a certificate authority or another issuance process before an X.509 certificate exists.

## `_Chilkat_Cert_ExportFiles()`

```autoit
_Chilkat_Cert_ExportFiles(ByRef $oCert, $sDerCertFileFullPath = Default, $sPemCertFileFullPath = Default)
```

Exports a Chilkat `Cert` object to one or both of the following representations:

- binary DER certificate, commonly stored as `.cert` or `.cer`;
- PEM-encoded X.509 certificate.

At least one output path must be provided. The function exports the public certificate and does not export the private key associated with it.

## Example 038 — PEM generator

`Examples/Chilkat_Example_038_PEM_GENERATOR.au3` provides a GUI for generating and exporting key and certificate-related files.

The example can:

- select an RSA modulus size;
- generate an RSA private/public key pair;
- export a private key as PKCS#1, PKCS#8, or encrypted PKCS#8;
- export a public key to PEM/PUB;
- generate a SHA-256 CSR with subject data and optional DNS SAN;
- import an existing X.509 certificate or PFX/P12 container;
- export a certificate as DER and PEM;
- select the output directory and base filename.

The example demonstrates the new helper functions rather than duplicating the underlying Chilkat operations in GUI code.

## Example 039 — PEM, KEY, and CERT reader

`Examples/Chilkat_Example_039_PEM_KEY_CERT_Reader.au3` provides a GUI for opening and inspecting:

- PEM;
- KEY;
- PUB;
- CSR;
- CERT;
- CER;
- CRT files.

A single PEM container may contain multiple certificates, private keys, public keys, CSRs, or CRLs. The reader enumerates the available objects instead of assuming that one file contains exactly one object.

### Certificate details

The reader can display information such as:

- subject and issuer;
- serial number;
- fingerprints;
- validity dates;
- key type and key size;
- key usage;
- private-key availability;
- self-signed and root status.

### Key details

For private and public keys, the reader can display:

- key type;
- key size;
- PEM representation;
- SHA-256 JWK/SPKI thumbprint where available.

### CSR details

For certificate signing requests, the reader can display:

- subject fields;
- SAN values;
- hash algorithm;
- public-key information;
- CSR signature-verification result.

### Encrypted private keys

The GUI accepts an optional password. When an encrypted private key is detected but no password is supplied, the reader reports:

```text
PASSWORD REQUIRED
```

This is a normal inspection result, not an AutoIt runtime error.

### Raw source display

The reader can append the raw source text to the details view. This option is disabled by default because displaying a private-key file exposes the complete private-key material.

### Chilkat 10 and 11 compatibility

For PEM enumeration, the reader uses Chilkat 11 `*At()` methods when available and falls back to the older Chilkat 10 `Get*()` methods.

## Error handling

These helpers normally return `$CHILKAT_RET_SUCCESS` or `$CHILKAT_RET_FAILURE` and set `@error` and `@extended` according to the UDF error model.

After a failure:

1. preserve `@error` and `@extended` immediately;
2. inspect the relevant Chilkat object's `LastErrorText` through the available logging path;
3. confirm the actual loaded Chilkat version;
4. confirm the input object type and output path;
5. confirm that passwords are supplied only where required and are not logged.

## Security considerations

- Never commit generated private keys, PFX/P12 passwords, PINs, or unlock codes.
- Store private keys in a directory with restricted access.
- Prefer encrypted PKCS#8 when private-key files must be stored outside a controlled test environment.
- Do not confuse successful parsing with certificate trust validation.
- A valid CSR signature does not establish identity or authorization.
- A certificate fingerprint used as an identifier is not a substitute for chain, revocation, policy, or purpose validation.
- Enable raw source display only in a controlled environment.
