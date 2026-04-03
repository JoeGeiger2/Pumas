@echo off
chcp 65001 >nul

echo.
echo  Graue Pumas - Alle Verzeichnisse aktualisieren
echo  ================================================
echo.

cscript //nologo "%~dp0generate_all.vbs"

echo.
echo  Alle 5 Verzeichnisse aktualisiert!
echo  Bitte in GitHub Desktop committen und pushen!
echo.
pause
