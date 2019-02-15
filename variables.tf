variable "application" {
  type = "string"

  default = "asset"
}

variable "domain" {
  type = "string"

  default = "granturismo.world"
}

variable "env_names" {
  type = "map"

  default = {
    "stg" = "staging"
    "prd" = "prod"
  }
}

variable "env_dns_zones_prefix" {
  type = "map"

  default = {
    "stg" = "staging."
    "prd" = ""
  }
}
