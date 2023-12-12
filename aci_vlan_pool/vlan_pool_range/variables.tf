variable "vlan_pool_id" {
  description = "VLAN pool id."
  type        = string
}

variable "role" {
  description = "Name of the ACI tenant"
  type        = string
}

variable "alloc_mode" {
  description = "Specifies how VLANs are allocated"
  type        = string
}

variable "to" {
  description = "Ending VLAN ID in the block."
  type        = string
}

variable "from" {
  description = "Starting VLAN ID in the block"
  type        = string
}