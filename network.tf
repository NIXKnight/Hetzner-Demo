resource "hcloud_network" "default" {
  name     = "Default-Net"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "lb" {
  network_id   = hcloud_network.default.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_network_subnet" "servers" {
  network_id   = hcloud_network.default.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.2.0/24"
}
