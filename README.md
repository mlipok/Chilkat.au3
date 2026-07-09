# Chilkat.au3

Chilkat.au3 is an AutoIt UDF for working with the Chilkat ActiveX components from AutoIt scripts.

This repository preserves and continues the public **Chilkat.au3 UDF** work originally published through the AutoIt community.

## Current release

Current GitHub release:

* `v0.1.4-BETA`
* https://github.com/mlipok/Chilkat.au3/releases/tag/v0.1.4-BETA

This release should be treated as a beta / work-in-progress development baseline.

## Repository contents

The repository contains:

* `Chilkat.au3` — main AutoIt UDF wrapper for Chilkat ActiveX components.
* `ChilkatConstants.au3` — constants and object metadata used by the UDF.
* `Chilkat_Examples.au3` — example scripts demonstrating selected UDF functionality.
* `Chilkat_GetObjectFlags_GENERATOR_FOR___$CHILKATOBJ_NAME_template.au3` — helper/generator template used for maintaining Chilkat object metadata.

## Requirements

To use this UDF, you need:

* AutoIt.
* Chilkat ActiveX installed and properly registered on the target system.
* A Chilkat version compatible with the selected `$CHILKATOBJ_VERSION_*` setting used by the UDF.

Useful Chilkat references:

* https://www.chilkatsoft.com/refdoc/activex.asp
* https://www.chilkatsoft.com/downloads_ActiveX.asp
* https://chilkatsoft.com/activex_dll_registration_tutorial.asp

## Status

`v0.1.4-BETA` is a development release and may include script-breaking changes compared to earlier public versions.

Known compatibility-sensitive changes include renamed internal/logging helper functions and refactoring around Chilkat object creation wrappers.

Use this release for testing, maintenance, documentation cleanup, and further development rather than as an assumed drop-in replacement without verification.

## Original AutoIt Forum references

Original AutoIt Forum topic:

* https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/

Original AutoIt Forum file download:

* https://www.autoitscript.com/forum/files/file/433-chilkat-udf

## Authors and contributors

Chilkat.au3 is maintained by mLipok and preserves the AutoIt community work and discussion related to the Chilkat.au3 UDF.

## Discussion and support

Discussion, questions, and support for this UDF can continue in the AutoIt Forum support topic:

* https://www.autoitscript.com/forum/topic/186850-chilkatau3-udf/
