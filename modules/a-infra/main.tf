# Terraform State via GCS w/ IAM policies protection objectViewer/objectAdmin
# terraform {
#   backend "gcs" {
#     bucket  = var.
#     prefix  =
#     credentials = "./gcp-key.json"
#   }
# }

module "shared_gke" {
  source     = "../../modules/shared/gke" # Correct relative path from a-infra
  project_id = var.project_id
  region     = "asia-south1"
  network    = google_compute_network.vpc_internal.id
  node_count = 2
}