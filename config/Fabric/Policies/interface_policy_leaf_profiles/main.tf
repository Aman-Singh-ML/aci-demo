terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

# Create CDP Policy1
module "Leaf_101" {
  source = "../../../aci_sdk/aci_leaf_interface_profile"

  name                          = "Leaf_101"
}
