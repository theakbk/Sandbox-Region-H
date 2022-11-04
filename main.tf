terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "theakRG" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    Environment = "Terraform Getting Started"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.theakRG.name
}

#resource "azurerm_storage_account" "tfstate" {
#  name                     = "tfstate${random_string.resource_code.result}"
#  resource_group_name      = azurerm_resource_group.tfstate.name
#  location                 = azurerm_resource_group.tfstate.location
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#  allow_blob_public_access = true
#
#  tags = {
#   environment = "staging"
#  }
#}

#resource "azurerm_storage_container" "tfstate" {
#  name                  = "tfstate"
#  storage_account_name  = azurerm_storage_account.tfstate.name
#  container_access_type = "blob"
#}