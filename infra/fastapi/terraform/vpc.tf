resource "aws_vpc" "GiganotoKiseiFastApiVPC" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.0.0.0/16"
  enable_classiclink               = "false"
  enable_classiclink_dns_support   = "false"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"

  tags = {
    Name  = "prod-GiganotoKiseiFastApiProgect-vpc"
    Group = "GiganotoKiseiFastApi"
  }

  tags_all = {
    Name  = "prod-GiganotoKiseiFastApiProgect-vpc"
    Group = "GiganotoKiseiFastApi"
  }
}
