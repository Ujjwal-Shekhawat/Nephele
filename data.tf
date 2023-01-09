data "template_file" "user_data" {
  template = file("./cloud-init.yaml")

  vars = {
    setup_script                  = file("./scripts/setup_script.sh")
    minecraft_server_setup_script = file("./scripts/minecraft_server_setup_script.sh")
    service_setup                 = file("./scripts/compose/service_setup.sh")
    nginx_compose                 = file("./scripts/compose/nginx_proxy_manager.yml")
    ssh_public_key                = file("~/.ssh/id_rsa.pub")
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
