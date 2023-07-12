#!/bin/bash

echo "=== start: add seed user details to catalog output"

while getopts "o:u:d" flag; do
    case "${flag}" in
    o) UI_OUTPUT_JSON_FILE=${OPTARG} ;;
    u) USER_SEED_DETAILS_JSON_FILE=${OPTARG} ;;
    esac
done

if [ ! -f $UI_OUTPUT_JSON_FILE ]; then
  echo "--- $UI_OUTPUT_JSON_FILE not found"
  exit 0
fi

if [ ! -f $USER_SEED_DETAILS_JSON_FILE ]; then
  echo "--- $USER_SEED_DETAILS_JSON_FILE not found"
  exit 0
fi

echo "--- reading $UI_OUTPUT_JSON_FILE into array"
SAVEIFS=$IFS
IFS=$'\n'
names=(`cat $UI_OUTPUT_JSON_FILE | jq -r '.[] | .name'`)
IFS=$SAVEIFS

array_length=${#names[@]}
for (( i=0; i<${array_length}; i++ ))
do
  echo "--- processing index $i and section ${names[$i]}"
  userObject=`cat $USER_SEED_DETAILS_JSON_FILE | jq --arg name ${names[$i]} '.[] | select(.name == $name) | .users'`

  echo "--- updating catalog section with user details"
  echo $userObject > temp-users.json
  
  updatedCatalog=`cat $UI_OUTPUT_JSON_FILE | jq --arg name ${names[$i]} '.[] | select(.name == $name)' | jq --argjson userObject "$(cat temp-users.json)" '. + {users: $userObject}'`
  rm -f temp-users.json

  echo $updatedCatalog > $i-catalog-object.json
  echo "--- saved updated catalog section in $i-catalog-object.json"
done

echo "--- creating final output.."
echo "[" > final.json
for (( i=0; i<${array_length}; i++ ))
do
  filename=${i}-catalog-object.json
  cat $filename >> final.json

  if [[ "$i" < $(($array_length - 1)) ]]; then
    echo "," >> final.json
  fi

  rm -f $filename
done

echo "]" >> final.json

echo "--- copying final.json to $UI_OUTPUT_JSON_FILE"
jq -r '.' final.json > $UI_OUTPUT_JSON_FILE
rm -f final.json

echo "=== end: add seed user details to catalog output"
