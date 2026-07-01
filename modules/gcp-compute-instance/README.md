# GCP Compute Instance Module

## Usage

```hcl
module "web_server" {
  source = "../../modules/gcp-compute-instance"

  instance_name = "my-web-server"
  project_id    = var.project_id
  zone          = "us-central1-a"
  network       = "default"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| instance_name | Name of the instance | string | - | yes |
| project_id | GCP project ID | string | - | yes |
| zone | GCP zone | string | us-central1-a | no |
| machine_type | Machine type | string | e2-micro | no |
| network | VPC network | string | default | no |
| subnetwork | Subnetwork name | string | null | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | The instance ID |
| self_link | The self link URI |
| network_ip | The internal IP |
| nat_ip | The external/NAT IP |
