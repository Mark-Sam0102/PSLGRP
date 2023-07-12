#!/bin/sh
writeToTfvarFile() {
  local OPTIND # Must be local

  while getopts "k:v:d:" flag; do
      case "${flag}" in
      k) key=${OPTARG} ;;
      v) value=${OPTARG} ;;
      d) deploymentId_tfvars=${OPTARG} ;;
      esac
  done
  
  if [ "${key}" == "private_subnet_ids" ] || [ "${key}" == "public_subnet_ids" ]; then
      echo "$key=$value"
      output_string=$(echo "$value" | sed 's/\[\([^]]*\)\]/[\1]/' | sed 's/,/","/g' | sed 's/\[\([^]]*\)\]/["\1"]/')
      echo "$key=$output_string" >> $deploymentId_tfvars
  else
      echo "$key=$value"
      echo "$key=\"$value\""
      echo "$key=\"$value\"" >> $deploymentId_tfvars
  fi
}

export -f writeToTfvarFile