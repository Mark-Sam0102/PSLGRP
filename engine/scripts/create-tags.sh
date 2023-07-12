# #!/bin/bash

echo "=== start create-tags.sh"

cat > common-tags.auto.tfvars << EOL
tags = {  
    type="${type}"
    deployment_id="${deploymentId}"
    requester="${requester}"
    owner="${owner}" 
    account_id="${account}"
    account_name="${account_name}"
}
EOL

echo "--- printing common tags"
cat common-tags.auto.tfvars

echo "=== end create-tags.sh"
