#!/bin/sh 
TF_VARS_file=.local_mssql.auto.tfvars 
for n in $(cat common.auto.tfvars); do
  export $(echo "$n" | tr -d '"')
done
cat > $TF_VARS_file << EOL
rds_name			= "pipod-rds-mssql-${deploymentId}"
username		= "root"
application_name = "piPod"
environment_name = "${account_name}"
added_by = "${requester}"
deletion_protection	= "false"
EOL
cat $TF_VARS_file 

