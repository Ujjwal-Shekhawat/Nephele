terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.102.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.31.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.oci_private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
}

provider "cloudflare" {
  api_token = var.cloudfare_api_token
}
