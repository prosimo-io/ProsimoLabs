---
slug: review-architecture-and-deploy-resources
id: uzzx4rly7wkc
type: challenge
title: Review Architecture and Deploy Resources
teaser: Connecting Multi-Cloud Networks and Resources.
notes:
- type: text
  contents: Welcome to this hands-on Prosimo Lab for "Connecting Multi-Cloud Networks
    and Resources"
tabs:
- title: Shell
  type: terminal
  hostname: shell
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-connect/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 3600
---

**NOTE:** This environment is *real*! AWS and Azure Cloud Accounts have been created for each student.

In this section we will:
1) Review the cloud architecture
2) Access Lab Application
3) Login to your cloud account console's
4) Create your Prosimo Admin user

---

## 1) Review Cloud Architecture
===

First lets review the cloud architecture that has been provision for your Prosimo Lab experience.

Navigate to the *Lab Diagram* tab above and review the diagram. This is what we're building today!


## 2) Access Lab Application
===

Obtain the 'public ip addresses' of our frontend servers using the following commands:

```bash,run
cat /root/prosimo-lab/assets/terraform/lab_resources/tf_eu_west_1.out
```

```bash,run
cat /root/prosimo-lab/assets/terraform/lab_resources/tf_us_east_1.out
```

Look for `aws_ec2_public_ip1` and `aws_ec2_public_ip2` from each output. These are the pblic addresses of the app front end.


## 3) Login to your cloud account consoles
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

**AZURE USERNAME**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_USERNAME" hostname="shell" ]]
```

**AZURE PASSWORD**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_PASSWORD" hostname="shell" ]]
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
    "status": "success",
    "data": {
        "statusCode": "E100000",
        "message": "Successful",
        "data": {
            "id": "c02200fc-01aa-4d73-84d2-0bd9637c3862"
        }
    }
}
```

2. You will receive an email with the subject "Password Setup Information". Open this email and click "Reset password"
3. A new browser window/tab will be opened prompting you to enter a new password. Please do so.
4. Close this new tab/window - we are going to login via the Instruqt tab labelled `Prosimo`.
5. In th Instuqt tab, login using the credentials provided above.
6. You will be prompted for a one-time passcode. This code has been emailed to you with the subject "Multi-Factor Authentication". Enter this code and click "Verify". You should now see the Prosimo Dashboard.

---

## Time for the Next Challenge

Now we've inspected the playing field its game time. Click **Check**!