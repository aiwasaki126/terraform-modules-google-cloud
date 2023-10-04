variable "project" {
  type = object({
    id             = string
    number         = number
    default_region = string
    default_zone   = string
  })
}

variable "labels" {
  type = object({
    env = string
  })
}

variable "presets" {
  type = object({
    service_name = string
    domain       = string
  })
}

variable "imports" {
  type = object({
    cloud_run_name = string
    managed_zone   = string
  })
}

variable "secrets" {
  type = object({
    oauth2_client_id     = string
    oauth2_client_secret = string
  })
  sensitive = true
}
