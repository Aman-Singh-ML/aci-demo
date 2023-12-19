terraform {
  cloud {
    organization = "ACITest"

    workspaces {
      name = "aci-demo"
    }
  }
}

module "aaep_all_vlans" {
  source = "../aaeps"
}

# Create CDP Policy1
module "ESX_Hosts" {
  source = "../../../aci_sdk/aci_leaf_access_port_policy_group"

  name                          = "ESX_Hosts"
  relation_infra_rs_cdp_if_pol  = "enabled"
  relation_infra_rs_att_ent_p   = module.aaep_all_vlans.aaep_all_vlans_id

  depends_on                    = [module.aaep_all_vlans]

}
