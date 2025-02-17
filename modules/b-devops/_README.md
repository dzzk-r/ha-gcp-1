# DevOps-B: DevOps Project B

## Overview
DevOps-B is responsible for **application deployment, automation, and Kubernetes orchestration** in this GCP environment. It focuses on ensuring smooth CI/CD pipelines and containerized workload management.

###  Responsibilities
- **Google Kubernetes Engine (GKE) Management**
- **Ingress & Traffic Routing (Nginx, L7 ILB)**
- **CI/CD Pipelines & Deployment Automation**
- **Application Scaling & Monitoring**

### Directory Structure
```
/modules/devops-b/
  ├── gke.tf                  # Kubernetes Cluster setup
  ├── ingress.tf              # Ingress Controller & Traffic Routing
  ├── flask_app.tf            # Application Deployment
  ├── variables.tf            # DevOps-specific variables
  ├── outputs.tf              # Terraform outputs
  ├── ToDo-low.md             # Detailed DevOps tasks
  ├── README.md               # This documentation
```

## Next Steps
- Define role-based access for DevOps-B in GKE.
- Establish best practices for container security.
- Automate deployments with a robust CI/CD pipeline.

---

**Managed by:** DevOps Team
    