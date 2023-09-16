#!/bin/bash

# Nombre del archivo HTML a analizar
archivo_html="index-img.html"

# Patrón de búsqueda y reemplazo
patron_busqueda="./img/camisetaBlanca.png"
patron_reemplazo="./img/camisetaNegra.png"

# Realizar el reemplazo en el archivo HTML y guardar la salida en un archivo temporal
sed "s|$patron_busqueda|$patron_reemplazo|g" "$archivo_html" > temporal.html

# Mostrar las líneas modificadas y los nombres
echo "Líneas modificadas:"
grep -n "$patron_reemplazo" temporal.html

# Preguntar al usuario si desea guardar los cambios en el archivo original
echo "¿Deseas guardar los cambios en el archivo original? (Sí/No)"
read -r respuesta

if [[ "$respuesta" =~ ^[Ss][Ii]$ ]]; then
  mv temporal.html "$archivo_html"
  echo "Cambios guardados en el archivo original."
else
  rm temporal.html
  echo "Cambios descartados."
fi
