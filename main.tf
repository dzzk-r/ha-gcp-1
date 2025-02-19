terraform {
  required_version = ">= 1.0"
  backend "local" {
    path = "./terraform.tfstate" # Going GH First Approach
  }
  # backend "gcs" {
  #   bucket = "terraform-state-dev"
  #   prefix = "terraform/state"
  # }
}

module "a-infra" {
  source = "./modules/a-infra"

  cloud_armor_rules        = var.cloud_armor_rules
  psc_service              = var.psc_service
  terraform_backend_prefix = var.terraform_backend_prefix
  terraform_backend_bucket = var.terraform_backend_bucket
  environment              = var.environment
  vpc_name                 = var.vpc_name
  subnet_cidr              = var.subnet_cidr
}

module "b-devops" {
  source = "./modules/b-devops"
}

module "monitoring" {
  source = "./modules/monitoring"
}

module "argo" {
  source = "./modules/argo"
}
