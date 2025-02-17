# modules/devops-b/outputs.tf

output "gke_cluster_id" {
  description = "ID of the created GKE cluster"
  value       = google_container_cluster.gke.id
}

output "ingress_controller_endpoint" {
  description = "Ingress controller external endpoint"
  value       = google_compute_global_address.ingress_ip.address
}

output "app_service_url" {
  description = "Public URL for the deployed application"
  value       = kubernetes_service.app.status.load_balancer.ingress[0].hostname
}
