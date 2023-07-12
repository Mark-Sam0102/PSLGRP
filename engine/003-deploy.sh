#!/bin/bash

echo "=== start 003-deploy.sh"

cd ./$deploymentId || exit 1

echo "--- export variables from common.auto.tfvars and deployment.auto.tfvars"
for n in $(cat common.auto.tfvars deployment.auto.tfvars); do
	export $(echo "$n" | tr -d '"')
done

echo "--- import log function"
. ../engine/scripts/log.sh

echo "--- check if init.sh exists"
if [ -f ./init.sh ]; then
{
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing init steps for deployment"
	chmod +x init.sh

	./init.sh &&
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of init steps completed"
} || {
	writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of init steps failed"
	exit 1
}
fi

echo "--- check if pre-deploy.sh exists"
if [ $PIPOD_OPERATION = "create" ] && [ -f ./pre-deploy.sh ]; then
{
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing pre deploy steps for deployment"
	./pre-deploy.sh &&
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of pre deploy steps completed"
} || {
	writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of pre deploy steps failed"
	exit 1
}
fi

{
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing plan stage for deployment"
	terraform plan -out=autocloud.tfplan &&
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of plan stage completed"
} || {
	writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of plan stage failed"
	exit 1
}

{
	logMsgStart="Provisioning resources"
	logMsgEnd="Resource provisioning completed"
	
	if [ $PIPOD_OPERATION = "update" ];
	then
    logMsgStart="Updating deployment"
		logMsgEnd="Deployment update completed"
	fi

	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "$logMsgStart"
	
	terraform apply --auto-approve autocloud.tfplan &&
	export TF_OUTPUTS=$(terraform output -raw ui_output) &&
	echo ${TF_OUTPUTS} > ui_output.json &&
	terraform output | sed -n '/ui_output/,$!p' | sed 's/\s*=\s*/=/g' >> pipod_outputs.env &&
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "$logMsgEnd"
} || {
	logMsg="Resource provisioning failed"
	
	if [ $PIPOD_OPERATION = "update" ];
	then
    	logMsg="Deployment update failed"
	fi

	writeLog -d ${deploymentId} -r ${runId} -i "error" -m "$logMsg"
	terraform destroy --auto-approve
	exit 1
}

if [ $PIPOD_OPERATION = "create" ] && [ -f ./post-deploy.sh ]; then
{
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Executing post deploy steps for deployment"
	./post-deploy.sh &&
	writeLog -d ${deploymentId} -r ${runId} -i "info" -m "Execution of post deploy steps completed"
} || {
	writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Execution of post deploy steps failed"
	exit 1
}
fi

echo "=== end 003-deploy.sh"
