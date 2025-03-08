# terraform-azurerm-remote-tfstate

This module is designed to provision resources necessary to store Terraform state files on Azure. 

- By default, the module creates an Azure resource group, storage account, and blob container for Terraform state files.
- It is possible to use an exisring resource group to provision a storage account and blob container, instead of creating a new group (see Examples).

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.22.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.tfstate_blob_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfstate_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_pet.rg_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_rg_location"></a> [existing\_rg\_location](#input\_existing\_rg\_location) | The location of the existing resource group (applies when `use_existing_rg` is `true`) | `string` | `""` | no |
| <a name="input_existing_rg_name"></a> [existing\_rg\_name](#input\_existing\_rg\_name) | The name of the existing resource group (applies when `use_existing_rg` is `true`) | `string` | `""` | no |
| <a name="input_resource_group_name_prefix"></a> [resource\_group\_name\_prefix](#input\_resource\_group\_name\_prefix) | The prefix for the name of the Azure resource group to create | `string` | `"rg-tfstate"` | no |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | The location of the resource group | `string` | `"East US"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name for the storage account to create | `string` | `"tfstate-storage"` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | The replication type for the storage account | `string` | `"LRS"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | The storage account tier to use | `string` | `"Standard"` | no |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | The name for the blob storage container to create | `string` | `"tfstate-container"` | no |
| <a name="input_use_existing_rg"></a> [use\_existing\_rg](#input\_use\_existing\_rg) | Whether to use an existing resource group | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the created or reused resource group |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the created storage account |
| <a name="output_storage_container_name"></a> [storage\_container\_name](#output\_storage\_container\_name) | The name of the created storage account |
| <a name="output_tfstate_blob_container_url"></a> [tfstate\_blob\_container\_url](#output\_tfstate\_blob\_container\_url) | The URL of the provisioned Azure storage container for state files |
