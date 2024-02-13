#/bin/bash

cho "###################################################"
echo "# Verifying Prosimo Edge's are deployed and ready #"
echo "###################################################"

ALL_EDGE_READY=false
EDGE_DEPLOY_STATUS_ARR=""
while [ "$ALL_EDGE_READY" = false ]
do
  EDGE_DEPLOY_STATUS_ARR=($(curl -s https://${INSTRUQT_PARTICIPANT_ID}.admin.prosimo.io/api/prosimo/app \
 -H "Content-Type: application/json" \
 -H "Prosimo-ApiToken: ${TF_VAR_prosimo_token}" | jq -r '.data[] | .status'))

  EDGE_READY_COUNT=0

  for i in ${EDGE_DEPLOY_STATUS_ARR[@]}
  do
    if [ "$i" = "DEPLOYED" ]
    then
      EDGE_READY_COUNT=$((EDGE_READY_COUNT + 1))
    fi
  done

  ARR_LEN=${#EDGE_DEPLOY_STATUS_ARR[@]}

  if [ "$EDGE_READY_COUNT" -eq "$ARR_LEN" ]
  then
    echo "#############################################"
    echo "# All Edges are Deployed and READY!!! Yay!! #"
    echo "#############################################"
    ALL_EDGE_READY=true
  else
    echo "All Edges are NOT READY yet."
    echo "Retrying API for Edge Status in 60 seconds"
    sleep 60
  fi
done 
