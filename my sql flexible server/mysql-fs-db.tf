# Manages the MySQL Flexible Server Database
resource "azurerm_mysql_flexible_database" "default" {
  charset             = var.db_charset
  collation           = var.db_collation
  name                = var.db_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.default.name
}