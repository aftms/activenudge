@echo off
setlocal

set "ROOT=%~dp0.."
set "FLUTTER=C:\tmp\flutter\bin\flutter.bat"
cd /d "%ROOT%"

if not exist "%FLUTTER%" (
  echo Flutter was not found at %FLUTTER%.
  exit /b 1
)

echo Running ActiveNudge static analysis...
"%FLUTTER%" analyze
