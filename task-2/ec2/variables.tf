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
  description = "AMI Amazon Linux id"
  type        = string
  default     = "ami-09487ea169b6a279a"
}

variable "ami_type" {
  description = "AMI Amazon Linux type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

