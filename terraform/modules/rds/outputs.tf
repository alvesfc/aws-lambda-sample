
output "database_arn" {
  description = "Database ARN"

  value = aws_db_instance.sample_database.arn
}

output "database_url" {
  description = "Database endpoint"

  value = aws_db_instance.sample_database.endpoint
}