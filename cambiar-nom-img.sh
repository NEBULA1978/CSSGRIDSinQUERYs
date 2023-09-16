#!/bin/bash

# Nombre del archivo HTML
html_file="index.html"

# Directorio de imágenes
img_dir="./img"

# Función para mostrar las imágenes disponibles
mostrar_imagenes_disponibles() {
  echo "Imágenes disponibles en el directorio $img_dir:"
  ls -1 "$img_dir"
}

# Función para cambiar el nombre de una imagen y actualizar el HTML
cambiar_nombre_imagen() {
  echo "Por favor, introduce el nombre de la imagen que deseas cambiar:"
  read nombre_anterior

  # Verificar si la imagen existe
  if [ -f "$img_dir/$nombre_anterior" ]; then
    echo "Introduce el nuevo nombre para la imagen:"
    read nuevo_nombre

    # Renombrar la imagen
    mv "$img_dir/$nombre_anterior" "$img_dir/$nuevo_nombre"

    # Actualizar el HTML
    sed -i "s/$nombre_anterior/$nuevo_nombre/g" "$html_file"

    echo "La imagen $nombre_anterior ha sido renombrada a $nuevo_nombre y el HTML ha sido actualizado."
  else
    echo "La imagen $nombre_anterior no existe en el directorio $img_dir."
  fi
}

# Menú principal
while true; do
  echo "Menú Principal:"
  echo "1. Mostrar imágenes disponibles"
  echo "2. Cambiar el nombre de una imagen"
  echo "3. Salir"
  read opcion

  case $opcion in
    1)
      mostrar_imagenes_disponibles
      ;;
    2)
      cambiar_nombre_imagen
      ;;
    3)
      echo "Saliendo del programa."
      exit 0
      ;;
    *)
      echo "Opción no válida."
      ;;
  esac
done
