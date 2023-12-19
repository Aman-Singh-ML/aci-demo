terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create CDP Policy1
module "cdp-enabled" {
  source = "../../../aci_sdk/aci_cdp_policy"

  name      = "cdp-enabled"
  admin_st  = "enabled"
}
