resource "aws_route_table_association" "GiganotoKiseiFastApiPublicSubnet1" {
  route_table_id = aws_route_table.GiganotoKiseiFastApiPublicRouteTable.id
  subnet_id      = aws_subnet.GiganotoKiseiFastApiPublicSubnet1.id
}

resource "aws_route_table_association" "GiganotoKiseiFastApiPublicSubnet2" {
  route_table_id = aws_route_table.GiganotoKiseiFastApiPublicRouteTable.id
  subnet_id      = aws_subnet.GiganotoKiseiFastApiPublicSubnet2.id
}

resource "aws_route_table_association" "GiganotoKiseiFastApiPrivateSubnet1" {
  route_table_id = aws_route_table.GiganotoKiseiFastApiPrivateRouteTable.id
  subnet_id      = aws_subnet.GiganotoKiseiFastApiPrivateSubnet1.id
}

resource "aws_route_table_association" "GiganotoKiseiFastApiPrivateSubnet2" {
  route_table_id = aws_route_table.GiganotoKiseiFastApiPrivateRouteTable.id
  subnet_id      = aws_subnet.GiganotoKiseiFastApiPrivateSubnet2.id
}
