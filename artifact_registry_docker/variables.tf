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
    repository_name = string
  })
}

variable "imports" {
  type = object({
    service_accounts = optional(list(string), null)
  })
}
