#!/bin/bash

# Arreglo con las líneas a buscar
lineas_a_buscar=(
  "<img src=\"./img/camisetaBlanca.png\" alt=\"Camiseta Blanca\">"
  "<img src=\"./img/camisetaNegra.png\" alt=\"Camiseta Negra\">"
  "<img src=\"./img/corazon.png\" alt=\"Corazón\">"
  "<img src=\"./img/rey_atanagildo.png\" alt=\"Rey Atanagildo\">"
  "<img src=\"./img/rey_ataulfo.png\" alt=\"Rey Ataulfo\">"
  "<img src=\"./img/rey_ervigio.png\" alt=\"Rey Ervigio\">"
  "<img src=\"./img/rey_leogivildo.png\" alt=\"Rey Leovigildo\">"
  "<img src=\"./img/rey_recesvinto.png\" alt=\"Rey Recesvinto\">"
  "<img src=\"./img/rey_sisebuto.png\" alt=\"Rey Sisebuto\">"
  "<img src=\"./img/rey_teodorico.png\" alt=\"Rey Teodorico\">"
)

# Nombre del archivo HTML a analizar
archivo_html="index-img.html"

# Recorremos el arreglo de líneas a buscar
for linea in "${lineas_a_buscar[@]}"; do

  # Buscamos la línea en el archivo HTML
  linea_encontrada=$(grep -n "$linea" "$archivo_html")

  # Imprimimos el número de línea donde se encontró la línea
  echo "$linea_encontrada"

done
