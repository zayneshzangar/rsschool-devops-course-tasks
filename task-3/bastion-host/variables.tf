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
  description = "Ubuntu 24.04 LTS id"
  type        = string
  default     = "ami-047126e50991d067b"
}

variable "ami_type" {
  default = "t2.small"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = string
  default     = "ap-southeast-1a"
}
