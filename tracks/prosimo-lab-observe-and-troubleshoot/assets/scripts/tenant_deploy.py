import json
import requests
import os

class ResourceCreator:
    def __init__(self, api_token):
        """
        Initialize the ResourceCreator class.

        Parameters:
        - api_token (str): The API token for authentication.
        """
        self.headers = {
            "Prosimo-ApiToken": api_token,
            "Content-Type": "application/json"
        }
        self.session = requests.Session()
        self.session.headers.update(self.headers)

    def create_resource(self, api_endpoint, payload):
        """
        Function to create a new resource via HTTP POST request.

        Parameters:
        - api_endpoint (str): The URL endpoint for the API.
        - payload (dict): The payload containing resource attributes.

        Returns:
        - dict: Response data from the API.
        """
        response = self.session.post(api_endpoint, data=json.dumps(payload))

        if response.status_code == 201:
            return {
                'status': 'success',
                'data': response.json()
            }
        else:
            return {
                'status': 'failure',
                'error': f"HTTP {response.status_code}: {response.reason}",
                'details': response.json()
            }

if __name__ == "__main__":
    # Initialize the ResourceCreator class with the API token
    api_token = "cNxkno6pGS2RFQlqjtv1abqQvH-xffxn6ZjvFqIgxvI="  # Replace with your actual API token
    resource_creator = ResourceCreator(api_token)
    team_name = os.environ.get('INSTRUQT_PARTICIPANT_ID')
    username = f"igor+{team_name}@prosimo.io"
    # Define the API endpoint and payload
    api_endpoint = "https://learning.admin.prosimo.io/api/msp/team"  # Replace with your actual API endpoint
    payload = {
        "comment": "Sample Comment",
        "company": "prosimo",
        "firstName": "John",
        "lastName": "Doe",
        "teamName": team_name,
        "username": username
    }

    # Invoke the function to create the resource
    response = resource_creator.create_resource(api_endpoint, payload)

    # Output the response
    print(json.dumps(response, indent=4))