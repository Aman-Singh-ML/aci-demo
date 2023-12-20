
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

module "create_vlan_pools" {
    source = "./policies/vlan_pools"
}

module "create_cdp_policy" {
    source = "./policies/cdp_policies"
}

module "create_physical_domain" {
    source = "./physicaldomain"

    depends_on = [module.create_vlan_pools]
}

module "create_aaep" {
    source = "./policies/aaeps"

    depends_on = [module.create_physical_domain]
}

module "create_interface_policy_groups" {
    source = "./policies/interface_policy_groups"

    depends_on = [module.create_aaep]
}

module "create_interface_policy_leaf_profiles" {
    source = "./policies/interface_policy_leaf_profiles"

}