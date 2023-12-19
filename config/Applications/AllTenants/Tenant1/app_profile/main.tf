terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "demo" {
  source = "../"
}

# Create App Profile
module "wordpress" {
  source = "../../../aci_sdk/aci_application_profile"

  name         = "wordpress"
  tenant_id    = module.demo.demo_id          
  
  depends_on   = [module.demo]
}

output "wordpress_id" {
  value = module.wordpress.id
}
