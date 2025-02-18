# resource "google_project_iam_member" "gke_restrict_sa" {}

resource "null_resource" "check_iam" {
  provisioner "local-exec" {
    command = "gcloud compute forwarding-rules list || echo 'No access to GCP Load Balancer!'"
  }
}
