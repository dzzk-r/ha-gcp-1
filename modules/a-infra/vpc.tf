
resource "google_compute_network" "vpc_external" {
  name                    = "vpc-external"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_internal" {
  name                    = "vpc-internal"
  auto_create_subnetworks = false
}
