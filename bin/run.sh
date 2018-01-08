### !bin/bash
# bash -e  run.sh 1 100 a config/config.sh

firstCur=$1
lastCur=$2
processesList=$3
configurationFileName=$4
cmcHome=$PWD

echo "firstCur=$1"
echo "lastCur=$2"
echo "processesList=$3"
echo "configurationFileName=$4"
echo "cmcHome=$PWD"

cmcHome=$PWD
source $cmcHome/$configurationFileName $firstCur $lastCur $processesList

if [ $processesList == 'a' ] || echo "$processesList" | grep -q "c"; then
    echo 'coinmarketcap'
        python3 \
        $cmcHome/python/coinmarektcap.py \
        "[$firstCur;$lastCur;$outputFileName]"
fi
