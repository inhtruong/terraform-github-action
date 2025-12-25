resource "aws_iam_user" "demo_user" {
  name = "demo-terraform-user"

  tags = {
    Name        = "demo-terraform-user"
    Environment = "dev"
    Owner       = "terraform"
    Purpose     = "iam-demo"
  }
}


resource "aws_iam_policy" "s3_read_only" {
  name        = "demo-s3-read-only"
  description = "Allow read-only access to S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:ListAllMyBuckets",
          "s3:GetObject"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_policy_to_user" {
  user       = aws_iam_user.demo_user.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}

resource "aws_iam_role" "demo_ec2_role" {
  name = "demo-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy_to_role" {
  role       = aws_iam_role.demo_ec2_role.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}
