variable "projectname" {
  type        = string
  default     = "cloudtop"
  description = "The name of the project (string). Default: cloudtop"
}

variable "domain" {
  type        = string
  default     = "meinit.nl"
  description = "The domain to use. (string). Default: meinit.nl"
}
variable "projectdescription" {
  type        = string
  default     = "Roberts CloudTop."
  description = "The description of the project (string). Default: Roberts CloudTop."
}

variable "projectpurpose" {
  type        = string
  default     = "Hosting a desktop environment."
  description = "The prupose of the project (string). Default: Hosting a desktop environment."
}

variable "projectenvironment" {
  type        = string
  default     = "Production"
  description = "The environment of the project (string). Default: Production"
}

variable "region" {
  type        = string
  default     = "ams3"
  description = "The region where to deploy (string). Default: ams3"
}

variable "dropletsize" {
  type        = string
  default     = "s-8vcpu-16gb"
  description = "The size of the droplet (string). Default: s-8vcpu-16gb"
}

variable "dropletimage" {
  type        = map
  default     = {
    0 = "fedora-32-x64"
    1 = "ubuntu-16-04-x64"
    2 = "ubuntu-18-04-x64"
    3 = "ubuntu-20-04-x64"
  }
  description = "Distributions to start an instance with (map)."
}
