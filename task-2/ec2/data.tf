data "aws_vpc" "vpc_rsschool" {
  filter {
    name   = "cidr-block"
    values = var.vpc_cidr
  }
}

data "aws_subnets" "subnet_public_rsschool" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_rsschool.id]
  }

  filter {
    name   = "tag:Name"
    values = ["rsschool-zayneshzangar-vpc-public-0", "rsschool-zayneshzangar-vpc-public-1"] # Укажите точные имена ваших подсетей
  }
}

data "aws_subnet" "subnet_private_rsschoolA" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_rsschool.id]
  }

  filter {
    name   = "tag:Name"
    values = ["rsschool-zayneshzangar-vpc-private-0"] # Укажите точные имена ваших подсетей
  }
}

data "aws_subnet" "subnet_private_rsschoolB" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_rsschool.id]
  }

  filter {
    name   = "tag:Name"
    values = ["rsschool-zayneshzangar-vpc-private-1"] # Укажите точные имена ваших подсетей
  }
}
