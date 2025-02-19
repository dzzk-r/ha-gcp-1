# resource "google_project_iam_member" "gke_restrict_sa" {
#   project = var.project_id
#   role    = "roles/container.admin"
#   member  = "serviceAccount:${var.service_account_email}"
# }
