#!/bin/bash

cd ./$deploymentId || exit 1

echo "--- list folder contents"
pwd && ls -al

for n in $(cat common.auto.tfvars deployment.auto.tfvars); do
	export $(echo "$n" | tr -d '"')
done

echo "--- import log function"
. ../engine/scripts/log.sh

if [ -f ./init.sh ]; then
{
  writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing init steps for the delete deployment operation"
  chmod +x init.sh

  ./init.sh &&
  writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of init steps completed"
} ||
{
  writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of init steps failed"
  exit 1
}
fi

if [ -f ./pre-destroy.sh ]; then
{
  writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing pre destroy steps for delete deployment operation"
  chmod +x ./pre-destroy.sh

  ./pre-destroy.sh &&
  writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of pre destroy steps completed"
} ||
{
  writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of pre destroy steps failed"
  exit 1
}
fi

{
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing delete stage"
	ls &&
	terraform destroy --auto-approve &&
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of delete stage completed"
} ||
{
	writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of delete stage failed"
	exit 1
}

if [ -f ./post-destroy.sh ]; then
{
  writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing post destroy steps for delete deployment operation"
  chmod +x ./post-destroy.sh

  ./post-destroy.sh &&
  writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of post destroy steps completed"
} ||
{
  writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of post destroy steps failed"
  exit 1
}
fi
