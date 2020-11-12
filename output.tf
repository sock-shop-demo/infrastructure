output "staging_ip" {
  description = "Staging ip."
  value       = module.staging.cluster_ip
}

output "prod_ip" {
  description = "Produ ip."
  value       = module.prod.cluster_ip
}