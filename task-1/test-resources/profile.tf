terraform {
  backend "s3" {
    bucket         = "s3-terraform-states-epam-rsschool-zayneshzangar"
    dynamodb_table = "state-lock"
    key            = "global/test-resources/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}
