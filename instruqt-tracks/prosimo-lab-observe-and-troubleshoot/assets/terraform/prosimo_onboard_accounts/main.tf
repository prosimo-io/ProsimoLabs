# Onboard CSP Account into Prosimo Dashboard

resource "prosimo_cloud_creds" "aws" {
  cloud_type = "AWS"
  nickname   = "Prosimo_AWS"

  aws {
    preferred_auth = "AWSKEY"

    access_keys {
      access_key_id = var.Access_Key_AWS
      secret_key_id = var.Access_Secret_AWS
    }
  }
}

resource "prosimo_cloud_creds" "azure" {
  cloud_type = "AZURE"
  nickname   = "Prosimo_Azure"

  azure {
    subscription_id = var.subscription
    tenant_id       = var.tenantazure
    client_id       = var.client
    secret_id       = var.clientsecret
  }
}
