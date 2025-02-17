terraform {
  required_version = ">= 1.0"
  backend "gcs" {
    bucket = "terraform-state-dev"
    prefix = "terraform/state"
  }
}

module "a-infra" {
  source = "./modules/a-infra"
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
