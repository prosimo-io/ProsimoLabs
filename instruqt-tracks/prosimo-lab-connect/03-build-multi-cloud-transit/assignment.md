---
slug: build-multi-cloud-transit
id: yuiywvvxyfml
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
  url: https://htmlpreview.github.io/?https://raw.githubusercontent.com/prosimo-io/ProsimoLabs/main/instruqt-tracks/prosimo-lab-connect/assets/images/Prosimo_Lab_Architecture.html
difficulty: basic
timelimit: 3600
---

In this challenge we will on-board existing cloud network to Prosimo for management. We shall then create multi-cloud interconnectivity between these networks - across clouds, regions, and geographies.

1) Build multi-region, multi-cloud transits
2) Create Metwork Namespaces
3) On-boarding region networks
3) Verify the transit connectivity

Before we begin, here's a quick introduction to the concepts of Prosimo Transits and Prosimo Networks:
![Transits & Networks](../assets/images/Prosimo_Lab_Multi-Cloud_Networking.jpg)

Below we shall first create a Prosimo Transit (the blue lines in the diagram), then we shall onboard the VPC/VNet networks (the orange lines).

# 1) Build Multi-Region/Cloud Transit
===

![prosimo Transit](../assets/images/Prosimo_Lab_Transit.jpg)

In this secion we will:
* Attach an existing AWS Transit Gateway to the in-region Prosimo Network Edge - `AWS/eu-west-1`
* Peer VNets directly to their regions Network Edge - `Azure/northerneurope`
* (When Ready) Attach the us-east-1 TGW to the newly deployed Network Edge in - `AWS/us-east-1`

Swith to the 'Prosimo' tab, and follow the steps below:

---

## Build Transit for eu-west-1:

1) In the left-hand navgation pane, in the "Onboard" section, select "Transit".
2) Click the blue cirlce with the number '2' in it to zoom into that region.
3) Select the "AWS eu-west-1" Edge icon, then click the blue button, located at the bottom of the screen, labelled "Let's start building transit".
4) Select/Click the Prosimo Edge already deployed in this region (the Prosimo logo).
5) Now click the AWS Transit Gateway (TGW). An orange dashed line should appear, representing the new connection.
6) Next click "Add VPCs" - bottom right corner. You should see a list of discovered VPCs and Subnets for this region appear in the right-hand pane.
7) Click the checkbox next to the account name (top of the list) to automatically select all VPCs.
8) Now click on the "Add VPC's" button
9) Click on the TGW
10) Click on the "2 VPCs" icon - a dashed orange line should appear between then two.
11) Click "Save to Deployment"
12) Click "Preview Deployment" - bottom right.
13) Select the new configuration and click "Review & Deploy"
 You should now see your changes listed in the "Edited" section. It should resemble something like this: `tgw-072dd16ccd3248cc3 - connected to 2 VPCs and Infra Edge`
14) Click "Proceed". The configuration status should now read "Deploying"

Review the deployment:

1) Click the 'Tasks' button - top right corner.
2) Select the "In Progress" task at the top of the list and click the "View" button.

You are now watching Prosimo's orchestration of cloud-native network resources, including:

* Creation and attacment of Route Tables for each VPC/Network to TGW.
* Attachment of Transit Gateway to Prosimo's Secure Multi-Cloud Mesh

Verify change:
1) In the left-hand pane, click "Management" then click the "Edges" tile.
2) Select the region we just modified above - "AWS/eu-west-1", and click "View/Edit".

NOTE: "Conenctions" is no longer "0"

3) Click on "Connections"
4) Click the "Transit Gateway" tab. You can see the transit gateway is now being attached to our Prosimo Edge deployed in that region.

You have now connected the `AWS/eu-west-1` region to the Prosimo Mesh.

---

## Build Transit by peering networks directly with Prosimo Edge:

Next we shall connect the `Azure/northerneurope` region to its Prosimo Edge, but this time we shall peer the VNets directly, as showin the following diagram.

![Azure Peering](../assets/images/Prosimo_Lab_Transit_Azure_Peering.jpg)

1) Navigate to "Onboard > Transit"
2) Click the blue "2", and select 'Azure northeurope'
3) Click "Lets start building transit'
4) click "Add VNETs" (bottom right)
5) Select all VNETs an click "Add VNets".
6) Click on the Prosimo Edge (Prosimo Logo) and then click on the "2 VNETs" to draw a connection between them (green dashed line).
7) Click "Save to deployment"
8) Click "Preview deployment"
9) Select the new 'Configured' deployment for Azure and click "Review & Deploy"
10) Note in "Added" you should see `2 VNETs connected to the Edge via VNET Peering`.
11) Click "Proceed"
12) Review the new task in the Tasks section.

---

## Build Transit for newly deployed Edge:

Verify that your new edge has completed deploying in *AWS/us-east-1*. If not, you may continue onto the 'on-boarding networks section below for the already deployed Edges, and return to this section when ready.

Repeat the steps above (1 - 14) for the *Build Transit for eu-west-1* section above.

---

While we wait for the new Edge deployment to complete we will onboard the Azure networks. We have an Edge deployed in the region, and we have now 'peered' the VNETs with that Edge. Now its time to 'on-board' the Azure networks for communication...

**BUT WAIT!** We have overlapping IP ranges!!!

Fear not, Prosimo has a solution. We are going to use Prosimo's network namespaces to provide network domain isolation.

# 2) Creating Namespaces
===

1) Navigate to "Policy > Namespaces"
2) Click "Create New" (top right)
3) Enter the name `frontend_eu_west`
4) Leave the Source Networks blank - we haven't on-boarded the networks yet.
5) Click 'Save'.
6) Follow the same steps to create two more namespaces, named: `frontend_us_east` and `app_svcs_north_europe`

You should now have 4 namespaces - the three new ones, and the `default` namespace.

Return to the 'tasks' list (top right) and review the progress of the 'In Progress' tasks. You're AWS Edge should now be deloyed, or very nearly so. Once complete, repeat the steps above to 'Build Transit' for the new `us-east-1` Edge before continuing the next section "Onboard Cloud-Region Networks".


**NOTE**: Before progressing to the next section ensure that the Transit onboarding has complete by monitoring the deployment tasks. To review the deployment:



# 3) Onboard Cloud-Region Networks
===

![Prosimo Networks](../assets/images/Prosimo_Lab_Transit_and_Prosimo_Network.jpg)

Now we shall on-board specific networks for Prosimo management (orange lines above).

In this section we will create Prosimo Networks – a Prosimo construct comprising of a collection of subnets across any number of VPCs or VNets, across any number of regions, within a common Cloud Account. A single Prosimo Network may not span two Cloud Accounts.

First we shall onboard the 'Dev' networks.

| *Region* | *Prosimo Network* |
|-----------|------------|
| `eu-west-1` | `eu_west_1` |
| `us-east-1` | `us_east_1` |
| `Azure/northerneurope` | `northern_europe1` |


Switch to the Prismo tab and proceed with the instructions below:

### On-board northern_europe1 Network

1) In the left-hand pane, under "Onbaord", click "Networks".
2) Select the "Discovered" tab.
3) Under Cloud Service Providers, click "Prosimo_AWS".
4) Under regions, select `northeurope`.
5) Under VNETs, select both `AppSvcsEu1_Vnet` & `AppSvcsEu2_Vnet`.
6) Click "Onboard"
7) Enter the name `northern_europe1`
8) Select the namespace `app_svcs_north_europe` from the menu.
9) Click "Submit"

**NOTE**: Several of the options will already be selected but please check them carefully.

10) Change "5 Where do you want to run connectors?" to `Infra VNET`
11) Expand the second VNETs setting (bottom of the screen). *Note* that the Connector deployment destination is not editable, due to the selection made above, which will be used for both.
12) Click "Proceed"
13) Select "All Networks"
14) Click "Proceed"
15) Review the summary and then click "Onboard"

If you click the 'onboarded' tab you will see the Azure networks/VNets being onboarded. You can also monitor the progress in the Tasks section.


### On-board eu_west_1 Networks

To onboard the AWS eu-west_1 networks/VPCs, follow the steps above but for the Prosimo netowrk name use `eu_west_1` and select the Prosimo namespace `frontend_eu_west`.

**NOTE**: Due to the presence of the TGW, the 'Infra VPC' connector placement will already be selected. You will have to select the Transit Gateway in the "7. Peering Options" for each network you are onboarding.

### On-board us_east_1 Networks

Verify that the AWS us-east-1 Transit Gateway has completed on-boarding before on-boarding that regions networks/VPCs. You can do this by checking the 'Tasks' are complete.

To onboard the AWS eu-west_1 networks/VPCs, follow the steps above but for the Prosimo netowrk name use `us_east_1` and select the Prosimo namespace `frontend_us_east`

---

With all networks now onboarded you may proceed to the section below.


# 4) Verify connectivity
===

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


