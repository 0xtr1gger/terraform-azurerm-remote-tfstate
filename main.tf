
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix

  count = var.existing_rg_name ? 1 : 0 # create if existing_rg_name set to true
}

resource "azurerm_resource_group" "rg" {
  name     = var.use_existing_rg ? var.existing_rg_name : random_pet.rg_name[0].id
  location = var.rg_location

  count = var.existing_rg_name ? 1 : 0 # create if existing_rg_name set to true
}

resource "azurerm_storage_account" "tfstate_blob_storage" {
  name                     = var.storage_account_name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  # if use_existing_rg == true, then use exisring_rg_name, otherwise use azurerm_resource_group.rg.name
  resource_group_name = var.use_existing_rg ? var.existing_rg_name : azurerm_resource_group.rg[0].name
  location            = var.use_existing_rg ? var.existing_rg_location : azurerm_resource_group.rg[0].location
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.storage_container_name
  container_access_type = "private"
  storage_account_id    = azurerm_storage_account.tfstate_blob_storage.id
}

