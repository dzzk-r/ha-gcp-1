
resource "google_container_cluster" "gke_cluster" {
  name               = "gke-cluster"
  location           = var.region
  network            = google_compute_network.vpc_internal.id
  initial_node_count = 2
}

resource "google_compute_network" "vpc_internal" {
  name                    = "vpc-internal"
  project                 = var.project_id
  auto_create_subnetworks = true
}