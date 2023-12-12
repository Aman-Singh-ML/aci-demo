provider "aci" {
  username = "admin"
  password = "C1sco12345"
  url      = "https://apic1.dcloud.cisco.com/"
  insecure = true
}

resource "aci_tenant" "aci_tenant" {
  name        = var.name
  description = var.description
  
  # Other fields and configurations for the tenant resource...

}
