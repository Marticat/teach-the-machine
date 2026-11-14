@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
 echo Install Node.js 20 or newer from https://nodejs.org then run this file again.
 pause
 exit /b 1
)
powershell -NoProfile -Command "$secret=Read-Host 'Paste Gemini API key (hidden)' -AsSecureString; $ptr=[Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret); try { $env:GEMINI_API_KEY=[Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr) } finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }; try { node server.mjs } finally { Remove-Item Env:GEMINI_API_KEY -ErrorAction SilentlyContinue }"
pause
