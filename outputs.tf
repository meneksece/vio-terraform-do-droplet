# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

output "ip_address" {
  value = digitalocean_droplet.web.ipv4_address
  description = "The public IP address of your droplet application."
}