resource "aws_iam_user" "this" {
  name = var.user_name

  tags = merge(
    {
      Name        = var.user_name
      Environment = var.environment
      Owner       = var.owner
      Purpose     = "iam-demo"
    },
    var.tags
  )
}

resource "aws_iam_policy" "s3_read_only" {
  name        = var.policy_name
  description = "Allow read-only access to S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetObject"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "user_attach" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}

resource "aws_iam_role" "ec2_role" {
  name = var.role_name

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

  tags = merge(
    {
      Name        = var.role_name
      Environment = var.environment
      Owner       = var.owner
    },
    var.tags
  )
}

resource "aws_iam_role_policy_attachment" "role_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}
