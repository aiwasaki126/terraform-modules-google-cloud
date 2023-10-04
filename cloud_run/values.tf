locals {
  name     = var.presets.name
  location = var.project.default_region
  ingress  = var.presets.ingress
  cpu_idle = var.presets.cpu_idle
  memory   = var.presets.memory
  cpu      = var.presets.cpu
  port     = var.presets.port
}
