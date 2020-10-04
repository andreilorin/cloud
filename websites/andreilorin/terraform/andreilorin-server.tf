resource "digitalocean_domain" "domain" {
  name = var.domain_name
  ip_address = digitalocean_droplet.andreilorin-server.ipv4_address
}

resource "digitalocean_record" "record" {
  domain = digitalocean_domain.domain.name
  name = "@"
  type = "A"
  value = digitalocean_droplet.andreilorin-server.ipv4_address
}

resource "digitalocean_ssh_key" "ssh_key" {
  name       = var.key_name
  public_key = file(var.pub_key)
}

resource "digitalocean_droplet" "andreilorin-server" {
  image = "ubuntu-18-04-x64"
  name = var.server_name
  region = "lon1"
  size = "s-1vcpu-1gb"
  monitoring = true
  private_networking = false
  ssh_keys = [ digitalocean_ssh_key.ssh_key.fingerprint ]
}

output "public_ip" {
  value = digitalocean_droplet.andreilorin-server.ipv4_address
}