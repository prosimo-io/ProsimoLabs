#/bin/bash

curl -s https://${INSTRUQT_PARTICIPANT_ID}.admin.prosimo.io/api/network/onboard  -H "Content-Type: application/json"  -H "Prosimo-ApiToken: ${TF_VAR_prosimo_token}" | jq -r ".data[] | { name: .name, id: .id, status: .status }"