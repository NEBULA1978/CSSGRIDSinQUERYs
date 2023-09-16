#!/bin/bash

# Patrón para buscar etiquetas <img>
patron_img="<img .*>"

# Nombre del archivo HTML a analizar
archivo_html="index-img.html"

# Buscamos todas las líneas que contienen etiquetas <img> en el archivo HTML
lineas_encontradas=$(grep -n "$patron_img" "$archivo_html")

# Imprimimos las líneas encontradas
echo "$lineas_encontradas"
