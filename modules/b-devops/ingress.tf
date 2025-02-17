
resource "kubernetes_deployment" "nginx_ingress" {
  metadata {
    name = "nginx-ingress"
  }
  spec {
    replicas = 2
    template {
      metadata {
        labels = {
          app = "nginx-ingress"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx"
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_app_service" {
  metadata {
    name = "flask-app"
  }
  spec {
    selector = {
      app = "flask"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 5000
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_ingress" "flask_ingress" {
  metadata {
    name = "flask-ingress"
  }
  spec {
    rule {
      host = "flask.example.com"
      http {
        path {
          path = "/"
          backend {
            service_name = kubernetes_service.flask_app_service.metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}
