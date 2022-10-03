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
  image  = var.dropletimage
  name   = "${var.dropletimage}-${var.projectname}.${var.domain}"
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

data "aws_route53_zone" "default" {
  name = var.domain
}

resource "aws_route53_record" "default" {
  zone_id = data.aws_route53_zone.default.zone_id
  name    = "${var.projectname}"
  records = [digitalocean_droplet.default.ipv4_address]
  type    = "A"
  ttl     = 300
}
