# Multicloud Basic VM

## What This Example Shows

This example demonstrates the concept of multi-cloud infrastructure. It shows how similar naming patterns and resource structures are used across different cloud providers.

For actual multi-cloud resource creation, run the individual examples:

- `aws/01-create-ec2` — AWS EC2 instance
- `azure/03-linux-vm` — Azure Linux VM
- `gcp/02-compute-instance` — GCP Compute Instance
- `digitalocean/01-droplet` — DigitalOcean Droplet

---

## Multi-Cloud Philosophy

Each cloud provider has different:
- Resource types
- Naming conventions
- Networking models
- Authentication methods

But with OpenTofu, the **workflow is identical**:

```bash
# Same commands, different provider
tofu init && tofu plan && tofu apply && tofu destroy
```

---

## Cost Warning

For the individual cloud examples, see their READMEs for cost warnings. **Always run `tofu destroy` when done.**
