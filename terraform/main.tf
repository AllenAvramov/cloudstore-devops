
terraform {
  required_version = ">= 1.4.0"
}

resource "terraform_data" "cloudstore" {
  input = {
    project     = "CloudStore"
    environment = "staging"
    managed_by  = "Terraform"
    owner       = "DevOps Team"
  }
}

output "project_info" {
  value = terraform_data.cloudstore.output
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = pathexpand("~/.kube/config")
  config_context = "kind-cloudstore"
}

resource "kubernetes_namespace_v1" "staging" {
  metadata {
    name = "cloudstore-staging"
  }
}