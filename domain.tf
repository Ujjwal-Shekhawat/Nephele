data "cloudflare_zones" "domain" {
  filter {
    name        = var.cloudfare_domain_name
    lookup_type = "exact"
  }
}

resource "cloudflare_record" "proxy_manager" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "proxy"
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
