@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: generate.bat - Senior Golfer Webseite
:: Diese .bat in den Unterordner kopieren und per Doppelklick starten.
:: Sie erkennt automatisch den Ordner, liest alle PDF/JPG ein
:: und erstellt die index.html.

:: Eigenen Ordner bestimmen
set "MYDIR=%~dp0"
if "%MYDIR:~-1%"=="\" set "MYDIR=%MYDIR:~0,-1%"
for %%F in ("%MYDIR%") do set "DIR=%%~nxF"
set "OUTFILE=%MYDIR%\index.html"

echo.
echo Senior Golfer - Index-Generator
echo ================================
echo Ordner erkannt: %DIR%
echo.

:: Icon, Titel und Untertitel je Verzeichnis
if /i "%DIR%"=="saison2026"  set "ICON=&#128197;" & set "TITLE=Saison 2026"  & set "SUB=Dokumente &amp; Informationen zur Saison"
if /i "%DIR%"=="startlisten" set "ICON=&#128203;" & set "TITLE=Startlisten"  & set "SUB=Aktuelle Startlisten als PDF"
if /i "%DIR%"=="ergebnisse"  set "ICON=&#127942;" & set "TITLE=Ergebnisse"   & set "SUB=Turnierergebnisse als PDF"
if /i "%DIR%"=="fotos"       set "ICON=&#128247;" & set "TITLE=Fotos"        & set "SUB=Bilder aus dem Clubgeschehen"
if /i "%DIR%"=="sonstiges"   set "ICON=&#128193;" & set "TITLE=Sonstiges"    & set "SUB=Weitere Dokumente als PDF"

if not defined TITLE (
    echo FEHLER: Ordner "%DIR%" ist unbekannt.
    echo Erlaubt: saison2026, startlisten, ergebnisse, fotos, sonstiges
    echo.
    pause
    exit /b 1
)

:: Alle PDF und JPG Dateien einlesen
set "COUNT=0"
set "TMPFILE=%MYDIR%\_filelist_tmp.txt"
if exist "%TMPFILE%" del "%TMPFILE%"

for %%F in ("%MYDIR%\*.pdf" "%MYDIR%\*.PDF") do (
    echo %%~nxF|PDF|background:linear-gradient(135deg,#c0392b,#e74c3c^) >> "%TMPFILE%"
    set /a COUNT+=1
)
for %%F in ("%MYDIR%\*.jpg" "%MYDIR%\*.JPG" "%MYDIR%\*.jpeg" "%MYDIR%\*.JPEG") do (
    echo %%~nxF|JPG|background:linear-gradient(135deg,#1a6b8a,#2196b0^) >> "%TMPFILE%"
    set /a COUNT+=1
)

echo Gefundene Dateien: %COUNT%
echo.
echo Schreibe index.html ...

:: HTML Kopf schreiben
(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>%TITLE% - Senior Golfer^</title^>
echo   ^<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700^&family=Source+Sans+3:wght@300;400;600^&display=swap" rel="stylesheet"^>
echo   ^<style^>
echo     *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
echo     :root {
echo       --green-dark: #1a3d2b; --green-mid: #2d6a4f; --green-light: #52b788;
echo       --gold: #c9a84c; --gold-light: #e9c46a;
echo       --cream: #faf7f2; --text: #1e1e1e; --text-light: #5a5a5a;
echo       --shadow: 0 4px 24px rgba(26,61,43,0.13^);
echo     }
echo     body { font-family: 'Source Sans 3', sans-serif; background: var(--cream^); color: var(--text^); min-height: 100vh; }
echo     header { background: var(--green-dark^); }
echo     header::after { content: ''; display: block; height: 4px; background: linear-gradient(90deg, var(--gold^), var(--gold-light^), var(--gold^)^); }
echo     .header-inner { max-width: 800px; margin: 0 auto; padding: 1.5rem 1.5rem 1.4rem; }
echo     .back-link {
echo       display: inline-flex; align-items: center; gap: 0.4rem;
echo       font-size: 0.83rem; font-weight: 600; color: var(--gold-light^);
echo       text-decoration: none; letter-spacing: 0.04em; opacity: 0.85; transition: opacity 0.15s; margin-bottom: 1rem;
echo     }
echo     .back-link:hover { opacity: 1; }
echo     .header-top { display: flex; align-items: center; gap: 0.9rem; }
echo     .header-icon {
echo       width: 46px; height: 46px; border-radius: 11px; flex-shrink: 0;
echo       background: linear-gradient(135deg, var(--green-mid^), var(--green-light^)^);
echo       display: flex; align-items: center; justify-content: center; font-size: 1.4rem;
echo     }
echo     h1 { font-family: 'Playfair Display', serif; font-size: clamp(1.4rem, 5vw, 1.9rem^); font-weight: 700; color: #fff; line-height: 1.2; }
echo     .header-sub { font-size: 0.82rem; color: rgba(255,255,255,0.55^); font-weight: 300; margin-top: 0.2rem; }
echo     main { max-width: 800px; margin: 1.8rem auto 3rem; padding: 0 1rem; }
echo     .section-label { font-size: 0.72rem; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase; color: var(--green-mid^); margin-bottom: 0.8rem; padding-left: 0.2rem; }
echo     .file-list { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
echo     .file-item a {
echo       display: flex; align-items: center; gap: 1rem;
echo       background: #fff; border: 1px solid #e8e2d8; border-radius: 10px;
echo       padding: 1rem 1.2rem; text-decoration: none; color: var(--text^);
echo       box-shadow: var(--shadow^); transition: transform 0.15s, box-shadow 0.15s, border-color 0.15s;
echo     }
echo     .file-item a:hover { transform: translateX(4px^); box-shadow: 0 6px 28px rgba(26,61,43,0.15^); border-color: var(--green-light^); }
echo     .file-item a:active { transform: translateX(0^); }
echo     .file-type-badge {
echo       flex-shrink: 0; width: 38px; height: 38px; border-radius: 8px;
echo       display: flex; align-items: center; justify-content: center;
echo       font-size: 0.65rem; font-weight: 700; color: #fff; letter-spacing: 0.05em;
echo     }
echo     .file-name { font-size: 0.97rem; font-weight: 600; color: var(--green-dark^); flex: 1; }
echo     .file-arrow { color: var(--green-mid^); font-size: 1rem; opacity: 0.5; }
echo     footer { text-align: center; padding: 1.5rem 1rem 2rem; font-size: 0.78rem; color: var(--text-light^); border-top: 1px solid #e8e2d8; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo.
echo ^<header^>
echo   ^<div class="header-inner"^>
echo     ^<a class="back-link" href="../index.html"^>^&larr; Zuruck zur Ubersicht^</a^>
echo     ^<div class="header-top"^>
echo       ^<div class="header-icon"^>%ICON%^</div^>
echo       ^<div^>
echo         ^<h1^>%TITLE%^</h1^>
echo         ^<div class="header-sub"^>%SUB%^</div^>
echo       ^</div^>
echo     ^</div^>
echo   ^</div^>
echo ^</header^>
echo.
echo ^<main^>
echo   ^<p class="section-label"^>Dateien^</p^>
echo   ^<ul class="file-list"^>
) > "%OUTFILE%"

:: Dateieintraege schreiben
if %COUNT%==0 (
    echo     ^<li style="padding:2rem 1rem;text-align:center;color:#5a5a5a;"^>Noch keine Dateien vorhanden.^</li^> >> "%OUTFILE%"
) else (
    for /f "usebackq tokens=1,2,3 delims=|" %%A in ("%TMPFILE%") do (
        (
        echo     ^<li class="file-item"^>
        echo       ^<a href="%%A" target="_blank"^>
        echo         ^<div class="file-type-badge" style="%%C"^>%%B^</div^>
        echo         ^<span class="file-name"^>%%A^</span^>
        echo         ^<span class="file-arrow"^>^&nearr;^</span^>
        echo       ^</a^>
        echo     ^</li^>
        ) >> "%OUTFILE%"
    )
)

:: HTML abschliessen
(
echo   ^</ul^>
echo ^</main^>
echo.
echo ^<footer^>
echo   ^&copy; 2026 ^&middot; Senior Golfer
echo ^</footer^>
echo.
echo ^</body^>
echo ^</html^>
) >> "%OUTFILE%"

if exist "%TMPFILE%" del "%TMPFILE%"

echo.
echo Fertig! index.html wurde mit %COUNT% Datei(en^) erstellt.
echo.
echo Nicht vergessen: In GitHub Desktop committen und pushen!
echo.
pause
endlocal
