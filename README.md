# GCP Infrastructure with Terraform

## Project Structure: Infra-A & DevOps-B

This repository follows a **clear separation of concerns**:

- **Infra-A (Infrastructure Project A):** Manages security, networking, load balancing, and global policies.
- **DevOps-B (DevOps Project B):** Handles application deployment, GKE, CI/CD pipelines, and Kubernetes operations.

This distinction ensures:
- **Secure and scalable infrastructure** managed by Infrastructure Teams.
- **Efficient DevOps automation** for applications managed by Platform/DevOps Teams.
- **Separation of IAM roles and access policies** between network security and application teams.

## Directory Structure tree ./
```
/terraform
  ├── README.md                   # Documentation
  ├── modules/
  │   ├── a-infra/                 # Infrastructure Project A
  │   │   ├── vpc.tf
  │   │   ├── load_balancer.tf
  │   │   ├── cloud_armor.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   │   ├── TODO-High.md          # High-level infra tasks
  │   │   └── README.md             # Infra-A documentation
  │   ├── b-devops/                # DevOps Project B
  │   │   ├── gke.tf
  │   │   ├── ingress.tf
  │   │   ├── flask_app.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   │   ├── TODO-Low.md           # Detailed DevOps tasks
  │   │   └── README.md             # DevOps-B documentation
  ├── environments/
  │   ├── dev/                     # Terraform configs for Dev
  │   ├── prod/                    # Terraform configs for Prod
  ├── main.tf                      # Main Terraform file
  ├── variables.tf
  ├── outputs.tf
  ├── backend.tf                   # Remote Terraform state configuration
```

## Monitoring & Observability

This project includes Prometheus, Grafana, and Google Cloud Monitoring for tracking system metrics.

### 1. Accessing Prometheus & Grafana
After deployment, you can access monitoring tools inside your Kubernetes cluster:

- **Prometheus**:
```sh
kubectl port-forward -n monitoring svc/prometheus-server 9090:80
```
- Open `http://localhost:9090` in your browser.

- **Grafana**:
```sh
kubectl port-forward -n monitoring svc/grafana 3000:80
```
- Open `http://localhost:3000` in your browser.
- Default credentials: `admin` / `prom-operator`

### 2. Google Cloud Monitoring Dashboard
A custom GKE Dashboard is automatically created in Google Cloud Monitoring.

- Access it via Terraform output:
```sh 
terraform output gke_dashboard_url
```
- Or visit:
```sh 
https://console.cloud.google.com/monitoring/dashboards/custom/YOUR_DASHBOARD_ID?project=YOUR_PROJECT_ID
```

### 3. Alerts & Notifications
- **CPU Usage Alert**: Triggers if CPU utilization exceeds 79%.
- **Notifications**: Sent via Slack and Email (configured in Terraform).

### 4. Customizing Monitoring
You can modify monitoring settings in `terraform/modules/monitoring/monitoring.tf`.

## CI/CD Pipeline
This project uses a GitHub Actions-based CI/CD pipeline for Terraform automation.
See [CI-CD.md](./CI-CD.md) for details on setup, validation, and deployment.

![Architecture Diagram](architecure-enterprice/architecture.png)

![diagram-export-2-20-2025-10_09_14-PM](https://github.com/user-attachments/assets/35c38beb-477f-4794-b565-939ee401d8b3)
via https://www.eraser.io/ai/architecture-diagram-generator
