# Chilkat.au3 Release Notes

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

This file is the central Release Notes history for the Chilkat.au3 UDF.

## Maintenance policy

- Whenever a new UDF function is added, update the current release entry in the same change.
- While a version is still in development, revise and extend its latest entry instead of creating incomplete duplicate entries.
- Before a final release, update the version/tag in the AI-assisted documentation notice in every Markdown file.

## v0.3.0 — 2026/07/19

- Changed: split object-specific functions into Certificates/PKI, Digital Signatures, Email, Cryptography and Compression/Archives modules - AI / mLipok
- Changed: Chilkat.au3 remains the primary include file and links all modular UDF files, preserving a single entry point for existing scripts - AI / mLipok
- Changed: split Chilkat_Examples.au3 into one runnable file per numbered example using the Chilkat_Example_XXX_ShortDescription.au3 naming convention - AI / mLipok
- Added: Chilkat_Example_Common.au3 as the shared initialization, Chilkat DLL selection, UnlockBundle and common helper layer for all numbered examples - AI / mLipok
- Changed: every numbered example now includes Chilkat.au3 and Chilkat_Example_Common.au3, calls _Example_Init(), and exits when initialization fails - AI / mLipok
- Changed: moved __Example_19b_API() from Chilkat_Example_Common.au3 to Chilkat_Example_019b_CSV_CreateFile_Alternative.au3 because it is specific to that example - AI / mLipok
- Added: Function: _Chilkat_Rsa_GenerateKeyPair() - generates an RSA private/public key pair, validates the requested modulus size and returns Chilkat PrivateKey and PublicKey objects - AI / mLipok
- Added: _Chilkat_Rsa_GenerateKeyPair() compatibility path for Chilkat 10 using Rsa.GenerateKey(), ExportPrivateKeyObj() and ExportPublicKeyObj() - AI / mLipok
- Added: _Chilkat_Rsa_GenerateKeyPair() modern path for Chilkat 11 and newer using Rsa.GenKey() and PrivateKey.ToPublicKey() - AI / mLipok
- Changed: _Chilkat_Rsa_GenerateKeyPair() selects the appropriate Chilkat 10 or Chilkat 11+ API through _Chilkat_IsAtLeastThisVersion() - AI / mLipok
- Added: Function: _Chilkat_PRIVATEKEY_SavePemFile() - exports private keys as PKCS#1 PEM, unencrypted PKCS#8 PEM or AES-256 encrypted PKCS#8 PEM to PEM/KEY files - AI / mLipok
- Added: _Chilkat_PRIVATEKEY_SavePemFile() validation for the PrivateKey object, output path, requested encoding and mandatory password for encrypted PKCS#8 output - AI / mLipok
- Added: Function: _Chilkat_PublicKey_SavePemFile() - exports public keys to PEM/PUB files using the standard public-key representation or optional PKCS#1 RSA PUBLIC KEY output - AI / mLipok
- Added: Function: _Chilkat_Csr_GeneratePemFile() - creates a SHA-256 signed PEM CSR from a PrivateKey with CN, organization, organizational unit, country, email and optional DNS SAN fields - AI / mLipok
- Added: Function: _Chilkat_Cert_ExportFiles() - exports an X.509 certificate to DER CERT/CER and/or PEM certificate files - AI / mLipok
- Fixed: _Chilkat_IsAtLeastThisVersion() now normalizes both current and required version strings to four numeric components and pads missing components with zeros before validation and comparison - AI / mLipok
- Added: Chilkat_Example_038_PEM_GENERATOR.au3 with a GUI for generating RSA key pairs and selecting the RSA modulus size, destination directory and output base name - AI / mLipok
- Added: Example 038 exports private keys as PKCS#1, PKCS#8 or password-protected AES-256 PKCS#8 PEM/KEY files and exports public keys as PEM/PUB files - AI / mLipok
- Added: Example 038 generates SHA-256 certificate signing requests with subject fields and optional DNS Subject Alternative Name - AI / mLipok
- Added: Example 038 imports an existing X.509 certificate or PFX/P12 container and exports the certificate as DER CERT and PEM files - AI / mLipok
- Changed: renamed Chilkat_Example_038_PEM.au3 to Chilkat_Example_038_PEM_GENERATOR.au3 to describe its purpose more precisely - AI / mLipok
- Added: Chilkat_Example_039_PEM_KEY_CERT_Reader.au3 with a GUI for opening and inspecting PEM, KEY, PUB, CSR, CERT, CER and CRT files - AI / mLipok
- Added: Example 039 enumerates multiple certificates, private keys, public keys, CSRs and CRLs stored in a single PEM container - AI / mLipok
- Added: Example 039 lists certificate subject, issuer, serial number, fingerprints, validity, key type/size, key usage, private-key availability and self-signed/root status - AI / mLipok
- Added: Example 039 lists private/public key type, key size, PEM representation and SHA-256 JWK/SPKI thumbprint where available - AI / mLipok
- Added: Example 039 lists CSR subject fields, SAN values, hash algorithm, public-key information and CSR signature verification result - AI / mLipok
- Added: Example 039 supports optional passwords for encrypted private keys and reports PASSWORD REQUIRED when an encrypted key is selected without a password - AI / mLipok
- Added: Example 039 can optionally append the raw source text to the details view, with a warning because private-key material may be exposed - AI / mLipok
- Changed: Example 039 selects Chilkat 11 *At() PEM enumeration methods or Chilkat 10 Get*() compatibility methods through _Chilkat_IsAtLeastThisVersion() - AI / mLipok
- Fixed: Example 039 uses _StringRepeat() from String.au3 instead of the nonexistent StringRepeat() function - AI / mLipok
- Changed: moved the complete Release Notes history from the `#Region ; Release Notes` block in `Chilkat.au3` to the central `RELEASE_NOTES.md` file - AI / mLipok
- Added: `_Chilkat_CertStore_FindCert()` with native Chilkat 10.1.2+ `CertStore.FindCert()` support and a validated fallback based on `_Chilkat_CertStore_ListValidCertificates_AsArray()` - AI / mLipok
- Added: `_Chilkat_Cert_GetSmartCardFailReason()` and `_Chilkat_Cert_SmartCardFailReasonToText()`; legacy smart-card loading now returns the Chilkat reason code in `@extended` when available - AI / mLipok
- Added: SCard wrappers for EstablishContext, ConnectedReader, Connect, CheckStatus, Reconnect, Disconnect, FindSmartcards and ReleaseContext - AI / mLipok
- Added: PAdES LTV/TSA option creation, file and binary signing variants for Cert, SmartCard and PKCS11, and explicit TSA verification wrappers - AI / mLipok
- Added: Authenticode CodeSign wrappers for AddSignature, VerifySignature, RemoveSignature, smart-card signing and PKCS11 signing - AI / mLipok
- Added: Examples 044-048 covering CertStore search, SCard lifecycle/status, PAdES TSA timestamps, Authenticode signing and SmartCardFailReason - AI / mLipok
- Changed: refreshed the TODO list to remove completed SCard, SmartCardFailReason, CertStore.FindCert, PAdES TSA and Authenticode items - AI / mLipok

- Changed: moved CURL, FTP, HTTP, REST, SCP, SFTP, SSH, SSH Key, SSH Tunnel, Socket/SSL/TLS, Spider, Stream, Upload and WebSocket object functions from `Chilkat.au3` to `Chilkat_TransferNetworking.au3` - AI / mLipok
- Changed: moved the public `$CHILKAT_FTP2_*` list and filter constants from `Chilkat.au3` to `Chilkat_TransferNetworking.au3` - AI / mLipok
- Changed: `Chilkat.au3` now includes `Chilkat_TransferNetworking.au3` as part of the primary single-file entry point - AI / mLipok
- Added: Function: `_Chilkat_HTTPCURL_ObjCreate()` for creating the Chilkat 11 HttpCurl object through the existing object metadata wrapper - AI / mLipok

- Changed: moved ASN.1, Base64-related CkString/StringBuilder support, CSV, HTML-to-XML/Text, JSON, Markdown and XML functions from `Chilkat.au3` to `Chilkat_DataFormats.au3` - AI / mLipok
- Added: Functions: `_Chilkat_Base64_EncodeString()`, `_Chilkat_Base64_DecodeString()` and `_Chilkat_Markdown_ToHtml()` - AI / mLipok
- Changed: moved NTLM, OAuth1 and OAuth2 object functions from `Chilkat.au3` to `Chilkat_Authentication.au3` - AI / mLipok
- Added: Functions: `_Chilkat_OIDC_Discover_AsJson()` and `_Chilkat_OIDC_UserInfo_AsJson()` - AI / mLipok
- Changed: moved AuthAws, AuthAzureAD, AuthAzureSAS and AuthAzureStorage object functions from `Chilkat.au3` to `Chilkat_CloudStorage.au3` - AI / mLipok
- Added: generic cloud-storage JSON REST support and Amazon S3 create/configure, upload, download, delete and list wrappers - AI / mLipok
- Changed: moved AuthGoogle object functions from `Chilkat.au3` to `Chilkat_Google.au3` - AI / mLipok
- Added: generic Google API CRUD wrappers plus Calendar event CRUD, Sheets value CRUD, Tasks CRUD, Cloud SQL instance CRUD and Firebase CRUD helpers - AI / mLipok
- Added: Function: `_Chilkat_Base64_DecodeString()` - AI / mLipok
- Added: Function: `_Chilkat_Base64_EncodeString()` - AI / mLipok
- Added: Function: `_Chilkat_CloudStorage_Request_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_Firebase_Create_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_Firebase_Delete()` - AI / mLipok
- Added: Function: `_Chilkat_Firebase_Read_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_Firebase_Update_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleAPI_Create_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleAPI_Delete()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleAPI_Read_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleAPI_Update_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCalendar_CreateEvent_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCalendar_DeleteEvent()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCalendar_ListEvents_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCalendar_ReadEvent_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCalendar_UpdateEvent_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCloudSQL_CreateInstance_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCloudSQL_DeleteInstance()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCloudSQL_ListInstances_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCloudSQL_ReadInstance_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleCloudSQL_UpdateInstance_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleSheets_CreateSpreadsheet_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleSheets_CreateValues_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleSheets_DeleteValues_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleSheets_ReadSpreadsheet_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleSheets_ReadValues_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleSheets_UpdateValues_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleTasks_CreateTask_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleTasks_DeleteTask()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleTasks_ListTasks_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleTasks_ReadTask_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_GoogleTasks_UpdateTask_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_HTTP_Request_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_HTTP_UrlEncode()` - AI / mLipok
- Added: Function: `_Chilkat_Markdown_ToHtml()` - AI / mLipok
- Added: Function: `_Chilkat_OIDC_Discover_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_OIDC_UserInfo_AsJson()` - AI / mLipok
- Added: Function: `_Chilkat_S3_CreateHttp()` - AI / mLipok
- Added: Function: `_Chilkat_S3_DeleteObject()` - AI / mLipok
- Added: Function: `_Chilkat_S3_DownloadFile()` - AI / mLipok
- Added: Function: `_Chilkat_S3_ListBucketObjects_AsXml()` - AI / mLipok
- Added: Function: `_Chilkat_S3_UploadFile()` - AI / mLipok
- Added: shared `_Chilkat_HTTP_Request_AsJson()` and `_Chilkat_HTTP_UrlEncode()` helpers with Chilkat 10 and 11 compatibility paths - AI / mLipok
- Added: Examples 040-043 for data formats, OIDC discovery, Google CRUD and S3 cloud storage - AI / mLipok
- Added: Function: `_Chilkat_JWT_ExtractBearerToken()` - extracts a compact JWT from a raw token, `Bearer` value, or complete `Authorization: Bearer` header and validates the three-part compact structure - AI / mLipok
- Added: Function: `_Chilkat_JWT_DecodeHeader_AsJson()` - decodes the JOSE header through Chilkat `Jwt.GetHeader()` and returns a Chilkat JsonObject - AI / mLipok
- Added: Function: `_Chilkat_JWT_DecodePayload_AsJson()` - decodes the claims payload through Chilkat `Jwt.GetPayload()` and returns a Chilkat JsonObject - AI / mLipok
- Added: Function: `_Chilkat_JWT_DecodeToken_AsJson()` - returns a combined decoded header/payload object with explicit flags showing that the signature was not verified - AI / mLipok
- Added: `Chilkat_Example_049_JWT_DecodeBearerToken.au3` for decoding an `Authorization: Bearer` JWT while preserving the distinction between decoding and verification - AI / mLipok
- Changed: Function: `_Chilkat_Csr_GeneratePemFile()` now supports optional State/Province (`ST`) and Locality (`L`) subject fields while preserving existing positional calls by appending the new parameters - AI / mLipok
- Changed: `Chilkat_Example_038_PEM_GENERATOR.au3` now provides `ST` and `L` inputs for generated PKCS#10 certificate signing requests - AI / mLipok
- Added: Example 038 automatically reloads each generated CSR, verifies its signature, compares the Subject DN and requested DNS SAN, and displays the verification summary in a MsgBox without adding verification controls to the GUI - AI / mLipok
- Fixed: removed redundant blank lines before the JWT entries in the current release notes - AI / mLipok
- Added: smart-card certificate listing as a native AutoIt array containing certificate name, issuer, serial number, validity dates, fingerprint, key usage and qualification metadata - AI / mLipok
- Added: interactive ListView-based selection of a valid smart-card certificate, with the selected certificate identified by its full SHA-1 fingerprint - AI / mLipok
- Changed: smart-card PIN prompts now display a readable summary of the selected certificate before requesting the PIN - AI / mLipok
- Changed: _Example_36_PDF_PAdES_Binary() now uses interactive smart-card certificate selection before PAdES signing - AI / mLipok

## v0.2.11 — 2026/07/09

- Changed: grouped Chilkat object functions into dedicated #Region blocks by object prefix - AI / mLipok
- Added: missing _Chilkat_*_ObjCreate() wrapper functions based on ChilkatConstants.au3 object metadata - AI / mLipok
- Added: ObjCreate() Remarks documenting Chilkat object introduction versions where available in the Chilkat ActiveX refdoc - AI / mLipok
- Added: Registration-Free COM / SxS comments for CLSID/IID/DLL-handle object creation and clarified registered ProgID fallback logging - AI / mLipok
- Changed: SmartCard certificate loading can reject expired or not-yet-valid certificates when selecting a certificate for signing - AI / mLipok

## v0.2.10 — 2026/07/07

- Changed: FTP2 ListPattern/$sMask usage note moved from parameter description to Remarks - AI / mLipok

## v0.2.9 — 2026/07/07

- Changed: FTP2 directory listing helper renamed to _Chilkat_FTP2_ListDirectoryItems_AsArray() - AI / mLipok
- Added: FTP2 directory listing filters for files, directories, symbolic links, recursion, sorting and path output mode - AI / mLipok
- Added: FTP2 convenience wrappers for files-only, directories-only and recursive directory item listings - AI / mLipok

## v0.2.8 — 2026/07/07

- Changed: ZIP array listing helpers renamed to ListEntriesFromFile/Object/Binary for clearer English API naming - AI / mLipok

## v0.2.7 — 2026/07/07

- Changed: ZIP listing helpers now return native AutoIt arrays; obsolete ZIP AsXml listing wrappers removed - AI / mLipok
- Added: FTP2 directory listing helper returning a native AutoIt array instead of XML/JSON - AI / mLipok
- Added: PC/SC and PKCS11 discovery helpers returning arrays for readers/slots/tokens - AI / mLipok
- Added: PKCS11 certificate listing helpers returning arrays, including private-key filtering and certificate metadata - AI / mLipok
- Added: Certificate helper functions for qualified-policy detection and validity date checks - AI / mLipok

## v0.2.6 — 2026/07/07

- Added: BinData helpers for AutoIt binary Variant <-> Chilkat BinData conversion - AI / mLipok
- Added: ZIP in-memory helpers for Binary -> Zip object -> Binary workflows, listing, deleting, extracting and adding entries without filesystem files - AI / mLipok
- Added: FTP2 binary/BinData upload and download helpers plus direct FTP ZIP object transfer helpers - AI / mLipok
- Added: PAdES signing and aggregate verification helpers for binary PDF data, returning signed PDF bytes - AI / mLipok
- Added: XAdES-BES signing and verification helpers for external binary references and binary XAdES XML data - AI / mLipok

## v0.2.5 — 2026/07/07

- Added: ProgID fallback object creators for Pkcs11, SCard, ScMinidriver, XmlDSig, XmlDSigGen and PrivateKey - AI / mLipok
- Added: ZIP helpers for creating archives from patterns, encrypted ZIP, opening, appending, extracting and listing entries - AI / mLipok
- Added: FTP2 helpers for connect, upload, download, change directory and disconnect - AI / mLipok
- Added: PKCS11 and smart-card helpers for loading signing certificates and private-key capable certificate discovery - AI / mLipok
- Added: PAdES PDF signing helpers for Cert, SmartCard and PKCS11 plus aggregate PDF signature verification - AI / mLipok
- Added: XAdES-BES external-file signing helpers for Cert, SmartCard and PKCS11 plus XAdES verification helpers - AI / mLipok

## v0.2.4 — 2026/06/07

- Added: headers suplemented by AI - ChatGPT / mLipok

## v0.1.4 — 2026/06/06

- Added: support for $CHILKATOBJ_VERSION_10 - mLipok
- Added: Enums: $CHILKAT_ERR_FAILURE - mean when Chilkat object functions returns 0 - mLipok
- Added: Enums: $CHILKAT_ERR_UNKNOWN -  - mLipok
- Added: Enums: $CHILKAT_ERR_NOTFOUND -  - mLipok
- Added: $__g_sChilkat_LastCOMError - mLipok
- Added: Function: _Chilkat_EMAIL_ObjCreate() - mLipok
- Added: Function: _Chilkat_SFTP_ObjCreate() - mLipok
- Added: Function: _Chilkat_SFTPDIR_ObjCreate() - mLipok
- Added: Function: _Chilkat_SFTPFILE_ObjCreate() - mLipok
- Added: Function: _Chilkat_SCP_ObjCreate() - mLipok
- Added: Function: _Chilkat_ZIPCRC_ObjCreate() - mLipok
- Added: Function: _Chilkat_ZIPENTRY_ObjCreate() - mLipok
- Added: Function: _Chilkat_MAILBOXES_ObjCreate() - mLipok
- Added: Function: _Chilkat_HTTP_ObjCreate() - mLipok
- Added: Function: _Chilkat_BINDATA_ObjCreate() - mLipok
- Added: Function: __Chilkat_ObjCreate_Wrapper() - mLipok
- Added: Function: _Chilkat_IsAtLeastThisVersion() - mLipok
- Added: Function: _Chilkat_ObjName_FlagsValue() - mLipok
- Added: Function: _Chilkat_LogWrapper() - mLipok
- Added: Function: __Chilkat_Log() - mLipok
- Added: Function: _Chilkat_StringTable_ObjCreate() - mLipok
- Added: Function: _Chilkat_TASK_ObjCreate() - mLipok
- Added: Function: _Chilkat_TASKCHAIN_ObjCreate() - mLipok
- Added: Function: _Chilkat_Cert_ObjCreate() - mLipok
- Added: Function: _Chilkat_Cert_LoadFromSmartCard() - mLipok
- Added: Function: _Chilkat_Cert_ValidateSmartCard_PIN() - mLipok
- Added: Function: _Chilkat_CertStore_ObjCreate() - mLipok
- Added: Function: _Chilkat_Csp_ObjCreate() - mLipok
- Added: Function: _Chilkat_Csp_GetProvidersList() - mLipok
- Added: Function: _Chilkat_Csp_FindCertificate_OnSmartCard_InReader() - mLipok
- Added: Function: _Chilkat_Pdf_ObjCreate() - mLipok
- Added: Function: _Chilkat_PDF_Sign() - mLipok
- Added: Function: _Chilkat_PDF_VerifySignature() - mLipok
- Added: Function: _Chilkat_PDF_GetDSS() - mLipok
- Added: Function: _Chilkat_IMAP_GetSentMailboxName() - mLipok
- Refactored: Function: all _Chilkat_XXX_ObjCreate() use __Chilkat_ObjCreate_Wrapper() - mLipok
- Renamed: Function: _ErrorLog_ChilkatWrapper() >> _Chilkat_ErrorLogWrapper() - mLipok - !!! SCRIPT BREAKING CHANGES !!!
- Renamed: Function: __ErrorLog_Chilkat() >> __Chilkat_LogOnError() - mLipok - !!! COULD BE SCRIPT BREAKING CHANGES !!!
- Changed: Function: _Chilkat_ErrorLogWrapper() store/restore @error/@extednded - mLipok
- Changed: Function: _Chilkat_EMAIL_SendSingleMail() better error checking - mLipok
- Changed: Function: _COM_Error_Handler__for_Chilkat()  >>>>>>__Internal_COM_ERROR_HANDLER__for_Chilkat() - mLipok
- Changed: Function: _Chilkat_ObjName_FlagsValue()  preserves @error @extended - mLipok
- Changed: in many places __Chilkat_LogOnError() >> __Chilkat_Log() - mLipok
- Added: Parameter: $bEnableQuotes to function: _Chilkat_CSV_StringToArray() - mLipok
- Added: IFNC to ConsoleWrite() messages - mLipok
- Added: IFNC to __Chilkat_LogOnError() messages - mLipok
- Added: __Chilkat_ConsoleWrite_IFNC() - mLipok
- Added: Examples: _Example_24_Simple_SMTP_Send() - mLipok
- Added: Examples: _Example_25_Simple_IMAP_List_MailBoxes() - mLipok
- Added: Examples: _Example_26_ZIP() - mLipok
- Added: Examples: _Example_27_DownloadBdAsync() - mLipok

## v0.1.3 — 2017/11/12

- Added: Function: _Chilkat_ATOM_ObjCreate() - mLipok
- Added: Function: _Chilkat_CKSTRING_ObjCreate() - mLipok
- Added: Function: _Chilkat_EMAIL_ObjCreate() - mLipok
- Added: Function: _Chilkat_IMAP_ObjCreate() - mLipok
- Added: Function: _Chilkat_MAILMAN_ObjCreate() - mLipok
- Added: Function: _Chilkat_StringBuilder_ObjCreate() - mLipok
- Added: Function: _Chilkat_ZIP_ObjCreate() - mLipok
- Added: Function: _Chilkat_JSON_StringPretty() - mLipok
- Added: New Examples - mLipok

## v0.1.2 — 2017/02/08

- Chnaged: few refactoring - mLipok
- Added: Function: _Chilkat_CSV_StringToArray() - mLipok
- Added: Function: _Chilkat_JSON_ObjFromString() - mLipok
- Added: Function: _Chilkat_JSON_ObjToString() - mLipok
- Added: $CHILKATOBJ_API - modest beginning for support to create object for future Chilkat Component version - mLipok

## v0.1.1 — 2017/02/01

- First official version - mLipok

## References

- https://www.chilkatsoft.com/refdoc/xChilkatJsonObjectRef.html
