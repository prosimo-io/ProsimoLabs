---
slug: troubleshoot-multi-cloud-networking
id: tppcsijh7s0t
type: challenge
title: Troubleshoot Multi-Cloud Networking
teaser: A short description of the challenge.
notes:
- type: text
  contents: Replace this text with your own text
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

In this final Instruqt challenge we shall troubleshoot a problem.

A configuration error has been applied to a Cloud Native network resource in a "Web Svcs Front End" VPC in `us-east-1`. We shall use Prosimo, an orchestrator/manager of cloud native resource, to identify and resolve the issue.

You've been advised that servers in `WebSvcsProdUs` are failing to connect to `AppSvcsProd` resources.



1) Navigate to Insights, then to Sessions Tab.
2) In the search input type "WebScvsProdUs" and hit enter.
3) Select the first entry in the list to exand it for more details.
4) Click "Review Hops in Cloud Tracer"

NOTE: the suggested entries will be "10.2.0.100 in default" and "10.0.0.100 in default". The 'in default' references the 'network namespace' in which to trace.





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


