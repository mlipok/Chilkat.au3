# Object creation and deployment

## Supported object creation paths

The UDF supports two object creation models.

### Registered COM

The registered path uses a Chilkat ActiveX ProgID. For Chilkat 10 and newer, the expected pattern is:

```text
Chilkat.<ObjectName>.<MajorVersion>
```

Examples include:

```text
Chilkat.Http.10
Chilkat.BinData.10
Chilkat.Pdf.10
```

The legacy 9.5 metadata retains the `Chilkat_9_5_0.<ObjectName>` naming scheme.

### Registration-Free COM / SxS

The DLL-based path creates objects from a loaded ActiveX DLL using:

- a DLL handle;
- the object's CLSID;
- the object's IID;
- metadata stored in `ChilkatConstants.au3`.

Use `_Chilkat_StartUp()` to load and initialize the selected DLL before creating objects through this path.

## Object metadata

`ChilkatConstants.au3` defines:

- `$CHILKATOBJ_VERSION_*` selectors;
- `$CHILKATOBJ_NAME_*` object indexes;
- `$CHILKATOBJ_ID_PROGID`, `$CHILKATOBJ_ID_CLSID`, and `$CHILKATOBJ_ID_IID`;
- the `$CHILKATOBJ_API` metadata array.

The object creator wrappers call the shared `__Chilkat_ObjCreate_Wrapper()` infrastructure. Missing or incorrect metadata can prevent both registration-free creation and registered ProgID fallback.

## Architecture compatibility

The AutoIt process and Chilkat ActiveX component must use the same architecture:

- 32-bit AutoIt requires a 32-bit Chilkat ActiveX DLL or registration.
- 64-bit AutoIt requires a 64-bit Chilkat ActiveX DLL or registration.

A component registered for the opposite architecture is not a valid fallback.

## Deployment checklist

- Include all UDF module files.
- Include the correct Chilkat DLL when using Registration-Free COM.
- Confirm the selected `$CHILKATOBJ_VERSION_*` metadata.
- Confirm AutoIt and DLL architecture.
- Keep license/unlock data outside committed source code.
- Verify that every used Chilkat object has ProgID/CLSID/IID metadata for the selected version.
- Test object creation on a clean target system, not only on the development machine.

## Version-dependent APIs

Some Chilkat 11 methods differ from Chilkat 10. The UDF uses `_Chilkat_IsAtLeastThisVersion()` for compatibility branches, for example in RSA key generation and PEM enumeration.

Do not infer method availability only from the selected metadata constant. Confirm the actual loaded or registered Chilkat component version.

## Security

Treat DLL paths, unlock codes, private keys, PINs, passwords, and certificate containers as secrets or security-sensitive deployment inputs. Do not write them to diagnostic logs unless the environment is controlled and the output is protected.
