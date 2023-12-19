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

resource "aci_leaf_interface_profile" "aci_p23_vpc_intf_p" {
    name                            = "aci_p23_vpc_intf_p"
}