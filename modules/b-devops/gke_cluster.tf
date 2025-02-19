resource "google_container_cluster" "gke" {
  location  = "asia-south1"                      # primary
  locations = ["asia-south1-a", "asia-south1-b"] # multi-zone

  #  location = "asia-south1-c"
}
