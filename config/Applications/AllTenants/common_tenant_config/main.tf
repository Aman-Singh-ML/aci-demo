
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

module "create_vrfs" {
  source = "./vrfs"
}

module "create_bridge_domains" {
  source = "./bridge_domains"
}

module "create_bd_subnets" {
  source = "./bd_subnets"
}