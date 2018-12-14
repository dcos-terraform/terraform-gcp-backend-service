[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-backend-service/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-backend-service/job/master/)
# GCP Backend Service

Used to create the Internal Load Balancer for DC/OS on GCP

## EXAMPLE

```hcl
module "dcos-backend-service" {
  source  = "dcos-terraform/backend-service/gcp"
  version = "~> 0.1.0"

  dcos_role = "master"
  project_id = "myid"
  region = "us-west1"
  network = "network_self_link"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow_ports | ports to allow | list | `<list>` | no |
| cluster_name | Name of the DC/OS cluster | string | - | yes |
| dcos_role | DCOS Role | string | - | yes |
| instances_self_link | List of instance self links | list | - | yes |
| network | Network Name | string | - | yes |
| project_id | project id | string | - | yes |
| region | region | string | - | yes |
| target_pool | Target Pool | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| dcos_role | DCOS Role |
| instances_self_link | List of instance self links |
| name_prefix | Cluster Name |
| network | Network Name |
| target_pool | Target Pool |

