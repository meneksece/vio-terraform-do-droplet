terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_ssh_key" "web" {
  name       = "webapp ssh key"
  public_key = file("${path.module}/files/id_rsa.pub")
}

# Create a new Web Droplet in the nyc2 region

resource "digitalocean_droplet" "web" {
  image      = "centos-7-x64"
  name       = "web-test"
  region     = "lon1"
  size       = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys = [
    digitalocean_ssh_key.web.id
  ]
  user_data = file("${path.module}/files/userdata.sh")
}