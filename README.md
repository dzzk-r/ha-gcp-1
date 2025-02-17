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
