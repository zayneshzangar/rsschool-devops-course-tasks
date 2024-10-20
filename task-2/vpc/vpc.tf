resource "aws_vpc" "vpc_rsschool" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}
