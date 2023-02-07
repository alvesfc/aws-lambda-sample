terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}

provider "aws" {
  profile = "cloudGuru"
  region  = "us-east-1"

}

module "s3" {
  source        = "./modules/s3"
  bucket_name   = lower("${var.project_name}-my-bucket")
  object_key    = "${var.project_name}-lambda.jar"
  object_source = "${abspath(path.root)}/../javaAwsLambda/target/javaAwsLambda-1.0-aws.jar"
  project_name  = var.project_name
  infra_env     = var.infra_env
}

module "lambda" {
  source = "./modules/lambda"

  function_name  = "${var.project_name}-lambda"
  lambda_handler = "org.springframework.cloud.function.adapter.aws.FunctionInvoker::handleRequest"
  s3_object_key  = "${var.project_name}-lambda.jar"
  bucket_name    = module.s3.lambda_bucket_name
  project_name   = var.project_name
  infra_env      = var.infra_env
}

module "apiGateway" {
  source = "./modules/apiGateway"

  lambda_invoke_arn = module.lambda.invoke_arn
  source_arn        = "arn:aws:execute-api:${var.aws_region}:${var.aws_account}:${module.apiGateway.id}/*/${module.apiGateway.http_method}${module.apiGateway.resource_path}"
  lambda_name       = "${var.project_name}-lambda"

  project_name = var.project_name
  infra_env    = var.infra_env

}