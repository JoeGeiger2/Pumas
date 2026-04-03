@echo off
chcp 65001 >nul

:: ============================================================
:: generate_all.bat - Senior Golfer Webseite
::
:: Ruft die generate.bat in allen 5 Unterordnern auf und
:: aktualisiert damit alle index.html auf einmal.
::
:: Diese Datei liegt im Hauptordner (neben index.html).
:: ============================================================

set "MAINDIR=%~dp0"
if "%MAINDIR:~-1%"=="\" set "MAINDIR=%MAINDIR:~0,-1%"

echo.
echo  Senior Golfer - Alle Verzeichnisse aktualisieren
echo  ==================================================
echo.

set "ERRORS=0"

:: Saison 2026
if exist "%MAINDIR%\saison2026\generate.bat" (
    echo  [1/5] Saison 2026 ...
    call "%MAINDIR%\saison2026\generate.bat"
    echo  OK
) else (
    echo  [1/5] FEHLER: saison2026\generate.bat nicht gefunden!
    set /a ERRORS+=1
)

:: Startlisten
if exist "%MAINDIR%\startlisten\generate.bat" (
    echo  [2/5] Startlisten ...
    call "%MAINDIR%\startlisten\generate.bat"
    echo  OK
) else (
    echo  [2/5] FEHLER: startlisten\generate.bat nicht gefunden!
    set /a ERRORS+=1
)

:: Ergebnisse
if exist "%MAINDIR%\ergebnisse\generate.bat" (
    echo  [3/5] Ergebnisse ...
    call "%MAINDIR%\ergebnisse\generate.bat"
    echo  OK
) else (
    echo  [3/5] FEHLER: ergebnisse\generate.bat nicht gefunden!
    set /a ERRORS+=1
)

:: Fotos
if exist "%MAINDIR%\fotos\generate.bat" (
    echo  [4/5] Fotos ...
    call "%MAINDIR%\fotos\generate.bat"
    echo  OK
) else (
    echo  [4/5] FEHLER: fotos\generate.bat nicht gefunden!
    set /a ERRORS+=1
)

:: Sonstiges
if exist "%MAINDIR%\sonstiges\generate.bat" (
    echo  [5/5] Sonstiges ...
    call "%MAINDIR%\sonstiges\generate.bat"
    echo  OK
) else (
    echo  [5/5] FEHLER: sonstiges\generate.bat nicht gefunden!
    set /a ERRORS+=1
)

echo.
if %ERRORS%==0 (
    echo  Alle 5 Verzeichnisse erfolgreich aktualisiert!
) else (
    echo  Fertig mit %ERRORS% Fehler(n^). Bitte pruefen!
)
echo.
echo  Nicht vergessen: In GitHub Desktop committen und pushen!
echo.
pause
