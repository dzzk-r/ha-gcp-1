module "shared_gke" {
  source       = "../shared/gke"
  project_id   = var.project_id
  region       = var.region
  network      = var.vpc_internal_id
  cluster_name = var.gke_cluster_name
  node_count   = var.node_count
}
