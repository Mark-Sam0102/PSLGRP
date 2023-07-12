#!/bin/bash

echo "=== start update-run-details.sh"

echo "--- change to deployment dir $deploymentId"
pwd && cd ./$deploymentId && ls -l | exit 1

echo "--- exporting tf variables as env variables"
for n in $(cat common.auto.tfvars deployment.auto.tfvars); do
  export $(echo "$n" | tr -d '"')
done

while getopts "f:d:r:a:s:" flag; do
    case "${flag}" in
    f) FAILED_STAGE=${OPTARG} ;;
    d) deploymentId=${OPTARG} ;;
    r) runId=${OPTARG} ;;
    a) apiserver=${OPTARG} ;;
    s) status=${OPTARG} ;;
    esac
done

echo "--- printing catalog output from ui_output.json"
cat ui_output.json

if [ "$FAILED_STAGE" = "None" ]; then
    outputjson=$(cat ui_output.json)
else
    outputjson="{}"
fi

curl --retry 3 --retry-delay 5 --retry-connrefused -X PUT \
http://${apiserver}:3000/api/v1/deployments/${deploymentId}/runs/${runId} \
-H 'Content-Type: application/json' \
-H 'cache-control: no-cache' \
-H "Authorization: Bearer $pipodtoken" \
-d "{ \"status\": \"${status}\", \"output\": ${outputjson}}"

echo "=== end update-run-details.sh"
