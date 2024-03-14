variable "DOMAIN" {
  type        = string
  description = "The sub domain Vultr DNS is configured as ns record."
  validation {
    condition = can(regex(".+[.].+[.].+", var.DOMAIN))
    error_message = "module only works with a sub domain currently"
  }
}

variable "VULTR_API_KEY" {
  type = string
  description = "Vultr API key to create instances with"
}

variable "SSH_KEY" {
  type = string
  description = "A ssh public key to access the trojan instances"
  validation {
    condition = can(regex("^ssh-[0-9a-z]+ AAAA[0-9A-Za-z+]+[=]{0,3} .+$", var.SSH_KEY))
    error_message = "must be a single line ssh public key, e.g. content from ~/.ssh/id_rsa.pub"
  }
}

variable "REGIONS" {
  type = list(string)
  description = "A list of Vultr regions to a deploy trojan instances to"
  default = ["lax"]
  validation {
    condition = can([for r in var.REGIONS : regex("^[a-z]{3}$", r)])
    error_message = "See https://api.vultr.com/v2/regions for a list of valid regions"
  }
}

# currently available regions
#
# ams Amsterdam
# atl Atlanta
# blr Bangalore
# bom Mumbai
# cdg Paris
# del Delhi NCR
# dfw Dallas
# ewr New Jersey
# fra Frankfurt
# hnl Honolulu
# icn Seoul
# itm Osaka
# jnb Johannesburg
# lax Los Angeles
# lhr London
# mad Madrid
# man Manchester
# mel Melbourne
# mex Mexico City
# mia Miami
# nrt Tokyo
# ord Chicago
# sao São Paulo
# scl Santiago
# sea Seattle
# sgp Singapore
# sjc Silicon Valley
# sto Stockholm
# syd Sydney
# tlv Tel Aviv
# waw Warsaw
# yto Toronto
