resource "azurerm_resource_group" "rg" {
  location             = var.resource_group_location
  name                 = var.resource_group_name
}

# Manages the Virtual Network
resource "azurerm_virtual_network" "default" {
  address_space        = var.Add_space
  location             = azurerm_resource_group.rg.location
  name                 = var.vnet_name
  resource_group_name  = azurerm_resource_group.rg.name
}

# Manages the Subnet
resource "azurerm_subnet" "default" {
  address_prefixes     = var.Subnet_prefix
  name                 = var.Subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.default.name
  service_endpoints    = var.Service_ep

  delegation {
    name               = var.delegation_name

    service_delegation {
      name             = var.delegation_ep_name
      actions          = [
        var.delegation_ep_action,
      ]
    }
  }
}

# Enables you to manage Private DNS zones within Azure DNS
resource "azurerm_private_dns_zone" "default" {
  name                = var.pvt_dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name
}

# Enables you to manage Private DNS zone Virtual Network Links
resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = var.pvt_dns_zone_name_link
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_id    = azurerm_virtual_network.default.id
}

# Manages the MySQL Flexible Server
resource "azurerm_mysql_flexible_server" "default" {
  location                     = azurerm_resource_group.rg.location
  name                         = var.mysql_fs_name
  resource_group_name          = azurerm_resource_group.rg.name
  administrator_login          = var.admin_name
  administrator_password       = var.admin_password
  backup_retention_days        = var.bkp_retention_days
  delegated_subnet_id          = azurerm_subnet.default.id
  geo_redundant_backup_enabled = false
  private_dns_zone_id          = azurerm_private_dns_zone.default.id
  sku_name                     = var.Sku
  version                      = var.server_ver
  zone                         = var.server_zone

  high_availability {
    mode                      = var.high_av_mode
    standby_availability_zone = var.high_av_zones
  }
  maintenance_window {
    day_of_week  = var.day_week
    start_hour   = var.hour
    start_minute = var.minute
  }
  storage {
    iops         = var.strg_iops
    size_gb      = var.strg_size_gb
  }

  depends_on     = [azurerm_private_dns_zone_virtual_network_link.default]
}