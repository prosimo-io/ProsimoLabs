---
slug: troubleshoot-multi-cloud-networking
id: zlx1pekau9ju
type: challenge
title: Troubleshoot Multi-Cloud Networking
teaser: A short description of the challenge.
notes:
- type: text
  contents: Now its time to troubleshoot!
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-observe/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 3600
---

In this final Instruqt challenge we shall troubleshoot a problem.

A configuration error has been applied to a Cloud Native network resource effecting Front End Web Services. The network has been blamed (typical!). An SRE is saying its access from the `US East` region, but that's all we've got to go on. Use Prosimo, an orchestrator/manager of cloud native resource, we will now identify and resolve the issue.

What you know: You've been advised that servers in `AWS/us_east_1` are failing to connect to `Azure/northeurope` resources.

1) Navigate to Insights, then to Sessions Tab.
2) Using the 'filter' on the left, click the 'pencil' icon in the box labelled 'Source'
3) In the window that appears, click the checkbox next to "Network Name" to deselct all the networks.
4) Check the box next to `us_east_1` so that it is the only one selected, and click 'Done'. You are now only seeing sessions originated from `us_east_1`.
5) From the list of sessions, select the first TCP session with a Target Port of 80. Note the extra detail showing that it was at one time working fine.
6) At the bottom-riht corner of this session detail, click "Review hops in Cloud Tracer".

Cloud Tracer is now evaluating network hops, routes, and policies between the source and destination networks across countries and clouds. And it takes just a minute.

7) You should now see that the session is blocked at the source network. Note the red circle next to the 'Outbound Rule'. Click on 'Outbound Rule' to expose more!

NOTE the policy is only allowing outbound ICMP! Not TCP on any port! MTTI (Mean Time To Innocence) of the network has remained low and now the problem can be resolved.

Resolving the problem:

1) Switch to the AWS Console tab
2) Change to the region `us-east-1`
3) Navigate to the EC2 view (Type “EC2” in the search bar)
4) In the EC2 Dashboard, click on “Instances (Running)”
5) Select our `WebServerUs1` instance.
6) Click on the Security Tab and scroll down to the “Outbound rules” where you should be able to verify that only ICMP Outbound is permitted.
7) Click on the security group name (e.g. `sg-063af91696692314c (frontnet_allow)`)
8) Select the *Outbound* tab, and click “Edit Outbound Rules”
9) Change Type from “ICMP” to “All Traffic” (or add a new HTTP rule if this feels wrong), and click “Save Rules”

Verify that the problem has been resolved:

1) Switch to the `Prosimo` tab.
2) Rerun the Cloud Trace for this same session.
    NOTE: there are two options:
    a. If you are still on the Cloud Tracer screen, simply click “Run”.
    b. Otherwise, navigate to “Cloud Tracer”. Click ‘View History”. Click ‘rerun’ next to our previously run trace to ‘rerun’ it.

The Cloud Tracer result should now be 'Success'.

---

Congratulations on completing the: **Prosimo Lab: Multi-Cloud Networking Obserability & Troubleshooting**


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


