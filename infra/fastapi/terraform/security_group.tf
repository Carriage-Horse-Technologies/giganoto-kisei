resource "aws_security_group" "GiganotoKiseiFastApiALBSecurityGroup" {
  description = "prod-GiganotoKiseiFastApiALBSG"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name = "prod-GiganotoKiseiFastApiALBSecurityGroup"

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-alb-security-group"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-alb-security-group"
    Group = "GiganotoKiseiFastApi"
  }

  vpc_id = aws_vpc.GiganotoKiseiFastApiVPC.id
}

resource "aws_security_group" "GiganotoKiseiFastApiPostgresSecurityGroup" {
  description = "Created by RDS management console"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = [
      aws_subnet.GiganotoKiseiFastApiPublicSubnet1.cidr_block,
      aws_subnet.GiganotoKiseiFastApiPublicSubnet2.cidr_block
    ]
    from_port = "5432"
    protocol  = "tcp"
    self      = "false"
    to_port   = "5432"
  }

  name = "prod-GiganotoKiseiFastApiPostgresSecurityGroup"

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-postgres-security-group"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-postgres-security-group"
    Group = "GiganotoKiseiFastApi"
  }

  vpc_id = aws_vpc.GiganotoKiseiFastApiVPC.id
}

resource "aws_security_group" "GiganotoKiseiFastApiECSTaskSecurityGroup" {
  description = "prod-GiganotoKiseiFastApiECSTaskSecurityGroup"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8000"
  }

  name = "prod-GiganotoKiseiFastApiECSTaskSecurityGroup"

  tags = {
    Name  = "prod-GiganotoKiseiFastApi-ecs-task-security-group"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApi-ecs-task-security-group"
    Group = "GiganotoKiseiFastApi"
  }

  vpc_id = aws_vpc.GiganotoKiseiFastApiVPC.id
}
