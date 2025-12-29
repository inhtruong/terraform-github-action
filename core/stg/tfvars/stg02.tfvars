user_name   = "demo-terraform-user-stg02"
role_name   = "demo-ec2-role-stg02"
policy_name = "demo-s3-read-only-stg02"

environment = "staging"
owner       = "terraform"

tags = {
  Project = "infra-demo"
  Cost    = "stg02"
}
