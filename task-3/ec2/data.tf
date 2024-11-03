data "aws_vpc" "vpc_rsschool" {
  filter {
    name   = "cidr-block"
    values = var.vpc_cidr
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

data "terraform_remote_state" "eip_state" {
  backend = "s3"
  config = {
    bucket = "s3-terraform-states-epam-rsschool-zayneshzangar"
    key    = "global/eip/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

data "terraform_remote_state" "profile_role_pv" {
  backend = "s3"
  config = {
    bucket = "s3-terraform-states-epam-rsschool-zayneshzangar"
    key    = "global/role-pv/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
