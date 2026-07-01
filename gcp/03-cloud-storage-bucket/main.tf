# GCP Cloud Storage bucket with best practices

resource "google_storage_bucket" "example" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project_id
  force_destroy = true

  # Enable versioning
  versioning {
    enabled = true
  }

  # Prevent public access
  public_access_prevention = "enforced"

  # Uniform bucket-level access (recommended)
  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
    managed-by  = "opentofu"
  }
}
