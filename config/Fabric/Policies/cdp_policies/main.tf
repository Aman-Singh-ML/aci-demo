terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create CDP Policy1
module "cdp_policy1" {
  source = "../../../aci_sdk/aci_cdp_policy"

  name      = "test_cdp_policy"
  admin_st  = "enabled"
}
