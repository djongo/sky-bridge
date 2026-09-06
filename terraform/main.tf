# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a resource group with tags
resource "azurerm_resource_group" "example" {
  name     = "skybridge-rg"
  location = "West Europe"
  tags = {
    Environment = "Dev"
    Project     = "SkyBridge"
  }
}

# Create a storage account with tags
resource "azurerm_storage_account" "example" {
  name                     = "skybridgestorage2026"  # Use your unique name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Environment = "Dev"
    Project     = "SkyBridge"
  }
}