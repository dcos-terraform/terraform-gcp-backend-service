variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "network" {
  description = "Network Name"
}

variable "target_pool" {
  description = "Target Pool"
}

variable "instances_self_link" {
  description = "List of instance self links"
  type        = "list"
}

variable "allow_ports" {
  description = "ports to allow"
  type        = "list"
  default     = ["5050", "2181", "8181", "8080"]
}

variable "dcos_role" {
  description = "DCOS Role"
}
