
variable "db_name" {
  type        = string
  description = "The database name"
}

variable "db_username" {
  type        = string
  description = "The database username"
}

variable "db_password" {
  type        = string
  description = "The database password"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure environment"
}

variable "project_name" {
  type        = string
  description = "The Project Name"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}