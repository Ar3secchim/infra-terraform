data "aws_caller_identity" "current" {
}
data "aws_cloudfront_distribution" "current" {
  id = aws_cloudfront_distribution.s3_distribution.id
}


locals {
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal",
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::${aws_s3_bucket.s3_bucket.bucket}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.id}:distribution/${data.aws_cloudfront_distribution.current.id}"
          }
        }
      },
    ]
  })
}
