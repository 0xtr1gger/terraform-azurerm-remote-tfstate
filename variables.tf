variable "resource_group_name_prefix" {
  type        = string
  description = "The prefix for the name of the Azure resource group to create"
  default     = "rg-tfstate"
}

variable "rg_location" {
  type        = string
  description = "The location of the resource group"
  default     = "East US"
}

variable "storage_account_name" {
  type        = string
  description = "The name for the storage account to create"
  default     = "tfstate-storage"
}

variable "storage_account_tier" {
  type        = string
  description = "The storage account tier to use"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "The replication type for the storage account"
  default     = "LRS"
}

variable "storage_container_name" {
  type        = string
  description = "The name for the blob storage container to create"
  default     = "tfstate-container"
}

## support to provide an existing resource group

variable "use_existing_rg" {
  type        = bool
  description = "Whether to use an existing resource group"
  default     = false
}

variable "existing_rg_name" {
  type        = string
  description = "The name of the existing resource group (applies when `use_existing_rg` is `true`)"
  default     = ""
}

variable "existing_rg_location" {
  type        = string
  description = "The location of the existing resource group (applies when `use_existing_rg` is `true`)"
  default     = ""
}