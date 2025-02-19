variable "cloud_armor_rules" {
  type    = list(string)
  default = ["allow-all"]
}

variable "psc_service" {
  type    = string
  default = "default-psc"
}

variable "terraform_backend_prefix" {
  type    = string
  default = "default-prefix"
}

variable "terraform_backend_bucket" {
  type    = string
  default = "default-bucket"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_name" {
  type    = string
  default = "default-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}
