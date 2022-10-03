output "cloudtop_hostnames" {
  description = "The hostnames as generated."
  value       = aws_route53_record.default.fqdn
}
