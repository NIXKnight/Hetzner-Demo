resource "hcloud_server" "bastion" {
  depends_on = [
    hcloud_network_subnet.servers
  ]

  name        = "Bastion"
  server_type = "cx22"
  image       = "debian-12"

  ssh_keys = [
    hcloud_ssh_key.default.id
  ]

  network {
    network_id = hcloud_network.default.id
    ip         = "10.0.2.5"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  placement_group_id = hcloud_placement_group.default.id
}


resource "hcloud_server" "lamp" {
  depends_on = [
    hcloud_network_subnet.servers
  ]

  name        = "LAMP-Server"
  server_type = "cx22"
  image       = "lamp"

  ssh_keys = [
    hcloud_ssh_key.default.id
  ]

  network {
    network_id = hcloud_network.default.id
    ip         = "10.0.2.6"
  }

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  placement_group_id = hcloud_placement_group.default.id
}
