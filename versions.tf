terraform {
  required_providers {
    github = {
      source  = "hashicorp/github"
      version = "4.0.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = ">= 0.13"
}