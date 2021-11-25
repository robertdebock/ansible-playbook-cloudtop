resource "digitalocean_volume" "default" {
  region                  = "fra1"
  name                    = "home"
  size                    = 4
  description             = "Home directories."
}
