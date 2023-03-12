resource "aws_lb_listener" "GiganotoKiseiFastApiBackendECSIbListernerHttp" {
  default_action {
    target_group_arn = aws_lb_target_group.GiganotoKiseiFastApiTG.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.GiganotoKiseiFastApiALB.arn
  port              = "80"
  protocol          = "HTTP"

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-lb-listerner-http"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-lb-listerner-http"
    Group = "GiganotoKiseiFastApi"
  }
}

resource "aws_lb_listener" "GiganotoKiseiFastApiBackendECSIbListernerHttps" {
  certificate_arn = var.CERTIFICATE_ARN

  default_action {
    target_group_arn = aws_lb_target_group.GiganotoKiseiFastApiTG.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.GiganotoKiseiFastApiALB.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-lb-listerner-https"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-lb-listerner-https"
    Group = "GiganotoKiseiFastApi"
  }
}
