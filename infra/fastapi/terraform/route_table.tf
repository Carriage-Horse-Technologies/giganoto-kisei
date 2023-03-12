resource "aws_route_table" "GiganotoKiseiFastApiPublicRouteTable" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GiganotoKiseiFastApiIGW.id
  }

  tags = {
    Name  = "prod-GiganotoKiseiFastApiProgect-rtb-public"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApiProgect-rtb-public"
    Group = "GiganotoKiseiFastApi"
  }

  vpc_id = aws_vpc.GiganotoKiseiFastApiVPC.id
}

resource "aws_route_table" "GiganotoKiseiFastApiPrivateRouteTable" {
  tags = {
    Name  = "prod-GiganotoKiseiFastApiProgect-rtb-private"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApiProgect-rtb-private"
    Group = "GiganotoKiseiFastApi"
  }

  vpc_id = aws_vpc.GiganotoKiseiFastApiVPC.id
}
