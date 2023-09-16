#!/bin/bash

# Nombre del archivo HTML de destino
html_file="index.html"

# Contenido HTML
html_content='<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Event</title>
  <style>
    /* Estilos para la galería y el elemento destacado */
    .gallery {
      display: grid;
      gap: 1rem;
      grid-auto-rows: 22rem;
      grid-template-columns: repeat(auto-fill, minmax(15rem, 1fr));
    }

    .featured {
      grid-column: span 2;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Latest News</h1>
    <div class="gallery">
      <article class="card"></article>
      <article class="card"></article>
      <article class="card featured">
        <div class="card-img">Imagen aquí</div>
        <h4 class="card-title">Título</h4>
        <p>Contenido del artículo</p>
      </article>
      <article class="card"></article>
      <article class="card"></article>
    </div>
  </div>
</body>
</html>'

# Escribir el contenido HTML en el archivo
echo "$html_content" > "$html_file"

# Confirmación
echo "El archivo $html_file ha sido creado con el contenido HTML."
