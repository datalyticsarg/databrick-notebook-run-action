#!/bin/sh -l

time=$(date)
echo ::set-output name=time::$time

DBURL=$1
TOKEN=$2
CLUSTERID=$3
LOCALPATH=$4
WORKSPACEPATH=$5
OUTFILEPATH=$6

python3 ${SCRIPTPATH}/executenotebook.py --workspace=${DBURL}\
                        --token=$TOKEN\
                        --clusterid=${CLUSTERID}\
                        --localpath=${LOCALPATH}\
                        --workspacepath=${WORKSPACEPATH}\
                        --outfilepath=${OUTFILEPATH}
                        
python3 ${SCRIPTPATH}/evaluatenotebookruns.py ${OUTFILEPATH}