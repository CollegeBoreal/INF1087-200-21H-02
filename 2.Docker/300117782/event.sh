#!/bin/sh
echo "########################## LA DATE D'AUJOURD'HUI";
echo `date` $@ >> log.txt;
cat log.txt;
