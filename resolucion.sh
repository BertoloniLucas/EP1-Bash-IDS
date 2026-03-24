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
            "$HOME/EPnro1/consolidar.sh" &
            echo "Proceso iniciado con éxito"
        ;;
        3)
            #Codigo para punto 3
        ;;
        4)
            #Codigo para punto 4
        ;;
        5)
            #Codigo para punto 5
        ;;
        6)
            echo "Ha salido del menú"
            break
        ;;
    esac
done