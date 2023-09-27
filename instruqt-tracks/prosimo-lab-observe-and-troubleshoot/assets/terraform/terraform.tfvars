aws_region = [
          "eu-west-1",
          "us-east-1",
]

vpc_cidr = [ 
          "10.0.0.0/16",
          "10.1.0.0/16", 
]

subnet_cidr = [ 
          "10.0.0.0/24",
          "10.1.0.0/24",
 ]

prosimo_cidr = [
          "10.251.0.0/23",
          "10.252.0.0/23",
]

private_ip = [
          "10.0.0.100",
          "10.1.0.100",
]

cloud_type = "AWS"


Dev_East_VPCs = {
  VPC1 = {
    aws_vpc_name          = "Dev-Prod1"
    igw_name              = "Dev-Prod1-IGW"
    rt_name               = "Dev-Prod1-RT"
    aws_subnet_name       = "Prod1-Web-subnet"
    private_ip            = "10.0.0.100"
    aws_ec2_name          = "WebServer1"
    aws_ec2_key_pair_name = "demo1"
    aws_vpc_cidr          = "10.0.0.0/16"
    aws_subnet_cidr       = "10.0.0.0/24"
  },

  VPC2 = {
    aws_vpc_name          = "Dev-Prod2"
    igw_name              = "Dev-Prod2-IGW"
    rt_name               = "Dev-Prod2-RT"
    aws_subnet_name       = "Prod2-Web-subnet"
    private_ip            = "10.1.0.100"
    aws_ec2_name          = "WebServer2"
    aws_ec2_key_pair_name = "demo2"
    aws_vpc_cidr          = "10.1.0.0/16"
    aws_subnet_cidr       = "10.1.0.0/24"
  }
}

Dev_West_VPCs = {
  VPC1 = {
    aws_vpc_name          = "Dev-Prod3"
    igw_name              = "Dev-Prod3-IGW"
    rt_name               = "Dev-Prod3-RT"
    aws_subnet_name       = "Prod3-Web-Subnet"
    private_ip            = "10.2.0.100"
    aws_ec2_name          = "WebServer3"
    aws_ec2_key_pair_name = "demo3"
    aws_vpc_cidr          = "10.2.0.0/16"
    aws_subnet_cidr       = "10.2.0.0/24"
  },

  VPC2 = {
    aws_vpc_name          = "Dev-Prod4"
    igw_name              = "Dev-Prod4-IGW"
    rt_name               = "Dev-Prod4-RT"
    aws_subnet_name       = "Prod4-Web-Subnet"
    private_ip            = "10.3.0.100"
    aws_ec2_name          = "WebServer4"
    aws_ec2_key_pair_name = "demo4"
    aws_vpc_cidr          = "10.3.0.0/16"
    aws_subnet_cidr       = "10.3.0.0/24"
  }
}

Dev_North_EU_VNets = {
  Vnet1 = {
    azure_resource_group        = "Dev_RG_1"
    azure_location              = "North Europe"
    azure_vnet_name             = "Dev_Vnet1"
    azure_subnet_name           = "Dev_Vnet1_subnet"
    azure_instance_name         = "WebServer1"
    azure_vm_size               = "Standard_DS1_v2"
    azure_server_key_pair_name  = "Azure_Srv1"
    azure_admin_username        = "igorlinux"
    azure_admin_password        = "igorlinux"
    azure_subnet_cidr           = "10.5.0.0/24"
    azure_vnet_cidr             = "10.5.0.0/16"
    azure_private_ip            = "10.5.0.100"
  },

  Vnet2 = {
    azure_resource_group        = "Dev_RG_2"
    azure_location              = "North Europe"
    azure_vnet_name             = "Dev_Vnet2"
    azure_subnet_name           = "Dev_Vnet2_subnet"
    azure_instance_name         = "WebServer2"
    azure_vm_size               = "Standard_DS1_v2"
    azure_server_key_pair_name  = "Azure_Srv2"
    azure_admin_username        = "igorlinux"
    azure_admin_password        = "igorlinux"
    azure_subnet_cidr           = "10.6.0.0/24"
    azure_vnet_cidr             = "10.6.0.0/16"
    azure_private_ip            = "10.6.0.100"
  }
}
