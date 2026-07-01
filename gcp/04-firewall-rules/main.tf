# GCP Firewall rules example

# Allow SSH from a specific source range
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.project_name}-${var.environment}-allow-ssh"
  network = var.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Restrict to a specific source range in production
  source_ranges = [var.allowed_ssh_cidr]
  target_tags   = ["ssh-server"]
}

# Allow HTTP and HTTPS
resource "google_compute_firewall" "allow_http_https" {
  name    = "${var.project_name}-${var.environment}-allow-web"
  network = var.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

# Allow internal traffic
resource "google_compute_firewall" "allow_internal" {
  name    = "${var.project_name}-${var.environment}-allow-internal"
  network = var.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [var.internal_cidr]
}
