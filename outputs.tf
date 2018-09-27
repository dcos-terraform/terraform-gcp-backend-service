# Cluster Name
output "name_prefix" {
  description = "Cluster Name"
  value = "${var.name_prefix}"
}

# Network Name
output "network" {
  description = "network"
  value = "${var.network}"
}

# Target Pool Name
output "target_pool" {
  description = "target pool"
  value = "${var.target_pool}"
}

# Instances Self Link
output "instances_self_link" {
  description = "List of instance self links"
  value = "${var.instances_self_link}"
}

# DCOS Role
output "dcos_role" {
  description = "dcos role"
  value = "${var.dcos_role}"
}
