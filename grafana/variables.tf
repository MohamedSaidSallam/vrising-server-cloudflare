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

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID for the domain"
  sensitive   = true
}

variable "domain" {
  type        = string
  description = "Domain for Grafana dashboard"
  sensitive   = true
}

variable "dns_ip" {
  type        = string
  description = "IP of the Grafana server"
  sensitive   = true

  validation {
    condition     = (var.enable_dns == true && var.dns_ip != "") || var.enable_dns == false
    error_message = "Required when using `enable_tunnel`"
  }
}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID"
  sensitive   = true

  validation {
    condition     = (var.enable_tunnel == true && var.account_id != "") || var.enable_tunnel == false
    error_message = "Required when using `enable_tunnel`"
  }
}

variable "tunnel_name" {
  type        = string
  description = "Cloudflare Tunnel name for Grafana Dashboard"
  default     = "V Rising Grafana"

  validation {
    condition     = (var.enable_tunnel == true && var.tunnel_name != "") || var.enable_tunnel == false
    error_message = "Required when using `enable_tunnel`"
  }
}

variable "service_url" {
  type        = string
  description = "URL of the Grafana Dashboard from the perspective of the Cloudflare Tunnel container"

  validation {
    condition     = (var.enable_tunnel == true && var.service_url != "") || var.enable_tunnel == false
    error_message = "Required when using `enable_tunnel`"
  }
}


