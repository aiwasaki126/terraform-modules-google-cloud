locals {
  name               = var.presets.name
  location           = var.project.default_region
  ingress            = var.presets.ingress
  cpu_idle           = var.presets.cpu_idle
  memory             = var.presets.memory
  cpu                = var.presets.cpu
  min_instance_count = var.presets.min_instance_count
  max_instance_count = var.presets.max_instance_count
  port               = var.presets.port
}
