#!/bin/bash

DIR=$(pwd)
DATAFILE="$DIR/$1"

if [ ! -f "$DATAFILE" ]; then
  echo "setenv: Configuration file not found: $DATAFILE"
  return 1
fi

BUCKET=$(grep google_bucket_name $DATAFILE | awk -F '"' '{print $2}')
PROJECT=$(grep google_project_id $DATAFILE | awk -F '"' '{print $2}')
ENVIRONMENT=$(grep deployment_environment $DATAFILE | awk -F '"' '{print $2}')
DEPLOYMENT=$(grep deployment_name $DATAFILE | awk -F '"' '{print $2}')
CREDENTIALS=$(grep google_credentials_json $DATAFILE | awk -F '"' '{print $2}')

if [ -z "$ENVIRONMENT" ]
then
    echo "setenv: 'deployment_environment' variable not set in configuration file."
    return 1
fi

if [ -z "$BUCKET" ]
then
  echo "setenv: 'google_bucket_name' variable not set in configuration file."
  return 1
fi

if [ -z "$PROJECT" ]
then
    echo "setenv: 'google_project_id' variable not set in configuration file."
    return 1
fi

if [ ! -f "$CREDENTIALS" ]
then
    echo "setenv: 'credentials' file not found: $CREDENTIALS."
    return 1
fi

if [ -z "$DEPLOYMENT" ]
then
    echo "setenv: 'deployment_name' variable not set in configuration file."
    return 1
fi

cat << EOF > "$DIR/backend.tf"
terraform {
  backend "gcs" {
    bucket  = "${BUCKET}"
    prefix  = "${ENVIRONMENT}/${DEPLOYMENT}"
  }
}
EOF
cat "$DIR/backend.tf"

GOOGLE_APPLICATION_CREDENTIALS="${DIR}/${CREDENTIALS}"
export GOOGLE_APPLICATION_CREDENTIALS
export DATAFILE

/bin/rm -rf "$DIR/.terraform" 2>/dev/null

echo "setenv: Initializing terraform"
terraform init 

