# CloudTop - My desktop in the cloud.

A repository to start and setup a "cloud desktop". Feature include:

- Spinning up resources in DigitalOcean.
- Exposing a DNS name using CloudFlare.
- Installing ansible, atom, molecule, gnome.

You can connect to the machine using RDP.

## Requirements

### Packages

Please install these tools:

- Ansible
- Terraform

### Variables

Please set these variables:

- TF_VAR_do_token
- TF_VAR_cloudflare_api_token

### SSH keys

Please create a directory `ssh_keys`, `cd` into that directory and either place your public key, or generate a new one. (`ssh-keygen -f id_rsa`).

The public key is used to allow access (using `root`) to the machine so Ansible can configure the instance.

### Custom values

Have a look in `terraform/terraform.tfvars` and change values to your preference.

Also have a look at `ansible/group_vars/all/users.yml` to change at least:

- `users_user_list.name`
- `users_user_list.authorized_keys`

The file `ansible/group_vars/all/git.yml` contains a list of repositories that are cloned to the instance. You may want to change values here too.
