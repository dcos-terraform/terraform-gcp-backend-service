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
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| dcos\_role | DCOS Role | string | n/a | yes |
| instances\_self\_link | List of instance self links | list | n/a | yes |
| network | Network Name | string | n/a | yes |
| project\_id | project id | string | n/a | yes |
| region | region | string | n/a | yes |
| target\_pool | Target Pool | string | n/a | yes |
| allow\_ports | ports to allow | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| dcos\_role | DCOS Role |
| instances\_self\_link | List of instance self links |
| name\_prefix | Name Prefix |
| network | Network Name |
| target\_pool | Target Pool |

