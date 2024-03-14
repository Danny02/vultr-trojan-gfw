## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5)

- <a name="requirement_vultr"></a> [vultr](#requirement\_vultr) (>= 2.19.0)

## Providers

The following providers are used by this module:

- <a name="provider_random"></a> [random](#provider\_random) (3.6.0)

- <a name="provider_vultr"></a> [vultr](#provider\_vultr) (2.19.0)

## Modules

The following Modules are called:

### <a name="module_trojan"></a> [trojan](#module\_trojan)

Source: ./modules/trojan

Version:

## Resources

The following resources are used by this module:

- [random_password.trojan_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) (resource)
- [vultr_dns_domain.vultr_top_domain](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/dns_domain) (resource)
- [vultr_ssh_key.instance_root](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/ssh_key) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_DOMAIN"></a> [DOMAIN](#input\_DOMAIN)

Description: The sub domain Vultr DNS is configured as ns record.

Type: `string`

### <a name="input_SSH_KEY"></a> [SSH\_KEY](#input\_SSH\_KEY)

Description: A ssh public key to access the trojan instances

Type: `string`

### <a name="input_VULTR_API_KEY"></a> [VULTR\_API\_KEY](#input\_VULTR\_API\_KEY)

Description: Vultr API key to create instances with

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_REGIONS"></a> [REGIONS](#input\_REGIONS)

Description: A list of Vultr regions to a deploy trojan instances to

Type: `list(string)`

Default:

```json
[
  "lax"
]
```

## Outputs

The following outputs are exported:

### <a name="output_trojan_instances"></a> [trojan\_instances](#output\_trojan\_instances)

Description: n/a

### <a name="output_trojan_passsword"></a> [trojan\_passsword](#output\_trojan\_passsword)

Description: n/a
