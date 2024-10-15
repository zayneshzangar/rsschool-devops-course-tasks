variable "region" {
  description = "deploy region"
  default     = "ap-southeast-1"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "rsschool-zayneshzangar-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "billing" {
  description = "Private subnets for VPC"
  type        = string
  default     = "0.039"
}
