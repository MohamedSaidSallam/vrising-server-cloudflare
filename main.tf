terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }

  cloud {
    organization = "MohamedSaidSallam"

    workspaces {
      project = "vrising"
      name="prd"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

module "game" {
  source  = "./game"
  zone_id = var.zone_id
  domain  = var.game_domain
  dns_ip  = var.game_dns_ip

  providers = {
    cloudflare = cloudflare
  }
}

module "grafana" {
  source      = "./grafana"
  enable_dns = var.enable_dns
  enable_tunnel = var.enable_tunnel
  zone_id     = var.zone_id
  domain      = var.grafana_domain
  dns_ip      = var.grafana_dns_ip
  account_id  = var.account_id
  tunnel_name = var.grafana_tunnel_name
  service_url = var.grafana_service_url

  providers = {
    cloudflare = cloudflare
  }
}
