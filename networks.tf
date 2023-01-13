resource "oci_core_vcn" "nephele_vcn" {
  cidr_blocks    = [var.oci_cidr_blocks]
  dns_label      = var.oci_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.oci_vcn_display_name
}

resource "oci_core_internet_gateway" "nephele_internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.nephele_vcn.id
  enabled        = true
  display_name   = var.oci_internet_gateway_display_name
}

resource "oci_core_route_table" "nephele_vcn_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.nephele_vcn.id
  display_name   = var.oci_route_table_display_name
  route_rules {
    network_entity_id = oci_core_internet_gateway.nephele_internet_gateway.id
    description       = var.oci_route_tables_description
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "nephele_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.nephele_vcn.id
  display_name   = var.oci_security_list_display_name

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
    description = "Allow Outbound traffic without any restrictions"
    stateless   = false
  }

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    description = "TCP SSH Traffic from anywhere"
    stateless   = false
    tcp_options {
      max = 22
      min = 22
    }
  }

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    description = "TCP HTTP traffic from anywhere"
    stateless   = false
    tcp_options {
      max = 80
      min = 80
    }
  }

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    description = "TCP HTTPS traffic from anywhere"
    stateless   = false
    tcp_options {
      max = 443
      min = 443
    }
  }

  ingress_security_rules {
    protocol    = 17
    source      = "0.0.0.0/0"
    description = "UDP Wireguard traffic from anywhere"
    stateless   = false
    udp_options {
      max = 51820
      min = 51820
    }
  }

  ingress_security_rules {
    protocol    = 17
    source      = "0.0.0.0/0"
    description = "UDP Minecraft traffic from anywhere"
    stateless   = false
    udp_options {
      max = 25565
      min = 25565
    }
  }

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    description = "TCP Minecraft traffic from anywhere"
    stateless   = false
    tcp_options {
      max = 25565
      min = 25565
    }
  }

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    description = "TCP Minecraft RCON traffic from anywhere"
    stateless   = false
    tcp_options {
      max = 25575
      min = 25575
    }
  }
}

resource "oci_core_subnet" "nephele_public_subnet" {
  cidr_block          = var.oci_subnet_cidr_block
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_vcn.nephele_vcn.id
  availability_domain = var.selected_AD
  display_name        = var.oci_subnet_display_name
  route_table_id      = oci_core_route_table.nephele_vcn_route_table.id
  security_list_ids   = [oci_core_security_list.nephele_security_list.id]
}
