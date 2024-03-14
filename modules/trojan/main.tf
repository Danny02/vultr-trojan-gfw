
locals {
  domain = "${var.REGION}.${var.DOMAIN}"
  trojan_config = templatefile("${path.module}/trojan-config.json", {
    domain = local.domain
    password = var.PASSWORD
  })
  cloud_config = templatefile("${path.module}/cloud-config.yaml", {
    config = local.trojan_config
    domain = local.domain
  })
  parts = split(".", var.DOMAIN)
  sub_domain = join(".", slice(local.parts, 0, length(local.parts) - 2))
}

resource "vultr_instance" "proxy" {
  plan = "vc2-1c-1gb"
  label = "trojan-${var.REGION}"
  region = var.REGION
  os_id = "1743" # Ubuntu 22.04
  enable_ipv6 = true
  disable_public_ipv4 = false
  backups = "disabled"
  ddos_protection = false
  activation_email = false
  ssh_key_ids = [ var.SSH_KEY_ID ]
  user_data = local.cloud_config
}

resource "vultr_dns_record" "ipv6" {
  domain = "${var.DOMAIN_ID}"
  name = "${var.REGION}.${local.sub_domain}"
  data = "${vultr_instance.proxy.v6_main_ip}"
  type = "AAAA"
}

resource "vultr_dns_record" "ipv4" {
  domain = "${var.DOMAIN_ID}"
  name = "${var.REGION}.${local.sub_domain}"
  data = "${vultr_instance.proxy.main_ip}"
  type = "A"
}
