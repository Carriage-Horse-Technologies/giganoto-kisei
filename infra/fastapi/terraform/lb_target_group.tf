resource "aws_lb_target_group" "GiganotoKiseiFastApiTG" {
  deregistration_delay = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    matcher             = "404"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "prod-GiganotoKiseiFastApiTG"
  port                          = "80"
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  slow_start                    = "0"

  stickiness {
    cookie_duration = "86400"
    enabled         = "false"
    type            = "lb_cookie"
  }

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-alb-targate-group"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-alb-targate-group"
    Group = "GiganotoKiseiFastApi"
  }

  target_type = "ip"
  vpc_id      = aws_vpc.GiganotoKiseiFastApiVPC.id
}
