variable "zone_id" {
  type        = string
  description = "Zone ID for the domain"
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
}
