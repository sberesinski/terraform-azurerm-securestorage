terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
}

locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name           = var.resourcegroupname
  location                      = var.location
  name                          = var.storageaccountname
  account_tier                  = "Standard"
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"
  public_network_access_enabled = false
  tags                          = local.tags
}

