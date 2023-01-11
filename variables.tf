variable "user_ocid" {
  type        = string
  description = "Oracle User OCID"
}

variable "tenancy_ocid" {
  type        = string
  description = "Oracle Tenency OCID"
}

variable "compartment_ocid" {
  type        = string
  description = "Oracle Compartment OCID"
}

variable "fingerprint" {
  type        = string
  description = "Oracle API fingerprint"
}

variable "cloudfare_api_token" {
  type        = string
  description = "CLoudfare API token"
}

variable "wg_easy_password" {
  type        = string
  description = "Wireguard password"
}
variable "oci_private_key_path" {
  type        = string
  description = "Path to the oci private key"
}

variable "region" {
  type        = string
  description = "Oracle cloud region"
}

variable "instance_shape" {
  type        = string
  description = "Oracle instance shape"
}

variable "image_ocid" {
  type        = string
  description = "Oracle image OCID"
}

variable "selected_AD" {
  type        = string
  description = "Selected avaliblaty domain"
}

variable "ssh_public_key" {
  type        = string
  description = "Path to the private key used later for ssh connection"
}

variable "default_user" {
  type        = string
  description = "Name of the defautl user"
}

variable "default_user_gecos" {
  type        = string
  description = "Default user gecos"
}

variable "cloudfare_domain_name" {
  type        = string
  description = "Cloudfare domain name"
}

variable "scripts_path" {
  type        = string
  description = "Path on instance where all scripts will be written"
}

variable "compose_scripts_path" {
  type        = string
  description = "Path on instance where all docker compose files will be written"
}

variable "oci_cidr_blocks" {
  type        = string
  description = "CIDR blocks"
}
variable "oci_vcn_dns_label" {
  type        = string
  description = "oci vcn dns label"
}

variable "oci_vcn_display_name" {
  type        = string
  description = "oci vcn display name"
}

variable "oci_internet_gateway_display_name" {
  type        = string
  description = "oci internet gateway display name"
}

variable "oci_route_table_display_name" {
  type        = string
  description = "oci route table display name"
}

variable "oci_route_tables_description" {
  type        = string
  description = "oci route table description"
}

variable "oci_subnet_display_name" {
  type        = string
  description = "oci subnet display name"
}

variable "oci_security_list_display_name" {
  type        = string
  description = "oci security list display name"
}

variable "oci_subnet_cidr_block" {
  type        = string
  description = "oci subnet CIDR block"
}
