resource "google_compute_backend_service" "ext_lb_backend" {
  name                  = "ext-lb-backend"
  project               = var.project_id
  protocol              = "HTTP"
  port_name             = "http"
  timeout_sec           = 30
  load_balancing_scheme = "EXTERNAL"

  backend {
    group = google_container_node_pool.gke_nodes.instance_group_urls[0] # Attach GKE Nodes
  }
}

resource "google_compute_url_map" "ext_lb_map" {
  name            = "ext-lb-map"
  project         = var.project_id
  default_service = google_compute_backend_service.ext_lb_backend.id
}

resource "google_compute_target_http_proxy" "ext_lb_proxy" {
  name    = "ext-lb-proxy"
  project = var.project_id
  url_map = google_compute_url_map.ext_lb_map.id
}

resource "google_compute_global_forwarding_rule" "ext_lb_fwd_rule" {
  name       = "ext-lb-fwd-rule"
  project    = var.project_id
  target     = google_compute_target_http_proxy.ext_lb_proxy.id
  port_range = "80"
}
