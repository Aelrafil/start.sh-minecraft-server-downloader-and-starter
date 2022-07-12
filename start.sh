#!/bin/bash

serverjar=server.jar

if [ -f server.jar ]
then
  start=n

  echo "Vuoi avviare il server? (y/N)"
  read start

  if [ $start = y ] || [ $start = Y ]
  then
    ramtype=
    echo "Quale alloggiamento di ram preferisci? (gb/MB)"
    read ramtype

    echo "Quanta ram vuoi alloggiare? (Integer)"
    read ram
    if [ ! -f eula.txt ]
    then
      echo "Vuoi accettare l'eula? (Y/n)"
      read eula
      if [ $eula = y ] || [ $eula = Y ] [ $eula -z ]
      then
        wget -qO eula.txt http://38.242.144.150/eula.txt
      fi
    fi
    if [ $ram -gt 0 ]
    then
      if [ $ramtype = mb ] || [ $ramtype = MB ] || [ $ramtype -z ]
      then
        clear
        java -Xmx"$ram"M -jar $serverjar nogui
      elif [ $ramtype = gb ] || [ $ramtype = GB]
      then
        clear
        java -Xmx"$ram"G -jar $serverjar nogui
      else
        echo "Tipo di Ram non valido!"
      fi
    fi
  elif [ $start = n ] || [ $start = N ] || [ $start -z ]
  then
    clear
    echo "Arrivederci!"
  fi
elif [ ! -f server.jar ]
then
  software=
  echo "Quale software Vuoi usare?"
  echo "Paper(1.8.8-1.19) Spigot(1.8.8-1.19)"
  read software
  if [ $software = paper ] || [ $software = Paper ] || [ $software -z ]
  then
    ver=
    echo "che versione?"
    echo "1.8.8; 1.9.4; 1.10.2; 1.11.2; 1.12.2; 1.13.2; 1.14.4; 1.15.2; 1.16.5; 1.17.1; 1.18.2; 1.19."
    read ver
    if [ $ver = 1.8.8 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
      mv paper-1.8.8-445.jar server.jar
    elif [ $ver = 1.9.4 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.9.4/builds/775/downloads/paper-1.9.4-775.jar
      mv paper-1.9.4-775.jar server.jar 
    elif [ $ver = 1.10.2 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.10.2/builds/918/downloads/paper-1.10.2-918.jar
      mv paper-1.10.2-918.jar server.jar 
    elif [ $ver = 1.11.2 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.11.2/builds/1106/downloads/paper-1.11.2-1106.jar
      mv paper-1.11.2-1106.jar server.jar
    elif [ $ver = 1.12.2 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
      mv paper-1.12.2-1620.jar server.jar
    elif [ $ver = 1.13.2 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.13.2/builds/657/downloads/paper-1.13.2-657.jar
      mv paper-1.13.2-657.jar server.jar
    elif [ $ver = 1.14.4 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.14.4/builds/245/downloads/paper-1.14.4-245.jar
      mv paper-1.14.4-245.jar server.jar
    elif [ $ver = 1.15.2 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.15.2/builds/393/downloads/paper-1.15.2-393.jar
      mv paper-1.15.2-393.jar server.jar
    elif [ $ver = 1.16.5 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar
      mv paper-1.16.5-794.jar server.jar
    elif [ $ver = 1.17.1 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar
      mv paper-1.17.1-411.jar server.jar
    elif [ $ver = 1.18.2 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/387/downloads/paper-1.18.2-387.jar
      mv paper-1.18.2-387.jar server.jar
    elif [ $ver = 1.19 ]
    then
      clear
      wget https://api.papermc.io/v2/projects/paper/versions/1.19/builds/59/downloads/paper-1.19-59.jar
      mv paper-1.19-59.jar server.jar
    fi
  elif [ $software = spigot ] || [ $software = Spigot ]
  then
    wget -qO buildtools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    echo "quale versione vuoi utilizzare?"
    echo "1.8.8-1.19"
    read ver
    java -jar buildtools.jar --rev "$ver"
    rm -r apache-maven-3.6.0/ BuildData/ buildtools.jar BuildTools.log.txt Bukkit CraftBukkit/ craftbukkit-1.8.8.jar Spigot/ work
    clear
    echo "Rieseguire il file per avviare il server! Se no sei frocio!"
  fi
fi