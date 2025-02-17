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
