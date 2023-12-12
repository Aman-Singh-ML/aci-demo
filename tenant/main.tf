resource "aci_tenant" "aci_tenant" {
  name        = var.name
  description = var.description
  display_name = var.display_name
  
  # Other fields and configurations for the tenant resource...

}
