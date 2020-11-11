#!/bin/bash
#Encontrar todos los archivos de audio 

AZUL="\e[34;1m"
DORADO="\e[33;1m"
RESET="\e[0m"
buscamusica()
{
  flag=0
  for archivo in "$ubiact"/*; do
    if [[ -d "${archivo}" ]]
   	then
   		ubiact=${ubiact}/${archivo##*/}
        cd "$ubiact"
        buscamusica  
        cd ..
        ubiact=$(pwd)
    elif [ "${archivo##*.}" = "mp3" ] 
    then
      direcciones[$iteracion]="$archivo"
	  iteracion=$(($iteracion+1))
      flag=1
    fi
  done
  if [[ "$flag" -eq 1 ]]; then
     carpeta[iteracion_2]=$ubiact
     iteracion_2=$(($iteracion_2+1))
  fi
  flag=0
}

iteracion=0
iteracion_2=0
iteracion_3=0
ubiact="/home/$USER"
buscamusica 

while : 
do
	echo -e "$DORADO\n\t>>>>>>>>>>>>>>>>> REPRODUCTOR <<<<<<<<<<<<<<<<<\n\n$RESET"
	echo -e "$AZUL$USER TIENES ARCHIVOS MP3 EN LAS SIGUIENTES CARPETAS\n$RESET$DORADO ELIJA UNA PARA REPRODUCIR$RESET"
	for (( i = 0; i < ${#carpeta[@]}; i++ )); do
		echo "$i.- ${carpeta[$i]##*mariohn/}"
	done
	echo "*.- Salir"
	read opdir
	if [[ "$opdir" == "*" ]]; then
		break
	elif [[ "$opdir" -ge "${#carpeta[@]}" ]]; then
		echo -e "Ingresa un valor valido"
	else
		IFS=''
		for (( i = 0; i < ${#direcciones[@]}; i++ )); do
			xdir=`dirname ${direcciones[$i]}`
			if [[ "$xdir" == "${carpeta[$opdir]}" ]]; then
				listamusic[iteracion_3]=${direcciones[$i]}
				iteracion_3=$(($iteracion_3+1))
			fi
		done

		while :
		do
			echo -e "$DORADO Carpeta:${carpeta[opdir]}$RESET\n$AZUL Elija una opcion de reproduccion $RESET"
			for (( i = 0; i < ${#listamusic[@]}; i++ )); do
				echo "$i.- ${listamusic[$i]##*/}"
			done
			echo "? .- Reproducir todas "
			echo "* salir "
			read opsong
			if [[ "$opsong" == "*"  ]]; then
				clear
				break
			elif [[ "$opsong" == "?" ]]; then
				for song in ${listamusic[@]}; do
					mpg123 $song
				done
			elif [[ "$opsong" -ge "${#listamusic[@]}" ]];then
				echo -e "Ingresa un valor valido"
			else
				mpg123 ${listamusic[opsong]}
			fi
			clear
		done
		unset listamusic
		iteracion_3=0
	fi
done