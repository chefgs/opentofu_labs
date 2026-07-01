# Intermediate: VPC + VM

## What This Example Creates

This intermediate example shows how to use the `random` provider for a complete, self-contained VPC and VM naming/ID example that demonstrates resource dependencies.

For a real cloud example, see `aws/02-vpc-basics` combined with `aws/01-create-ec2`.

---

## Commands

```bash
cd examples/intermediate-vpc-vm
tofu init
tofu apply
tofu destroy
```

## ⚠️ Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**

For real cloud VPC + VM examples, see:
- `aws/02-vpc-basics` + `aws/01-create-ec2`
- `azure/02-virtual-network` + `azure/03-linux-vm`
- `gcp/01-vpc-network` + `gcp/02-compute-instance`
