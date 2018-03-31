#!/bin/bash

if [ "$1" == 'on' ]; then
  tvservice -p ; chvt 6 ; chvt 7
  xrefresh -d :0;
  #echo 'Switched Screen ON!' | wall
fi

if [ "$1" == 'off' ]; then
  tvservice -o
  #echo 'Switched Screen OFF!' | wall
fi
