#!/bin/bash

# Nombre del archivo HTML a analizar
archivo_html="index-img.html"

# Realizar el reemplazo en el archivo HTML y guardar la salida en un archivo temporal
sed_script=""

# Mostrar todos los patrones en el archivo
echo "Patrones encontrados en el archivo HTML:"
grep -oE 'src="[^"]+"' "$archivo_html" | sort | uniq

# Pedir al usuario que seleccione el patrón a reemplazar
echo "Ingrese el patrón que desea reemplazar (por ejemplo, './img/camisetaBlanca.png'): "
read -r patron_busqueda

# Pedir al usuario el nuevo patrón
echo "Ingrese el nuevo patrón (por ejemplo, './img/camisetaNegra.png'): "
read -r patron_reemplazo

# Generar el script sed para reemplazar el patrón seleccionado
sed_script="s|$(echo "$patron_busqueda" | sed 's/[\/&]/\\&/g')|$(echo "$patron_reemplazo" | sed 's/[\/&]/\\&/g')|g"

# Realizar el reemplazo en el archivo HTML y guardar la salida en un archivo temporal
sed "$sed_script" "$archivo_html" > temporal.html

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
