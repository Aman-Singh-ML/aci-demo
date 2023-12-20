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

module "demo" {
  source = "../../../aci_sdk/aci_tenant"

  name         = "demo"
  description = "This is a Demo tenant created by terraform"
}

output "demo_id" {
  value = module.demo.id
}

module "create_app_profile" {
  source = "./app_profile"
}

module "create_epgs" {
  source = "./epgs"
}

module "create_epg_to_app_binding" {
    source = "./epg_to_app_binding"
}