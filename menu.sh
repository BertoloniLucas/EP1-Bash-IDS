#!/bin/bush
#Definir rutas
DIR_EPNro1="$HOME/EPNro1"
DIR_ENTRADA="$DIR_EPNro1/entrada"
DIR_SALIDA="$DIR_EPNro1/salida"
DIR_PROCESADO="$DIR_EPNro1/procesado"
ARCHIVO_FINAL="$DIR_SALIDA/$FILENAME.txt"

#Ejecutar en un bucle infinito
while true;
do
    echo "1) Crear entorno"
    echo "2)Correr proceso"
    echo "3)Listado por padron"
    echo "4)Los 10 mejores notas "
    echo "5)Buscar por padron"
    echo "6)Salir"

    #Leer la opcion ingresada
    read -p "Por favor,selecciona una opcion [1-6]:" opcion
    case $opcion in
	1)
	    #crear carpeta
	    mkdir -p "$DIR_EPNro1"
	    mkdir -p "$DIR_ENTRADA" "$DIR_SALIDA" "$DIR_PROCESADO"
	    #copiar archivo
	    cp consolidar.sh "$DIR_EPNro1/"
	    echo "Ya cree el entorno"
	;;
	2)
	    #Ejecutar en segundo plano
	    "$DIR_EPNro1/consolidar.sh" &
	    echo "Proceso iniciado con exido"
	;;
	6)
		break
    esac
done
