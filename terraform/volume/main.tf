resource "digitalocean_volume" "default" {
  region                  = "fra1"
  name                    = "home"
  size                    = 32
  description             = "Home directories."
}
