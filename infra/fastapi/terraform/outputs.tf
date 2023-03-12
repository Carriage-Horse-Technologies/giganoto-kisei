# account id
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# network
# vpc
output "aws_vpc_GiganotoKiseiFastApiVPC_id" {
  value = aws_vpc.GiganotoKiseiFastApiVPC.id
}

# subnet
output "aws_subnet_GiganotoKiseiFastApiPublicSubnet1_id" {
  value = aws_subnet.GiganotoKiseiFastApiPublicSubnet1.id
}

output "aws_subnet_GiganotoKiseiFastApiPrivateSubnet2_id" {
  value = aws_subnet.GiganotoKiseiFastApiPrivateSubnet2.id
}

output "aws_subnet_GiganotoKiseiFastApiPrivateSubnet1_id" {
  value = aws_subnet.GiganotoKiseiFastApiPrivateSubnet1.id
}

output "aws_subnet_GiganotoKiseiFastApiPublicSubnet2_id" {
  value = aws_subnet.GiganotoKiseiFastApiPublicSubnet2.id
}

output "aws_subnet_GiganotoKiseiFastApiPublicSubnet1_availability_zone" {
  value = aws_subnet.GiganotoKiseiFastApiPublicSubnet1.availability_zone
}

output "aws_subnet_GiganotoKiseiFastApiPrivateSubnet2_availability_zone" {
  value = aws_subnet.GiganotoKiseiFastApiPrivateSubnet2.availability_zone
}

output "aws_subnet_GiganotoKiseiFastApiPrivateSubnet1_availability_zone" {
  value = aws_subnet.GiganotoKiseiFastApiPrivateSubnet1.availability_zone
}

output "aws_subnet_GiganotoKiseiFastApiPublicSubnet2_availability_zone" {
  value = aws_subnet.GiganotoKiseiFastApiPublicSubnet2.availability_zone
}

# igw
output "aws_internet_gateway_GiganotoKiseiFastApiIGW_id" {
  value = aws_internet_gateway.GiganotoKiseiFastApiIGW.id
}

# route_table
output "aws_route_table_GiganotoKiseiFastApiPublicRouteTable_id" {
  value = aws_route_table.GiganotoKiseiFastApiPublicRouteTable.id
}

output "aws_route_table_GiganotoKiseiFastApiPrivateRouteTable_id" {
  value = aws_route_table.GiganotoKiseiFastApiPrivateRouteTable.id
}

output "aws_route_table_association_GiganotoKiseiFastApiPublicSubnet1_id" {
  value = aws_route_table_association.GiganotoKiseiFastApiPublicSubnet1.id
}

output "aws_route_table_association_GiganotoKiseiFastApiPublicSubnet2_id" {
  value = aws_route_table_association.GiganotoKiseiFastApiPublicSubnet2.id
}

output "aws_route_table_association_GiganotoKiseiFastApiPrivateSubnet1_id" {
  value = aws_route_table_association.GiganotoKiseiFastApiPrivateSubnet1.id
}

# sg
output "aws_security_group_GiganotoKiseiFastApiALBSecurityGroup_id" {
  value = aws_security_group.GiganotoKiseiFastApiALBSecurityGroup.id
}

output "aws_security_group_GiganotoKiseiFastApiPostgresSecurityGroup_id" {
  value = aws_security_group.GiganotoKiseiFastApiPostgresSecurityGroup.id
}

output "aws_security_group_GiganotoKiseiFastApiECSTaskSecurityGroup_id" {
  value = aws_security_group.GiganotoKiseiFastApiECSTaskSecurityGroup.id
}
output "aws_route_table_association_GiganotoKiseiFastApiPrivateSubnet2_id" {
  value = aws_route_table_association.GiganotoKiseiFastApiPrivateSubnet2.id
}

# db
# rds
# output "aws_db_instance_GiganotoKiseiFastApiPostgres_id" {
#   value = aws_db_instance.GiganotoKiseiFastApiPostgres.id
# }

output "aws_db_subnet_group_GiganotoKiseiFastApiDBSubnetGroup_id" {
  value = aws_db_subnet_group.GiganotoKiseiFastApiDBSubnetGroup.id
}

# backend
# ecr
# output "aws_ecr_repository_GiganotoKiseiInternalApiRepository_id" {
#   value = aws_ecr_repository.GiganotoKiseiInternalApiRepository.id
# }

# output "aws_ecr_repository_GiganotoKiseiFastApiRepository_id" {
#   value = aws_ecr_repository.GiganotoKiseiFastApiRepository.id
# }

# ecs
output "aws_ecs_cluster_GiganotoKiseiFastApiECSCluster_id" {
  value = aws_ecs_cluster.GiganotoKiseiFastApiECSCluster.id
}

output "aws_ecs_cluster_GiganotoKiseiFastApiECSCluster_name" {
  value = aws_ecs_cluster.GiganotoKiseiFastApiECSCluster.name
}

# alb
output "aws_lb_listener_GiganotoKiseiFastApiBackendECSIbListernerHttp_id" {
  value = aws_lb_listener.GiganotoKiseiFastApiBackendECSIbListernerHttp.id
}

output "aws_lb_listener_GiganotoKiseiFastApiBackendECSIbListernerHttps_id" {
  value = aws_lb_listener.GiganotoKiseiFastApiBackendECSIbListernerHttps.id
}

output "aws_lb_target_group_GiganotoKiseiFastApiTG_id" {
  value = aws_lb_target_group.GiganotoKiseiFastApiTG.id
}

output "aws_lb_GiganotoKiseiFastApiALB_id" {
  value = aws_lb.GiganotoKiseiFastApiALB.id
}
