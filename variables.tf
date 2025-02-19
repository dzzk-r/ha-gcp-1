# Mock project
variable "project_id" {
  type    = string
  default = "mock-project"
}

# Mock GCP SA
variable "service_account_email" {
  type    = string
  default = "mock-sa@mock-project.iam.gserviceaccount.com"
}

variable "cloud_armor_rules" {
  type    = list(string)
  default = ["allow-all"]
}

variable "psc_service" {
  type    = string
  default = "default-psc"
}

variable "terraform_backend_prefix" {
  type    = string
  default = "default-prefix"
}

variable "terraform_backend_bucket" {
  type    = string
  default = "default-bucket"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_name" {
  type    = string
  default = "default-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

#### Fix of b-devops module arguments (!)
variable "gke_cluster_name" {
  type    = string
  default = "default-cluster"
}

variable "ingress_controller" {
  type    = string
  default = "nginx"
}

variable "app_image" {
  type    = string
  default = "nginx:latest"
}