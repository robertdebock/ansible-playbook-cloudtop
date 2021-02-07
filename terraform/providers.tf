# cloudflare
variable "cloudflare_api_token" {}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# digitalocean
variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}
