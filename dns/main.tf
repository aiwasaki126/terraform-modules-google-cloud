resource "google_dns_managed_zone" "main" {
  name        = "${local.zone.service_name}-zone"
  dns_name    = "${local.zone.top_domain}."
  description = "DNS zone for ${local.zone.service_name}"
}

output "zone_name" {
  value = google_dns_managed_zone.main.name
}

output "zone_dns_name" {
  value = google_dns_managed_zone.main.dns_name
}
