
variable "bucket_name" {
    type        = string
    description = "The bucket name"
}

variable "object_key" {
  type        = string
  description = "The Object key"
}

variable "object_source" {
  type        = string
  description = "The Object source"
}

variable "infra_env" {
    type        = string
    description = "Infrastructure environment"
}

variable "project_name" {
  type        = string
  description = "The Project Name"
}