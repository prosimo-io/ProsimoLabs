resource "aws_alb" "application_load_balancer" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"

  subnets         = [ aws_subnet.subnet1.id ]
  security_groups = [ aws_security_group.sg_allow_access_inbound.id ]

  tags = merge(
    {
      Name        = "frontend-alb",
      Environment = "prod",
      Owner       = "Prosimo"
      Application = "prosimo-labs"
    }
  )
}

resource "aws_alb_target_group" "alb_tg" {
  name_prefix = "alb-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc1.id
  target_type = "instance"

  health_check {
    path                = "/"
    port                = 8080
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"

  tags = merge(
    {
      Name        = "frontend-alb",
      Environment = "prod",
      Owner       = "Prosimo"
      Application = "prosimo-labs"
    }
  )
}

resource "aws_alb_listener" "application_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.arn
    type             = "forward"
  }
}