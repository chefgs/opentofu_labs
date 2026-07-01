# GCP instance with module example

module "web_instance" {
  source = "../../modules/gcp-compute-instance"

  instance_name    = "${var.project_name}-${var.environment}-web"
  project_id       = var.project_id
  zone             = var.zone
  machine_type     = var.machine_type
  network          = "default"
  create_public_ip = true
  environment      = var.environment
}
