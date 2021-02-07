terraform {
  required_version = ">= 0.13"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.4.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.18.0"
    }
  }
}
