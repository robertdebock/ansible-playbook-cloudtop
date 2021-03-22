resource "digitalocean_volume" "default" {
  region                  = "fra1"
  name                    = "home"
  size                    = 128
  description             = "Home directories."
}
