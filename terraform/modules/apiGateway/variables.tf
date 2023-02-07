

variable "lambda_invoke_arn" {
  type        = string
  description = "The Lambda ARN"
}

variable "lambda_name" {
  type        = string
  description = "The Lambda Name"
}

variable "source_arn" {
  type        = string
  description = "The Source ARN"
}

variable "infra_env" {
    type        = string
    description = "Infrastructure environment"
}

variable "project_name" {
  type        = string
  description = "The Project Name"
}