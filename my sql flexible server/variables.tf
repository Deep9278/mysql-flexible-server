variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_name" {
  default     = "my-rg"
  description = "Location of the resource group."
}

variable "vnet_name" {
  type        = string
  default     = "Demo"
  description = "Name of Virtual Network"
}

variable "Add_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Range of ip address or address space"
}


variable "Subnet_name" {
  type        = string
  default     = "mysubnet"
  description = "Name of Subnet"
}

variable "Subnet_prefix" {
  type        = list(string)
  default     = ["10.0.0.0/32"]
  description = "Subnet range"
}

variable "Service_ep" {
  type        = list(string)
  default     = ["Microsoft.Storage"]
  description = "service endpoint"
}

variable "delegation_name" {
  type        = string
  default     = "fs"
  description = "delegation name"
}

variable "delegation_ep_name" {
  type        = string
  default     = "Microsoft.DBforMySQL/flexibleServers"
  description = "delegation endpoint name"
}

variable "delegation_ep_action" {
  type        = string
  default     = "Microsoft.Network/virtualNetworks/subnets/join/action"
  description = "delegation endpoint action"
}

variable "pvt_dns_zone_name" {
  type        = string
  default     = "privatelink.mysql.database.azure.com"
  description = "private dns zone name"
}

variable "pvt_dns_zone_name_link" {
  type        = string
  default     = "vnet-private-zone-link"
  description = "private dns zone name link"
}

variable "mysql_fs_name" {
  type        = string
  default     = "mysqlfs-demo"
  description = "my sql flexible server name"
}

variable "admin_name" {
  type        = string
  default     = "mysqlAdmin"
  description = "Administrator name"
}

variable "admin_password" {
  type        = string
  default     = "Pa55w.rd"
  description = "Administrator Password"
}

variable "bkp_retention_days" {
  type        = string
  default     = "7"
  description = "Backup retention days"
}

variable "Sku" {
  type        = string
  default     = "GP_Standard_D2ds_v4"
  description = "Server sku"
}

variable "server_ver" {
  type        = string
  default     = "8.0.21"
  description = "server version"
}

variable "server_zone" {
  type        = string
  default     = "1"
  description = "zones"
}

variable "high_av_mode" {
  type        = string
  default     = "ZoneRedundant"
  description = "high availability mode"
}

variable "high_av_zones" {
  type        = string
  default     = "2"
  description = "high availability zones"
}

variable "day_week" {
  type        = string
  default     = "0"
  description = "day of weeks of maintinance"
}

variable "hour" {
  type        = string
  default     = "8"
  description = "start hour for maintinance"
}

variable "minute" {
  type        = string
  default     = "0"
  description = "start minute of maintinance"
}

variable "strg_iops" {
  type        = string
  default     = "360"
  description = "Storage iops"
}

variable "strg_size_gb" {
  type        = string
  default     = "20"
  description = "storage size in gb"
}

variable "db_charset" {
  type        = string
  default     = "utf8"
  description = "charset for database"
}

variable "db_collation" {
  type        = string
  default     = "utf8_unicode_ci"
  description = "collation for database"
}

variable "db_name" {
  type        = string
  default     = "mysqlfsdb_demo"
  description = "name of database"
}