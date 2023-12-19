terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = "0.4.1"
    }
  }
  required_version = ">= 0.13.4"
}

provider "aci" {
  username = "admin"
  password = "C1sco12345"
  url      = "https://apic1.dcloud.cisco.com/"
  insecure = true
}

resource "aci_leaf_access_port_policy_group" "aci_p23_intpolg_access" {
    name                            = "aci_p23_intpolg_access"
    relation_infra_rs_cdp_if_pol    = data.aci_cdp_interface_policy.aci_lab_cdp.id
    relation_infra_rs_att_ent_p     = aci_attachable_access_entity_profile.aci_p23_l3_aep.id
}