terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create VLAN Pool1
module "all_vlans" {
  source = "../../../aci_sdk/aci_vlan_pool/vlan_pool"

  name         = "all_vlans"
  alloc_mode  = "static"
}

output "all_vlans_id" {
  value = module.all_vlans.id
}

module "all_vlans_pool_range" {
  source = "../../../aci_sdk/aci_vlan_pool/vlan_pool_range"

  vlan_pool_id = module.all_vlans.id
  alloc_mode   = "static"
  role         = "external"
  from         = "vlan-2000"
  to           = "vlan-2501"

  depends_on = [module.all_vlans]
}
