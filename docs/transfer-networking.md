# Transfer and networking

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_TransferNetworking.au3` contains network transport, remote-file, web-protocol, and socket functionality moved from the main UDF.

## Covered categories

- CURL / `HttpCurl`
- FTP and FTPS through `Ftp2`
- HTTP and HTTP miscellaneous objects
- REST and REST miscellaneous helpers
- SCP
- SFTP, SFTP directories, and SFTP files
- SSH, SSH keys, and SSH tunnels
- Socket, SSL, and TLS
- Spider
- Stream
- Upload
- WebSocket

## Public FTP2 constants

The `$CHILKAT_FTP2_*` list-column, filter, recursion, sort, and path-mode constants are stored in this module because they form part of its public API.

## Shared JSON REST layer

### `_Chilkat_HTTP_UrlEncode()`

Encodes individual path segments and query values using the selected Chilkat `Http` object.

### `_Chilkat_HTTP_Request_AsJson()`

Sends authenticated or unauthenticated JSON REST requests and returns a Chilkat `JsonObject`. Successful HTTP status is returned in `@extended`.

The compatibility path uses modern `HttpNoBody()` / `HttpStr()` methods on Chilkat 11+ and the older `QuickRequest()` / `PText()` path for supported earlier versions.

## Compatibility

All moved functions keep their existing names. The historical `_Chilkat_SSHTunel_ObjCreate()` spelling remains unchanged to avoid a script-breaking rename.
