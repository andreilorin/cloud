resource "digitalocean_droplet" "andreilorin-server" {
  image = "ubuntu-18-04-x64"
  name = "andreilorin-server"
  region = "lon1"
  size = "s-1vcpu-1gb"
  monitoring = true
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      #"export PATH=$PATH:/usr/bin",
      #"sudo apt update", causing:  E: Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
      "sudo apt -y upgrade",
      "sudo ln -s /usr/bin/python3.6 /usr/bin/python" #create the soft link needed by ansible to find python
    ]
  }
}
output "public_ip" {
  value = "${digitalocean_droplet.andreilorin-server.ipv4_address}"
}