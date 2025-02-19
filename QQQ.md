# High-Level Discussion Topics

This document outlines **key discussion areas** without diving into detailed solutions.  
Each section represents a **high-priority topic** for future refinement and decision-making.

### 0. Feature
https://github.com/dzzk-r/ha-gcp-1/commit/fa04465a9dee02dd6dd05cfca17f75c3e920de6a#commitcomment-152762381


## 1. **IAM & Role-Based Access Control**
- How do we structure IAM policies between Infra-A and DevOps-B?
- What roles and permissions should each team have?

## 2. **Cloud Armor Security Policies**
- What WAF rules should be enforced?
- How do we protect against DDoS and OWASP Top 10 attacks?

## 3. **Private Service Connect Design**
- What services should be exposed via PSC?
- How do we manage DNS and internal routing?

## 4. **Ingress Controller Strategy**
- Which controller should be used: `ingress-nginx` or `GCP L7 ILB`?
- How should traffic flow be managed between Infra-A and DevOps-B?

## 5. **GKE Security & Compliance**
- How do we enforce Pod Security Policies (PSP)?
- What best practices should be followed for RBAC and network policies?

## 6. **CI/CD Pipeline & Deployment Strategy**
- How should the DevOps team manage deployments?
- What CI/CD tooling best fits this architecture?

## 7. **Monitoring & Logging Implementation**
- What metrics should be collected for observability?
- What tools should be used: Cloud Logging, Prometheus, or ELK?

## 8. **Scaling & Performance**
- What auto-scaling strategies should be applied for GKE and applications?
- How do we optimize resource allocation?

## 9. **Terraform State & Automation**
- Where should Terraform state be stored?
- How can infrastructure changes be safely applied and tracked?

---

These topics frame **the discussion** without going into unnecessary implementation details.  
They serve as a foundation for **deeper technical exploration in next phases**.
