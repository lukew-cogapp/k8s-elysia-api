# GitHub Actions Setup for Container Publishing

If you encounter permission errors like `denied: permission_denied: write_package` when pushing to GitHub Container Registry, follow these steps:

## Update Repository Workflow Permissions

1. Go to your GitHub repository → Settings → Actions → General
2. Scroll down to "Workflow permissions"
3. Select "Read and write permissions"
4. Save the changes

![Workflow Permissions](https://docs.github.com/assets/cb-104295/mw-1440/images/help/actions/workflow-settings-repo-permissions.webp)

## Check Package Access Settings

1. Go to your repository → Settings → Packages
2. Ensure "GitHub Actions" is allowed to create and publish packages

## Using a Personal Access Token (alternative method)

If the above steps don't resolve the issue, create a Personal Access Token:

1. Go to your GitHub account → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate a new token with the `write:packages` scope
3. Copy the token
4. In your repository, go to Settings → Secrets and variables → Actions
5. Create a new repository secret named `CR_PAT` with the token as its value
6. Update your workflow file to use the token:

```yaml
- name: Log in to GitHub Container Registry
  uses: docker/login-action@v2
  with:
    registry: ghcr.io
    username: ${{ github.actor }}
    password: ${{ secrets.CR_PAT }} # Use PAT instead of GITHUB_TOKEN
```

7. Commit the changes and run the workflow again
