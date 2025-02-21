# CI/CD Pipeline for Terraform

## Overview
This project includes a GitHub Actions-based CI/CD pipeline for automating Terraform workflows. The pipeline ensures Terraform code is properly formatted, validated, security-scanned, cost-estimated, and tested before applying infrastructure changes.

## Workflow Triggers
The workflow is triggered on:
- Pushes to the `main` branch
- Pull requests

## Jobs and Steps

### 1. Setup & Install Dependencies
**Purpose:** Ensures Terraform and required dependencies are installed before running any tasks.
- Checks out the repository
- Installs Terraform (version 1.6.0)
- Caches Terraform dependencies

### 2. Terraform Tasks
This job runs various validation and security checks using a matrix strategy:

#### **Format Check**
- Ensures Terraform files are formatted correctly.
- Uses: `terraform fmt -check -recursive`

#### **Validation**
- Runs `terraform validate -no-color` to check syntax and configuration errors.
- Runs `terraform plan -var-file=env/dev.tfvars` to verify variable files.
- Checks `terraform.lock.hcl` integrity to detect unexpected changes.

#### **Security Scan**
- Uses Checkov to scan for security vulnerabilities.

#### **Linting**
- Uses TFLint to check for Terraform best practices.

#### **Cost Estimation**
- Uses Infracost to estimate costs before applying changes.

#### **Testing with Terratest**
- Runs Go-based Terraform tests (`go test -v -timeout 30m ./tests/`).

### 3. Terraform Plan
**Purpose:**
- Generates a Terraform execution plan (`terraform plan -out=tfplan.binary`).
- Converts the plan to JSON format.
- Posts a summary of `terraform plan` to the pull request as a comment.

### 4. Terraform Apply (Main Branch Only)
**Purpose:**
- Ensures validation passes before applying changes.
- Runs `terraform apply -auto-approve` to deploy infrastructure.
- Captures Terraform output variables and stores them as artifacts.

## Artifacts & Reports
- **Checkov security report** (`checkov-results.json`)
- **TFLint linting report** (`tflint-results.json`)
- **Infracost cost estimate** (`infracost-results.json`)
- **Terraform test results** (`terratest-results.log`)
- **Terraform execution plan JSON** (`tfplan.json`)
- **Terraform output variables** (`terraform-output.txt`)

## Running Locally
To test Terraform configurations locally:
```sh
    terraform fmt -recursive
    terraform init
    terraform validate
    terraform plan -var-file=env/dev.tfvars
    terraform apply -auto-approve
```

For security and linting checks:
```sh
    checkov -d .
    tflint --init && tflint
```

For testing:
```sh
    go test -v -timeout 30m ./tests/
```

## Notes
- The pipeline supports multiple Terraform validation steps before deployment.
- Cost estimation is only performed in pull requests.
- Security scanning is integrated using Checkov.
- Workspaces are currently disabled as we use a local backend (`path = "./terraform.tfstate"`).
