
# Configure the AWS Provider
# provider "aws" {
#   region = var.aws_region
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
  }
}


data "aws_availability_zones" "available" {}



# Create a VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    "Name" = var.aws_vpc_name
  }
}

# Create a Subnet
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.aws_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    "Name" = var.aws_subnet_name
  }
}

# Create a IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    "Name" = "igw_vpc_1"
  }
}

# Create a Route Table
resource "aws_route_table" "rt_vpc1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    "Name" = "rt_vpc_1"
  }
}

# Create a Route Table Association
resource "aws_route_table_association" "rt_association_vpc1" {
  route_table_id = aws_route_table.rt_vpc1.id
  subnet_id      = aws_subnet.subnet1.id
}

# Create a Route Default Route
resource "aws_route" "route_igw" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  route_table_id         = aws_route_table.rt_vpc1.id
}

## #Create a Network Interface
## resource "aws_network_interface" "eth1" {
##   subnet_id       = aws_subnet.subnet1.id
##   private_ips     = [var.private_ip]
##   security_groups = [aws_security_group.sg_allow_access_inbound.id]
##   tags = {
##     Name = "primary_network_interface"
##   }
## }
## 
## # Get latest AWS Linux AMI 2023
## data "aws_ami" "amazon-linux-2023" {
##   most_recent = true
##   owners      = ["amazon"]
##   filter {
##     name   = "name"
##     values = ["al2023-ami-2023.*-x86_64"]
##   }
## }

# Create Security Group
resource "aws_security_group" "sg_allow_access_inbound" {
  name   = "frontnet_allow"
  vpc_id = aws_vpc.vpc1.id
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

# Create a SSH private key
resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a Key Pair and Download
resource "aws_key_pair" "demo_key_pair" {
  key_name   = var.aws_ec2_key_pair_name
  public_key = tls_private_key.demo_key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.demo_key.private_key_pem}' > ../${var.aws_ec2_key_pair_name}.pem && chmod 400 ../${var.aws_ec2_key_pair_name}.pem"
  }
}

locals {
  user_data = templatefile("/root/prosimo-lab/assets/scripts/aws-user-data.sh", {
    lab_version   = var.lab_version
    upstream_host = var.upstream_host
    upstream_port = var.upstream_port
  })
}

## # Create EC2 Instance
## resource "aws_instance" "ec2_linux" {
##   ami = data.aws_ami.amazon-linux-2023.id
##   network_interface {
##     network_interface_id = aws_network_interface.eth1.id
##     device_index         = 0
##   }
##   depends_on    = [aws_key_pair.demo_key_pair]
##   instance_type = var.aws_ec2_instance_type
##   key_name      = var.aws_ec2_key_pair_name
##   tags = {
##     "Name" = var.aws_ec2_name
##   }
## 
##   user_data = local.user_data
## 
## }

## #Create a Elastic IP
## resource "aws_eip" "eip" {
##   domain                    = "vpc"
##   instance                  = aws_instance.ec2_linux.id
##   associate_with_private_ip = var.private_ip
##   depends_on                = [aws_internet_gateway.igw]
## }
