provider "aws" {
  region = "ap-southeast-1"
}


module "iam-demo" {
  source = "../../module/iam"

  user_name   = var.user_name
  role_name   = var.role_name
  policy_name = var.policy_name

  environment = var.environment
  owner       = var.owner
  tags        = var.tags
}
