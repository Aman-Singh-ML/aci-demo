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

resource "aci_tenant" "aci_demo2" {
  name        = "aci_demo2"
}

resource "aci_tenant" "aci_demo2" {
  name        = "aci_demo3"
}