terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "physical_servers" {
  source = "../../physicaldomains"
}

# Create AAEP
module "aaep_all_vlans" {
    source = "../../../../aci_sdk/aci_cdp_policy"

    name       = "aaep_all_vlans"
    domain_dn  = module.physical_servers.physical_servers_id
    
    depends_on = [module.physical_servers]
}

output "aaep_all_vlans_id" {
  value = module.aaep_all_vlans.id
}