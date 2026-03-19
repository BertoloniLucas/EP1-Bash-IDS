#!/bin/bash
#Definir rutas
DIR_EPNro1="$HOME/EPNro1"
DIR_ENTRADA="$DIR_EPNro1/entrada"
DIR_SALIDA="$DIR_EPNro1/salida"
DIR_PROCESADO="$DIR_EPNro1/procesado"
ARCHIVO_FINAL="$DIR_SALIDA/$FILENAME.txt"

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
    sleep 2
done
