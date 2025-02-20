output "gke_cluster_id" {
  value = google_container_cluster.gke_cluster.id
}

output "gke_nodes_instance_group" {
  description = "Instance group URLs for GKE nodes"
  value       = google_container_node_pool.gke_nodes.instance_group_urls
}
