#/bin/bash

curl -s https://${INSTRUQT_PARTICIPANT_ID}.admin.prosimo.io/api/prosimo/app  -H "Content-Type: application/json"  -H "Prosimo-ApiToken: ${TF_VAR_prosimo_token}
" | jq -r '.data[] | { cloudType: .cloudType, cloudRegion: .cloudRegion, status: .status }'