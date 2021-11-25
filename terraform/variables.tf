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
  default     = "s-4vcpu-8gb"
  description = "The size of the droplet (string). Default: s-4vcpu-8gb"
}

variable "dropletimage" {
  type        = string
  default     = "fedora-35-x64"
  description = "Distributions to start an instance with (map)."
}

variable "volume" {
  type    = string
  default = "home"
  description = "The name of an existing volume to mount under /home."
}
