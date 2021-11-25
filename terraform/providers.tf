# cloudflare
# variable "cloudflare_api_token" {}

provider "cloudflare" {
}

# digitalocean
variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}
