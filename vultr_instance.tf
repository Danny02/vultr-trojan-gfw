variable "DOMAIN" {}

variable "SSH_KEY" {}

variable "REGIONS" {}

locals {
  parts = split(".", var.DOMAIN)
  top_domain = join(".", slice(local.parts, length(local.parts) - 2, length(local.parts)))
  sub_domain = join(".", slice(local.parts, 0, length(local.parts) - 2))
}

resource "vultr_ssh_key" "my_ssh_key" {
  name = "dev macbook"
  ssh_key = "${var.SSH_KEY}"
}

resource "vultr_dns_domain" "my_domain" {
  domain = "${local.top_domain}"
}

resource "vultr_instance" "example_instance" {
  for_each = toset(var.REGIONS)
  plan = "vc2-1c-1gb"
  label = "trojan-${each.value}"
  region = each.value
  os_id = "1743" # Ubuntu 22.04
  enable_ipv6 = true
  disable_public_ipv4 = false
  backups = "disabled"
  ddos_protection = false
  activation_email = false
  ssh_key_ids = [
    "${vultr_ssh_key.my_ssh_key.id}"
  ]
  user_data = "${templatefile("cloud-config.yaml", {
    config = templatefile("trojan-config.json", {
      domain = "${each.value}.${var.DOMAIN}"
    })
    domain = "${each.value}.${var.DOMAIN}"
  })}"
}

resource "vultr_dns_record" "my_record_aaaa" {
  for_each = vultr_instance.example_instance
  domain = "${vultr_dns_domain.my_domain.id}"
  name = "${each.value.region}.${local.sub_domain}"
  data = "${each.value.v6_main_ip}"
  type = "AAAA"
}

resource "vultr_dns_record" "my_record_a" {
  for_each = vultr_instance.example_instance
  domain = "${vultr_dns_domain.my_domain.id}"
  name = "${each.value.region}.${local.sub_domain}"
  data = "${each.value.main_ip}"
  type = "A"
}

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
