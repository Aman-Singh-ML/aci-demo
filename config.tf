terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "aci_tenant" {
  source = "./tenant"

  name         = "my_tenant"
  description  = "This is my tenant"
  display_name = "My Tenant"
}