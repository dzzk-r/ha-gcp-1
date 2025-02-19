provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = fileexists("fake-gcp-credentials.json") ? file("fake-gcp-credentials.json") : null
}
