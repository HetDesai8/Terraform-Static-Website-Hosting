module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "het-vpc"
  cidr = var.vpc_cidr

  azs = var.az

  private_subnets      = var.subnet_cidr_private
  private_subnet_names = ["het-private-subnet-A", "het-private-subnet-B", "het-private-subnet-C"]

  public_subnets      = var.subnet_cidr_public
  public_subnet_names = ["het-public-subnet-A", "het-public-subnet-B", "het-public-subnet-C"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  igw_tags = {
    "Name" = "het-igw"
  }

  public_route_table_tags = {
    "Name" = "het-public-rt"
  }
}