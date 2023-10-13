---
slug: observe-multi-cloud-interconnectivity
id: ge9erz0ga0f4
type: challenge
title: Observe Multi-Cloud Interconnectivity
teaser: A short description of the challenge.
notes:
- type: text
  contents: New we've deployed, orchestrated, and interconnected - time to observe!
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-observe-and-troubleshoot/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 3600
---

Now that our environments are configrued and we've familiarized ourselves with the transit and network on-baording process.

1) Insights
2) Cost 360


# 1) Insights
===

Switch to the 'Prosimo' tab. Click on "Insights" in the left-hand navigation panel.

In this section we shall review Prosimo's Network Insights:

1) Summary
2) Performance
3) Sessions
4) Events
5) Logs


### 1) Summary

Under the 'Summary' tab you will sub-sections for:

* Cloud Regions
* Onboarded Objects
* No. of Sessions
* Protocols (pretty graphs)

Note the ability to 'filter' on the left by "Source", "Target", and "Time Range".
NOTE: the default time range is 1 week.

Review each of these before progressing to the next tab labelled performance.

### 2) Performance

The performance tab covers Latency, Packet Loss, and Data Usage.

### 3) Sessions

While reviewing the 'Sessions' log, ensure you click on one of the entries for more detail, including per-session metrics for each segment of communication between source and destination.

AND ROCKETS!!

### 4) Events

In the events tab you will find details like policy events, Allow/Deny, etc.

### 5) Logs

ALL OF THE LOGS!!! Make sure you select an entry in the list to see EVEN MORE detail!!! :)



# 2) Cost 360
===

Directly below "Insight" in the left-hand side navigation panel you will find "Cost 360".

Cost 360 provides insight into cloud network spend. Be sure to review the follow sections of the Cost 360 data:

1) Overview
2) Chargeback
3) Data Transfer
4) Shared Services


### 1) Overview

**NOTE:** Screen Capture Coming Soon

### 2) Chargeback

**NOTE:** Screen Capture Coming Soon

### 3) Data Transfer

**NOTE:** Screen Capture Coming Soon

### 4) Shared Services

**NOTE:** Screen Capture Coming Soon

---

Move to the next section for "Troubleshooting"


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


