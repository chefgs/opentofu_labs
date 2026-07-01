# DigitalOcean Droplet with module example

module "web_droplet" {
  source = "../../modules/do-droplet"

  droplet_name = "${var.project_name}-${var.environment}-web"
  region       = var.region
  size         = var.droplet_size
  image        = var.image

  tags = [var.environment, "web"]
}
