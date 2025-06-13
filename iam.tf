resource "aws_iam_user" "cloudinstitute" {
    name = "cloudinstitute" 
}


resource "aws_iam_user_policy" "cloudinstitute_policy" {
  name = "cloudinstitute_policy"
  user = aws_iam_user.cloudinstitute.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Resource = "*"
      }
    ]
  })
}