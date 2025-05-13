variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID for the domain"
  sensitive   = true
}

variable "domain" {
  type        = string
  description = "Domain for the game server"
  sensitive   = true
}

variable "dns_ip" {
  type        = string
  description = "IP of the game server"
  sensitive   = true
}
