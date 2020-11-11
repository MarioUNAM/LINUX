#!/bin/bash
#Imprime la ayuda para cada comando dentro de la shell
TITULOS="\e[33;3m"
AZUL="\e[34;1m"
RESET="\e[0m"

function ahorcado(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tahorcado\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
  echo -e "$AZUL  Este comando ejecuta el juego de ahorcado"
  echo -e "  Solo se introduce el comando ahorcado no necesita de ningun argumento para ejecutarlo$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}

function arbol(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tarbol\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
	echo -e "$AZUL  Este comando sirve para mostrar graficamente los archivos que se encuentren dentro de la ruta especificada\n"
  echo -e "  El comando acepta rutas relativas o absolutas"
  echo -e "  Cuenta con 2 formas de usarse:"
  echo -e "  Sin argumentos:\n  arbol \n  Mostrara el arbol de direcciones dentro de la carpeta que se ejecute el comando"
  echo -e "  Con argumentos:\n  arbol direccion \n  Mostrara el arbol de direcciones del directorio que se pasa como argumento"
  echo -e "  En caso de ingresar una direccion no valida o inexitente mostrara el mensaje \"NO EXISTE EL DIRECTORIO: direccion\""
  echo -e "  Acepta nombre de carpetas con espacios$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}

function ayuda(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tayuda\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
	echo -e "$AZUL  Este comando muestra la descripcion de todos los comandos que se pueden utilizar dentro de la shell"
  echo -e "  Cuenta con 2 formas de usarse:"
  echo -e "  Sin argumentos:\n  ayuda \n  Mostrara la descripcion de todos los comandos"
  echo -e "  Con argumentos:\n  ayuda comando \n  Mostrara la descripcion del comando especificado$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}

function buscar(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tbuscar\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
  echo -e "$AZUL  El comando buscar recibe 2 argumentos el primero es el nombre del archivo y el segundo el nombre de la carpeta"
  echo -e "  Se necesita que los argumentos esten entre comillad como se muestra a continuación"
  echo -e "  buscar \"nombre_archivo\" \"nombre_carpeta\""
  echo -e "  Acepta nombres con espacios"
  echo -e "  NOTA: Este comando solo busca dentro de los archivos del usuario con el que se inicio sesion$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"

}

function creditos(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tcreditos\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
  echo -e "$AZUL  Este comando muestra los creditos de los programadores de esta prebeshell"
  echo -e "  Solo se introduce el comando creditos no necesita de ningun argumento para ejecutarlo$RESET"

  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}

function fecha(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tfecha\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
	echo -e "$AZUL  Este comando mostrara la fecha actual"
  echo -e "  No necesita ningun argumento solo se necesita escribir fecha para ejecutarlo$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}


function gato(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tgato\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
	echo -e "$AZUL  Este comando ejecuta el juego de gato"
  echo -e "  Solo se introduce el comando gato no necesita de ningun argumento para ejecutarlo$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"

}

function hora(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\thora\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
	echo -e "$AZUL  Este comando mostrara la hora exacta en que fue ejecutado"
  echo -e "  No necesita ningun argumento solo se necesita escribir hora para ejecutarlo$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"

}

function infosis(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\tinfosis\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
	echo -e "$AZUL  Muestra la informacion del sistema"
  echo -e "  La forma de uso de este comando es solo escribir infosis en la terminal$RESET"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}


function reproductor(){
  echo -e "\n$TITULOS┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\treproductor\t━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$RESET"
  echo -e "$AZUL  ejecuta el reproductor"
  echo -e "  El reproductor agrupa las canciones encontradas dentro de la carpeta del usuario con el que ese inicio sesion"
  echo -e "  La primer pantalla muestra las carpetas donde el usuario tiene musica, dentro de esta patalla se puede elegir\n  alguna de las pciones que ahi se muestran"
  echo -e "  Una vez elegida la carpeta, se muestan todas las canciones que contiene y se muestan las posibles opciones que se pueden seleccionar"
  echo -e "  Al reproducir una cancion se ejecuta el programa mpg123 por lo que se pueden ver los comandos para utilizarlo oprimiendo h"
  echo -e "  NOTA: Este comando solo busca dentro de los archivos del usuario con el que se inicio sesion"
  echo -e "$TITULOS┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET"
}



#####################PROGRAMA PRINCIPAL##########################################################

if [[ $1 == "" ]]
then 
  arbol
  ayuda
  fecha
  gato
  hora
  infosis
  buscar
  ahorcado
  creditos
  reproductor
else
	$1
fi

