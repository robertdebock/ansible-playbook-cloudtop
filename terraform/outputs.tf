output "cloudtop_hostnames" {
  description = "The hostnames as generated."
  value       = cloudflare_record.default.*.hostname
}
