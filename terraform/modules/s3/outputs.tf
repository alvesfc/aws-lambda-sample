
output "lambda_bucket_name" {
  description = "S3 bucket name used to store function code."

  value = aws_s3_bucket.s3_bucket.id
}