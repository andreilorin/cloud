variable "do_token" {
  type = string
}
variable "pub_key" {
  type = string
}
variable "key_name" {
  type = string
}
variable "domain_name" {
  type = string
}
variable "server_name" {
  type = string
  default = "test-server"
}

provider "digitalocean" {
  token = var.do_token
  version = "1.22.2"
}