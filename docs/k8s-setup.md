# Kubernetes Setup

## Create GitHub Container Registry Secret

Create a Personal Access Token (PAT) in GitHub with the `read:packages` scope.

Then create a Kubernetes secret with your GitHub credentials:

```bash
kubectl create secret docker-registry ghcr-creds \
  --docker-server=ghcr.io \
  --docker-username=YOUR_GITHUB_USERNAME \
  --docker-password=YOUR_GITHUB_PAT \
  --docker-email=YOUR_EMAIL@example.com \
  --namespace=default
```

## Flux Configuration

If you're using Flux, make sure your HelmRelease is configured to use the latest image:

```yaml
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: elysia-api
  namespace: default
spec:
  interval: 5m
  chart:
    spec:
      chart: charts/elysia-api
      version: "0.1.0"
      sourceRef:
        kind: GitRepository
        name: elysia-api
        namespace: flux-system
  values:
    image:
      tag: main # This will use the 'main' branch tag
```

## Manual Deployment

If you want to deploy manually:

```bash
helm upgrade --install elysia-api ./charts/elysia-api
```
