# vnet variables

variable "location" {
  description = "One of the Azure region for the resource provisioning"
  type        = string
  default     = "France Central"
}

variable "resource_group_name" {
  description = "Resource groupe name tha will contain various resources"
  type        = string
  default     = ""
}

variable "vnet_cidr" {
  description = "CIDR Block for virtual network"
  type        = string
  default     = "10.9.8.0/23"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = ""
}

variable "vnet_dns_servers" {
  description = "The DNS servers to be used with vNet. If empty, default will be Azure dns servers"
  type        = list(string)
  default     = [""]
}

# Subnet variables

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.9.8.0/26"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1"]
}

# Default tags

variable "tags" {
  description = "Default tags to apply on the resource"
  type        = map(string)

  default = {
    environment = ""
    terraform   = "true"
  }
}
