#!/bin/bash
#Cambiar de clolor
ROJO="\e[31m"
VERDE="\e[32m"
AMARILLO="\e[33m"
AZUL="\e[34;1m"
MAGNETA="\e[35m"
CYAN="\e[0;36m"
BLANCO="\e[97m"
NEGRITA="\e[1m"
RESET="\e[0m"
DORADO="\e[33;1m"

#Cancela las señales
trap "" SIGINT   # SIGINTP es la señal que manda Ctrl + c
trap "" SIGTSTP  # SIGTSTP es la señal que manda Ctrl + z

ubi=$(pwd);

echo -e "$NEGRITA $ROJO Vamos a instalar whois y mpg123 $RESET"
sudo apt-get install whois
clear
sudo apt-get install mpg123



#Login
clear
echo -e "\n $NEGRITA Para ingresar intruduzca su usuario y contraseña por favor $RESET\n "
read -p "$(echo -e "$AMARILLO User: $RESET" )" usuario
read -p "$(echo -e "$AMARILLO Contraseña:$RESET" )" -s contrasenia



echo -e "\n"

#busca usuario  y guarda en un arreglo la linea donde lo encontro 
linea=`sudo -S grep -r $usuario /etc/shadow 2>/dev/null ` 
IFS='$' 
read -a array <<< "$linea" 
IFS=' '

#Obtenemos la contraseña encriptada y la comparamos
micontra=`mkpasswd -m sha-512 "$contrasenia" "${array[2]}"`
if [ `echo "$linea" | grep -c "$micontra"` -eq 1   ]
	#Si son iguales entramos a shell
	then
		USER=$usuario
		cd /home/$usuario
		clear
		echo -e "$DORADO
		┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 		$AMARILLO☆$RESET$ROJO <3$RESET $AZUL Bienvenido       $RESET $AZUL $usuario $RESET $ROJO<3$RESET$AMARILLO ☆$RESET
		$DORADO┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$RESET\n"

		
		while :
		do
			IFS=' '
			read -p  "$(echo -e "$DORADO$USER:$RESET$AZUL$PWD$RESET"$  )" -a comando  
      		case ${comando[0]} in
				
				#NO SE LE PUEDE PASAR UNA DIRECCION SOLO SE EJECUTA DONDE ESTE
				'arbol')
					cuenta=-1
					argumento=""
					for i in ${comando[@]} ; do
						cuenta=$(($cuenta+1))
					done
					for (( i = 1; i <= "$cuenta" ; i++ )); do
						argumento="$argumento ${comando[i]}"
					done
					argumento="${argumento#"${argumento%%[![:space:]]*}"}"
					IFS=''
					bash $ubi/tree.sh $argumento
					IFS=' '
				;;
						
          		'hora')
          			bash $ubi/hora.sh
				;;

				'fecha')
					bash $ubi/fecha.sh
				;;

				'ayuda')
						IFS=' '
						bash $ubi/ayuda.sh ${comando[1]} 
				;;

				'infosis')
						bash $ubi/infosis.sh
				;;

				'reproductor')
          				bash $ubi/buscamusica.sh
				;;
				'creditos')
						bash $ubi/creditos.sh
				;;
				'ahorcado')
						bash $ubi/ahorcado.sh $ubi
				;;

				'gato')
						bash $ubi/gato.sh
				;;

				'buscar')
					cuenta=-1
					argumento=""
					for i in ${comando[@]} ; do
						cuenta=$(($cuenta+1))
					done
					for (( i = 1; i <= "$cuenta" ; i++ )); do
						argumento="$argumento ${comando[i]}"
					done
					argumento="${argumento#"${argumento%%[![:space:]]*}"}"
					IFS='"'
					read -a palabras <<< $argumento
					bash $ubi/busqueda.sh ${palabras[1]} ${palabras[3]}
				;;

				'salir')
						clear
						exit
				;;

				'exit')
						echo -e "$DORADO La unica forma de salir es con el comando salir"
				;;

				*)
						command ${comando[@]}
				;;
			
			esac
   	 	done
	else
		echo -e "$NEGRITA No has ingresado bien el usuario o la contraseña\n Prueba ejecutando de nuevo el programa $RESET"
	fi 