#!/bin/bash

if ! [ -f ./test.sh ]; then
  exit 0
fi

cd $deploymentId || exit 1

for n in $(cat common.auto.tfvars deployment.auto.tfvars); 
do
  export $(echo "$n" | tr -d '"')
done

outputjson=$(cat ui_output.json)
seedJson=”{}”

if [ -f seed_details.json ]; then
  seedJson = $(cat seed_details.json)
fi

echo "Executing test.sh..."
./test.sh outputjson seedJson
