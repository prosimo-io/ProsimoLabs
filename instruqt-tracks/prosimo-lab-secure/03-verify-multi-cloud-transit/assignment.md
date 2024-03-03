---
slug: verify-multi-cloud-transit
id: zxujqqbhm1pq
type: challenge
title: Verify Multi-Cloud Transit
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-observe/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 3600
---

In this challenge we will verify communication across your multi-cloud network.

Before we begin, here's a quick introduction to the concepts of Prosimo Transits and Prosimo Networks:
![Transits & Networks](../assets/images/Prosimo_Lab_Multi-Cloud_Networking.jpg)

Below we shall first create a Prosimo Transit (the blue lines in the diagram), then we shall onboard the VPC/VNet networks (the orange lines).

# Verify the transit connectivity
===

Now we shall verify the connectivity across these newly paved networks.

Review the `Lab Diagram`. We are now going to verify connectivity from each of the 'Front End Web Services' virtual machines through to the 'App Services' virtual machines.

You should now be able to reload the application using one of the front-end IP Addresses.

To access the IP Addresses again, execute the following commands:

```bash,run
cat /root/prosimo-lab/assets/terraform/lab_resources/tf_eu_west_1.out
```

```bash,run
cat /root/prosimo-lab/assets/terraform/lab_resources/tf_us_east_1.out
```

Look for `aws_ec2_public_ip1` and `aws_ec2_public_ip2` from each output. These are the pblic addresses of the app front end.


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


