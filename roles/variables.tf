variable "region" {
  description = "deploy region"
  default     = "ap-southeast-1"
}

variable "identity_provider" {
  description = "identity provider for github actions"
  default     = "arn:aws:iam::623043548856:oidc-provider/token.actions.githubusercontent.com"
}

variable "role_name" {
  description = "role name for github actions"
  default     = "GithubActionsRole"
}
