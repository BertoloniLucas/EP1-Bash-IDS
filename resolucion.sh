if [ "$1" = "-d" ]; then
    pkill -f consolidar.sh 
    rm -rf "$HOME/EPNro1"
    echo "Entorno eliminado y procesos finalizados"
    exit 0
fi

while [ 1 -gt 0 ];
do
    echo "-----MENÚ DE OPCIONES-----"
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Alumnos por padrón ordenados"
    echo "4) 10 notas más altas"
    echo "5) Datos de alumno/a por padrón"
    echo "6) Salir"
    echo "-----FIN MENÚ DE OPCIONES-----"

    read -p "Ingrese una opcón: " opcion

    case "$opcion" in
        1)
            mkdir -p "$HOME/EPNro1/entrada" "$HOME/EPNro1/salida" "$HOME/EPNro1/procesado"
            cp consolidar.sh "$HOME/EPNro1"
            echo "Entorno creado"
            # Lo que hacemos acá es utilizar el comando mkdir, y este mismo puede recibir 
            # más de 1 parámetro, entonces ya de una le ponemos todos los directorios a 
            # a crear, obviamente dentro de home y dentro de EPNro1. El flag -p lo buscamos
            # y nos sirvió para no tener errores por si el usuario ya tenía creado el 
            # directorio EPNro1. Además copiamos consolidar.sh a EPNro1 
        ;;
        2)
            "$HOME/EPNro1/consolidar.sh" &
            echo "Proceso iniciado con éxito"
        ;;
        3)
            ARCHIVO="$HOME/EPNro1/salida/${FILENAME}.txt"

            if [ -f "$ARCHIVO" ]; then
                sort -k1,1n "$ARCHIVO"
            else
                echo "No existe el archivo para poder ordenar"
            fi
        ;;
        4)
            ARCHIVO="$HOME/EPNro1/salida/$FILENAME.txt"

            if [ -f "$ARCHIVO" ]; then
                echo "Las 10 notas más altas:"
                sort -k4,4nr "$ARCHIVO" | head -10
            else
                echo "El archivo no existe para poder ordenar"
            fi
        ;;
        5)
            ARCHIVO="$HOME/EPNro1/salida/$FILENAME.txt"

            if [ -f "$ARCHIVO" ]; then
                read -p "Ingrese número de padrón: " PADRON
            
                RESULTADO=$(grep "^$PADRON " "$ARCHIVO")
            
                if [ -n "$RESULTADO" ]; then
                    echo "Datos del alumno:"
                    echo "$RESULTADO"
                else
                    echo "No se encontró un alumno con padrón $PADRON"
                fi
            else
                echo "El archivo $ARCHIVO no existe."
            fi
        ;;
        6)
            echo "Ha salido del menú"
            break
        ;;
    esac
done