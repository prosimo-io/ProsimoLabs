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
- title: On-boarding Demo
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

Click the "On-boarding Demo" tab to access the Navattic 'Click-thru' demo. Click through the demo to experience the simplicity of deploying Prosimo.

Once you've finished the click-thru demo, proceed to the next section below.


# 2) Discover network resources
===

In this challenge we shall be referencing the 'Lab Diagram' and 'Prosimo' tabs.

Switch to the 'Prosimo' tab.

Note that the 'Main Dashboard' view isn't showing any data yet. This is a freshly deployed implementation of Prosimo.

In the left-hand menu, under the "On-board" section, click "Networks". No networks have been on-boarded to Prosimo for management yet (we'll do that later).

Click "Discovered" near the top of the window.

You should see two Prosimo Accounts that were on-boarded for you, named:

* Prosimo_AWS
* Prosimo_Azure

Now we shall review Prosimo's discovery of cloud-native resources:
1. Click on `Prosimo_AWS` - you should now see the AWS Cloud Regions associated with this account.
2. Click on the first AWS Region `eu-west-1` - You should now see the VPCs in that region.
3. Click on the first VPC - you should now see this VPC's subnets.

Following the same flow, review the network and ensure it is matching the 'Lab Diagram'.

**NOTE**: We are not 'on-boarding' networks at this stage. We shall do this after we've familiarized ourselves with the platform.


# 3) Review Edge Deployment
===

Prosimo Network Edges are deployed 'per cloud region'. No Spoke Gateway in every single VPC/VNet with Prosimo's ochestraton of cloud native networks! Woohoo!!

Let's review the three Network Edges the were aleady deployed for you:
* In the left-hand navgation pane, select "Management"
* Click on the "Edges" tile
* Review the 'Status' column - all Edges should now be deployed.


# 4) Review the Prosimo Managed Infrastructure

1) In the left-hand navgation pane, select "Transit 360"

You are currently looking at 'Map View' which is showing you the three deployed Network Edges - 1 in EU and 2 in US.

2) In the top-right, click on 'Topology View'. You are now looking at all of the providers and their regions. The regions with Prosimo's Network Edge's deployed are identifiable with a yellow circle.

3) Click on `AWS-eu-west-1` (at the bottom), then click "View Edge Connections".

In the list provided you should see an Incoming and Outgoing connection from this Edge to each of the other Edge's deployed. These are secure mTLS connections deployed and maintained by Prosimo to form the 'Prosimo Mesh'.

No Hub and Spoke hairpinning back to a central choke point here!! :)

4) Click 'back' (bottom left corner) to return to the Map View.

That concludes our review of the Prosimo infrastructure. You may now click the green "Check" button at the bottom-right corner and progress to the next challenge.


# Cloud Account Credentials (if needed)
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


