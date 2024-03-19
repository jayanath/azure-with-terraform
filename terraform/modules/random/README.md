## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.6 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_length"></a> [length](#input\_length) | length of the random string | `number` | `8` | no |
| <a name="input_special"></a> [special](#input\_special) | use special characters or not | `bool` | `false` | no |
| <a name="input_upper"></a> [upper](#input\_upper) | use upper case or not | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_result"></a> [result](#output\_result) | n/a |
