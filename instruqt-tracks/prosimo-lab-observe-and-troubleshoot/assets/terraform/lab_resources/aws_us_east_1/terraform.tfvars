VPC1 = {
  aws_vpc_name          = "WebSvcsUs1"
  igw_name              = "WebSvcsUs1-IGW"
  rt_name               = "WebSvcsUs1-RT"
  aws_subnet_name       = "WebSvcsUs1-subnet"
  aws_private_ip        = "10.1.1.100"
  aws_ec2_name          = "WebServerUs1"
  upstream_host         = "192.168.1.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "US_EAST_WebSvcs1"
  aws_vpc_cidr          = "10.1.0.0/16"
  aws_subnet_cidr       = "10.1.1.0/24"
}

VPC2 = {
  aws_vpc_name          = "WebSvcsUs2"
  igw_name              = "WebSvcsUs2-IGW"
  rt_name               = "WebSvcsUs2-RT"
  aws_subnet_name       = "WebSvcsUs2-subnet"
  aws_private_ip        = "10.2.2.100"
  aws_ec2_name          = "WebServerUs2"
  upstream_host         = "192.168.2.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "US_EAST_WebSvcs2"
  aws_vpc_cidr          = "10.2.0.0/16"
  aws_subnet_cidr       = "10.2.2.0/24"
}
