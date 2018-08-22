# project id
variable "project_id" {}

# region
variable "region" {}

# Cluster Name
variable "name_prefix" {}

# Network Name
variable "network" {}

# Target Pool
variable "target_pool" {}

# Instances Self Link
variable "instances_self_link" {
  type = "list"
}

# ports to allow
variable "allow_ports" {
  type    = "list"
  default = ["5050", "2181", "8181", "8080"]
}

# DCOS Role
variable "dcos_role" {}
