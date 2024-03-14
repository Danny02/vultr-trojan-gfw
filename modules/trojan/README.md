## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5)

- <a name="requirement_vultr"></a> [vultr](#requirement\_vultr) (>= 2.19.0)

## Providers

The following providers are used by this module:

- <a name="provider_vultr"></a> [vultr](#provider\_vultr) (>= 2.19.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [vultr_dns_record.ipv4](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/dns_record) (resource)
- [vultr_dns_record.ipv6](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/dns_record) (resource)
- [vultr_instance.proxy](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/instance) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_DOMAIN"></a> [DOMAIN](#input\_DOMAIN)

Description: The sub domain Vultr DNS is configured as ns record.

Type: `string`

### <a name="input_DOMAIN_ID"></a> [DOMAIN\_ID](#input\_DOMAIN\_ID)

Description: id of vultr\_dns\_domain

Type: `string`

### <a name="input_PASSWORD"></a> [PASSWORD](#input\_PASSWORD)

Description: Password to use for trojan connection

Type: `string`

### <a name="input_REGION"></a> [REGION](#input\_REGION)

Description: A Vultr region to a deploy the trojan instances to

Type: `string`

### <a name="input_SSH_KEY_ID"></a> [SSH\_KEY\_ID](#input\_SSH\_KEY\_ID)

Description: id of vultr\_ssh\_key

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_connection"></a> [connection](#output\_connection)

Description: n/a
