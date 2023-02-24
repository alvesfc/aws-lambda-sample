
resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name

  s3_bucket = var.bucket_name
  s3_key    = var.s3_object_key

  runtime = var.lambda_runtime
  handler = var.lambda_handler

  memory_size = 512

  role = aws_iam_role.lambda_exec.arn

 snap_start {
   apply_on = "PublishedVersions"
 }

  publish = true

  environment {
    variables = var.environment_variables
  }

}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_function.function_name}"

  retention_in_days = 7
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

