data "cloudflare_zones" "domain" {
  filter {
    name        = var.cloudflare_domain_name
    lookup_type = "exact"
  }
}

resource "cloudflare_record" "wireguard" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "wg"
  value   = oci_core_instance.compute_instance.public_ip
  type    = "A"
  ttl     = "1"
  proxied = true
}

resource "cloudflare_record" "portainer" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "portainer"
  value   = oci_core_instance.compute_instance.public_ip
  type    = "A"
  ttl     = "1"
  proxied = true
}

resource "cloudflare_record" "heimdall" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "heimdall"
  value   = oci_core_instance.compute_instance.public_ip
  type    = "A"
  ttl     = "1"
  proxied = true
}

resource "cloudflare_record" "traefik" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "traefik"
  value   = oci_core_instance.compute_instance.public_ip
  type    = "A"
  ttl     = "1"
  proxied = true
}

resource "cloudflare_record" "filemanager" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "filemanager"
  value   = oci_core_instance.compute_instance.public_ip
  type    = "A"
  ttl     = "1"
  proxied = true
}


resource "cloudflare_record" "minecraft" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "minecraft"
  value   = oci_core_instance.compute_instance.public_ip
  type    = "A"
  ttl     = "1"
  proxied = true
}

resource "cloudflare_record" "_minecraft_tcp" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "_minecraft._tcp"
  type    = "SRV"

  data {
    service  = "_minecraft"
    proto    = "_tcp"
    name     = "minecraft"
    priority = 0
    weight   = 0
    port     = 25565
    target   = "minecraft.${var.cloudflare_domain_name}"
  }
}
