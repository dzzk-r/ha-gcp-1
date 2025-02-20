variable "project_id" {}
variable "region" {
  description = "The region where GKE will be deployed"
  default     = "asia-south1"
}

variable "network" {
  description = "VPC network for GKE"
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  default     = 2
}

variable "cluster_name" {
  description = "Name of the shared GKE cluster"
  type        = string
  default     = "shared-gke-cluster"
}