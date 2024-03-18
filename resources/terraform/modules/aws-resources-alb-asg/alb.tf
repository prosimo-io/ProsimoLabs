# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener#gateway-load-balancer-listener

resource "aws_lb" "api_fw" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "gateway"
  subnets            = module.vpc.public_subnets

  tags = merge(
    {
      Name        = "frontend-alb",
      Environment = "prod",
      Owner       = "Prosimo"
      Application = "prosimo-labs"
    }
  )
}

resource "aws_lb_listener" "api_fw" {
  depends_on = [ aws_lb_target_group.api_fw, aws_autoscaling_group.application_asg ]

  load_balancer_arn = aws_lb.api_fw.arn

  default_action {
    target_group_arn = aws_lb_target_group.api_fw.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "api_fw" {
  depends_on = [ aws_lb.api_fw ]
  name        = "alb-tg"
  port        = 6081
  protocol    = "GENEVE"
  vpc_id      = module.vpc.vpc_id

  health_check {
    port                = 8080
    protocol            = "HTTP"
  }

  tags = merge(
    {
      Name        = "frontend-alb",
      Environment = "prod",
      Owner       = "Prosimo"
      Application = "prosimo-labs"
    }
  )
}

resource "aws_autoscaling_attachment" "api_fw" {
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
  lb_target_group_arn    = aws_lb_target_group.api_fw.arn
}

resource "aws_vpc_endpoint_service" "api_fw" {
  acceptance_required        = false
  gateway_load_balancer_arns = [ aws_lb.api_fw.arn ]
}
