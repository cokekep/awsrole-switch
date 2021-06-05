#!/bin/sh

usage="awsrole <role_arn> [<mfa_code> <source_profile>]"

_role_arn=$1
_mfa_code=$2
_source_profile=${3:-"epilot-access"}

if [ -z "$_role_arn" ]; then
  echo Usage: $usage
  exit 1
fi

# get first mfa device serial
mfa_serial=$(
  aws iam list-mfa-devices \
    --profile $_source_profile \
    --query "MFADevices[0].SerialNumber" \
    --output text
)

if [ -z "$_mfa_code" ]; then
  # ask for MFA code
  echo "Enter MFA code for $mfa_serial:"
  read _mfa_code
fi

# get credentials from assume-role
credentials_json=$(
  aws sts assume-role \
    --profile $_source_profile \
    --role-arn $_role_arn \
    --role-session-name awsrole-$USER \
    --serial-number $mfa_serial \
    --token-code $_mfa_code \
    --output json
)

# export aws credentials
export AWS_ACCESS_KEY_ID=`jq -r '.Credentials.AccessKeyId' <<< $credentials_json`
export AWS_SECRET_ACCESS_KEY=`jq -r '.Credentials.SecretAccessKey' <<< $credentials_json`
export AWS_SESSION_TOKEN=`jq -r '.Credentials.SessionToken' <<< $credentials_json`
