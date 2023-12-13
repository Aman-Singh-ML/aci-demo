terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create VLAN Pool

module "vlan_pool" {
  source = "./aci_vlan_pool/vlan_pool"

  name         = "test_vlan"
  alloc_mode  = "static"
}

module "vlan_pool_range" {
  source = "./aci_vlan_pool/vlan_pool_range"

  vlan_pool_id = module.vlan_pool.id
  alloc_mode   = "static"
  role         = "external"
  from         = "vlan-100"
  to           = "vlan-150"

  depends_on = [module.vlan_pool]
}

