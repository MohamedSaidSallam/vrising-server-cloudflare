terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "grafana_tunnel" {
  account_id = var.account_id
  name       = var.tunnel_name
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "grafana_tunnel_token" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.grafana_tunnel.id
}

resource "cloudflare_dns_record" "grafana_dns" {
  zone_id = var.zone_id
  name    = var.domain
  content = "${cloudflare_zero_trust_tunnel_cloudflared.grafana_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "grafana_tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.grafana_tunnel.id
  account_id = var.account_id

  config = {
    ingress = [
      {
        hostname = var.domain
        service  = var.service_url
      },
      {
        service = "http_status:404"
      }
    ]
  }
}


