#!/bin/bash


#Cambiar de clolor
ROJO="\e[31m"
VERDE="\e[32m"
AMARILLO="\e[33m"
AZUL="\e[0;34m"
MAGNETA="\e[35m"
CYAN="\e[0;36m"
BLANCO="\e[97m"
NEGRITA="\e[1m"
RESET="\e[0m"


#variables de ayuda
directiorios=0
files=0
dir=$(pwd);
#VARIABLES DE USUARIO:
pos=0

arbol()
{
  total=$(ls $dir | wc -l);
  if [[ $total -ne 0 ]]
  then
    cont=0
    rama=0

    #for que obtiene todos los archivos de la ruta actual
    for archivo in "$dir"/*
    do
      #ESTE WHILE LE DA FORMATO DE IMPRESIÓN, IMPRIME LAS RAMAS
      while [ $cont -le $1 ]
      do
        if [ $cont -eq 0 ]
        then
          echo -n "   |"
        fi
        if [ $rama -eq 1 ]; then
          echo -n "   |"
          rama=0
        fi
        rama=$(($rama+1))
        cont=$((cont+1))
      done
      rama=0

      #CARPETAS RECURSIVO
      if [ -d "${archivo}" ]; then
        echo -e -n "__$VERDE $NEGRITA${archivo##*/} $RESET \n"
        pos=$(($1+1))
        dir=${dir}/${archivo##*/}
        cd "$dir"
        arbol $pos "$dir" 
        cd ..
        dir=$(pwd)
        directiorios=$(($directiorios+1))

      #EJECUTABLES
      elif [ -x "$archivo" ]; then
        echo -e -n "__ $ROJO${archivo##*/}$RESET\n"
        files=$(($files+1))

      #PARA ARCHIVOS DE AUDIO
      elif [ "${archivo##*.}" = "mp3" ] || [ "${archivo##*.}" = "wav" ] || [ "${archivo##*.}" = "aiff" ] || [ "${archivo##*.}" = "wma" ] || [ "${archivo##*.}" = "flac" ]; then
        echo -e -n "__ $CYAN${archivo##*/}$RESET \n"
        files=$(($files+1))

      #PARA ARCHIVOS DE VIDEOS
      elif [ "${archivo##*.}" = "mp4" ] || [ "${archivo##*.}" = "avi" ] || [ "${archivo##*.}" = "wmv" ] || [ "${archivo##*.}" = "asf" ] || [ "${archivo##*.}" = "mov" ] || [ "${archivo##*.}" = "flv" ] || [ "${archivo##*.}" = "rm" ] || [ "${archivo##*.}" = "rmvb" ] || [ "${archivo##*.}" = "mkv" ] || [ "${archivo##*.}" = "mks" ] || [ "${archivo##*.}" = "3gpp" ];then
        echo -e -n "__ $BLANCO${archivo##*/}$RESET \n"
        files=$(($files+1))

      #FILES
      elif [ -f "$archivo" ]; then
        echo -e -n "__$MAGNETA${archivo##*/} $RESET \n"
        files=$(($files+1))

      fi
      cont=0
    done   
  fi
}



###############################PROGRAMA PRINCIPAL######################3


IFS=''
if [[ "$1" != "" ]]
then
  dir="$1"
fi
if [ -d "${dir}" ];
then
  ubiaux=$(pwd)
  cd "$1"
  dir=$(pwd)
  cd "$ubiaux"
  echo -e "   $NEGRITA$AMARILLO.$RESET$RESET $NEGRITA$VERDE$1$RESET"
  arbol 0 "$dir" 
  echo -e "Hay $directiorios directiorios y $files archivos\n"
else
  echo -e "$ROJO NO EXISTE EL DIRECTORIO: $dir" 
fi