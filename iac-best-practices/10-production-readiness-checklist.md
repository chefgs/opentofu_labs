# Production Readiness Checklist

Use this checklist before promoting any OpenTofu configuration to production.

---

## Infrastructure Code

- [ ] All `.tf` files pass `tofu fmt -check -recursive`
- [ ] All directories pass `tofu validate`
- [ ] Provider versions are pinned in `required_providers`
- [ ] OpenTofu version is constrained in `required_version`
- [ ] `.terraform.lock.hcl` is committed
- [ ] No hardcoded credentials, account IDs, or secrets
- [ ] All sensitive variables marked `sensitive = true`
- [ ] All resources have appropriate tags/labels
- [ ] Variable validation added for critical inputs
- [ ] Outputs documented with `description`

---

## State Management

- [ ] Remote backend configured (S3, GCS, Azure Blob, etc.)
- [ ] State encryption enabled
- [ ] State locking configured (DynamoDB, GCS lock, etc.)
- [ ] State bucket versioning enabled
- [ ] State access restricted to authorized principals only
- [ ] State backup/recovery process documented
- [ ] Separate state per environment (dev/staging/prod)

---

## Security

- [ ] Security scanning run (Checkov, tfsec, or Trivy) — no critical issues
- [ ] All resources follow least-privilege principle
- [ ] No public access to sensitive resources (S3 buckets, databases)
- [ ] Encryption at rest enabled for all storage
- [ ] Network security groups/rules reviewed
- [ ] No SSH/RDP open to `0.0.0.0/0` in production
- [ ] IAM roles used instead of long-lived access keys
- [ ] Secrets retrieved from secrets manager, not variables

---

## CI/CD

- [ ] CI pipeline runs `tofu fmt -check` on every PR
- [ ] CI pipeline runs `tofu validate` on every PR
- [ ] CI pipeline runs security scanning on every PR
- [ ] `tofu plan` output reviewed before applying
- [ ] Production apply requires manual approval
- [ ] CI uses OIDC/role-based auth (no static credentials in CI)
- [ ] Plan artifacts saved for audit trail

---

## Documentation

- [ ] `README.md` explains what is created and how to run it
- [ ] Cost estimates documented
- [ ] Runbook for common operations documented
- [ ] Rollback procedure documented
- [ ] On-call escalation path documented

---

## Testing

- [ ] Plan reviewed against expected changes
- [ ] Non-production environment deployed and verified first
- [ ] Rollback tested in non-production
- [ ] Monitoring and alerting in place
- [ ] Cost alerts configured

---

## Go/No-Go Decision

Only proceed to production apply if **all items above are checked**.

If any item is unchecked, document the exception and get sign-off before proceeding.
