# IAM Module - S3 for Glue
# Creates basic IAM role and policy for Glue to access S3

# IAM Role for Glue to access S3
resource "aws_iam_role" "glue_s3_access_role" {
  name = "${var.project_name}-glue-s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })
}

# S3 Access Policy for Glue
resource "aws_iam_role_policy" "glue_s3_access_policy" {
  name = "${var.project_name}-glue-s3-access-policy"
  role = aws_iam_role.glue_s3_access_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject", 
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        Effect = "Allow",
        Resource = [
          "${var.s3_bucket_arn}/*",  # Objects
          "${var.s3_bucket_arn}"     # Bucket
        ]
      }
    ]
  })
}
