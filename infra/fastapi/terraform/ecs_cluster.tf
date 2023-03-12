resource "aws_ecs_cluster" "GiganotoKiseiFastApiECSCluster" {
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  name = "prod-giganoto-kisei-fastapi-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    "ecs:cluster:createdFrom" = "ecs-console-v2"
    Name                      = "prod-GiganotoKiseiFastApi-ecs-cluster"
    Group                     = "GiganotoKiseiFastApi"
  }

  tags_all = {
    "ecs:cluster:createdFrom" = "ecs-console-v2"
    Name                      = "prod-GiganotoKiseiFastApi-ecs-cluster"
    Group                     = "GiganotoKiseiFastApi"
  }
}
