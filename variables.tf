variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
  sensitive   = true
}

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID"
  sensitive   = true
}

variable "game_domain" {
  type        = string
  description = "Domain for the game server"
  sensitive   = true
}

variable "game_dns_ip" {
  type        = string
  description = "IP of the game server"
  sensitive   = true
}

variable "enable_dns" {
  type        = bool
  description = "Enable DNS entry creation flow"
  default     = true
}

variable "enable_tunnel" {
  type        = bool
  description = "Enable Cloudflare Tunnel creation flow"
  default     = false
}

variable "grafana_domain" {
  type        = string
  description = "Domain for Grafana dashboard"
  sensitive   = true
}

variable "grafana_dns_ip" {
  type        = string
  description = "IP of the Grafana server"
  sensitive   = true
  default     = ""
}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID"
  sensitive   = true
  default     = ""
}

variable "grafana_tunnel_name" {
  type        = string
  description = "Cloudflare Tunnel name for Grafana Dashboard"
  default     = "V Rising Grafana"
}

variable "grafana_service_url" {
  type        = string
  description = "URL of the Grafana Dashboard from the perspective of the Cloudflare Tunnel container"
  default     = ""
}
