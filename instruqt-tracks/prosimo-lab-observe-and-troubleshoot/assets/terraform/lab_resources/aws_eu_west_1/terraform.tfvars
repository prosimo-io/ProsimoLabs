VPC1 = {
  aws_vpc_name          = "WebSvcsEu1"
  igw_name              = "WebSvcsEu1-IGW"
  rt_name               = "WebSvcsEu1-RT"
  aws_subnet_name       = "WebSvcsEu1-Subnet"
  aws_private_ip        = "10.4.0.100"
  aws_ec2_name          = "WebServerEu1"
  upstream_host         = "10.0.0.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "EU_WEST_WebSvcs1"
  aws_vpc_cidr          = "10.4.0.0/16"
  aws_subnet_cidr       = "10.4.0.0/24"
}

VPC2 = {
  aws_vpc_name          = "WebSvcsEu2"
  igw_name              = "WebSvcsEu2-IGW"
  rt_name               = "WebSvcsEu2-RT"
  aws_subnet_name       = "WebSvcsEu2-Subnet"
  aws_private_ip        = "10.5.0.100"
  aws_ec2_name          = "WebServerEu2"
  upstream_host         = "10.1.0.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "EU_WEST_WebSvcs2"
  aws_vpc_cidr          = "10.5.0.0/16"
  aws_subnet_cidr       = "10.5.0.0/24"
}
