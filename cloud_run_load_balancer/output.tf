output "external_ip" {
  value = module.lb-http.external_ip
}

output "external_ipv6_address" {
  value = module.lb-http.external_ipv6_address
}

output "backend_service_name" {
  value = "${local.service_name}-lb-backend-default"
}
