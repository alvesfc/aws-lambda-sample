


output "function_name" {
  description = "Lambda function name"

  value = aws_lambda_function.lambda_function.function_name
}

output "invoke_arn" {
  description = "Lambda function arn"

  value = aws_lambda_function.lambda_function.invoke_arn
}
