# Cluster Name
output "name_prefix" {
  value = "${var.name_prefix}"
}

# Network Name
output "network" {
  value = "${var.network}"
}

# Target Pool Name
output "target_pool" {
  value = "${var.target_pool}"
}

# Instances Self Link
output "instances_self_link" {
  value = "${var.instances_self_link}"
}

# DCOS Role
output "dcos_role" {
  value = "${var.dcos_role}"
}
