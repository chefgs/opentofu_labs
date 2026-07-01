# GCP VPC Network example

resource "google_compute_network" "example" {
  name                    = "${var.project_name}-${var.environment}-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.project_name}-${var.environment}-public-subnet"
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.example.id
  project       = var.project_id
}

resource "google_compute_subnetwork" "private" {
  name          = "${var.project_name}-${var.environment}-private-subnet"
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.example.id
  project       = var.project_id
}
