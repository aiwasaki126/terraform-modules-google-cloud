resource "google_dns_record_set" "a_record" {
  name = local.dns_a_record.domain
  type = "A"
  ttl  = local.dns_a_record.ttl

  managed_zone = local.dns_a_record.managed_zone

  rrdatas = [module.lb-http.external_ip]
}
