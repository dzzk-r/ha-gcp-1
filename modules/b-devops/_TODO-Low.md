# TODO-Low.md

## Kubernetes & Application Deployment
- [ ] **Define how Ingress should be handled**:
  - Should **Ingress be fully managed in Project A**?
  - Alternative: Move to **regional L7 Internal Load Balancer**.
- [ ] **Automate GKE cluster scaling & Ingress Controller high availability**.
- [ ] **Enforce security for GKE clusters**:
  - Use **Pod Security Policies** or **Gatekeeper**.
  - Implement **RBAC restrictions** to separate roles.
  - Define a **network policy for internal traffic segmentation**.
- [ ] **Specify container image versions (flask-app, nginx-ingress)**:
  - Use **stable, security-validated images**.
  - Define **an update & lifecycle policy**.
- [ ] **Determine the best secrets management solution**:
  - **Google Secret Manager**, **HashiCorp Vault**, or **Keycloak**?

## CI/CD & Deployment
- [ ] Automate CI/CD pipeline (Terraform checks, container scanning).
- [ ] Set up dashboards for cloud & Kubernetes monitoring.

**Managed by:** DevOps Team
