#!/bin/bash

# this code uses terraform-plan-parser.
# this parser allows the textual log output from terraform plan to be converted to JSON which is more machine readable.
# currently, terraform-plan-parser do not support terraform 1.4. For more details refer https://github.com/lifeomic/terraform-plan-parser

# install terraform plan parser using npm
# https://github.com/lifeomic/terraform-plan-parser
# installTerraformPlanParser() {
#	npm install -g terraform-plan-parser
#}

# after impact assessment, send assessment results json to api
processImpactPlan(){
	if [ -f ./pipod-deployment-impact.json ]; then
	{
  		impactJson=$(cat pipod-deployment-impact.json)
		status="completed"
		echo "Impact analysis for existing deployment completed"
	} else {
		echo "Output of impact analysis not available"
		impactJson="{}"
		status="failed"
	fi
	}

	curl -X PUT \
	http://${apiserver}:3000/api/v1/deployments/${deploymentId}/impacts/${impactRequestId} \
	-H 'Content-Type: application/json' \
	-H 'cache-control: no-cache' \
	-H "Authorization: Bearer $pipodtoken" \
	-d "{ \"status\": \"${status}\", \"impact\": ${impactJson}}"
	
	echo "--- impact analysis output sent to pipod api"
	exit 0
}

cd ./$deploymentId || exit 1

# export tf variables as env variables
for n in $(cat common.auto.tfvars deployment.auto.tfvars); do
	export $(echo "$n" | tr -d '"')
done

if [ -f ./init.sh ]; then
{
	chmod +x init.sh
	writeLog -d ${deploymentId} -i "info" -m "Executing init steps for deployment"
	./init.sh && echo "Execution of init steps completed"
} || {
  	echo "Execution of init steps failed"
	exit 1
}
fi

{
	echo "Executing plan stage for deployment"
	# terraform plan -out=autocloud.tfplan &&
	# Store "terraform plan" output in file
	terraform plan > terraform-plan.stdout &&
	echo "Execution of plan stage completed"
} || {
	echo "Execution of plan stage failed"
	exit 1
}

{
	echo "Analyzing impacts to existing deployment"
	# installTerraformPlanParser && 
	# Read from "terraform plan" output file and write to JSON file
	parse-terraform-plan --pretty -i terraform-plan.stdout -o pipod-deployment-impact.json &&
  	processImpactPlan
} || {
	echo "Impact analysis for existing deployment failed"
	exit 1
}
