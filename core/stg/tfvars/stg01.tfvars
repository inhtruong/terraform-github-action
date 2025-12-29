user_name   = "demo-terraform-user-stg01"
role_name   = "demo-ec2-role-stg01"
policy_name = "demo-s3-read-only-stg01"

environment = "staging"
owner       = "terraform"

tags = {
  Project = "infra-demo"
  Cost    = "stg01"
}
