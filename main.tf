/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-backend-service/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-backend-service/job/master/)
 * # GCP Backend Service
 *
 * Used to create the Internal Load Balancer for DC/OS on GCP
 *
 * ## EXAMPLE
 *
 * ```hcl
 * module "dcos-backend-service" {
 *   source  = "dcos-terraform/backend-service/gcp"
 *   version = "~> 0.1.0"
 *
 *   dcos_role = "master"
 *   project_id = "myid"
 *   region = "us-west1"
 *   network = "network_self_link"
 * }
 * ```
 */

provider "google" {}

resource "google_compute_firewall" "node-internal" {
  name    = "${var.cluster_name}-${var.dcos_role}-internal-firewall"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = "${var.allow_ports}"
  }

  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_region_backend_service" "internal-node-region-service" {
  name             = "${var.cluster_name}-${var.dcos_role}-internal-backend-service"
  protocol         = "TCP"
  timeout_sec      = 10
  session_affinity = "NONE"

  backend {
    group = "${var.target_pool}"
  }

  health_checks = ["${google_compute_health_check.node-healthcheck.self_link}"]
}

# Used for the internal load balancer. The external load balancer only supports google_compute_http_health_check resource.
resource "google_compute_health_check" "node-healthcheck" {
  name                = "${var.cluster_name}-mesos-${var.dcos_role}-healthcheck"
  check_interval_sec  = 30
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = "5050"
  }
}

resource "google_compute_forwarding_rule" "internal-node-forwarding-rule" {
  name                  = "${var.cluster_name}-${var.dcos_role}-internal-lb-forwarding-rule"
  load_balancing_scheme = "INTERNAL"
  backend_service       = "${google_compute_region_backend_service.internal-node-region-service.self_link}"
  ports                 = "${var.allow_ports}"
  subnetwork            = "${var.network}"
}
