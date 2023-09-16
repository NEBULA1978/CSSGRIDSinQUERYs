# CSSGRIDSinQUERYs

## Modificar Imágenes en Archivo HTML

Este script de Bash permite a los usuarios realizar
modificaciones en un archivo HTML específico. En particular, se utiliza para 
reemplazar rutas de imágenes en el atributo `src` de las etiquetas `img`.

### Uso

1. Ejecuta el script proporcionando el nombre del archivo HTML
2. que deseas modificar (por ejemplo, "index-img.html").

3. El script buscará y mostrará una lista de patrones que coinciden
4.  con las rutas de imágenes en el archivo HTML.

5. Selecciona el número correspondiente al patrón que deseas reemplazar.

6. Ingresa el nuevo patrón de reemplazo (asegurándote de mantener
7. el atributo `src` en el patrón).

8. El script realizará el reemplazo en el archivo HTML y mostrará
9. las líneas modificadas.

10. Se te preguntará si deseas guardar los cambios en el archivo original.

### Requisitos

- Bash (Shell de Unix/Linux)

### Ejemplo de Uso

```bash
./modificar-img-html.sh

Notas

    Asegúrate de mantener el atributo src en el patrón de reemplazo para que los atributos de las etiquetas img se mantengan intactos en el archivo HTML resultante.

    El archivo HTML original se guarda como "temporal.html" si decides guardar los cambios.

    Este script facilita la tarea de actualizar rutas de imágenes en un archivo HTML sin la necesidad de realizar cambios manuales.

Nota: Por favor, asegúrate de tener cuidado al modificar archivos HTML, ya que los cambios incorrectos pueden afectar la funcionalidad de una página web.
