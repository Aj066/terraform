resource "aws_iam_user" "admin_user" {
  name = "jabri"

  tags = {
    description = "Technical Team Lead"
  }
}

resource "aws_iam_policy" "admin_user_policy" {
  name = "AdminUsers"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid      = "AdminAccess"
      Effect   = "Allow"
      Action   = "*"
      Resource = "*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "admin_user_attach" {
  user       = aws_iam_user.admin_user.name
  policy_arn = aws_iam_policy.admin_user_policy.arn
}
