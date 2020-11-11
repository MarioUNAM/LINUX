#!/bin/bash

fileSearch()
{
  
  for archivo in "$ubiact"/*; do
    if [ "${archivo##*/}" = "${arch}" ]; then
      find="${archivo}"
      file_live=1
    fi
  done
}

buscacarpeta()
{
  for archivo in "$ubiact"/*; do
    if [ -d "${archivo}" ]
    then
      if [ "${archivo##*/}" = "${carpeta}" ]
      then
        dir_live=1
        ubiact=${ubiact}/${archivo##*/}
        cd "$ubiact"
        fileSearch "$ubiact"
        break
      else
        ubiact=${ubiact}/${archivo##*/}
        cd "$ubiact" 2>> /dev/null
        buscacarpeta  
        cd ..
        ubiact=$(pwd)
      fi
    fi
  done
}

###############PROGRAMA PRINCIPAL########################
IFS=''
if [[ "$1" == "" || "$2" == ""  ]]
then
  echo -e "Debes de ingresar el nombre del archivo y la carpeta donde buscarlo"
  echo -e "La manera de utilizar el comando es la siguiente: "
  echo -e "buscar \"nombre_archivo\" \"nombre_carpeta\""
else
  arch=$1
  carpeta=$2
  ubiact="/home/$USER"
  file_live=0
  dir_live=0
  pos=0
  find=""

  buscacarpeta
  if [[ "$dir_live" -eq 0 ]]
  then
    echo -e "El directorio: $carpeta no exite dentro dentro de los archivos de $USER"
  elif [[ $file_live -eq 0 ]]; then
     echo -e "${arch} no existe en la carpeta: ${carpeta}\n"
  else
    echo -e "ARCHIVO ENCONTRADO EN LA RUTA: $find"
  fi
fi
