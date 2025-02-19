variable "project_id" {
  type    = string
  default = "mock-project"
}

variable "service_account_email" {
  type    = string
  default = "mock-sa@mock-project.iam.gserviceaccount.com"
}

# modules/infra-a/variables.tf
variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "cloud_armor_rules" {
  description = "List of Cloud Armor security rules"
  type        = list(string)
}

variable "psc_service" {
  description = "Private Service Connect endpoint"
  type        = string
}

variable "terraform_backend_prefix" {
  description = "Prefix for Terraform state storage"
  type        = string
}


# TF Back. Variables
variable "terraform_backend_bucket" {
  description = "Google Cloud Storage bucket for Terraform state"
  type        = string
}

# resource "google_storage_bucket_iam_member" "terraform_state_viewer" {}
resource "google_storage_bucket_iam_member" "terraform_state_viewer" {
  bucket = "mock-tf-state-bucket"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:mock-sa@mock-project.iam.gserviceaccount.com"
}