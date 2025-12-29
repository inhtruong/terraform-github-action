user_name   = "demo-terraform-user-dev03"
role_name   = "demo-ec2-role-dev03"
policy_name = "demo-s3-read-only-dev03"

environment = "dev"
owner       = "terraform"

tags = {
  Project = "infra-demo"
  Cost    = "dev03"
}
