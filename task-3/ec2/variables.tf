variable "region" {
  description = "deploy region"
  default     = "ap-southeast-1"
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
  description = "AMI Amazon Linux type"
  type        = string
  default     = "t2.small"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "rsschool_key" {
  type = string
}

