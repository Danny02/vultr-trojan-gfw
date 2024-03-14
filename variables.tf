variable "DOMAIN" {
  type = string
}

variable "REGIONS" {
  type = list(string)
}

variable "SSH_KEY" {
  type = string
}

variable "VULTR_API_KEY" {}
