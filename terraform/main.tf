resource "digitalocean_project" "default" {
  name        = var.projectname
  description = var.projectdescription
  purpose     = var.projectpurpose
  environment = var.projectenvironment
}

resource "digitalocean_project_resources" "default" {
  project = digitalocean_project.default.id
  resources = digitalocean_droplet.default.*.urn
}

resource "digitalocean_ssh_key" "default" {
  name       = "default"
  public_key = file("../ssh_keys/id_rsa.pub")
}

resource "digitalocean_droplet" "default" {
  count  = length(var.dropletimage)
  image  = var.dropletimage[count.index]
  name   = "${var.dropletimage[count.index]}-${var.projectname}.${var.domain}"
  region = var.region
  size   = var.dropletsize
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_firewall" "default" {
  name = "firewall-${var.projectname}"
  droplet_ids = digitalocean_droplet.default.*.id
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "3389"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

data "cloudflare_zones" "default" {
  filter {
    name = var.domain
  }
}

resource "cloudflare_record" "default" {
  count  = length(var.dropletimage)
  zone_id = data.cloudflare_zones.default.zones[0].id
  name    = "${var.dropletimage[count.index]}-${var.projectname}"
  value   = digitalocean_droplet.default[count.index].ipv4_address
  type    = "A"
  ttl     = 1
  proxied = false
}
