terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = "0.4.1"
    }
  }
  required_version = ">= 0.13.4"
}

provider "aci" {
  username = "admin"
  password = "C1sco12345"
  url      = "https://apic1.dcloud.cisco.com/"
  insecure = true
}

resource "aci_ranges" "pool_range" {
  vlan_pool_dn = var.vlan_pool_id
  from         = var.from
  to           = var.to
  alloc_mode   = var.alloc_mode
  role         = var.role
}
