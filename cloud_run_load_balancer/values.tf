locals {
  lb = {
    domains = [var.presets.domain]
    iap_config = {
      enable               = true
      oauth2_client_id     = var.secrets.oauth2_client_id
      oauth2_client_secret = var.secrets.oauth2_client_secret
    }
    log_config = {
      enable      = true
      sample_rate = 1.0
    }
  }
  dns_a_record = {
    domain       = "${var.presets.domain}."
    ttl          = 300
    managed_zone = var.imports.managed_zone
  }
  service_name   = var.presets.service_name
  cloud_run_name = var.imports.cloud_run_name
}
