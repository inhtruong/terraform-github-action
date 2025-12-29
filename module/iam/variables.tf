variable "user_name" {
  description = "IAM user name"
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "policy_name" {
  description = "IAM policy name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Owner tag"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
