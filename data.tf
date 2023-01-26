data "template_file" "user_data" {
  template = file("./cloud-init.yaml")

  vars = {
    setup_script                  = file("./scripts/setup_script.sh")
    minecraft_server_setup_script = file("./scripts/minecraft_server_setup_script.sh")
    service_setup                 = file("./scripts/compose/service_setup.sh")
    nginx_compose                 = file("./scripts/compose/docker-compose.yml")
    ssh_public_key                = file(var.ssh_public_key)
    cloudflare_api_token          = var.cloudflare_api_token
    domain_name                   = var.cloudflare_domain_name
    email                         = var.cloudflare_email
    wg_easy_password              = var.wg_easy_password
    default_user                  = var.default_user
    default_user_group            = var.default_user
    default_user_gecos            = var.default_user_gecos
    scripts_path                  = var.scripts_path
    compose_scripts_path          = var.compose_scripts_path
  }
}

data "oci_identity_availability_domains" "test_availability_domains" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "ubuntu" {
  compartment_id           = var.tenancy_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  state                    = "AVAILABLE"
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}
