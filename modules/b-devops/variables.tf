# modules/devops-b/variables.tf

variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "ingress_controller" {
  description = "Ingress controller type"
  type        = string
}

variable "app_image" {
  description = "Container image for the application"
  type        = string
}
