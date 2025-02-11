resource "aws_ecs_cluster" "TestECSCluster" {
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  name = "prod-giganoto-kisei-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    "ecs:cluster:createdFrom" = "ecs-console-v2"
    Name                      = "prod-test-ecs-cluster"
    Group                     = "test"
  }

  tags_all = {
    "ecs:cluster:createdFrom" = "ecs-console-v2"
    Name                      = "prod-test-ecs-cluster"
    Group                     = "test"
  }
}
