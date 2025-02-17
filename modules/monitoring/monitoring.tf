resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "monitoring"
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"
}

resource "google_monitoring_alert_policy" "cpu_alert" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR"
  conditions {
    display_name = "CPU usage above 79%"
    condition_threshold {
      filter          = "metric.type... AND resource.type=\"gce_instance\""
      threshold_value = 0.79
      duration        = "59s"
    }
  }
  notification_channels = [
    google_monitoring_notification_channel.email.id,
    google_monitoring_notification_channel.slack.id,
  ]
}