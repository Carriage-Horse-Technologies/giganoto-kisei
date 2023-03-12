resource "aws_internet_gateway" "GiganotoKiseiFastApiIGW" {
  tags = {
    Name  = "prod-GiganotoKiseiFastApiProgect-igw"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApiProgect-igw"
    Group = "GiganotoKiseiFastApi"
  }

  vpc_id = aws_vpc.GiganotoKiseiFastApiVPC.id
}
