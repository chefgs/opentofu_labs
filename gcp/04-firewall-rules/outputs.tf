output "ssh_firewall_id" {
  description = "SSH firewall rule ID"
  value       = google_compute_firewall.allow_ssh.id
}

output "web_firewall_id" {
  description = "Web firewall rule ID"
  value       = google_compute_firewall.allow_http_https.id
}
