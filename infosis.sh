#!/bin/bash

#Mtotal=`cat /proc/meminfo | grep "MemTotal" | grep "[1-9].*" -o`
#Mlibre=`cat /proc/meminfo | grep "MemFree" | grep "[1-9].*" -o`
#Mswap=`cat /proc/meminfo | grep "SwapTotal" | grep "[1-9].*" -o`

#Aquí creé éstas variables para no perderme, pero bien se pueden imprimir directamente

#SO=`cat /proc/sys/kernel/ostype`
#Kernel=`cat /proc/version | awk {'print $3'}`
#Procesador=`cat /proc/cpuinfo | grep --max-count=1 "model name"`
#VProcesador=`cat /proc/cpuinfo | grep "cpu MHz"`
#CProcesador=`cat /proc/cpuinfo | grep --max-count=1 "cache size"`

clear
echo -e "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e ""
echo -e "\e[34;3m            		 Informacion de tu sistema\e[0m"
echo ""
echo -e "\e[33;3m  El sistema operativo es `cat /proc/sys/kernel/ostype`\e[0m"
echo -e "\e[33;3m  La versión del kernel es`cat /proc/version | awk {'print $3'}`\e[0m" 
echo ""
echo -e "\e[33;3m  La memoria total es de `cat /proc/meminfo | grep "MemTotal" | grep "[1-9].*" -o`\e[0m"
echo -e "\e[33;3m  La memorial libre es de `cat /proc/meminfo | grep "MemFree" | grep "[1-9].*" -o`\e[0m"
echo -e "\e[33;3m  La swap es de `cat /proc/meminfo | grep "SwapTotal" | grep "[1-9].*" -o`\e[0m"

echo ""
echo -e "\e[33;3m  El procesador es `cat /proc/cpuinfo | grep --max-count=1 "model name"`\e[0m"
echo -e "\e[33;3m  El tamaño de la memoria caché es de `cat /proc/cpuinfo | grep --max-count=1 "cache size"`\e[0m"
echo -e "\e[33;3m  La velocidad de cada nucleo es\e[0m\n\e[1m`cat /proc/cpuinfo | grep "cpu MHz"` \e[0m"
echo -e ""
echo -e "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"