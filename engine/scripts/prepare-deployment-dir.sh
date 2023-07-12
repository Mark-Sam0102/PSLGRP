#!/bin/bash

echo "=== start prepare-deployment-dir.sh ==="

. engine/scripts/log.sh

echo "=== exporting variables from common and deployment tf vars as env variables"
for n in $(cat ${deploymentId}/common.auto.tfvars ${deploymentId}/deployment.auto.tfvars); do
  export $(echo "$n" | tr -d '"')
done

if [ -z "$catalog_source" ];
then
    echo "=== catalog_source attribute not specified in catalog json. checking files in modules dir"

    if test -d "modules/custom/$type" ; then
        cp -r modules/custom/$type/* ${deploymentId}
    else 
        echo "=== required catalog is not present under modules."
        writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Catalog type not found in catalog source"
        exit 1
    fi
else
    echo "=== catalog_source is present"
    
    mkdir catalogSource_dir_${deploymentId}
    git clone --branch main $catalog_source catalogSource_dir_${deploymentId}
    rm -rf catalogSource_dir_${deploymentId}/.git
    
    if test -d "catalogSource_dir_${deploymentId}/$type" ; then
        cp -r catalogSource_dir_${deploymentId}/$type/* ${deploymentId}
        rm -r catalogSource_dir_${deploymentId}
    else 
        echo "=== cloned repository does not contain the required catalog dir"
        
        writeLog -d ${deploymentId} -r ${runId} -i "error" -m "Catalog type not found in catalog source"
        rm -r catalogSource_dir_${deploymentId}
        exit 1
    fi
fi

if [ "$pipodProvider" = "aws" ]; then
  cp engine/template/backend.tf.aws ${deploymentId}/backend.tf
elif [ "$pipodProvider" = "azure" ]; then
  cp engine/template/backend.tf.azure ${deploymentId}/backend.tf
fi

echo "=== end prepare-deployment-dir.sh ==="
