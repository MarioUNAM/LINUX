#!/bin/bash
# Nombre del juego: Ahorcado
declare -a word
declare -a imagen_de_palabra
declare -a imagen_abecedario
i=0
error=0
ind_de_la_palabra=0
correct=0
abecedario=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
char=0
if [[ $1 -eq "" ]]; then
	ubi=$(pwd);
else
	ubi=$1
fi

#Leyendo datos
function lectura_de_archivo
{
	clear
	echo -e "\e[34;1mBienvenido este programa fue creado para: \e[0m"
	echo -e "\e[33;1m
	    ____  ____  ____  ______________________ 
	   / __ \/ __ \/ __ \/_  __/ ____/ ____/ __ \\
	  / /_/ / /_/ / / / / / / / __/ / /   / / / /
	 / ____/ _, _/ /_/ / / / / /___/ /___/ /_/ / 
	/_/   /_/ |_|\____/ /_/ /_____/\____/\____/  
	                                             
	\e[0m"
	echo -e "\e[34;1mEscribe OK para continuar: \e[0m"
	exec 3<&0				
	exec 0< $ubi/archivo.dat 		
	while read LINEA		
	do
		word[i]=$LINEA
		i=`expr $i + 1`
		done
		exec 0<&3

}
#Seleccionando palabra 
function lectura_de_palabra {
	indice_de_palabra=$RANDOM

	while [ $indice_de_palabra -ge $i ]	
	do
		indice_de_palabra=$RANDOM
	done
	a=0
	while [ $a -lt ${#word[${indice_de_palabra}]} ] 		
	do
		imagen_de_palabra[$a]=0
		a=`expr $a + 1`
	done
}
#Solicitando letra
function adivina_letra
{
	j=0
	correct=0
	echo -n -e "\e[34;1mPista: Algunos son conceptos vistos durante curso \e[0m"
	echo -n -e "\e[34;1m\nDigita una letra: \e[0m" 
	read adivina_letra
	char=$adivina_letra
	if [ ${#adivina_letra} -eq "1" ]
	then
	
		adivina_letra=`echo $adivina_letra | tr "[:upper:]" "[:lower:]"` 
		while [ $j -lt ${#word[${indice_de_palabra}]} ]
		do
			if [ "$adivina_letra" == "${word[${indice_de_palabra}]:$j:1}" ] 
			then
				imagen_de_palabra[${j}]=1
				correct=1
			fi
			j=`expr $j + 1`
		done
	fi
	r=0
	numero_de_letra=0
	while [ ! $r == ${#word[${indice_de_palabra}]} ]
	do
		
		numero_de_letra=`expr $numero_de_letra + ${imagen_de_palabra[$r]}`
		r=`expr $r + 1`
	done
}
#Dibujos
function dib_horcas 
{
clear
echo -e " \e[34;1m         __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[0m"
}
function dib_horcas_cabeza 
{
clear
echo -e " \e[34;1m          __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "       _/_\_       |"
echo -e "        (_)        |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[0m"
}
function dib_horcas_cuerpo {
clear
echo -e "  \e[34;1m         __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "       _/_\_       |"
echo -e "        (_)        |"
echo -e  "         |         |"
echo -e "         |         |"
echo -e "         |         |"
echo -e "         |         |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[0m"
}
function dib_horcas_brazo1 {
clear
echo -e " \e[34;1m          __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "       _/_\_       |"
echo -e "        (_)        |"
echo -e "         |         |"
echo -e "      ---|         |"
echo -e "         |         |"
echo -e "         |         |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[0m"
}
function dib_horcas_brazo2 {
clear
echo -e "  \e[34;1m         __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "       _/_\_       |"
echo -e "        (_)        |"
echo -e "         |         |"
echo -e "      ---|---      |"
echo -e "         |         |"
echo -e "         |         |"
echo -e "                   |"
echo -e "                   |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[0m"
}
function dib_horcas_pierna1 {
clear
echo -e " \e[34;1m          __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "       _/_\_       |"
echo -e "        (_)        |"
echo -e "         |         |"
echo -e "      ---|---      |"
echo -e "         |         |"
echo -e "         |         |"
echo -e "        /          |"
echo -e "      _/           |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[0m"
}
function dib_horcas_pierna2 {
clear
echo -e "  \e[34;1m         __________"
echo -e "         |         |"
echo -e "         |         |"
echo -e "       _/_\_       |"
echo -e "        (_)        |"
echo -e "         |         |"
echo -e "      ---|---      |"
echo -e "         |         |"
echo -e "         |         |"
echo -e "        / \        |"
echo -e "      _/   \_      |"
echo -e "                   |"
echo -e "      _____________|_____"
echo -e "                           \e[34;1m"
}
function imprime_ganaste {
echo -e " \e[34;1m_  ____    _    _   _    _    ____ _____ _____ _ "
echo -e "(_)/ ___|  / \  | \ | |  / \  / ___|_   _| ____| |"
echo -e "| | |  _  / _ \ |  \| | / _ \ \___ \ | | |  _| | |"
echo -e "| | |_| |/ ___ \| |\  |/ ___ \ ___) || | | |___|_|"
echo -e "|_|\____/_/   \_\_| \_/_/   \_\____/ |_| |_____(_)\e[34;1m"

echo -en "\n\n\n"
}
function imprime_perdiste {
echo -e " \e[34;1m_                 _ "
echo -e "(_)_   _ _ __  ___| |"
echo -e "| | | | | '_ \/ __| |"
echo -e "| | |_| | |_) \__ \_|"
echo -e "|_|\__,_| .__/|___(_)"
echo -e "        |_|          \e[34;1m"
echo "La palabra incognita era: \"${word[$indice_de_palabra]}\""
}
function imprime_abecedario {
	echo -e "\nLetras introducidas:"
	
	e=0
	while [ ! "$e" == "26" ]	
	do
		if [ "$char" == "${abecedario[$e]}" ]
		then
			imagen_abecedario[$e]="1"
		fi
		
		if [ ${imagen_abecedario[$e]} == "1" ] 
		then
			echo -n ${abecedario[$e]} 
		else
			echo -n "-" 
		fi
		
		if [ $e == "12" ]
		then
			echo -e "\n"
		fi
		((e++))
	done
	echo -ne "\n\n"
	char=""
}

function imprime_la_palabra {
	echo -ne "\nPalabra incognita: "
	t=0
	while [ ! $t == ${#word[${indice_de_palabra}]} ]
	do
			if [ ${imagen_de_palabra[${t}]} == "1" ]
			then
				echo -n "${word[${indice_de_palabra}]:$t:1}" 
			else
				echo -n "-"
			fi
			t=`expr $t + 1`
	done
	echo -e "\n\n"
}
#Funcion principal
lectura_de_archivo;
gameover=0
error=0
correct=0
while [ "$gameover" == "0" ] 
do

	a=0
	while [ ! "$a" == "26" ]
	do
		imagen_abecedario[$a]=0
		a=`expr $a + 1`
	done

	imagen_de_palabra=0
	imagen_abecedario=0	
	error=0
	correct=0
	lectura_de_palabra;  
	a=0
	dib_horcas;
	imprime_abecedario;
	imprime_la_palabra;

        
	while [[ ! "${numero_de_letra}" == "${#word[${indice_de_palabra}]}" && ! "$error" == "6" ]]
	do
		adivina_letra;
	
		if [ $correct == "0" ]
		then 
			error=`expr $error + 1`
		fi	
	
		if [ $error == "0" ]
		then
			dib_horcas;
		elif [ $error == "1" ]
		then
			dib_horcas_cabeza;
		elif [ $error == "2" ]
		then
			dib_horcas_cuerpo;
		elif [ $error == "3" ]
		then
			dib_horcas_brazo1;
		elif [ $error == "4" ]
		then
			dib_horcas_brazo2;
		elif [ $error == "5" ]
		then
			dib_horcas_pierna1;
		elif [ $error == "6" ]
		then
			dib_horcas_pierna2;
		fi
		imprime_abecedario;
		imprime_la_palabra;
		
	done
	if [ "${numero_de_letra}" == "${#word[${indice_de_palabra}]}" ]
	then
	imprime_ganaste;
	gameover=1
	fi
	if [ $error == "6" ]
	then
	clear;
	imprime_perdiste;
	gameover=1
	fi

	if [ "$gameover" == "1" ] 
	then
		echo -e "\n\n Quieres jugar de nuevo? (s/n)"
		read answer
		if [ "$answer" == "s" ]
		then
			gameover=0
		fi
		clear
	fi
done
exit 0

