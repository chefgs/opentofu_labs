# DigitalOcean VPC example

resource "digitalocean_vpc" "example" {
  name     = "${var.project_name}-${var.environment}-vpc"
  region   = var.region
  ip_range = var.ip_range
}
