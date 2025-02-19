# resource "google_project_iam_member" "gke_restrict_sa" {
#   project = var.project_id
#   role    = "roles/container.admin"
#   member  = "serviceAccount:${var.service_account_email}"
# }
resource "null_resource" "mock_iam" {
  provisioner "local-exec" {
    command = "echo 'Mock IAM Member'"
  }
}
