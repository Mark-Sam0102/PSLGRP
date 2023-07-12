#!/bin/sh 
TF_VARS_file=.local_eks.auto.tfvars 
for n in $(cat common.auto.tfvars); do
  export $(echo "$n" | tr -d '"')
done
cat > $TF_VARS_file << EOL
cluster_name = "pipod-eks-${deploymentId}"
application_name = "piPod"
environment_name = "${account_name}"
added_by = "${requester}"
EOL
cat $TF_VARS_file 