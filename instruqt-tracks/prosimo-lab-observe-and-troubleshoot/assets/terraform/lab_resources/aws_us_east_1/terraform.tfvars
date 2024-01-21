VPC1 = {
  aws_vpc_name          = "WebSvcsProdUs"
  igw_name              = "WebSvcsProdUs-IGW"
  rt_name               = "WebSvcsProdUs-RT"
  aws_subnet_name       = "WebSvcsProdUs-subnet"
  aws_private_ip        = "10.2.0.100"
  aws_ec2_name          = "WebServerProdUs1"
  upstream_host         = "10.0.0.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "US_EAST_WebSvcsProd"
  aws_vpc_cidr          = "10.2.0.0/16"
  aws_subnet_cidr       = "10.2.0.0/24"
}

VPC2 = {
  aws_vpc_name          = "WebSvcsDevUs"
  igw_name              = "WebSvcsDevUs-IGW"
  rt_name               = "WebSvcsDevUs-RT"
  aws_subnet_name       = "WebSvcsDevUs-subnet"
  aws_private_ip        = "10.3.0.100"
  aws_ec2_name          = "WebServerDevUs1"
  upstream_host         = "10.1.0.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "US_EAST_WebSvcsDev"
  aws_vpc_cidr          = "10.3.0.0/16"
  aws_subnet_cidr       = "10.3.0.0/24"
}
