# Runbook

## Overview

This runbook provides step-by-step instructions for managing and troubleshooting the DevOps Template infrastructure and services.

---

## Deployment Process

### Staging Deployment

1. Push changes to the `staging` branch.
2. Monitor the CI/CD pipeline in GitHub Actions.
3. Verify the deployment:
   ```bash
   kubectl get pods -n staging