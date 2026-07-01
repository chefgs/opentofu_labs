output "bucket_name" {
  description = "The bucket name"
  value       = google_storage_bucket.example.name
}

output "bucket_url" {
  description = "The bucket URL"
  value       = google_storage_bucket.example.url
}
