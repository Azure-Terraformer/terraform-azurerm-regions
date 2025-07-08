terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.34.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "2e8709b1-d4b3-4408-a508-f94e320ffd98"
  resource_provider_registrations = "none"
}
