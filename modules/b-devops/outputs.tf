# modules/devops-b/outputs.tf

output "gke_cluster_id" {
  description = "ID of the created GKE cluster"
  # value       = google_container_cluster.gke.id
  value = module.shared_gke.gke_cluster_id # Use the shared GKE output
}


output "app_service_url" {
  description = "Public URL for the deployed application"
  # value       = kubernetes_service.app.status.load_balancer.ingress[0].hostname
  value = "mock-app-url"
}
