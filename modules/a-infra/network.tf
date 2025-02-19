# resource "google_compute_network" "v" {
#   name                    = "vpc-network"
#   auto_create_subnetworks = false
# }

# Mock instead of google_container_node_pool using, to give back null resource
resource "null_resource" "mock_gke_nodes" {
  provisioner "local-exec" {
    command = "echo 'Mock GKE Nodes'"
  }
}

resource "null_resource" "mock_network" {
  provisioner "local-exec" {
    command = "echo 'Mock VPC'"
  }
}
