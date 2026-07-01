# DigitalOcean Project example

resource "digitalocean_project" "example" {
  name        = "${var.project_name}-${var.environment}"
  description = "OpenTofu tutorial project for ${var.environment} environment"
  purpose     = "Web Application"
  environment = var.do_environment
}
