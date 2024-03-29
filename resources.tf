resource "oci_core_instance" "compute_instance" {
  availability_domain = var.selected_AD
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape
  display_name        = "nephele"

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.nephele_public_subnet.id
  }

  source_details {
    boot_volume_size_in_gbs = 200
    source_id               = data.oci_core_images.ubuntu.images[0].id
    source_type             = "image"
  }

  shape_config {
    memory_in_gbs = 24
    ocpus         = 4
  }

  metadata = {
    user_data = base64encode(data.template_file.user_data.rendered)
  }

  preserve_boot_volume = false
}
