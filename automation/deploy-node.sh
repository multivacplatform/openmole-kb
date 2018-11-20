#!/bin/bash

userName=$1
echo "input userName: $1"
export USERNAME=$userName
echo "accepted userName: $USERNAME"
envsubst < openmole-deploy.yaml | kubectl apply -f -

for i in {1..2}
do
  echo "deploying user$i"   
	./deploy-node.sh user$i
	echo "waiting..."  
	sleep 20
done
