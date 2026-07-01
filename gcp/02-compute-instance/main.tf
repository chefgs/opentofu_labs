# GCP Compute Instance example

resource "google_compute_instance" "example" {
  name         = "${var.project_name}-${var.environment}-instance"
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network = "default"

    # Ephemeral public IP
    access_config {}
  }

  labels = {
    environment = var.environment
    managed-by  = "opentofu"
  }
}
