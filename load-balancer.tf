resource "hcloud_load_balancer" "default" {
  name               = "Default-Load-Balancer"
  load_balancer_type = "lb11"
  location           = "hel1"
}

resource "hcloud_load_balancer_network" "lb" {
  depends_on = [
    hcloud_network_subnet.lb
  ]

  load_balancer_id = hcloud_load_balancer.default.id
  network_id       = hcloud_network.default.id
  ip               = "10.0.1.5"
}

resource "hcloud_load_balancer_service" "default" {
  load_balancer_id = hcloud_load_balancer.default.id
  protocol         = "http"

  health_check {
    protocol = "http"
    port     = 80
    interval = 10
    timeout  = 5
  }
}

resource "hcloud_load_balancer_target" "default" {
  type             = "server"
  load_balancer_id = hcloud_load_balancer.default.id
  server_id        = hcloud_server.lamp.id
  use_private_ip   = true
}
