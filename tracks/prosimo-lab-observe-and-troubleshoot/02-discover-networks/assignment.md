---
slug: discover-networks
id: lxodismxz3ef
type: challenge
title: Discover Networks
teaser: A short description of the challenge.
notes:
- type: text
  contents: Welcome to this Prosimo Lab for Observability and Troubleshooting
tabs:
- title: Shell
  type: terminal
  hostname: shell
  workdir: /root/prosimo-aws
- title: Editor
  type: code
  hostname: shell
  path: /root/prosimo-aws
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
  type: browser
  hostname: lab-diagram
- title: On-boarding
  type: website
  url: https://prosimo.navattic.com/account-onboard-and-deploy-edge
difficulty: basic
timelimit: 600
---

In this challenge we shall use Prosimo to discover existing networks.

Note that we've only associated our cloud accounts with the Prosimo dashboard thus far.

# 1) Cloud Account On-boarding & Edge Deployment
===

To save time, we have automated the On-boarding of the CLoud Accounts to Prosimo and the deployment of the Prosimo Network Edge's, which we will use in the following challenge.

* Cloud Account on-boarding is fast and simple
* Network Edge deployment is simple, but can take 20 minutes.

//TODO: Add navattic Tab to this Challenge

# 2) Discover network resources
===

In this challenge we shall be referencing the 'Lab Diagram' and 'Prosimo Dashboard'

Note that the 'Main Dashboard' view isn't showing any data yet.

In the left-hand menu, under the "On-board" section, click "Networks". No networks have been on-boarded to Prosimo for management yet. Click "Discovered" near the top of the window.

You should see two Prosimo Accounts that were on-boarded for you:

* Prosimo_AWS
* Prosimo_Azure

1. Click on Prosimo_AWS - you should now see the AWS Cloud Regions associated with this account.
2. Click on the first AWS Region 'xxxx' - You should now see the VPCs in that region.
3. Click on the first VPC listed - you should now see the Subnets in this VPC.



# n) Cloud Account Credentials (If required)
===

In case you need to login again, the cloud platform credentials are below:

Using the credentials below, login to the AWS and Azure Web Consoles in their respective tabs above:

---
# AWS Credentials ☁️

**AWS ID**
```
[[ Instruqt-Var key="AWS_ID" hostname="shell" ]]
```

**AWS Username**
```
[[ Instruqt-Var key="AWS_USER" hostname="shell" ]]
```

**AWS Password**
```
[[ Instruqt-Var key="AWS_PASS" hostname="shell" ]]
```
---

# AZURE Credentials ☁️

**AZURE SUBSCRIPTION**
```
[[ Instruqt-Var key="AZURE_SUBSCRIPTION_ID" hostname="shell" ]]
```

**AZURE USERNAME**
```
[[ Instruqt-Var key="AZURE_SUBSCRIPTION_USERNAME" hostname="shell" ]]
```

**AZURE PASSWORD**
```
[[ Instruqt-Var key="AZURE_SUBSCRIPTION_PASSWORD" hostname="shell" ]]
```


