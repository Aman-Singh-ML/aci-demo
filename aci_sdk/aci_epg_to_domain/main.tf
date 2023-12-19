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

resource "aci_epg_to_domain" "aci_epg_to_domain" {
  name       = var.name
  application_epg_dn = var.epg_id
  tdn = var.domain_id
}