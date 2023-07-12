#!/bin/bash

echo "=== start 004-seed.sh"

echo "--- changing folder to $deploymentId"
pwd && cd ./$deploymentId && ls -l || exit 1

echo "--- export variables from common.auto.tfvars and deployment.auto.tfvars"
for n in $(cat common.auto.tfvars deployment.auto.tfvars); do
	export $(echo "$n" | tr -d '"')
done

if [ -f ./pipod_output.env ]; then
	echo "--- source pipod_output.env as env variables"
  source ./pipod_output.env
fi

current_dir=`pwd`
echo "--- user_seed_type = $user_seed_type"
if [ "$user_seed_type" = "terraform" ]; then
  echo "--- using terraform to execute seed user function"
  
  cp ./common.auto.tfvars ./seed/user
  cp ./deployment.auto.tfvars ./seed/user
  cp ./provider.env ./seed/user
  cp ./backend.tf ./seed/user
  cp -r ./.aws ./seed/user

  cd ./seed/user && ls -al

  echo "--- executing terraform init for seed user operation"
  if [ "$pipodProvider" = "aws" ]; then
    terraform init -backend-config="bucket=$pipodBucket" -backend-config="region=$pipodRegion" -backend-config="key=deployments/$type/seed/user-${deploymentId}.tfstate" -reconfigure || exit 1
  elif [ "$pipodProvider" = "azure" ]; then
    terraform init -backend-config="access_key=${azureAccessKey}" -backend-config="key=deployments/$type/seed/user-${deploymentId}.tfstate" -reconfigure || exit 1
  fi

  echo "--- executing terraform plan for seed user operation"
  terraform plan -out=seed-user.tfplan
  if [ ! -f ./seed-user.tfplan ]; then
    echo "--- seed-user.tfplan not generated"
  fi

  {
    echo "--- executing terraform apply for seed user operation"
    terraform apply --auto-approve seed-user.tfplan &&
    export TF_OUTPUTS=$(terraform output -raw seed_user_output) &&
    echo ${TF_OUTPUTS} > seed_user_output.json
  } || {
    echo "--- terraform apply failed for seed user operation. destroying ghost resources.."
    terraform destroy --auto-approve
    exit 1
  }

  echo "--- copy seed_user_output.json to deployment dir"
  if [ -f ./seed_user_output.json ]; then
    cp ./seed_user_output.json ../../
  fi
else
  if [ -f ./seed.sh ] ; then
    echo "--- executing seed.sh..."
    chmod +x ./seed.sh
    ./seed.sh
  fi
fi

echo "--- change back to deployment dir"
cd $current_dir && ls -al

if [ -f ./seed_user_output.json ]; then
  echo "--- processing seed users data"
  chmod +x ../engine/scripts/add-seed-users-to-output.sh
  ../engine/scripts/add-seed-users-to-output.sh -o `pwd`/ui_output.json -u `pwd`/seed_user_output.json
else
  echo "--- seed users data not available"
fi

echo "=== end 004-seed.sh"
exit 0
