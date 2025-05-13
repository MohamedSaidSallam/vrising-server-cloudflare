terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

resource "null_resource" "flow_validation" {
  lifecycle {
    precondition {
      condition = (
        (var.enable_dns ? 1 : 0) +
        (var.enable_tunnel ? 1 : 0)
      ) == 1
      error_message = "one (and only one) of `enable_dns` or `enable_tunnel` should be true"
    }
  }
}

module "dns" {
  source = "./dns"

  count = var.enable_dns ? 1 : 0

  zone_id = var.zone_id
  domain  = var.domain
  dns_ip  = var.dns_ip

  providers = {
    cloudflare = cloudflare
  }
}

module "tunnel" {
  source = "./tunnel"

  count = var.enable_tunnel ? 1 : 0

  zone_id     = var.zone_id
  domain      = var.domain
  account_id  = var.account_id
  tunnel_name = var.tunnel_name
  service_url = var.service_url

  providers = {
    cloudflare = cloudflare
  }
}
