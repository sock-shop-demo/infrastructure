module "staging" {
  source             = "github.com/sock-shop-demo/infra-module?ref=v0.0.2"
  kubeconfig_name    = "kubeconfig_staging"
  loadbalancer_name  = "loadbalancer-staging"
  cluster_name       = "staging"
  cluster_nodes_name = "staging-node"
  digitalocean_token = var.digitalocean_token
}

module "prod" {
  source             = "github.com/sock-shop-demo/infra-module?ref=v0.0.2"
  kubeconfig_name    = "kubeconfig_prod"
  loadbalancer_name  = "loadbalancer-prod"
  cluster_name       = "prod"
  cluster_nodes_name = "prod-node"
  digitalocean_token = var.digitalocean_token
}

resource "github_actions_secret" "staging_kubernetes_config" {
  repository      = "catalogue-microservice"
  secret_name     = "STAGING_KUBERNETES_KUBECONFIG"
  plaintext_value = module.staging.kubeconfig
}


resource "github_actions_secret" "staging_cluster_ip" {
  repository      = "catalogue-microservice"
  secret_name     = "STAGING_CLUSTER_IP"
  plaintext_value = module.staging.cluster_ip
}


resource "github_actions_secret" "produ_kubernetes_config" {
  repository      = "catalogue-microservice"
  secret_name     = "PRODU_KUBERNETES_KUBECONFIG"
  plaintext_value = module.prod.kubeconfig
}


resource "github_actions_secret" "produ_cluster_ip" {
  repository      = "catalogue-microservice"
  secret_name     = "PRODU_CLUSTER_IP"
  plaintext_value = module.prod.cluster_ip
}

resource "github_actions_secret" "staging_kubernetes_config_frontend" {
  repository      = "frontend"
  secret_name     = "STAGING_KUBERNETES_KUBECONFIG"
  plaintext_value = module.staging.kubeconfig
}


resource "github_actions_secret" "staging_cluster_ip_frontend" {
  repository      = "frontend"
  secret_name     = "STAGING_CLUSTER_IP"
  plaintext_value = module.staging.cluster_ip
}


resource "github_actions_secret" "produ_kubernetes_config_frontend" {
  repository      = "frontend"
  secret_name     = "PRODU_KUBERNETES_KUBECONFIG"
  plaintext_value = module.prod.kubeconfig
}


resource "github_actions_secret" "produ_cluster_ip_frontend" {
  repository      = "frontend"
  secret_name     = "PRODU_CLUSTER_IP"
  plaintext_value = module.prod.cluster_ip
}
