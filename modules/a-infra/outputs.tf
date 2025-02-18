# modules/infra-a/outputs.tf

output "vpc_id" {
  description = "ID of the created VPC"
  value       = google_compute_network.v
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = google_compute_subnetwork
}

output "cloud_armor_policy" {
  description = "Cloud Armor policy applied"
  value       = google_compute_security_policy
}

output "lb_external_ip" {
  description = "External IP адрес LoadBalancer"
  value       = google_compute_global_address.external_lb.address
}

output "ingress_status" {
  description = "Проверка доступности Ingress"
  value       = <<EOT
  Запустите:
  curl -i http://$(kubectl get ingress flask-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  EOT
}
