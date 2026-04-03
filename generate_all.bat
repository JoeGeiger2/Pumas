@echo off
chcp 65001 >nul

set "MAINDIR=%~dp0"
if "%MAINDIR:~-1%"=="\" set "MAINDIR=%MAINDIR:~0,-1%"

echo.
echo  Graue Pumas - Alle Verzeichnisse aktualisieren
echo  ================================================
echo.

echo  [1/5] Saison 2026 ...
set "OUT=%MAINDIR%\saison2026\index.html"

(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>Saison 2026 - Graue Pumas^</title^>
echo   ^<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700^&amp;family=Source+Sans+3:wght@300;400;600^&amp;display=swap" rel="stylesheet"^>
echo   ^<style^>
echo     *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
echo     body { font-family: Source Sans 3, sans-serif; background: #faf7f2; color: #1e1e1e; }
echo     header { background: #1a3d2b; }
echo     header::after { content: ""; display: block; height: 4px; background: linear-gradient(90deg,#c9a84c,#e9c46a,#c9a84c^); }
echo     .hi { max-width: 800px; margin: 0 auto; padding: 1.5rem; }
echo     .back { display: block; font-size: 0.83rem; font-weight: 600; color: #e9c46a; text-decoration: none; margin-bottom: 1rem; }
echo     h1 { font-family: Playfair Display, serif; font-size: 1.8rem; font-weight: 700; color: #fff; }
echo     .sub { font-size: 0.82rem; color: rgba(255,255,255,0.55^); margin-top: 0.2rem; }
echo     main { max-width: 800px; margin: 1.8rem auto 3rem; padding: 0 1rem; }
echo     .lbl { font-size: 0.72rem; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase; color: #2d6a4f; margin-bottom: 0.8rem; }
echo     ul { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
echo     li a { display: flex; align-items: center; gap: 1rem; background: #fff; border: 1px solid #e8e2d8; border-radius: 10px; padding: 1rem 1.2rem; text-decoration: none; color: #1e1e1e; }
echo     li a:hover { transform: translateX(4px^); border-color: #52b788; }
echo     .badge { flex-shrink: 0; width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 0.65rem; font-weight: 700; color: #fff; }
echo     .fn { font-size: 0.97rem; font-weight: 600; color: #1a3d2b; flex: 1; }
echo     footer { text-align: center; padding: 1.5rem; font-size: 0.78rem; color: #5a5a5a; border-top: 1px solid #e8e2d8; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<header^>
echo   ^<div class="hi"^>
echo     ^<a class="back" href="../index.html"^>^&larr; Zur^&uuml;ck zur ^&Uuml;bersicht^</a^>
echo     ^<h1^>Saison 2026^</h1^>
echo     ^<div class="sub"^>Dokumente und Informationen zur Saison^</div^>
echo   ^</div^>
echo ^</header^>
echo ^<main^>
echo   ^<p class="lbl"^>Dateien^</p^>
echo   ^<ul^>
) > "%OUT%"

for %%F in ("%MAINDIR%\saison2026\*.pdf") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#c0392b,#e74c3c^)"^>PDF^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

for %%F in ("%MAINDIR%\saison2026\*.jpg" "%MAINDIR%\saison2026\*.jpeg") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#1a6b8a,#2196b0^)"^>JPG^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

(
echo   ^</ul^>
echo ^</main^>
echo ^<footer^>^&copy; 2026 ^&middot; Golfclub Tegernbach ^&middot; Graue Pumas^</footer^>
echo ^</body^>
echo ^</html^>
) >> "%OUT%"

echo  OK
echo.
echo  [2/5] Startlisten ...
set "OUT=%MAINDIR%\startlisten\index.html"

(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>Startlisten - Graue Pumas^</title^>
echo   ^<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700^&amp;family=Source+Sans+3:wght@300;400;600^&amp;display=swap" rel="stylesheet"^>
echo   ^<style^>
echo     *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
echo     body { font-family: Source Sans 3, sans-serif; background: #faf7f2; color: #1e1e1e; }
echo     header { background: #1a3d2b; }
echo     header::after { content: ""; display: block; height: 4px; background: linear-gradient(90deg,#c9a84c,#e9c46a,#c9a84c^); }
echo     .hi { max-width: 800px; margin: 0 auto; padding: 1.5rem; }
echo     .back { display: block; font-size: 0.83rem; font-weight: 600; color: #e9c46a; text-decoration: none; margin-bottom: 1rem; }
echo     h1 { font-family: Playfair Display, serif; font-size: 1.8rem; font-weight: 700; color: #fff; }
echo     .sub { font-size: 0.82rem; color: rgba(255,255,255,0.55^); margin-top: 0.2rem; }
echo     main { max-width: 800px; margin: 1.8rem auto 3rem; padding: 0 1rem; }
echo     .lbl { font-size: 0.72rem; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase; color: #2d6a4f; margin-bottom: 0.8rem; }
echo     ul { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
echo     li a { display: flex; align-items: center; gap: 1rem; background: #fff; border: 1px solid #e8e2d8; border-radius: 10px; padding: 1rem 1.2rem; text-decoration: none; color: #1e1e1e; }
echo     li a:hover { transform: translateX(4px^); border-color: #52b788; }
echo     .badge { flex-shrink: 0; width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 0.65rem; font-weight: 700; color: #fff; }
echo     .fn { font-size: 0.97rem; font-weight: 600; color: #1a3d2b; flex: 1; }
echo     footer { text-align: center; padding: 1.5rem; font-size: 0.78rem; color: #5a5a5a; border-top: 1px solid #e8e2d8; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<header^>
echo   ^<div class="hi"^>
echo     ^<a class="back" href="../index.html"^>^&larr; Zur^&uuml;ck zur ^&Uuml;bersicht^</a^>
echo     ^<h1^>Startlisten^</h1^>
echo     ^<div class="sub"^>Aktuelle Startlisten als PDF^</div^>
echo   ^</div^>
echo ^</header^>
echo ^<main^>
echo   ^<p class="lbl"^>Dateien^</p^>
echo   ^<ul^>
) > "%OUT%"

for %%F in ("%MAINDIR%\startlisten\*.pdf") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#c0392b,#e74c3c^)"^>PDF^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

for %%F in ("%MAINDIR%\startlisten\*.jpg" "%MAINDIR%\startlisten\*.jpeg") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#1a6b8a,#2196b0^)"^>JPG^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

(
echo   ^</ul^>
echo ^</main^>
echo ^<footer^>^&copy; 2026 ^&middot; Golfclub Tegernbach ^&middot; Graue Pumas^</footer^>
echo ^</body^>
echo ^</html^>
) >> "%OUT%"

echo  OK
echo.
echo  [3/5] Ergebnisse ...
set "OUT=%MAINDIR%\ergebnisse\index.html"

(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>Ergebnisse - Graue Pumas^</title^>
echo   ^<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700^&amp;family=Source+Sans+3:wght@300;400;600^&amp;display=swap" rel="stylesheet"^>
echo   ^<style^>
echo     *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
echo     body { font-family: Source Sans 3, sans-serif; background: #faf7f2; color: #1e1e1e; }
echo     header { background: #1a3d2b; }
echo     header::after { content: ""; display: block; height: 4px; background: linear-gradient(90deg,#c9a84c,#e9c46a,#c9a84c^); }
echo     .hi { max-width: 800px; margin: 0 auto; padding: 1.5rem; }
echo     .back { display: block; font-size: 0.83rem; font-weight: 600; color: #e9c46a; text-decoration: none; margin-bottom: 1rem; }
echo     h1 { font-family: Playfair Display, serif; font-size: 1.8rem; font-weight: 700; color: #fff; }
echo     .sub { font-size: 0.82rem; color: rgba(255,255,255,0.55^); margin-top: 0.2rem; }
echo     main { max-width: 800px; margin: 1.8rem auto 3rem; padding: 0 1rem; }
echo     .lbl { font-size: 0.72rem; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase; color: #2d6a4f; margin-bottom: 0.8rem; }
echo     ul { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
echo     li a { display: flex; align-items: center; gap: 1rem; background: #fff; border: 1px solid #e8e2d8; border-radius: 10px; padding: 1rem 1.2rem; text-decoration: none; color: #1e1e1e; }
echo     li a:hover { transform: translateX(4px^); border-color: #52b788; }
echo     .badge { flex-shrink: 0; width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 0.65rem; font-weight: 700; color: #fff; }
echo     .fn { font-size: 0.97rem; font-weight: 600; color: #1a3d2b; flex: 1; }
echo     footer { text-align: center; padding: 1.5rem; font-size: 0.78rem; color: #5a5a5a; border-top: 1px solid #e8e2d8; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<header^>
echo   ^<div class="hi"^>
echo     ^<a class="back" href="../index.html"^>^&larr; Zur^&uuml;ck zur ^&Uuml;bersicht^</a^>
echo     ^<h1^>Ergebnisse^</h1^>
echo     ^<div class="sub"^>Turnierergebnisse als PDF^</div^>
echo   ^</div^>
echo ^</header^>
echo ^<main^>
echo   ^<p class="lbl"^>Dateien^</p^>
echo   ^<ul^>
) > "%OUT%"

for %%F in ("%MAINDIR%\ergebnisse\*.pdf") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#c0392b,#e74c3c^)"^>PDF^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

for %%F in ("%MAINDIR%\ergebnisse\*.jpg" "%MAINDIR%\ergebnisse\*.jpeg") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#1a6b8a,#2196b0^)"^>JPG^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

(
echo   ^</ul^>
echo ^</main^>
echo ^<footer^>^&copy; 2026 ^&middot; Golfclub Tegernbach ^&middot; Graue Pumas^</footer^>
echo ^</body^>
echo ^</html^>
) >> "%OUT%"

echo  OK
echo.
echo  [4/5] Fotos ...
set "OUT=%MAINDIR%\fotos\index.html"

(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>Fotos - Graue Pumas^</title^>
echo   ^<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700^&amp;family=Source+Sans+3:wght@300;400;600^&amp;display=swap" rel="stylesheet"^>
echo   ^<style^>
echo     *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
echo     body { font-family: Source Sans 3, sans-serif; background: #faf7f2; color: #1e1e1e; }
echo     header { background: #1a3d2b; }
echo     header::after { content: ""; display: block; height: 4px; background: linear-gradient(90deg,#c9a84c,#e9c46a,#c9a84c^); }
echo     .hi { max-width: 800px; margin: 0 auto; padding: 1.5rem; }
echo     .back { display: block; font-size: 0.83rem; font-weight: 600; color: #e9c46a; text-decoration: none; margin-bottom: 1rem; }
echo     h1 { font-family: Playfair Display, serif; font-size: 1.8rem; font-weight: 700; color: #fff; }
echo     .sub { font-size: 0.82rem; color: rgba(255,255,255,0.55^); margin-top: 0.2rem; }
echo     main { max-width: 800px; margin: 1.8rem auto 3rem; padding: 0 1rem; }
echo     .lbl { font-size: 0.72rem; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase; color: #2d6a4f; margin-bottom: 0.8rem; }
echo     ul { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
echo     li a { display: flex; align-items: center; gap: 1rem; background: #fff; border: 1px solid #e8e2d8; border-radius: 10px; padding: 1rem 1.2rem; text-decoration: none; color: #1e1e1e; }
echo     li a:hover { transform: translateX(4px^); border-color: #52b788; }
echo     .badge { flex-shrink: 0; width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 0.65rem; font-weight: 700; color: #fff; }
echo     .fn { font-size: 0.97rem; font-weight: 600; color: #1a3d2b; flex: 1; }
echo     footer { text-align: center; padding: 1.5rem; font-size: 0.78rem; color: #5a5a5a; border-top: 1px solid #e8e2d8; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<header^>
echo   ^<div class="hi"^>
echo     ^<a class="back" href="../index.html"^>^&larr; Zur^&uuml;ck zur ^&Uuml;bersicht^</a^>
echo     ^<h1^>Fotos^</h1^>
echo     ^<div class="sub"^>Bilder aus dem Clubgeschehen^</div^>
echo   ^</div^>
echo ^</header^>
echo ^<main^>
echo   ^<p class="lbl"^>Dateien^</p^>
echo   ^<ul^>
) > "%OUT%"

for %%F in ("%MAINDIR%\fotos\*.pdf") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#c0392b,#e74c3c^)"^>PDF^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

for %%F in ("%MAINDIR%\fotos\*.jpg" "%MAINDIR%\fotos\*.jpeg") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#1a6b8a,#2196b0^)"^>JPG^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

(
echo   ^</ul^>
echo ^</main^>
echo ^<footer^>^&copy; 2026 ^&middot; Golfclub Tegernbach ^&middot; Graue Pumas^</footer^>
echo ^</body^>
echo ^</html^>
) >> "%OUT%"

echo  OK
echo.
echo  [5/5] Sonstiges ...
set "OUT=%MAINDIR%\sonstiges\index.html"

(
echo ^<!DOCTYPE html^>
echo ^<html lang="de"^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<title^>Sonstiges - Graue Pumas^</title^>
echo   ^<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700^&amp;family=Source+Sans+3:wght@300;400;600^&amp;display=swap" rel="stylesheet"^>
echo   ^<style^>
echo     *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
echo     body { font-family: Source Sans 3, sans-serif; background: #faf7f2; color: #1e1e1e; }
echo     header { background: #1a3d2b; }
echo     header::after { content: ""; display: block; height: 4px; background: linear-gradient(90deg,#c9a84c,#e9c46a,#c9a84c^); }
echo     .hi { max-width: 800px; margin: 0 auto; padding: 1.5rem; }
echo     .back { display: block; font-size: 0.83rem; font-weight: 600; color: #e9c46a; text-decoration: none; margin-bottom: 1rem; }
echo     h1 { font-family: Playfair Display, serif; font-size: 1.8rem; font-weight: 700; color: #fff; }
echo     .sub { font-size: 0.82rem; color: rgba(255,255,255,0.55^); margin-top: 0.2rem; }
echo     main { max-width: 800px; margin: 1.8rem auto 3rem; padding: 0 1rem; }
echo     .lbl { font-size: 0.72rem; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase; color: #2d6a4f; margin-bottom: 0.8rem; }
echo     ul { list-style: none; display: flex; flex-direction: column; gap: 0.6rem; }
echo     li a { display: flex; align-items: center; gap: 1rem; background: #fff; border: 1px solid #e8e2d8; border-radius: 10px; padding: 1rem 1.2rem; text-decoration: none; color: #1e1e1e; }
echo     li a:hover { transform: translateX(4px^); border-color: #52b788; }
echo     .badge { flex-shrink: 0; width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 0.65rem; font-weight: 700; color: #fff; }
echo     .fn { font-size: 0.97rem; font-weight: 600; color: #1a3d2b; flex: 1; }
echo     footer { text-align: center; padding: 1.5rem; font-size: 0.78rem; color: #5a5a5a; border-top: 1px solid #e8e2d8; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<header^>
echo   ^<div class="hi"^>
echo     ^<a class="back" href="../index.html"^>^&larr; Zur^&uuml;ck zur ^&Uuml;bersicht^</a^>
echo     ^<h1^>Sonstiges^</h1^>
echo     ^<div class="sub"^>Weitere Dokumente als PDF^</div^>
echo   ^</div^>
echo ^</header^>
echo ^<main^>
echo   ^<p class="lbl"^>Dateien^</p^>
echo   ^<ul^>
) > "%OUT%"

for %%F in ("%MAINDIR%\sonstiges\*.pdf") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#c0392b,#e74c3c^)"^>PDF^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

for %%F in ("%MAINDIR%\sonstiges\*.jpg" "%MAINDIR%\sonstiges\*.jpeg") do (
  (
  echo   ^<li^>^<a href="%%~nxF" target="_blank"^>
  echo     ^<div class="badge" style="background:linear-gradient(135deg,#1a6b8a,#2196b0^)"^>JPG^</div^>
  echo     ^<span class="fn"^>%%~nxF^</span^>^<span^>^&nearr;^</span^>
  echo   ^</a^>^</li^>
  ) >> "%OUT%"
)

(
echo   ^</ul^>
echo ^</main^>
echo ^<footer^>^&copy; 2026 ^&middot; Golfclub Tegernbach ^&middot; Graue Pumas^</footer^>
echo ^</body^>
echo ^</html^>
) >> "%OUT%"

echo  OK
echo.
echo  Alle 5 Verzeichnisse aktualisiert!
echo  Bitte in GitHub Desktop committen und pushen!
echo.
pause
