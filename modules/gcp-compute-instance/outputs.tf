output "instance_id" {
  description = "The unique identifier for the instance"
  value       = google_compute_instance.this.instance_id
}

output "self_link" {
  description = "The URI of the created resource"
  value       = google_compute_instance.this.self_link
}

output "network_ip" {
  description = "The internal IP address of the instance"
  value       = google_compute_instance.this.network_interface[0].network_ip
}

output "nat_ip" {
  description = "The external/NAT IP address (if public IP was created)"
  value       = var.create_public_ip ? google_compute_instance.this.network_interface[0].access_config[0].nat_ip : null
}
