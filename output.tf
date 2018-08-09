# Cluster Name
output "cluster_name" {
  value = "${var.cluster_name}"
}

# Target Self Link 
output "target" {
  value = "${var.target}"
}

# Network Name
output "network" {
  value = "${var.network}"
}

# Instance Type
output "ip_addresss" {
  value = "${var.ip_addresss}"
}

# Instances Self Link
output "instances_self_link" {
  value = "${var.instances_self_link}"
}

# DCOS Role
output "dcos_role" {
  value = "${var.dcos_role}"
}
