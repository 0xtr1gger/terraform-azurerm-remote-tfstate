output "resource_group_name" {
  description = "The name of the created or reused resource group"
  value       = var.use_existing_rg ? var.existing_rg_name : azurerm_resource_group.rg[0].name
}

output "storage_account_name" {
  description = "The name of the created storage account"
  value       = azurerm_storage_account.tfstate_blob_storage.name
}

output "storage_container_name" {
  description = "The name of the created storage account"
  value       = azurerm_storage_container.tfstate_container.name
}

output "tfstate_blob_container_url" {
  description = "The URL of the provisioned Azure storage container for state files"
  value       = "${azurerm_storage_account.tfstate_blob_storage.primary_web_endpoint}${azurerm_storage_container.tfstate_container.name}"
}
