data "aws_vpc" "vpc_rsschool" {
  filter {
    name   = "cidr-block"
    values = ["10.0.0.0/16"]
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
