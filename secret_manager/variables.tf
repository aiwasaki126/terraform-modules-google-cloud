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
    secret_id = string
  })
}

variable "imports" {
  type = object({
    service_accounts = optional(map(string))
  })
}

variable "secrets" {
  type = object({
    data = string
  })
  sensitive = true
}
