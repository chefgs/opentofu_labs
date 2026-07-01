output "instance_id" {
  description = "The instance ID"
  value       = google_compute_instance.example.instance_id
}

output "internal_ip" {
  description = "The internal IP address"
  value       = google_compute_instance.example.network_interface[0].network_ip
}

output "external_ip" {
  description = "The external/public IP address"
  value       = google_compute_instance.example.network_interface[0].access_config[0].nat_ip
}
