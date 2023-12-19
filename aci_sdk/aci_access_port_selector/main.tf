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

resource "aci_access_port_selector" "pod23_vpc_port_selector" {
    leaf_interface_profile_dn      = aci_leaf_interface_profile_id
    name                           = "pod23_vpc_port_selector"
    access_port_selector_type      = "range"
    relation_infra_rs_acc_base_grp = aci_leaf_access_bundle_policy_group.aci_p23_intpolg_vpc.id
}