#!/bin/bash

# Setup and run a load of analysis scripts for various folders with spectr*.tgz

NJOBS=50

for f in $@
do
    echo $f
    cp Proto_files/analyse.condor $f/analyse.condor
    sed -i "s@SEDJOBDIR@$f@g" $f/analyse.condor
    sed -i "s/SEDNUM/$NJOBS/g" $f/analyse.condor
    condor_submit $f/analyse.condor
    sleep 120  
    # give it a pause so you don't clog up the queue - analysis jobs should run v.quickly
done
