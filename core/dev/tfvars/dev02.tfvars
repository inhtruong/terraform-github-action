user_name   = "demo-terraform-user-dev02"
role_name   = "demo-ec2-role-dev02"
policy_name = "demo-s3-read-only-dev02"

environment = "dev"
owner       = "terraform"

tags = {
  Project = "infra-demo"
  Cost    = "dev02"
}
