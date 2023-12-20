terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create Physical Domain 
module "vrf-01" {
  source = "../../../aci_sdk/aci_vrf"

  name         = "vrf-01"
  tenant_id    = "common tenant id"              
}
