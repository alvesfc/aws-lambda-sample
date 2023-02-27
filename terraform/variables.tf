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

variable "database_user" {
  type        = string
  description = "The database user"
}

variable "database_password" {
  type        = string
  description = "The database password"
}

variable "db_name" {
  type        = string
  description = "The database username"
  default     = "sampleDatabase"
}

variable "artifact_name" {
  type        = string
  description = "The jar file name"
  default     = "javaAwsLambda-1.0-aws.jar"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}