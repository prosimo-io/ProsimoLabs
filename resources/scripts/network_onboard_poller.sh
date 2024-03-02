#/bin/bash

echo "######################################################"
echo "# Verifying Prosimo Networks are onboarded and ready #"
echo "######################################################"

ALL_ONBOARDS_READY=false
NETOWRK_ONBOARD_STATUS_ARR=""
while [ "$ALL_ONBOARDS_READY" = false ]
do
  NETOWRK_ONBOARD_STATUS_ARR=($(curl -s https://${INSTRUQT_PARTICIPANT_ID}.admin.prosimo.io/api/network/onboard \
 -H "Content-Type: application/json" \
 -H "Prosimo-ApiToken: ${TF_VAR_prosimo_token}" | jq -r '.data[] | .status'))

  NETWORK_READY_COUNT=0

  for i in ${NETOWRK_ONBOARD_STATUS_ARR[@]}
  do
    if [ "$i" = "DEPLOYED" ]
    then
      NETWORK_READY_COUNT=$((NETWORK_READY_COUNT + 1))
    fi
  done

  ARR_LEN=${#NETOWRK_ONBOARD_STATUS_ARR[@]}

  if [ "$NETWORK_READY_COUNT" -eq "$ARR_LEN" ]
  then
    echo "#################################################"
    echo "# All Networks are Onboarded and READY!!! Yay!! #"
    echo "#################################################"
    ALL_ONBOARDS_READY=true
  else
    echo "All Networks are NOT READY yet."
    echo "Retrying API for Edge Status in 60 seconds"
    sleep 60
  fi
done 
