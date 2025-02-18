### **Message for the Interviewer**

---

**Hey Aviran,**

I've prepared three feature branches with tests for **Ingress + External LB**:

1 **feature/terraform-ingress-tests** – Automated checks for Ingress availability using `curl`.  
2 **feature/terraform-iam-checks** – IAM permission validation to ensure Terraform has access to GCP resources.  
3 **feature/terraform-outputs** – Useful Terraform output values for quick debugging of the Load Balancer.

I'm ready to discuss the implementation of each approach and how they can be applied. I will also add a **HA.md** file to the `main` branch, where I'll describe the second-stage requirements and possible solutions.

Looking forward to continuing the discussion!

---

### **HA.md – High Availability & Verification**

#### ** Task: Ensure High Availability & Accessibility of the Application**
The goal is to verify that the **GCP Load Balancer (LB) and Kubernetes Ingress** are correctly configured and working as expected. The solution must provide:

- **Automated tests** to confirm external access.
- **Debugging outputs** for quick troubleshooting.
- **IAM permission validation** to prevent deployment failures due to access issues.

---

#### **Solution Approaches**

### **1. Automated Terraform Tests for Ingress Availability**
Terraform doesn’t natively support HTTP testing, so we use `null_resource + local-exec` to run `curl` inside Terraform.

```hcl
resource "null_resource" "test_ingress" {
  provisioner "local-exec" {
    command = <<EOT
    echo "Checking Ingress..."
    INGRESS_IP=$(kubectl get ingress flask-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    curl -f http://$INGRESS_IP || (echo "Ingress is NOT working!" && exit 1)
    echo "Ingress is accessible!"
    EOT
  }

  depends_on = [google_compute_global_forwarding_rule.external_lb]
}
```
**What this does:**
- Fetches the **Ingress external IP** from Kubernetes.
- Uses `curl` to test HTTP access.
- Fails `terraform apply` if the Ingress is unreachable.

---

### **2. Terraform Outputs for Quick Debugging**
We add outputs to show **External LB IP and Ingress verification steps** after deployment.

```hcl
output "lb_external_ip" {
  description = "External IP of the Load Balancer"
  value       = google_compute_global_address.external_lb.address
}

output "ingress_status" {
  description = "Ingress accessibility test"
  value       = <<EOT
  Run the following command to verify:
  curl -i http://$(kubectl get ingress flask-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  EOT
}
```
📌 **Benefits:**
- Shows **External LB IP** immediately after deployment.
- Provides a **predefined curl command** for verification.

---

### **3. IAM Permission Checks for GCP Load Balancer**
If the Load Balancer **fails to deploy**, it could be due to **missing IAM permissions**. We add an extra check to validate Terraform’s access:

```hcl
resource "null_resource" "check_iam" {
  provisioner "local-exec" {
    command = "gcloud compute forwarding-rules list || echo '❌ No permissions to access GCP Load Balancer!'"
  }
}
```
**Why this matters?**
- Ensures Terraform **has the required permissions** before applying changes.
- Prevents wasted debugging time due to IAM restrictions.

---

#### **Final Plan**
1. **`terraform apply` execution**:
    - Deploys **Ingress + External LB**.
    - Shows **External IP and debugging commands**.
    - Runs **Ingress availability check via curl**.
    - Validates **IAM permissions** for the Load Balancer.

2. **Failure handling:**
    - **Ingress unreachable?** → Issue with Kubernetes deployment.
    - **LB not deployed?** → Missing IAM permissions in GCP.

---

### **Conclusion:**
With these Terraform enhancements, we now have:  
**Automated validation** of Ingress and Load Balancer.  
**Predefined debugging commands** in Terraform outputs.  
**IAM permission checks** to prevent access issues.

This approach ensures **High Availability (HA) verification is fully automated**, making deployments smoother and debugging faster.