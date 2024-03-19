## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.96.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.96.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_random"></a> [random](#module\_random) | ../random | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.activity_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_categories"></a> [categories](#input\_categories) | n/a | <pre>list(object({<br>    category = string<br>    retention_policy = object({<br>      enabled = bool<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment: dev, staging, or prod | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
