data "aws_vpc" "vpc_rsschool" {
  filter {
    name   = "cidr-block"
    values = ["10.0.0.0/16"]
  }
}

data "aws_subnet" "subnet_public_rsschool" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_rsschool.id]
  }

  filter {
    name   = "tag:Name"
    values = ["rsschool-zayneshzangar-vpc-public"] # Укажите точные имена ваших подсетей
  }
}

data "terraform_remote_state" "ec2_state" {
  backend = "s3"
  config = {
    bucket = "s3-terraform-states-epam-rsschool-zayneshzangar"
    key    = "global/ec2/terraform.tfstate"
    region = "ap-southeast-1"
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
