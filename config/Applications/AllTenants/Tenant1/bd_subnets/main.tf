terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "192_168_100_0_24" {
  source = "../bridge_domains"
}

# Create Physical Domain 
module "192_168_100_0_24_subnet" {
  source = "../../../aci_sdk/aci_vrf"

  name         = "192_168_100_0_24_subnet"
  bd_domain_id = "module.192_168_100_0_24.192_168_100_0_24_id"
  ip           = "192.168.101.1/24"             
  
  depends_on   = [module.192_168_100_0_24]
}
