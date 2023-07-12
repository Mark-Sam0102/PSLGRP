#!/bin/bash

cd ./$deploymentId || exit 1

for n in $(cat common.auto.tfvars deployment.auto.tfvars); do
  export $(echo "$n" | tr -d '"')
done

echo ${PIPOD_BUILD_ID}
. ../engine/scripts/create-tags.sh

while getopts "s:" flag; do
  case "${flag}" in
    s) azureAccessKey=${OPTARG} ;;
  esac
done

if [ "$pipodProvider" = "aws" ]; then
  terraform init -backend-config="bucket=$pipodBucket" -backend-config="region=$pipodRegion" -backend-config="key=deployments/$type/${deploymentId}.tfstate" -reconfigure || exit 1
elif [ "$pipodProvider" = "azure" ]; then
  terraform init -backend-config="access_key=${azureAccessKey}" -backend-config="key=deployments/$type/${deploymentId}.tfstate" -reconfigure || exit 1
fi
