<?php

function listFiles($path) {
    if (!is_dir($path)) return;

    $items = scandir($path);

    echo "<ul>";

    foreach ($items as $item) {
        if ($item === "." || $item === "..") continue;

        $full = $path . "/" . $item;

        if (is_dir($full)) {
            echo "<li>";
            echo "<span class='folder' onclick='toggle(this)'>
                    <span class='icon'>DIR</span>
                    <span class='name'>$item</span>
                    <span class='meta'>Ordner</span>
                  </span>";
            echo "<ul class='hidden'>";
            listFiles($full);
            echo "</ul>";
            echo "</li>";
        } else {
            echo "<li>
                    <a href='$full' target='_blank'>
                        <span class='icon'>FILE</span>
                        <span class='name'>$item</span>
                        <span class='meta'>Datei</span>
                    </a>
                  </li>";
        }
    }

    echo "</ul>";
}

echo "<h2>Startzeiten</h2>";
listFiles("P:/Startzeiten");

echo "<h2>Ergebnisse</h2>";
listFiles("P:/Ergebnisse");

?>