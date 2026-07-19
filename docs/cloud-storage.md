# Cloud storage

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_CloudStorage.au3` groups provider authentication, object-storage helpers, and generic cloud REST access.

## Implemented scope

- AWS and Azure authentication-object creators;
- dedicated Amazon S3 upload, download, delete, and bucket-listing wrappers;
- optional S3-compatible endpoints supported by the S3 wrapper configuration;
- generic bearer-authenticated JSON REST requests.

The module does not currently provide dedicated wrapper sets for Amazon Glacier, Box, Dropbox, Google Cloud Storage, Google Drive, Google Photos, OneDrive, or SharePoint. Providers exposing bearer-authenticated JSON APIs may be accessed through the generic REST helper, but endpoint construction and provider-specific behavior remain the caller's responsibility.

## Authentication objects

The module contains the moved object creators for:

- `AuthAws`
- `AuthAzureAD`
- `AuthAzureSAS`
- `AuthAzureStorage`

## Generic provider REST

`_Chilkat_CloudStorage_Request_AsJson()` delegates bearer-authenticated JSON operations to the shared HTTP request layer. It is intended for providers whose APIs are exposed through normal HTTPS endpoints rather than a dedicated Chilkat object.

## Amazon S3 wrappers

- `_Chilkat_S3_CreateHttp()`
- `_Chilkat_S3_UploadFile()`
- `_Chilkat_S3_DownloadFile()`
- `_Chilkat_S3_DeleteObject()`
- `_Chilkat_S3_ListBucketObjects_AsXml()`

The wrappers configure AWS access key, secret key, region, endpoint, and optional session token. Alternate endpoints allow S3-compatible storage when supported by the provider.

## Security

Do not store access keys, bearer tokens, SAS tokens, or service-account material in source control. Prefer environment-specific secure configuration.

## Example

`Examples/Chilkat_Example_043_CloudStorage_S3.au3` demonstrates safe setup and listing with placeholder credentials.
