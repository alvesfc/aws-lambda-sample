variable "aws_profile" {
  type        = string
  description = "AWS Profile"
  default     = "cloudGuru"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "aws_account" {
  type        = string
  description = "AWS Account"
}

variable "project_name" {
  type        = string
  description = "The Project Name"
  default     = "myCompany"
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "appTest"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure environment"
  default     = "staging"
}