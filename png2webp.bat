@echo off
REM Getting cwebp, dwebp, and the WebP Libraries:
REM https://developers.google.com/speed/webp/docs/precompiled
REM TotalCommander > Start > 
REM  Command: cmd.exe /c D:\dir\to\png2webp.bat
REM  Parameter: ?%P %P%S
setlocal enabledelayedexpansion
set "dir=%~1"
if "%dir%"=="" set "dir=%CD%"
if not exist "%dir%\" set "dir=%CD%"
set "dir=%dir%\"
shift

set /p input="Quality for all PNGs (80/lossless)? "
set mode=80
if /i "%input%"=="lossless" set mode=lossless

set count=0
set success=0
:loop
if "%~1"=="" goto endloop
set /a count+=1
set "file=%~1"
set "name=%~n1"
set "outfile=%dir%!name!.webp"
echo Converting: !name!
if /i "%mode%"=="lossless" (
  cwebp -lossless "!file!" -o "!outfile!"
) else (
  cwebp -q %mode% "!file!" -o "!outfile!"
)
if exist "!outfile!" (
  set /a success+=1
  echo SUCCESS: !name!.webp
) else (
  echo FAILED: !name! (unsupported or error)
)
shift
goto loop
:endloop
echo Processed %count% files, %success% WebPs in %dir%
pause
