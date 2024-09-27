variable "region" {
  description = "deploy region"
  default     = "ap-southeast-1"
}

variable "bucket_name" {
  description = "bucket name"
  default     = "s3-terraform-states-epam-rsschool-zayneshzangar"
}

variable "dynamodb_table_name" {
  description = "dynamodb table name"
  default     = "state-lock"
}
