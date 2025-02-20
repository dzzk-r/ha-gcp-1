# modules/devops-b/variables.tf
variable "project_id" {
  type    = string
  default = "mock-project"
}

variable "region" {
  type    = string
  default = "asia-south1"
}

variable "vpc_internal_id" {
  description = "VPC network ID"
  type        = string
}

variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "shared-gke-cluster"
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 2
}

variable "app_image" {
  description = "Container image for the application"
  type        = string
}
