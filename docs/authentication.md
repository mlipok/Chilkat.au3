# Authentication

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_Authentication.au3` contains protocol-level authentication and identity-provider support.

## NTLM

The existing `Ntlm` object creator remains available under the same public name and can be used by callers that need direct NTLM message generation or parsing.

## OAuth1

The existing `OAuth1` object creator was moved without changing its public API.

## OAuth2

The existing `OAuth2` object creator remains the basis for browser-based authorization flows, local callback handling, authorization-code exchange, and access-token acquisition.

## OpenID Connect

### `_Chilkat_OIDC_Discover_AsJson()`

Normalizes an issuer URL and downloads its `/.well-known/openid-configuration` document.

### `_Chilkat_OIDC_UserInfo_AsJson()`

Calls the provider's UserInfo endpoint with an OAuth2 bearer token.

The caller remains responsible for validating issuer identity, state, nonce, token signatures, claims, and required scopes according to the application's security model.

## Example

`Examples/Chilkat_Example_041_OIDC_Discovery.au3` demonstrates discovery without embedding provider credentials.
