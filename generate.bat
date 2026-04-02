@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: ============================================================
:: generate.bat  –  Senior Golfer Webseite
::
:: Aufruf:
::   generate.bat <verzeichnis> "Datei1" "Datei2" ...
::
:: Beispiele:
::   generate.bat saison2026 "Terminplan 2026.pdf" "Spielordnung.pdf"
::   generate.bat startlisten "Startliste 01.06.2026.pdf"
::   generate.bat ergebnisse "Ergebnis Senioren Cup.pdf" "Ergebnis Juni.pdf"
::   generate.bat fotos "Turnier Mai.jpg" "Sommerfest 2026.jpg"
::
:: Erlaubte Verzeichnisse: saison2026, startlisten, ergebnisse, fotos
:: Dateitypen:  PDF-Dateien  →  roter Badge
::              JPG-Dateien  →  blauer Badge
:: ============================================================

:: ── Parameter prüfen ────────────────────────────────────────
if "%~1"=="" (
    echo.
    echo  FEHLER: Kein Verzeichnis angegeben.
    echo.
    echo  Aufruf:  generate.bat ^<verzeichnis^> "Datei1" "Datei2" ...
    echo  Beispiel: generate.bat saison2026 "Terminplan 2026.pdf"
    echo.
    pause
    exit /b 1
)

set "DIR=%~1"
set "OUTFILE=%DIR%\index.html"

:: ── Verzeichnis prüfen ──────────────────────────────────────
if not exist "%DIR%\" (
    echo.
    echo  FEHLER: Verzeichnis "%DIR%" nicht gefunden.
    echo  Bitte erst anlegen oder Namen prüfen.
    echo.
    pause
    exit /b 1
)

:: ── Icon, Titel und Untertitel je Verzeichnis ───────────────
if /i "%DIR%"=="saison2026"  set "ICON=📅" & set "TITLE=Saison 2026"  & set "SUB=Dokumente ^&amp; Informationen zur Saison"
if /i "%DIR%"=="startlisten" set "ICON=📋" & set "TITLE=Startlisten"  & set "SUB=Aktuelle Startlisten als PDF"
if /i "%DIR%"=="ergebnisse"  set "ICON=🏆" & set "TITLE=Ergebnisse"   & set "SUB=Turnierergebnisse als PDF"
if /i "%DIR%"=="fotos"       set "ICON=📷" & set "TITLE=Fotos"        & set "SUB=Bilder aus dem Clubgeschehen"
if /i "%DIR%"=="sonstiges"   set "ICON=📁" & set "TITLE=Sonstiges"    & set "SUB=Weitere Dokumente als PDF"

if not defined TITLE (
    echo.
    echo  FEHLER: Unbekanntes Verzeichnis "%DIR%".
    echo  Erlaubt: saison2026 ^| startlisten ^| ergebnisse ^| fotos ^| sonstiges
    echo.
    pause
    exit /b 1
)

:: ── Dateien ab Parameter 2 sammeln ──────────────────────────
set "ITEMS="
set "COUNT=0"
shift
:collect
if "%~1"=="" goto build
set /a COUNT+=1
set "FNAME=%~1"

:: Dateiendung ermitteln (letzten 4 Zeichen)
set "EXT=%FNAME:~-4%"
set "EXT_UP=%EXT%"
for %%A in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    call set "EXT_UP=%%EXT_UP:%%A=%%A%%"
)
:: Einfachere Endungs-Erkennung via Fallunterscheidung
echo %FNAME% | findstr /i "\.pdf$" >nul && set "FTYPE=PDF" && set "BADGE_COLOR=background:linear-gradient(135deg,#c0392b,#e74c3c)"
echo %FNAME% | findstr /i "\.jpg$" >nul && set "FTYPE=JPG" && set "BADGE_COLOR=background:linear-gradient(135deg,#1a6b8a,#2196b0)"
echo %FNAME% | findstr /i "\.jpeg$" >nul && set "FTYPE=JPG" && set "BADGE_COLOR=background:linear-gradient(135deg,#1a6b8a,#2196b0)"

set "ITEMS=!ITEMS!    <li class="file-item">^

      <a href="%FNAME%" target="_blank">^

        <div class="file-type-badge" style="!BADGE_COLOR!">!FTYPE!</div>^

        <span class="file-name">%FNAME%</span>^

        <span class="file-arrow">↗</span>^

      </a>^

    </li>^

"
shift
goto collect

:build
if %COUNT%==0 (
    echo.
    echo  WARNUNG: Keine Dateien angegeben – leere Liste wird erzeugt.
    echo.
)

:: ── HTML schreiben ──────────────────────────────────────────
echo Schreibe %OUTFILE% ...

(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>%TITLE% – Senior Golfer^</title^>
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
echo     ^<a class="back-link" href="../index.html"^>← Zurück zur Übersicht^</a^>
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

:: ── Dateiliste einfügen ─────────────────────────────────────
if %COUNT%==0 (
    echo     ^<li style="padding:2rem 1rem;text-align:center;color:#5a5a5a;"^>Noch keine Dateien vorhanden.^</li^> >> "%OUTFILE%"
) else (
    for /f "tokens=*" %%L in ('echo !ITEMS!') do (
        echo %%L >> "%OUTFILE%"
    )
)

:: ── HTML abschließen ────────────────────────────────────────
(
echo   ^</ul^>
echo ^</main^>
echo.
echo ^<footer^>
echo   ^&copy; 2026 · Senior Golfer
echo ^</footer^>
echo.
echo ^</body^>
echo ^</html^>
) >> "%OUTFILE%"

echo.
echo  ✓  %OUTFILE% wurde mit %COUNT% Datei(en^) erstellt.
echo.
endlocal
