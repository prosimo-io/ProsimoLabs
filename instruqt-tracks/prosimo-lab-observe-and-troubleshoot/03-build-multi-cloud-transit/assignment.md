---
slug: build-multi-cloud-transit
id: 4lbcuyhby6cy
type: challenge
title: Build Multi-Cloud Transit
teaser: A short description of the challenge.
notes:
- type: text
  contents: Next up, Building Multi-Cloud Transit
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/tracks/prosimo-lab-observe-and-troubleshoot/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 600
---

In this challenge we will on-board existing cloud network to Prosimo for management. We shall then create multi-cloud interconnectivity between these networks - across clouds, regions, and geographies.

1) On-boarding regional networks
2) Build multi-region, multi-cloud transits
3) Verify the transit connectivity


# 1) On-boarding Regional Networks
===

First we shall on-board some local VPC and VNet networks for Prosimo to manage. Switch to the Prismo tab.

1) In the left-hand navgation pane, in the "Onboard" section, select "Transit".
2) Click the blue cirlce with the numder '2' in it to zoom into that region.
3) Select the "AWS eu-west-1" Edge, then click the blue button labelled "Let's start building transit", located at the bottom of the screen.

NOTE: you would be promted to select an on-boarded cloud account and deploy an Edge if one wasn't present, but we have pre-provisioned your network edges for you.

3) Select the Prosimo Edge already deployed in this region (the Prosimo logo at the top).
4) Now click the AWS Transit Gateway (TGW). You should see an orange dashed line appear/
5) Click "Save to Deploymen" at the bottom of the screen.
6) Next click "Add VPCs" - bottom right corner. You should see a list of discovered VPCs and Subnets for this region appear in the right-hand pane.
7) Click the checkbox next to the account name (top of the list) to automatically select all VPCs.
8) Now click on the "Add VPC's" button

Connect the VPCs to the already connected TGW:
1) Click on the "Dev" TGW
2) Click on the "2 VPCs" icon - a dashed orange line should appear between then two.
9) Click "Save to Deployment"
10) Click "Preview Deployment" - bottom right.
11) Select the new configuration and click "Review & Deploy"
 You should now see your changes listed in the "Edited" section. It should resemble something like this: `tgw-072dd16ccd3248cc3 - connected to 2 VPCs and Infra Edge`
12) Click "Proceed". The configuration status should now read "Deploying"

Review the deployment:

1) Click the 'Tasks' button - top right corner.
2) Select the "In Progress" task at the top of the list and click the "View" button.

You are now watching Prosimo's orchestration of cloud-native network resources, including:

* Creation and attacment of Route Tables for each VPC/Network to TGW.
* Attachment of Transit Gateway to Prosimo's Secure Multi-Cloud Mesh

NOTE: on-going management of routes and attachments, as networks are discovered, on-boarded, or removed, are orchestrated by Prosimo. Cloud Natvie resource managment is no longer inhibiting business objectives.

Verify change:
1) in the left-hand pane, click "Management" then click the "Edges" tile.
2) Select the region we just modified above - "AWS/eu-west-1", and click "View/Edit".

NOTE: "Conenctions" is no longer "0"

3) Click on "Connections"
4) Click the "Transit Gateway" tab. You can see the transit gateway is now attacned to our Prosimo Edge deployed in that region.


# 2) On-board Networks
===

In the secion above we attached an existing Transit Gateway to the in-region Prosimo Network Edge. Now we shall on-board specific network for Prosimo management.

1) In the left-hand pane, under "Onbaord", click "Networks".
2) Under Cloud Service Providers, click "Prosimo_AWS".
3) Under regions

# 2) Build multi-region, multi-cloud transits
===




# 3) Verify the transit connectivity
===



This concludes the Building Multi-Cloud Transit sesssion. You may now click the green 'Check' button located at the bottom-right of the screen.




# Cloud Account Credentials (if needed)
===

In case you need to login again, the cloud platform credentials are below:

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


