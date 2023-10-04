module "lb-http" {
  source  = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version = "9.2.0"

  project = var.project.id
  name    = "${local.service_name}-lb"

  managed_ssl_certificate_domains = local.lb.domains
  ssl                             = true
  https_redirect                  = true

  backends = {
    default = {
      groups = [
        {
          group = google_compute_region_network_endpoint_group.main.id
        }
      ]
      enable_cdn = false
      log_config = local.lb.log_config
      iap_config = local.lb.iap_config
    }
  }
}

resource "google_compute_region_network_endpoint_group" "main" {
  name                  = "${local.service_name}-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.project.default_region
  cloud_run {
    service = local.cloud_run_name
  }
}
