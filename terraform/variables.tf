variable "region" {
  type = string
}

variable "project_id" {
  description = "The project_id ID"
  type        = string
}

variable "service_account" {
  description = "The service account to use for running the workflow and triggering the workflow by Cloud Scheduler - If empty or null a service account will be created. If you have provided a service account you need to grant the Cloud SQL Admin and the Workflows Invoker role to that"
  type        = string
  default     = null
}

variable "instance_name" {
  type = string
}

variable "zone" {
  type = string
}