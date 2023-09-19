---
slug: review-architecture-and-discover-networks
id: ps1kv5vrpym4
type: challenge
title: Review Architecture and Discover Networks
teaser: A short description of the challenge.
notes:
- type: text
  contents: Welcome to this Prosimo Lab for Observability and Troubleshooting
tabs:
- title: Shell
  type: terminal
  hostname: shell
  workdir: /root/prosimo-aws
difficulty: basic
timelimit: 600
---

In this section we shall review the architecture that has been created for your learning experience.

This environment is real. AWS and Azure accounts have been created for each student.



Using the credentials below, login to the AWS and Azure Web Consoles:

AWS Credentials ☁️
===

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

AZURE Credentials ☁️
===

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




Deploy AWS resources in EU
===

Apply the resources:

```
terraform apply  --auto-approve  -target=module.aws__instances_eu
```

Deploy AWS resources in the US
===

Apply the resources:

```
terraform apply  --auto-approve -target=module.aws__instances_us
```

Deploy Azure resources in North Europe
===

Apply the resources:

```
terraform apply  --auto-approve -target=module.azure_instances_eu
```
Create Admin User to your Prosimo Dashboard
===

Note: Utilizing Business Email for User Creation

Procedure
1. Execute the User Creation Script

```
python3 admin_create.py -e YourBusinessEmail