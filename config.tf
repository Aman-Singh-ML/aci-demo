terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "aci_tenant" {
  source = "./aci_tenant_module"

  name         = "my_tenant"
  description  = "This is my tenant"
}
