resource "aws_ecs_cluster_capacity_providers" "GiganotoKiseiFastApiECSCapacityProider" {
  cluster_name = aws_ecs_cluster.GiganotoKiseiFastApiECSCluster.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}
