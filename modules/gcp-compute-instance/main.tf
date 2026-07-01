# Reusable GCP Compute Instance module

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    # Create an ephemeral public IP if requested
    dynamic "access_config" {
      for_each = var.create_public_ip ? [1] : []
      content {
        # Ephemeral public IP
      }
    }
  }

  labels = merge(
    {
      managed-by  = "opentofu"
      environment = var.environment
    },
    var.additional_labels
  )

  metadata = var.metadata
}
