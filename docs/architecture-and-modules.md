# Architecture and modules

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

## Design goal

`Chilkat.au3` remains the stable public entry point. Object-specific functions are stored in thematic modules so the source is easier to maintain without requiring application scripts to change their include statement.

## Core file

`Chilkat.au3` contains:

- shared constants and array-column definitions that do not belong to a thematic module;
- DLL/API version selection;
- Registration-Free COM startup and shutdown;
- generic object creation, error logging, and common helpers;
- `#include` statements for all thematic modules.

## Thematic modules

### Data formats

`Chilkat_DataFormats.au3` contains ASN.1, Base64, CSV, CkString, StringBuilder, HTML-to-text/XML, JSON, JsonArray, Markdown, and XML functions.

### Authentication

`Chilkat_Authentication.au3` contains NTLM, OAuth1, OAuth2, OIDC discovery, and OIDC UserInfo support.

### Transfer and networking

`Chilkat_TransferNetworking.au3` contains CURL, FTP/FTPS, HTTP, HTTP request/response, REST, SCP, SFTP, SSH, SSH keys/tunnels, sockets and TLS, Spider, Stream, Upload, and WebSocket functions. Public FTP2 listing constants are stored in this module.

### Cloud storage

`Chilkat_CloudStorage.au3` contains AWS and Azure authentication objects, generic cloud REST requests, and dedicated Amazon S3 wrappers. Other providers use the common HTTP/REST layer.

### Google

`Chilkat_Google.au3` contains AuthGoogle and standard wrappers for Google APIs, Calendar, Sheets, Tasks, Cloud SQL, and Firebase.

### Existing modules

- `Chilkat_Certificates_PKI.au3`
- `Chilkat_DigitalSignatures.au3`
- `Chilkat_Email.au3`
- `Chilkat_Cryptography.au3`
- `Chilkat_CompressionArchives.au3`

## Dependency direction

Modules may call shared functions defined by `Chilkat.au3` and functions in modules included earlier by `Chilkat.au3`. Application code should not depend on this ordering and should include only the main UDF.

## Deployment rule

The complete set of `.au3` modules is one deployment unit. Copying only `Chilkat.au3` and `ChilkatConstants.au3` will produce include errors.

## Naming

Public functions use `_Chilkat_<Object>_<Operation>()`. Internal implementation helpers use the double-underscore prefix when appropriate. Existing names are retained for script compatibility, including historical spelling where changing it would be script-breaking.
