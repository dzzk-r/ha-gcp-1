# TODO.md

This document outlines the key tasks and questions that need to be addressed to ensure the security, reliability, and scalability of our GCP infrastructure, especially given the sensitive nature of the project (national security-grade requirements).

## High-Priority Tasks & Questions

### IAM (Identity and Access Management) - CRITICAL

- **Detailed IAM Policies:** The separation of Infra-A and DevOps-B necessitates clearly defined IAM policies for each team. We need to detail the specific roles and permissions required for each team to manage their respective components. This is absolutely critical for security.
    - *Action Required:* Define granular IAM roles for Infra-A and DevOps-B, adhering to the principle of least privilege.
    - *Question:* How will we manage and rotate service account keys?

### Cloud Armor - CRITICAL

- **Specific Cloud Armor Rules:** We need to define specific Cloud Armor rules to protect our application.
    - *Action Required:* Define the types of attacks we want to block (e.g., DDoS, SQL injection, cross-site scripting).
    - *Question:* What WAF (Web Application Firewall) rules will we implement?  How will we manage and update these rules?  How will we integrate Cloud Armor with our monitoring system?

### Private Service Connect - CRITICAL

- **PSC Configuration Details:** How exactly is PSC configured?
    - *Action Required:* Document the PSC setup, including network peering, service attachments, and DNS configuration.
    - *Question:* Which services are accessible via PSC? How is DNS resolution handled across projects?  What security measures are in place to prevent unauthorized access via PSC?

### Ingress Controller - CRITICAL

- **Ingress Controller Selection & Configuration:** Migrating to a dedicated Ingress Controller is essential.
    - *Action Required:* Choose an appropriate Ingress Controller (e.g., kubernetes.io/ingress-nginx or cloud.google.com/l7-ilb-regional).
    - *Question:* How will we configure the Ingress Controller to work with PSC and the external load balancer?  How will we ensure high availability and fault tolerance for the Ingress Controller?

### GKE Security - CRITICAL

- **Pod Security Policies & Container Security:** We need to define and implement Pod Security Policies.
    - *Action Required:* Choose and implement Pod Security Policies (or Gatekeeper) to secure the GKE cluster.
    - *Question:* How will we ensure container image security? Will we use vulnerability scanning and image signing?  How will we manage secrets within the cluster?

### CI/CD (Continuous Integration/Continuous Deployment) - HIGH

- **CI/CD Process & Tools:** How will we organize the CI/CD process?
    - *Action Required:* Define the CI/CD pipeline, including build, test, and deployment stages.
    - *Question:* Which tools will we use (e.g., Jenkins, GitLab CI)? How will we secure the CI/CD pipeline itself?  How will we automate security testing within the pipeline?

### Monitoring and Logging - HIGH

- **Metrics & Logging Strategy:** What metrics and logs will we collect?
    - *Action Required:* Define the monitoring and logging strategy, including tools (e.g., Cloud Monitoring, Cloud Logging, Prometheus, Grafana).
    - *Question:* How will we analyze logs and set up alerts?  How will we ensure the security and integrity of our logs?

### Scaling - HIGH

- **Scaling Strategies:** How will we scale the application and GKE?
    - *Action Required:* Define scaling strategies for both the application and the GKE cluster (horizontal pod autoscaler, cluster autoscaler).
    - *Question:* Will we use automatic or manual scaling?  How will we monitor and manage the scaling process?

## Medium-Priority Tasks

### ToDo Files

- **Task Prioritization & Assignment:** The existing ToDo files are a good start.
    - *Action Required:* Prioritize the tasks in the ToDo files and assign them to specific individuals or teams.  Set deadlines for each task.

## Low-Priority Tasks

_(These can be addressed later)_

##  Infra-A & DevOps-B
Each of scope (Infra-A & DevOps-B) localizing own REAMDE.md and ToDo.md respectively to the responsible teams.

---
This TODO.md file will serve as the central point of reference for all key decisions and tasks related to the project. We will update this document regularly as we make progress.
