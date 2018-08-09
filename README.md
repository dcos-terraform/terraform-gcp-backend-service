# GCP Backend Service

Used to create the Internal Load Balancer for DC/OS on GCP

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_name | Cluster Name | string | - | yes |
| dcos_role | DCOS Role | string | - | yes |
| instances_self_link | Instances Self Link | string | - | yes |
| ip_addresss | Instance Type | string | - | yes |
| network | Network Name | string | - | yes |
| target | Target Self Link | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster_name | Cluster Name |
| dcos_role | DCOS Role |
| instances_self_link | Instances Self Link |
| ip_addresss | Instance Type |
| network | Network Name |
| target | Target Self Link |

