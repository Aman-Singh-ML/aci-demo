terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

resource "aci_tenant" "aci_demo" {
  name        = "aci_demo"    
}
