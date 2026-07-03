# Managing Kubernetes Workloads with OpenTofu

## Overview

OpenTofu can manage Kubernetes-related infrastructure at two levels:

1. The **cluster platform** itself, such as networking and managed Kubernetes services
2. The **workloads inside the cluster**, such as namespaces, deployments, services, ingress, and Helm releases

This makes OpenTofu useful when you want a consistent, reviewable way to define Kubernetes environments alongside the rest of your infrastructure.

---

## When OpenTofu Is a Good Fit for Kubernetes

OpenTofu works well for Kubernetes workloads when you want to manage:

- Namespaces and environment boundaries
- Service accounts, RBAC, and access rules
- ConfigMaps and non-sensitive configuration
- Secrets references from external secret systems
- Services, ingress, and DNS dependencies
- Helm releases for platform components or applications
- Standard application deployments that should be versioned with infrastructure

It is especially useful when Kubernetes resources must stay aligned with cloud resources such as load balancers, IAM bindings, storage classes, or managed databases.

---

## When to Use Other Tools Alongside OpenTofu

OpenTofu should usually work with, not replace, your delivery tooling.

Use CI/CD, GitOps, or deployment tooling for:

- Rapid application release cycles
- Rollback-heavy application delivery
- Day-to-day image tag promotion
- Live troubleshooting operations

A practical split is:

- **OpenTofu** for cluster infrastructure, shared Kubernetes objects, and stable application definitions
- **CI/CD or GitOps** for high-frequency deployment changes

---

## Typical Workflow

### 1. Provision or connect to a cluster

First create or reference the Kubernetes cluster using cloud providers or an existing platform.

Examples:

- Amazon EKS
- Azure Kubernetes Service (AKS)
- Google Kubernetes Engine (GKE)
- A self-managed cluster with accessible kubeconfig

### 2. Configure Kubernetes and Helm providers

OpenTofu can then talk to the cluster through provider configuration.

```hcl
provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
```

### 3. Define namespaces and shared policies

Create stable cluster objects first, such as:

- Namespaces
- Resource quotas
- Network policies
- Service accounts
- RBAC bindings

```hcl
resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"
  }
}
```

### 4. Deploy workloads

For direct workload management, define deployments and services:

```hcl
resource "kubernetes_deployment" "api" {
  metadata {
    name      = "genai-api"
    namespace = kubernetes_namespace.apps.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "genai-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "genai-api"
        }
      }

      spec {
        container {
          image = "example/genai-api:1.0.0"
          name  = "api"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}
```

### 5. Use Helm for packaged applications

For common tools and packaged applications, Helm is often simpler:

```hcl
resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-system"

  create_namespace = true
}
```

### 6. Validate and apply

Use the normal OpenTofu workflow before changing cluster resources:

```bash
tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
```

---

## Recommended Practices

### Keep workload ownership clear

Decide which Kubernetes objects belong to OpenTofu and which belong to application delivery pipelines. Avoid having multiple systems compete to manage the same resources.

### Separate environments

Use separate state files, folders, or workspaces for development, staging, and production clusters or namespaces.

### Avoid hardcoding secrets

Reference secret managers or external secret mechanisms instead of storing secret values in OpenTofu configuration or state.

### Prefer modules for repeated patterns

If you deploy similar services repeatedly, wrap namespace, RBAC, service, and Helm patterns in reusable modules.

### Review plans carefully

Kubernetes changes can replace or delete resources if labels, selectors, or immutable fields change. Always inspect `tofu plan` before applying.

---

## Applying This to GenAI Workloads

For AI-related services on Kubernetes, OpenTofu can help manage:

- Inference API deployments
- Worker pods for embeddings or document processing
- Ingress and internal services
- Persistent storage dependencies
- Observability add-ons deployed with Helm
- Namespace-level separation between experimentation and production

This is a good match when you want the Kubernetes layer to stay aligned with the rest of your infrastructure defined in OpenTofu.

---

## Next Steps

- `09-genai-with-opentofu.md` — where OpenTofu fits in GenAI platforms
- `08-best-practices.md` — safe and maintainable OpenTofu usage
- `../iac-best-practices/05-modules.md` — reusable module design
