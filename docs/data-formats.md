# Data formats

<!-- AI_ASSISTED_DOCUMENTATION_NOTICE -->
> **AI-assisted documentation:** This document is developed with assistance from ChatGPT AI, reviewed by mLipok, and based on Chilkat.au3 version/tag `v0.3.0 BETA - Work in progress`.

`Chilkat_DataFormats.au3` centralizes data parsing, serialization, conversion, and textual encoding functions.

## Covered object families

- ASN.1 (`Asn`)
- Base64 and Base64URL
- CSV
- `CkString`
- HTML-to-text and HTML-to-XML
- JSON and `JsonArray`
- Markdown
- `StringBuilder`
- XML

## Added convenience functions

### `_Chilkat_Base64_EncodeString()`

Encodes a text string using a caller-selected character set and returns standard Base64 or Base64URL.

### `_Chilkat_Base64_DecodeString()`

Decodes standard Base64 or Base64URL into text using the requested character set.

### `_Chilkat_Markdown_ToHtml()`

Converts Markdown to HTML through `StringBuilder.MarkdownToHtml()`. This method requires Chilkat 11.2.0 or newer; the wrapper checks the selected component version before calling it.

## Compatibility

Previously existing CSV, JSON, XML, CkString, StringBuilder, ASN.1, and HTML conversion functions keep their public names. Only their source location changed.

## Example

`Examples/Chilkat_Example_040_DataFormats_Base64_Markdown.au3` demonstrates Base64 round-tripping and Markdown-to-HTML conversion.
