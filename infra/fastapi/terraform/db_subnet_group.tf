resource "aws_db_subnet_group" "GiganotoKiseiFastApiDBSubnetGroup" {
  description = "Created from the RDS Management Console"
  name        = aws_vpc.GiganotoKiseiFastApiVPC.id
  subnet_ids  = [aws_subnet.GiganotoKiseiFastApiPublicSubnet1.id, aws_subnet.GiganotoKiseiFastApiPublicSubnet2.id, aws_subnet.GiganotoKiseiFastApiPrivateSubnet1.id, aws_subnet.GiganotoKiseiFastApiPrivateSubnet2.id]
  tags = {
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Group = "GiganotoKiseiFastApi"
  }
}
