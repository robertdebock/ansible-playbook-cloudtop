variable "projectname" {
  type    = string
  default = "cloudtop"
}

variable "domain" {
  type    = string
  default = "meinit.nl"
}
variable "projectdescription" {
  type    = string
  default = "Roberts CloudTop."
}

variable "projectpurpose" {
  type    = string
  default = "Hosting a destop environment."
}

variable "projectenvironment" {
  type    = string
  default = "Production"
}

variable "region" {
  type    = string
  default = "ams3"
}

variable "dropletsize" {
  type    = string
  # default = "s-8vcpu-16gb"
  default = "4gb"
}

variable "dropletimage" {
  type    = string
  default = "fedora-32-x64"
}
