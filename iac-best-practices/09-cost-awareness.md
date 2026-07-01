# Cost-Aware Infrastructure Design

---

## 1. Always Destroy Tutorial Resources

This is the most important cost tip for learners:

```bash
# After every tutorial, run:
tofu destroy
```

Even a single forgotten EC2 instance can cost **$8-50/month**.

---

## 2. Use Free-Tier Resources in Tutorials

| Cloud | Free-Tier Resource |
|-------|--------------------|
| AWS | t2.micro, t3.micro (750 hrs/month) |
| Azure | Standard_B1s (750 hrs/month) |
| GCP | e2-micro (1 instance/month) |
| DigitalOcean | No permanent free tier, but $200 credit for new accounts |

---

## 3. Set Billing Alerts

Always set up billing alerts before using cloud accounts:

- **AWS**: AWS Cost Explorer, Budgets
- **Azure**: Azure Cost Management + Billing
- **GCP**: Cloud Billing alerts
- **DigitalOcean**: Billing alerts in Settings

---

## 4. Cost Estimate with `infracost`

[infracost](https://www.infracost.io/) shows cost estimates for your Terraform/OpenTofu plans:

```bash
# Install
brew install infracost

# Get cost breakdown
infracost breakdown --path .

# Show diff from last run
infracost diff --path .
```

---

## 5. Use `tofu plan` to Review Before Applying

Always review the plan before applying:

```bash
tofu plan
```

Look for:
- Unexpected resource creation
- Expensive resource types (e.g., NAT Gateways, large RDS instances)
- Resources that will be destroyed and recreated

---

## 6. Cost-Conscious Resource Choices

| Instead of | Use for tutorials |
|-----------|------------------|
| Large EC2 instances | t2.micro / t3.micro |
| Multi-AZ RDS | Single-AZ dev RDS |
| NAT Gateway ($0.045/hr) | NAT Instance or no NAT |
| Premium SSD storage | Standard SSD |
| Premium DNS zones | Free DNS tier |

---

## 7. Auto-Shutdown for Dev Resources

Consider adding auto-shutdown for development instances:

```hcl
# AWS Instance Scheduler (AWS managed service)
# Or use EventBridge rules to stop instances outside business hours
```
