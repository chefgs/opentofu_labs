# Reusable DigitalOcean Droplet module

resource "digitalocean_droplet" "this" {
  name   = var.droplet_name
  region = var.region
  size   = var.size
  image  = var.image

  # Optional: attach SSH keys for access
  ssh_keys = var.ssh_keys

  # Enable private networking
  ipv6 = false

  tags = concat(["managed-by:opentofu"], var.tags)
}
