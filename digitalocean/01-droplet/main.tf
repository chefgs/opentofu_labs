# DigitalOcean Droplet example

resource "digitalocean_droplet" "example" {
  name   = "${var.project_name}-${var.environment}-droplet"
  region = var.region
  size   = var.droplet_size
  image  = var.image

  # Optional: attach SSH keys for access
  # ssh_keys = [var.ssh_key_fingerprint]

  tags = ["opentofu", var.environment, var.project_name]
}
