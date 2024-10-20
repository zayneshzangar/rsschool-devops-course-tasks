variable "region" {
  description = "deploy region"
  default     = "ap-southeast-1"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "rsschool-zayneshzangar-bastion"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "ami_id" {
  description = "AMI Amazon Linux id"
  type        = string
  default     = "ami-09487ea169b6a279a"
}
