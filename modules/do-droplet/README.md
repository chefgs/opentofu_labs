# DigitalOcean Droplet Module

## Usage

```hcl
module "web_droplet" {
  source = "../../modules/do-droplet"

  droplet_name = "my-web-server"
  region       = "nyc3"
  size         = "s-1vcpu-1gb"
  image        = "ubuntu-22-04-x64"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| droplet_name | Name of the droplet | string | - | yes |
| region | DO region slug | string | nyc3 | no |
| size | Droplet size slug | string | s-1vcpu-1gb | no |
| image | Droplet image slug | string | ubuntu-22-04-x64 | no |
| ssh_keys | List of SSH key IDs | list(string) | [] | no |
| tags | Tags to apply | list(string) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| droplet_id | The droplet ID |
| ipv4_address | The public IPv4 address |
| ipv4_address_private | The private IPv4 address |
