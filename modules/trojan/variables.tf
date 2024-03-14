variable "DOMAIN" {
  type = string
  description = "The sub domain Vultr DNS is configured as ns record."
  validation {
    condition = can(regex(".+[.].+[.].+", var.DOMAIN))
    error_message = "module only works with a sub domain currently"
  }
}

variable "DOMAIN_ID" {
  type = string
  description = "id of vultr_dns_domain"
  validation {
    condition = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.DOMAIN_ID))
    error_message = "no valid uuid"
  }
}

variable "SSH_KEY_ID" {
  type = string
  description = "id of vultr_ssh_key"
  validation {
    condition = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.SSH_KEY_ID))
    error_message = "no valid uuid"
  }
}

variable "REGION" {
  type = string
  description = "A Vultr region to a deploy the trojan instances to"
  validation {
    condition = can(regex("^[a-z]{3}$", var.REGION))
    error_message = "See https://api.vultr.com/v2/regions for a list of valid regions"
  }
}

variable "PASSWORD" {
  type = string
  description = "Password to use for trojan connection"
  sensitive = true
}
