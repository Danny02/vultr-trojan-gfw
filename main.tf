provider "vultr" {
  api_key = var.VULTR_API_KEY
}

resource "random_password" "trojan_password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

locals {
  parts = split(".", var.DOMAIN)
  top_domain = join(".", slice(local.parts, length(local.parts) - 2, length(local.parts)))
  sub_domain = join(".", slice(local.parts, 0, length(local.parts) - 2))
}

resource "vultr_ssh_key" "instance_root" {
  name = "dev macbook"
  ssh_key = "${var.SSH_KEY}"
}

resource "vultr_dns_domain" "vultr_top_domain" {
  domain = "${local.top_domain}"
}

module "trojan" {
  source = "./modules/trojan"
  for_each = toset(var.REGIONS)
  REGION = each.value
  DOMAIN = var.DOMAIN
  DOMAIN_ID = vultr_dns_domain.vultr_top_domain.id
  SSH_KEY_ID = vultr_ssh_key.instance_root.id
  PASSWORD = random_password.trojan_password.result
}
