---
slug: review-architecture-and-deploy-resources
id: ps1kv5vrpym4
type: challenge
title: Review Architecture and Deploy Resources
teaser: A short description of the challenge.
notes:
- type: text
  contents: Welcome to this Prosimo Lab for Observability and Troubleshooting across
    Multi-Cloud Networks
tabs:
- title: Shell
  type: terminal
  hostname: shell
  workdir: /root/prosimo-lab
- title: Editor
  type: code
  hostname: shell
  path: /root/prosimo-lab
- title: AWS Console
  type: browser
  hostname: aws
- title: Azure Console
  type: browser
  hostname: azure
- title: Prosimo
  type: browser
  hostname: prosimo-tenant
- title: Lab Diagram
  type: website
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-observe-and-troubleshoot/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 3600
---

**NOTE:** This environment is *real*! AWS and Azure Cloud Accounts have been created for each student. No bitcoin mining, please! :)

In this section we will:
1) Review the cloud architecture
2) Login to your cloud account console's
3) Deploy resources onto your cloud regions
4) Create your Prosimo Admin user

---

## 1) Review Cloud Architecture
===

First lets review the cloud architecture that has been provision for your Prosimo Lab experience.

Navigate to the *Lab Diagram* tab above and review the diagram. This is what we're building today!


## 2) Login to your cloud account consoles
===
Using the credentials below, login to the AWS and Azure Web Consoles in their respective tabs above:

---
# AWS Credentials ☁️

Select "IAM Account" and enter the **AWS ID**:
```
[[ Instruqt-Var key="INSTRUQT_AWS_ACCOUNT_PROSIMO_DEMO_ACCOUNT_ID" hostname="shell" ]]
```

**AWS Username**
```
[[ Instruqt-Var key="INSTRUQT_AWS_ACCOUNT_PROSIMO_DEMO_USERNAME" hostname="shell" ]]
```

**AWS Password**
```
[[ Instruqt-Var key="INSTRUQT_AWS_ACCOUNT_PROSIMO_DEMO_PASSWORD" hostname="shell" ]]
```

---

# AZURE Credentials ☁️

**AZURE SUBSCRIPTION**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_SUBSCRIPTION_ID" hostname="shell" ]]
```

**AZURE USERNAME**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_USERNAME" hostname="shell" ]]
```

**AZURE PASSWORD**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_PASSWORD" hostname="shell" ]]
```


## 3) Deploy resources onto your cloud regions
===

Now that you've logged into the cloud providers consoles its time to deploy resources for upcoming Instruqt Challenges:

### 1. Deploy AWS resources in EU

Apply the resources:

```
cd ~/prosimo-lab/assets/terraform
terraform apply --auto-approve  -target=module.aws__instances_eu -target=aws_ec2_transit_gateway.dev
```

### 2. Deploy AWS resources in the US

Apply the resources:

```
terraform apply --auto-approve -target=module.aws__instances_us
```

### 3. Deploy Azure resources in North Europe

Apply the resources:

```
terraform apply --auto-approve -target=module.azure_instances_eu
```

## 4) Create Admin User to your Prosimo Dashboard
===

Note: Use your Business Email for User Creation

1. Execute the User Creation Script

```
python3 ~/prosimo-lab/assets/scripts/admin_create.py -e <YourBusinessEmail>
```

You should see something like:

```
python3 admin_create.py -e <YourBusinessEmail>
{
    "status": "failure",
    "error": "HTTP 200: OK",
    "details": {
        "statusCode": "E100000",
        "message": "Successful",
        "data": {
            "id": "718146fd-95bf-4bb9-b0ec-0df5164fe39b"
        }
    }
}
```

NOTE: You will receive an email with the subject "You are invited to join a new Prosimo team". Please ignore this email. We must create a password first!

2. Create your password

   1) In the 'Prosimo' tab above, click the 'Forgot Password' link.
   2) *IMPORTANT:* Enter the same email address you provided in the `admin_create.py` script.
   3) In your email, click the 'Reset password' button, after which you will be prompted to enter a new password twice.
   4) You can now close this additonal 'password creation' browser window as we will return to the "Prosimo" tab in Instruqt.

3. Login

   1) Returning to the "Prosimo" tab, click the 'back' arrow in the top left corner (Careful not to click your web browsers back arrow and leave Instruqt).
   2) Enter the Username (business email) and new password.
   3) You will now be prompeted for the Multi-Factor Authentication code sent to your email address
   4) Enter the six digit code into the MFA page and click "Verify"


---

## Time for the Next Challenge

Now we've inspected the playing field its game time. Click **Check**!