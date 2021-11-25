terraform {
  required_version = ">= 0.13"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.16.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "3.4.0"
    }
  }
}
