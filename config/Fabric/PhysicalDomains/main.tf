terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "all_vlans" {
  source = "../policies/vlan_pools"
}

# Create Physical Domain 
module "physical_servers" {
  source = "../../../aci_sdk/aci_physical_domain"

  name                       = "physical_servers"
  relation_infra_rs_vlan_ns  = module.all_vlans.all_vlans_id
  
  depends_on                 = [module.all_vlans]
}

output "physical_servers_id" {
  value = module.physical_servers.id
}