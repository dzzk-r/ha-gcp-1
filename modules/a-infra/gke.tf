# resource "google_container_node_pool" "gke_nodes" {
#   cluster    = google_container_cluster.gke_cluster.id
#   node_count = 2
# }

resource "google_container_cluster" "gke_cluster" {
  name     = "mock-cluster"
  project  = var.project_id
  location = "us-central1-a"
  network  = google_compute_network.vpc_internal.id
}

resource "google_container_node_pool" "gke_nodes" {
  cluster = google_container_cluster.gke_cluster.id
  project  = var.project_id
  node_count = 1
  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
