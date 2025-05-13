variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID for the domain"
  sensitive   = true
}

variable "domain" {
  type        = string
  description = "Full hostname (e.g. tunnel.example.com)"
  sensitive   = true
}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID"
  sensitive   = true
}

variable "tunnel_name" {
  type        = string
  description = "Cloudflare Tunnel name for Grafana Dashboard"
}

variable "service_url" {
  type        = string
  description = "URL of the Grafana Dashboard from the perspective of the Cloudflare Tunnel container"
}
