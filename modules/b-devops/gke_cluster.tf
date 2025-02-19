resource "google_container_cluster" "gke" {
  name     = "mock-gke-cluster"
  location  = "asia-south1"                      # primary
  network  = google_compute_network.vpc_internal.id
  # locations = ["asia-south1-a", "asia-south1-b"] # multi-zone
  #  location = "asia-south1-c"
}
