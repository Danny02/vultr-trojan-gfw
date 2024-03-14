output "connection" {
  value = {
    domain = "${vultr_instance.proxy.region}.${var.DOMAIN}"
    main_ip = vultr_instance.proxy.main_ip
    v6_main_ip = vultr_instance.proxy.v6_main_ip
  }
}
