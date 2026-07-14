# Google APIs and CRUD

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_Google.au3` contains `AuthGoogle`, Firebase support, a common authenticated REST layer, and standard CRUD functions for selected Google services.

## Common Google API CRUD

- `_Chilkat_GoogleAPI_Create_AsJson()` — POST
- `_Chilkat_GoogleAPI_Read_AsJson()` — GET
- `_Chilkat_GoogleAPI_Update_AsJson()` — PATCH or PUT
- `_Chilkat_GoogleAPI_Delete()` — DELETE

Callers provide a complete endpoint URL, OAuth2 bearer access token, and JSON request body where required.

## Google Calendar

The Calendar wrappers create, read, patch/update, delete, and list events. Calendar and event identifiers are URL-encoded by the UDF.

## Google Sheets

Value-level CRUD is mapped as follows:

- Create — append values to a range;
- Read — get a range;
- Update — update a range with PUT;
- Delete — clear a range.

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

## Authorization

Access tokens must include the scopes required by each API. API enablement, IAM roles, OAuth consent configuration, and resource ownership remain external to this UDF.

## Example

`Examples/Chilkat_Example_042_Google_CRUD.au3` demonstrates non-destructive read operations and shows the JSON objects required by create/update calls without executing destructive operations when identifiers are placeholders.
