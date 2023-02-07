

variable "lambda_handler" {
  type        = string
  description = "The Lambda Handler"
}

variable "lambda_runtime" {
  type        = string
  description = "The Lambda Handler"
  default = "java11"
}

variable "function_name" {
  type        = string
  description = "The Function name"
}

variable "bucket_name" {
    type        = string
    description = "The bucket name"
}

variable "s3_object_key" {
  type        = string
  description = "The S3 object key"
}

variable "infra_env" {
    type        = string
    description = "Infrastructure environment"
}

variable "project_name" {
  type        = string
  description = "The Project Name"
}