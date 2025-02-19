# Terraform State via GCS w/ IAM policies protection objectViewer/objectAdmin
# terraform {
#   backend "gcs" {
#     bucket  = var.
#     prefix  =
#     credentials = "./gcp-key.json"
#   }
# }

resource "google_compute_firewall" "allow_external_lb" {
  name    = "allow-external-lb"
  project = var.project_id
  network = google_compute_network.vpc_external.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
