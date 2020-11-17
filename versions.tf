terraform {
  backend "s3" {
    endpoint = "nyc3.digitaloceanspaces.com"
    region = "us-west-1"
    key = "terraform.tfstate"
    skip_requesting_account_id = true
    skip_credentials_validation = true
    skip_get_ec2_platforms = true
    skip_metadata_api_check = true
  }
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