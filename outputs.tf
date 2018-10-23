output "name_prefix" {
  description = "Cluster Name"
  value       = "${var.cluster_name}"
}

output "network" {
  description = "Network Name"
  value       = "${var.network}"
}

output "target_pool" {
  description = "Target Pool"
  value       = "${var.target_pool}"
}

output "instances_self_link" {
  description = "List of instance self links"
  value       = "${var.instances_self_link}"
}

output "dcos_role" {
  description = "DCOS Role"
  value       = "${var.dcos_role}"
}
