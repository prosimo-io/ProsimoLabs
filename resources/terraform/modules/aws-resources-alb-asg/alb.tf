# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener#gateway-load-balancer-listener

resource "aws_lb" "gw_load_balancer" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "gateway"

  subnets         = module.vpc.public_subnets
#  security_groups = [ module.vpc.default_security_group_id, aws_security_group.sg_allow_access_inbound.id ]

  tags = merge(
    {
      Name        = "frontend-alb",
      Environment = "prod",
      Owner       = "Prosimo"
      Application = "prosimo-labs"
    }
  )
}

resource "aws_lb_listener" "application_listener" {
  load_balancer_arn = aws_lb.gw_load_balancer.arn
#  port              = 80
#  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  name        = "alb-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id

  health_check {
    port                = 8080
    protocol            = "HTTP"
  }

#  load_balancing_algorithm_type = "round_robin"

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
  lb_target_group_arn    = aws_lb_target_group.alb_tg.arn
}