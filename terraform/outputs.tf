output "cloudtop_hostnames" {
  value = cloudflare_record.default.*.hostname
}
