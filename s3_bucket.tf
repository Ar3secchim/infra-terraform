resource "aws_s3_bucket" "s3_bucket" {
  bucket = "tf-s3-bucket-1234567890"

  tags = {
    Name = "s3_bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
