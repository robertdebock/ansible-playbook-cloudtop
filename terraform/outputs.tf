output "cloudtop_ip" {
  value = digitalocean_droplet.default.ipv4_address
}

output "cloudtop_hostname" {
  value = cloudflare_record.default.hostname
}
