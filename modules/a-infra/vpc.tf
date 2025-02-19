resource "google_compute_network" "vpc_external" {
  name                    = "vpc-external"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_internal" {
  name                    = "vpc-internal"
  project                 = var.project_id
  auto_create_subnetworks = false
}
