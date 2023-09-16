#!/bin/bash

# Nombre del archivo HTML a analizar
archivo_html="index-img.html"

# Realizar el reemplazo en el archivo HTML y guardar la salida en un archivo temporal
sed_script=""

# Mostrar todos los patrones en el archivo
patrones_encontrados=($(grep -oE 'src="[^"]+"' "$archivo_html" | sort | uniq))
num_patrones=${#patrones_encontrados[@]}

echo "Patrones encontrados en el archivo HTML:"
for ((i=0; i<num_patrones; i++)); do
  echo "[$i] ${patrones_encontrados[$i]}"
done

# Pedir al usuario que seleccione un número para reemplazar el patrón
echo "Ingrese el número del patrón que desea reemplazar: "
read -r seleccion

# Comprobar si la selección es un número válido
if ! [[ "$seleccion" =~ ^[0-9]+$ ]] || ((seleccion < 0 || seleccion >= num_patrones)); then
  echo "Selección no válida. Debe ingresar un número válido de la lista."
  exit 1
fi

patron_busqueda="${patrones_encontrados[$seleccion]}"

# Pedir al usuario el nuevo patrón
echo "Ingrese el nuevo patrón (por ejemplo, './img/camisetaNegra.png'): "
read -r patron_reemplazo

# Generar el script sed para reemplazar el patrón seleccionado
# Se agregará src= al patrón de reemplazo
sed_script="s|$(echo "$patron_busqueda" | sed 's/[\/&]/\\&/g')|src=\"$(echo "$patron_reemplazo" | sed 's/[\/&]/\\&/g')\"|g"

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
