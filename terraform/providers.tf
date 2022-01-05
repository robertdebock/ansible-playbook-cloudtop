# cloudflare
# variable "cloudflare_api_token" {}

provider "cloudflare" {
}

# digitalocean
variable "do_token" {
  description = "The Digital Ocean token."
  type        = string
}

provider "digitalocean" {
  token = var.do_token
}
