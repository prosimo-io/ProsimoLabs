#!/usr/bin/python3
import requests
import os

API_KEY = "$Instruqt_API_TOKEN"
ENDPOINT = "https://play.instruqt.com/graphql"
prosimo_token = os.getenv("prosimo_token")
INSTRUQT_POOL_ID = os.getenv("INSTRUQT_POOL_ID")

# GraphQL Queries and Mutations
FETCH_TENANTS_QUERY = """query Sandboxes($teamSlug: String, $filter: SandboxFilterInput) {
  sandboxes(teamSlug: $teamSlug, filter: $filter) {
    nodes { id, state, created }
  }
}"""

STOP_SANDBOX_MUTATION = """mutation StopSandbox($sandboxID: String!) {
  stopSandbox(sandboxID: $sandboxID) { id, state }
}"""


def execute_graphql(query, variables):
    headers = {"Authorization": "Bearer {API_KEY}"}
    response = requests.post(ENDPOINT, headers=headers, json={"query": query, "variables": variables}).json()
    return response.get('data', {})


class Prosimo:
    def __init__(self, tenant_id):
        self.api_url = "https://{tenant_id}.admin.prosimo.io/api"
        self.session = requests.Session()
        self.session.headers.update({"Prosimo-ApiToken": prosimo_token, "Content-Type": "application/json"})

    def get_all_edges(self):
        response = self.session.get("{self.api_url}/prosimo/app").json()
        return [item for item in response.get('data', []) if item['status'] == 'DEPLOYED']


def main():
    variables = {"teamSlug": "prosimo", "filter": {"pool_ids": [INSTRUQT_POOL_ID]}}
    tenant_nodes = execute_graphql(FETCH_TENANTS_QUERY, variables).get('sandboxes', {}).get('nodes', [])

    # Identify unhealthy tenants in a list comprehension
    unhealthy_tenants = [
        tenant['id'] for tenant in tenant_nodes
        if len(Prosimo(tenant['id']).get_all_edges()) != 3
    ]

    # Display unhealthy tenants
    print(f"Unhealthy Tenants: {unhealthy_tenants}")

    # Stop unhealthy tenants
    for tenant_id in unhealthy_tenants:
        print(f"Stopping unhealthy tenant: {tenant_id}")
        response = execute_graphql(STOP_SANDBOX_MUTATION, {"sandboxID": tenant_id})
        print(f"Stopped tenant {tenant_id}, response: {response}")


if __name__ == "__main__":
    main()
