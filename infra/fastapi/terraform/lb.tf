resource "aws_lb" "GiganotoKiseiFastApiALB" {
  desync_mitigation_mode     = "defensive"
  drop_invalid_header_fields = "false"
  enable_deletion_protection = "false"
  enable_http2               = "true"
  enable_waf_fail_open       = "false"
  idle_timeout               = "60"
  internal                   = "false"
  ip_address_type            = "ipv4"
  load_balancer_type         = "application"
  name                       = "prod-GiganotoKiseiFastApiALB"
  preserve_host_header       = "false"
  security_groups            = [aws_security_group.GiganotoKiseiFastApiALBSecurityGroup.id]

  subnet_mapping {
    subnet_id = aws_subnet.GiganotoKiseiFastApiPublicSubnet1.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.GiganotoKiseiFastApiPublicSubnet2.id
  }

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-alb"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-backend-ecs-alb"
    Group = "GiganotoKiseiFastApi"
  }
}
