terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create Bridge Domain
module "192_168_100_0_24" {
  source = "../../../aci_sdk/aci_bridge_domain"

  name         = "192_168_100_0_24"
  tenant_id    = "common tenant id"         
}

output "192_168_100_0_24_id" {
  value = module.192_168_100_0_24.id
}