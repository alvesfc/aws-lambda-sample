

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "${var.project_name}-${var.infra_env}-${var.bucket_name}"
    Project     = var.project_name
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Role        = "private"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "lambda_s3_object" {
  bucket = var.bucket_name
  key    = var.object_key
  source = var.object_source

  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
}