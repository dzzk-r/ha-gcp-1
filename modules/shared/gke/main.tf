resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.region
  network  = var.network

  remove_default_node_pool = true
}

resource "google_container_node_pool" "gke_nodes" {
  cluster    = google_container_cluster.gke_cluster.id
  project    = var.project_id
  node_count = var.node_count

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
