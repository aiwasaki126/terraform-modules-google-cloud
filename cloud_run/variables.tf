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
    name     = string
    ingress  = string # ingress = INGRESS_TRAFFIC_ALL, INGRESS_TRAFFIC_INTERNAL_ONLY, INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER
    cpu_idle = bool
    memory   = string
    cpu      = string
    port     = optional(number, 8080)
  })
}

variable "imports" {
  type = object({
    invokers = optional(list(string), ["allUsers"])
    secrets  = optional(map(string))
  })
  default = {
    invokers = ["allUsers"]
    secrets  = null
  }
}
