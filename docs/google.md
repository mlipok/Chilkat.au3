# Google APIs and CRUD

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_Google.au3` contains interactive OAuth2 and service-account authorization, `AuthGoogle`, Firebase support, a common authenticated REST layer, and standard CRUD functions for selected Google services.

## Authorization

### Interactive Google OAuth2

`_Chilkat_GoogleOAuth2_Authorize_AsJson()` starts the authorization-code flow for a public desktop client. It uses PKCE, opens the Google authorization page in the default browser, listens on the configured local port, and returns the token response as a Chilkat `JsonObject`.

`_Chilkat_GoogleOAuth2_Refresh_AsJson()` uses the saved `refresh_token` to obtain a new access token without repeating the browser flow. OAuth client data and returned tokens are sensitive configuration and must be stored below `Examples/!!!_MY_SECRET_DATA/`, which is excluded by the repository `.gitignore`.

The desktop OAuth client must be created in Google Cloud before the example can open a valid authorization page. Its public `client_id` is required; `client_secret` may remain empty for a public desktop client.

### Service account

`_Chilkat_GoogleServiceAccount_ObtainAccessToken()` obtains a bearer token from a Google service-account JSON private key. The target spreadsheet must be shared with the key's `client_email`. Viewer access is sufficient for reads; writes require Editor access.

Service-account keys must be stored below `Examples/!!!_MY_SECRET_DATA/` and must never be committed.

## Common Google API CRUD

- `_Chilkat_GoogleAPI_Create_AsJson()` — POST
- `_Chilkat_GoogleAPI_Read_AsJson()` — GET
- `_Chilkat_GoogleAPI_Update_AsJson()` — PATCH or PUT
- `_Chilkat_GoogleAPI_Delete()` — DELETE

Callers provide a complete endpoint URL, OAuth2 bearer access token, and JSON request body where required.

## Google Calendar

The Calendar wrappers create, read, patch/update, delete, and list events. Calendar and event identifiers are URL-encoded by the UDF.

## Google Sheets

Value operations are mapped as follows:

- Append — `_Chilkat_GoogleSheets_AppendValues_AsJson()`;
- Read — get a range;
- Update — update a range with PUT;
- Clear — `_Chilkat_GoogleSheets_ClearValues_AsJson()`.

`_Chilkat_GoogleSheets_CreateValues_AsJson()` and `_Chilkat_GoogleSheets_DeleteValues_AsJson()` remain available as compatibility aliases for append and clear.

Additional wrappers create a spreadsheet and read spreadsheet metadata/grid data.

## Google Tasks

The Tasks wrappers create, read, patch/update, delete, and list tasks within a task list.

## Google Cloud SQL

Cloud SQL CRUD is **administrative instance CRUD**, not row-level SQL data access:

- create an instance;
- read instance metadata;
- patch instance configuration;
- delete an instance;
- list project instances.

The wrappers use the Cloud SQL Admin API `sql/v1beta4` instance endpoints. Database row operations still require a database driver or a separate SQL connection, such as ADO with the appropriate PostgreSQL/MySQL/SQL Server driver.

## Firebase Realtime Database

Firebase wrappers create (POST), read (GET), update (PATCH), and delete data. They normalize the relative path and append the required `.json` suffix.

Access tokens must include the scopes required by each API. API enablement, IAM roles, OAuth consent configuration, and resource ownership remain external to this UDF.

## Examples

`Examples/Chilkat_Example_042_Google_CRUD.au3` demonstrates non-destructive read operations and shows the JSON objects required by create/update calls without executing destructive operations when identifiers are placeholders.

`Examples/Chilkat_Example_050_GoogleSheets_ReadWrite_GoogleOAuth2.au3` demonstrates browser-based Google authorization, secure token storage and refresh, value reads, and opt-in appending. Spreadsheet ID, ranges, write enablement, and listener port are local constants in the example. OAuth client data is read from the ignored `Examples/!!!_MY_SECRET_DATA/GoogleOAuth2_Client.json` file.

`Examples/Chilkat_Example_051_GoogleSheets_ReadWrite_ServiceAccount.au3` demonstrates unattended access with `Examples/!!!_MY_SECRET_DATA/GoogleServiceAccount.json`. It includes setup instructions and keeps write operations disabled until explicitly enabled.
