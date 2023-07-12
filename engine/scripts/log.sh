#!/bin/sh

writeLog() {
  local OPTIND # Must be local 
  while getopts "d:r:i:m:" flag; do
    case "${flag}" in
      d) deploymentId=${OPTARG};;
      r) runid=${OPTARG};;
      i) info=${OPTARG};;
      m) message=${OPTARG};;
    esac
  done

  curl --retry 3 --retry-delay 5 --retry-connrefused -X POST http://${apiserver}:3000/api/v1/deployments/${deploymentId}/runs/${runId}/logs/ \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $pipodtoken" \
  -d "{ \"log_level\" : \"${info}\", \"log\" : \"${message}\" }"
}

export -f writeLog
