terraform init

terraform apply --auto-approve \
 -var prosimo_token=$TF_VAR_prosimo_token \
 -var prosimo_team_name=$INSTRUQT_PARTICIPANT_ID \
 -var aws_access_key_id=$INSTRUQT_AWS_ACCOUNT_PROSIMO_DEMO_AWS_ACCESS_KEY_ID \
 -var aws_secret_key_id=$INSTRUQT_AWS_ACCOUNT_PROSIMO_DEMO_AWS_SECRET_ACCESS_KEY \
 -var azure_subscription_id=$INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_SUBSCRIPTION_ID \
 -var azure_tenant_id=$INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_TENANT_ID \
 -var azure_client_id=$INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_SPN_ID \
 -var azure_client_secret=$INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_SPN_PASSWORD