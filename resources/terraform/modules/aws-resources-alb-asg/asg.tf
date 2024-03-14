locals {
  user_data = templatefile("/root/prosimo-lab/assets/scripts/aws-api-fw-user-data.sh", {
    lab_version   = var.lab_version
  })
  asg_tags = merge(
    { "Name" = "frontend-asg"  }
  )
}

# Get latest AWS Linux AMI 2023
data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_launch_template" "application_lt" {
  name_prefix   = "frontend-launch_template"
  image_id      = data.aws_ami.amazon-linux-2023.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.demo_key_pair.key_name

  iam_instance_profile {
    name = "frontend-instance_profile"
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [ aws_security_group.sg_allow_access_inbound.id, aws_security_group.sg_allow_access_inbound.id ]
  }

  user_data = base64encode(local.user_data)

}

resource "aws_autoscaling_group" "application_asg" {
  name                = "frontend-asg"
  max_size            = 2
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = module.vpc.public_subnets

  launch_template {
    id      = aws_launch_template.application_lt.id
    version = aws_launch_template.application_lt.latest_version
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }

  dynamic "tag" {
    for_each = local.asg_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }


}

resource "aws_autoscaling_attachment" "application_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
  lb_target_group_arn    = aws_alb_target_group.alb_tg.arn
}