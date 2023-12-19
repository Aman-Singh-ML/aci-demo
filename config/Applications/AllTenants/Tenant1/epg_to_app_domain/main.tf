terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "physical_servers" {
  source = "../../../../Fabric/physicaldomains"
}

module "wordpress" {
  source = "../app_profile"
}

# Create Physical Domain 
module "webserver_epg_binding" {
  source = "../../../aci_sdk/aci_epg_to_domain"

  name        = "webserver_epg_binding"
  epg_id      = module.wordpress.wordpress_id             
  domain_id   = module.physical_servers.physical_servers_id
  
  depends_on  = [module.wordpress, module.physical_servers]
}
