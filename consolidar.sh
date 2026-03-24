#!/bin/bash
#Definir rutas
DIR_EPNro1="$HOME/EPNro1"
DIR_ENTRADA="$DIR_EPNro1/entrada"
DIR_SALIDA="$DIR_EPNro1/salida"
DIR_PROCESADO="$DIR_EPNro1/procesado"
ARCHIVO_FINAL="$DIR_SALIDA/$FILENAME.txt"

# Lo que hacemos acá al principio es definir variables para todas las rutas que
# vamos a usar. En vez de escribir la ruta completa todo el tiempo, ya de una
# las guardamos en variables usando $HOME, así el código  queda mucho más
# limpio y prolijo.


# Acá armamos un bucle infinito con while true, la idea es que chequee
# automáticamente si entran archivos nuevos. Adentro, usamos un ciclo for
# para agarrar todos los archivos que terminen en .txt en la carpeta de entrada.
# Por cada archivo que encuentra, usamos cat con >> para ir agregando las
# notas al archivo final. Después de leerlo, usamos mv para mover el archivo
# original a la carpeta de procesados y evitar leerlo dos veces. Al final, le
# clavamos un sleep 5 para que el bucle pause 5 segundos y no se nos tilde 
# la compu.

#Ejecutar en un bucle infinito
while true;
do
    #Buscar archivos con extencion .txt
    for i in "$DIR_ENTRADA"/*.txt;
    do
	#Concatenar contenido a FILENAME
	cat "$i" >> "$ARCHIVO_FINAL"
	#Mover archivo original
	mv "$i" "$DIR_PROCESADO"
    done
    sleep 5
done
