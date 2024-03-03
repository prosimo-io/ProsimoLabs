---
slug: discover-networks
id: ec0hjtkmd7n6
type: challenge
title: Discover Existing Networks
teaser: In this challenge we shall see how Prosimo interacts with existing environments.
notes:
- type: text
  contents: In this challenge we shall see how Prosimo interacts with existing environments.
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-observe/assets/images/Prosimo_Lab_Architecture.html
- title: On-boarding Demo
  type: website
  url: https://prosimo.navattic.com/account-onboard-and-deploy-edge
difficulty: basic
timelimit: 3600
---

In this challenge we shall use Prosimo to discover existing networks.

In this section we will:
1) Review Cloud Account On-boarding & Edge Deployment
2) Discover Network Resources
3) Review Edge Deployment
4) Review the Prosimo Managed Infrastructure

Note that we've only associated our cloud accounts with the Prosimo dashboard thus far.


# 1) Review Cloud Account On-boarding & Edge Deployment
===

To save time, we have automated the on-boarding of the Cloud Accounts to Prosimo, and the deployment of the Prosimo Network Edges, which we will use in the following lab challenge.

* Cloud Account on-boarding is fast and simple
* Network Edge deployment is simple, but can take 20 - 30 minutes, so we pre-deployed them for you.

1) Click the "On-boarding Demo" tab to access the Navattic click-through demo.
2) In the checklist (bottom right corner of screen), click on "Cloud Account On-boarding" to start the demonstration.

Once you've clicked through the on-boarding demonstration and edge deployment demonstration you may proceed to the next section titled "Discover Network Resources".


# 2) Review Edge Deployment
===

Prosimo Network Edges are deployed 'per cloud region'. There is no requirement for 'spoke gateways' in every single VPC/VNet. This is possible due to Prosimo's strategy of bringing cloud and network together through its ochestraton of cloud native-network resources.

Let's review the three Network Edges that were aleady deployed for you:
1) In the left-hand navgation pane, select "Management"
2) Click on the "Edges" tile
3) Review the 'Status' column - all Edges should now be deployed.
4) Click on the first Edge, then click on the "View/Edit" button.

Note there are no cloud network connections as we haven't on-boarded any networks yet


# 3) Review the Prosimo Managed Infrastructure
===

1) In the left-hand navgation pane, select "Transit 360"

You are currently looking at 'Map View' which is showing you the three deployed Network Edges - 2 in EU, 1 in US - displayed geographically.

2) In the top-right of the map, click on 'Topology View'. You are now looking at all of the providers and their regions. The regions with Prosimo's Network Edges deployed are identifiable with a green circle.

3) Click on `AWS-eu-west-1` (at the bottom), then click "View Edge Connections".

In the list provided you should see an Incoming and Outgoing connection from this Edge to each of the other Edge's deployed. These are secure mTLS connections deployed and maintained by Prosimo to form the 'Prosimo Mesh'. No 'Hub and Spoke' hairpinning back to a central choke point here!

4) Click 'back' (bottom left corner) to return to the Map View.

That concludes our review of the Prosimo infrastructure. You may now click the green "Check" button at the bottom-right corner and progress to the next challenge.



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

**AZURE USERNAME**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_USERNAME" hostname="shell" ]]
```

**AZURE PASSWORD**
```
[[ Instruqt-Var key="INSTRUQT_AZURE_SUBSCRIPTION_PROSIMO_TENANT_PASSWORD" hostname="shell" ]]
```


