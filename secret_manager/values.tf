locals {
  id               = var.presets.secret_id
  data             = var.secrets.data
  service_accounts = var.imports.service_accounts
}
