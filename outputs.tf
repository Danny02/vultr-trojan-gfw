output "trojan_instances" {
  value = {
    for k, t in module.trojan : k => t.connection
  }
}

output trojan_passsword {
  value     = random_password.trojan_password.result
  sensitive = true
}
