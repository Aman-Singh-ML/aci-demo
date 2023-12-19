terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "wordpress" {
  source = "../app_profile"
}

# Create EPGs
module "webservers" {
  source = "../../../aci_sdk/aci_application_epg"

  name         = "webservers"
  app_id    = module.wordpress.wordpress_id            
  
  depends_on   = [module.wordpress.tenant1]
}
