user_name   = "demo-terraform-user-dev01"
role_name   = "demo-ec2-role-dev01"
policy_name = "demo-s3-read-only-dev01"

environment = "dev"
owner       = "terraform"

tags = {
  Project = "infra-demo"
  Cost    = "dev01"
}
