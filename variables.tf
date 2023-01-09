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

variable "vnic_ocid" {
  type        = string
  description = "Oracle vnic OCID"
}

variable "subnet_ocid" {
  type        = string
  description = "Oracle subnet OCID"
}

variable "fingerprint" {
  type        = string
  description = "Oracle API fingerprint"
}

variable "cloudfare_api_token" {
  type        = string
  description = "CLoudfare API token"
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
