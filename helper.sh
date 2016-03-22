#!/bin/bash - 

function cp {
  if [ "$2" == "$3" ]; then
    echo "Case $1: YES"
  else
    echo "Case $1: NO"
    echo "#################Left  Value#################"
    echo $2 | cat -A
    echo "#################Right Value#################"
    echo $3 | cat -A
    echo "#############################################"
  fi
}
