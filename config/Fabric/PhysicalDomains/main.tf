terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create CDP Policy1
module "physical_domain1" {
  source = "../../../aci_sdk/aci_physical_domain"

  name                       = "physical_servers"
  relation_infra_rs_vlan_ns  = "enabled"
  depends_on                 = [module.vlan_pools.vlan_pool1.id]
}
