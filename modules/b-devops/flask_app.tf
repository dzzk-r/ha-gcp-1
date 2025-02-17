resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = "flask-app"
    labels = {
      app = "flask"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "flask"
      }
    }
    template {
      metadata {
        labels = {
          app = "flask"
        }
      }
      spec {
        container {
          name  = "flask"
          image = "gcr.io/${var.project_id}/flask-app:latest"

          ports {
            container_port = 5000
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "256Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/health"
              port = 5000
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = 5000
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }
        }
      }
    }
  }
}
