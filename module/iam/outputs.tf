output "user_name" {
  value = aws_iam_user.this.name
}

output "role_name" {
  value = aws_iam_role.ec2_role.name
}

output "policy_arn" {
  value = aws_iam_policy.s3_read_only.arn
}
