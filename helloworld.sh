#!/bin/bash
# check for correct # of parameters
if [ "$#" -ne 1 ]
  then
    echo "Illegal number of parameters"
    exit
fi

# create the new directory for our program
mkdir -p ~/apps/helloworld/new/$1
# echo contents into c file
echo "
// Hello World C

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
     printf(\"Hello World\\n\");

     return 0;
 }
" > ~/apps/helloworld/new/$1/$1.c
# echo contents into makefile
echo "
$1 : $1.c
		gcc -o $1 $1.c
clean :
		rm *.c
" > ~/apps/helloworld/new/$1/Makefile
# compile program
cd ~/apps/helloworld/new/$1
make
# run program
./$1
# open folder
open ~/apps/helloworld/new/$1