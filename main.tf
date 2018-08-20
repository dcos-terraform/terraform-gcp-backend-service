provider "google" {}

resource "google_compute_firewall" "node-internal" {
  name    = "${var.name_prefix}-${var.dcos_role}-internal-firewall"
  network = "${google_compute_network.default.name}"

  allow {
    protocol = "tcp"
    ports    = ["5050", "2181", "8181", "8080"]
  }

  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_region_backend_service" "internal-node-region-service" {
  name             = "${var.name_prefix}-${var.dcos_role}-internal-backend-service"
  protocol         = "TCP"
  timeout_sec      = 10
  session_affinity = "NONE"

  backend {
    group = "${google_compute_instance_group.node.self_link}"
  }

  health_checks = ["${google_compute_health_check.node-healthcheck.self_link}"]
}

# Used for the internal load balancer. The external load balancer only supports google_compute_http_health_check resource.
resource "google_compute_health_check" "node-healthcheck" {
  name                = "${var.name_prefix}-mesos-${var.dcos_role}-healthcheck"
  check_interval_sec  = 30
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = "5050"
  }
}

resource "google_compute_forwarding_rule" "internal-node-forwarding-rule" {
  name                  = "${var.name_prefix}-${var.dcos_role}-internal-lb-forwarding-rule"
  load_balancing_scheme = "INTERNAL"
  backend_service       = "${google_compute_region_backend_service.internal-node-region-service.self_link}"
  ports                 = ["5050", "2181", "8181", "8080"]
  subnetwork            = "${google_compute_subnetwork.private.self_link}"
}
