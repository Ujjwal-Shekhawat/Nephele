output "instance-public-ip" {
  value = oci_core_instance.compute_instance.public_ip
}

output "oci_image_name" {
  value = data.oci_core_images.ubuntu.images[0].id
}
