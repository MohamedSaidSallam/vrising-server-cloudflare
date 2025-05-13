terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

resource "cloudflare_dns_record" "vrising" {
  zone_id = var.zone_id
  content = var.dns_ip
  name    = var.domain
  proxied = false
  ttl     = 1
  type    = "A"
}
