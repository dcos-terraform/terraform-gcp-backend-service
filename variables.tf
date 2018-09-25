# project id
variable "project_id" {
  description = "project id"
}

# region
variable "region" {
  description = "region"
}

# Cluster Name
variable "name_prefix" {
  description = "Cluster Name"
}

# Network Name
variable "network" {
  description = "network"
}

# Target Pool
variable "target_pool" {
  description = "target pool"
}

# Instances Self Link
variable "instances_self_link" {
  description = "List of instance self links"
  type = "list"
}

# ports to allow
variable "allow_ports" {
  description = "allow ports"
  type    = "list"
  default = ["5050", "2181", "8181", "8080"]
}

# DCOS Role
variable "dcos_role" {
  description = "dcos role"
}
