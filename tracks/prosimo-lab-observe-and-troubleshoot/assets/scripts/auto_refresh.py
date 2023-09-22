#!/usr/local/bin/python3

import requests
import json
import os

class AutoRefreshAPI:
    def __init__(self):
        self.api_token = os.environ.get("TF_VAR_prosimo_token")
        self.tenant = os.environ.get("INSTRUQT_PARTICIPANT_ID")
        self.base_url = f"https://{self.tenant}.admin.prosimo.io/api"
        self.headers = {
            "Prosimo-ApiToken": self.api_token,
            "Content-Type": "application/json"
        }
        self.session = requests.Session()
        self.session.headers.update(self.headers)

    def diagnose_config(self):
        endpoint_url = f"{self.base_url}/diagnose/cloudtrace/config/refresh"
        response = self.session.get(endpoint_url)

        if response.status_code == 200:
            return json.loads(response.text)
        else:
            raise Exception(f"API call failed with status code {response.status_code}: {response.text}")

    def refresh_network_discovery(self):
        endpoint_url = f"{self.base_url}/network/discovery/refresh"
        payload = json.dumps({})  # Empty payload
        response = self.session.post(endpoint_url, data=payload)

        if response.status_code == 200:
            return json.loads(response.text)
        else:
            raise Exception(f"API call failed with status code {response.status_code}: {response.text}")

if __name__ == "__main__":
    # Ensure that the TOKEN and TENANT environment variables are set
    if not os.environ.get("TF_VAR_prosimo_token") or not os.environ.get("INSTRUQT_PARTICIPANT_ID"):
        raise Exception("TOKEN and TENANT environment variables must be set")

    api_client = AutoRefreshAPI()

    # Diagnose Config using GET
    diagnose_response = api_client.diagnose_config()
    print(f"Diagnose Config Response: {diagnose_response}")

    # Refresh Network Discovery using POST
    refresh_response = api_client.refresh_network_discovery()
    print(f"Refresh Network Discovery Response: {refresh_response}")