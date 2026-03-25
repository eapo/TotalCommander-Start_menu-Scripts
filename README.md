# TotalCommander-Start_menu-Scripts

## png2webppath
Add `cwebp` path to `%PATH%`:
```console
setx /M PATH "%PATH%;C:\Your\Directory\Path"
```
### Required
Getting _cwebp_, _dwebp_, and the _WebP_ Libraries from Google: https://developers.google.com/speed/webp/docs/precompiled

### Setup
- TotalCommander > Start > Change start menu > Add item:
   - Command: `cmd.exe /c D:\dir\to\png2webp.bat`
   - Parameter: `?%P %P%S`
