#!/usr/bin/env python3
"""
Generiert index.html fuer jeden Unterordner der Graue Pumas Website.
Wird von GitHub Actions aufgerufen.
"""

import os
from pathlib import Path

# Verzeichnis dieses Scripts -> zwei Ebenen hoch = Repository-Root
ROOT = Path(__file__).parent.parent.parent

DIRS = [
    ("saison2026",     "Saison 2026",     "Dokumente und Informationen zur Saison"),
    ("startlisten",    "Startlisten",     "Aktuelle Startlisten als PDF"),
    ("ergebnisse",     "Ergebnisse",      "Turnierergebnisse als PDF"),
    ("fotos",          "Fotos",           "Bilder aus dem Clubgeschehen"),
    ("ausschreibungen","Ausschreibungen",  "Ausschreibungen und weitere Dokumente"),
]

CSS = """
    *,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
    body{font-family:"Source Sans 3",sans-serif;background:#faf7f2;color:#1e1e1e}
    header{background:#1a3d2b}
    header::after{content:"";display:block;height:4px;background:linear-gradient(90deg,#c9a84c,#e9c46a,#c9a84c)}
    .hi{max-width:800px;margin:0 auto;padding:1.5rem}
    .back{display:block;font-size:.83rem;font-weight:600;color:#e9c46a;text-decoration:none;margin-bottom:1rem}
    .back:hover{opacity:1}
    h1{font-family:"Playfair Display",serif;font-size:1.8rem;font-weight:700;color:#fff}
    .sub{font-size:.82rem;color:rgba(255,255,255,.55);margin-top:.2rem}
    main{max-width:800px;margin:1.8rem auto 3rem;padding:0 1rem}
    .lbl{font-size:.72rem;font-weight:600;letter-spacing:.15em;text-transform:uppercase;color:#2d6a4f;margin-bottom:.8rem}
    ul{list-style:none;display:flex;flex-direction:column;gap:.6rem}
    li a{display:flex;align-items:center;gap:1rem;background:#fff;border:1px solid #e8e2d8;border-radius:10px;padding:1rem 1.2rem;text-decoration:none;color:#1e1e1e}
    li a:hover{transform:translateX(4px);border-color:#52b788}
    .badge{flex-shrink:0;width:38px;height:38px;border-radius:8px;display:flex;align-items:center;justify-content:center;font-size:.65rem;font-weight:700;color:#fff}
    .pdf{background:linear-gradient(135deg,#c0392b,#e74c3c)}
    .jpg{background:linear-gradient(135deg,#1a6b8a,#2196b0)}
    .fn{font-size:.97rem;font-weight:600;color:#1a3d2b;flex:1}
    footer{text-align:center;padding:1.5rem;font-size:.78rem;color:#5a5a5a;border-top:1px solid #e8e2d8}
"""

def generate(dirname, title, sub):
    folder = ROOT / dirname
    if not folder.exists():
        print(f"  Ordner nicht gefunden: {dirname}, überspringe.")
        return

    # Dateien sammeln
    files = sorted(folder.iterdir())
    pdf_files = [f for f in files if f.suffix.lower() == '.pdf']
    jpg_files = [f for f in files if f.suffix.lower() in ('.jpg', '.jpeg')]

    # Dateiliste als HTML
    items = []
    for f in pdf_files:
        items.append(
            f'    <li><a href="{f.name}" target="_blank">'
            f'<div class="badge pdf">PDF</div>'
            f'<span class="fn">{f.name}</span>'
            f'<span>&nearr;</span></a></li>'
        )
    for f in jpg_files:
        items.append(
            f'    <li><a href="{f.name}" target="_blank">'
            f'<div class="badge jpg">JPG</div>'
            f'<span class="fn">{f.name}</span>'
            f'<span>&nearr;</span></a></li>'
        )

    if not items:
        items.append('    <li style="padding:2rem 1rem;text-align:center;color:#5a5a5a;">Noch keine Dateien vorhanden.</li>')

    html = f"""<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{title} - Graue Pumas</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
  <style>{CSS}  </style>
</head>
<body>
<header>
  <div class="hi">
    <a class="back" href="../index.html">&larr; Zur&uuml;ck zur &Uuml;bersicht</a>
    <h1>{title}</h1>
    <div class="sub">{sub}</div>
  </div>
</header>
<main>
  <p class="lbl">Dateien</p>
  <ul>
{chr(10).join(items)}
  </ul>
</main>
<footer>&copy; 2026 &middot; Golfclub Tegernbach &middot; Graue Pumas</footer>
</body>
</html>"""

    out = folder / "index.html"
    out.write_text(html, encoding="utf-8")
    print(f"  [{dirname}] {len(pdf_files)} PDF, {len(jpg_files)} JPG -> index.html geschrieben")


if __name__ == "__main__":
    print("Generiere Index-Seiten...")
    for dirname, title, sub in DIRS:
        generate(dirname, title, sub)
    print("Fertig!")
