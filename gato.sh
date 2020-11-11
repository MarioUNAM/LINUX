#!/bin/bash


ROJO="\e[31m"
VERDE="\e[32m"
AMARILLO="\e[33m"
AZUL="\e[0;34m"
MAGNETA="\e[35m"
CYAN="\e[0;36m"
BLANCO="\e[97m"
NEGRITA="\e[1m"
RESET="\e[0m"


#Recibe que jugador es y selecciona la casilla
function jugador()
{
	while :
	do
		if [[ $contador = 9 ]]
		then
			ganador=3;	#Condicion de empate, rompe el while principal
			break;
		fi

		echo -e "$NEGRITA Jugador $1, ingrese el numero de la casilla que desee: $RESET";
		read N;

		if [ "$N" -ge "1" 2>/dev/null ] && [ $N -le "9" ] && [ ${line[${N}-1]} = 0 ] 
			then
				line[${N}-1]=$1; 
				((contador++)); 
				break
			else
				echo -e "$ROJO Lugar ocupado o casilla invalida. Intente de nuevo.$RESET";
		fi
	done
}

#Recibe que jugador es y revisa si gano
function check()
{
	#Revisa horizontales
	for (( i = 0; i < 9; i=i+3 )); do 
		if [ ${line[${i}]} = "$1" ] && [ ${line[1+${i}]} = "$1" ] && [ ${line[2+${i}]} = "$1" ]
		then
			ganador=$1;
			break;	
		fi
	done
	#Revisa verticales
	for (( i = 0; i < 3; i++ )); do
		if [ ${line[${i}]} = "$1" ] && [ ${line[3+${i}]} = "$1" ] && [ ${line[6+${i}]} = "$1" ]
		then
			ganador=$1;
			break;
		fi
	done
	#Revisa diagonal
	if [ ${line[0]} = "$1" ] && [ ${line[4]} = "$1" ] && [ ${line[8]} = "$1" ] 
	then
		ganador=$1;
		break;
	fi
	#Revisa antidiagonal
	if [ ${line[2]} = "$1" ] && [ ${line[4]} = "$1" ] && [ ${line[6]} = "$1" ] 
	then
		ganador=$1;
		break;
	fi
}

#Dibuja e gato
function dibujagato()
{
	clear
	echo -e "$MAGNETA \t GATO";
	echo -e "Jugador 1 es X. Jugador 2 es O$RESET";
	for (( i = 0; i < 3 ; i++ )); do 
			for (( j = 1; j < 4; j++ )); do		
				if [ "${line["$((($j+3*$i)-1))"]}" = 1 ]; then
					a["$((j-1))"]="$ROJO"X"$RESET";
					
				elif [ "${line["$((($j+3*$i)-1))"]}" = 2 ]; then
					a["$((j-1))"]="$AZUL"O"$RESET";
				else
					a["$((j-1))"]="$(($j+3*$i))"
				fi
			done

			echo -e "$AZUL _____________";
			echo -e " |   |   |   |$RESET";
			echo -e "$AZUL | $RESET"${a[0]}"$AZUL | $RESET"${a[1]}"$AZUL | $RESET"${a[2]}"$AZUL |$RESET";
			echo -e "$AZUL |___|___|___|$RESET";
	done	
}


#FUNCION PRINCIPAL
ganador=0; 
contador=0; 
line=(0 0 0 0 0 0 0 0 0); 
dibujagato

while :
do

	while [ $ganador = 0 ]
	do
		jugador 1
		check 1
		if [[ $ganador = 1 ]]; then
			break
		fi
		dibujagato
		jugador 2
		check 2
		dibujagato
	done

	dibujagato

	if [[ $ganador = 3 ]]; then 
		echo -e "$VERDE Empate! $RESET"
		gameover=1
	else
		echo -e "$VERDE Ganó el jugador: "$ganador""
		echo -e -n "$RESET"
		gameover=1
	fi

	if [ "$gameover" == "1" ] 
	then
		echo -e "$MAGNETA\n\nQuieres jugar de nuevo? (s/n)$RESET"
		read respuesta
		if [ "$respuesta" == "s" ]
		then
			gameover=0
			ganador=0
			contador=0; 
			line=(0 0 0 0 0 0 0 0 0); 
			clear
			dibujagato
		else
			break
		fi
		
	fi
done