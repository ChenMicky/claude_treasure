# GitHub Pages Deployment Guide

## 🔐 GitHub Authentication

To deploy to GitHub Pages, you need to authenticate with GitHub. Here are the methods:

### Method 1: Personal Access Token (Classic)
1. Go to **Settings** → **Developer settings** → **Personal access tokens**
2. Click **Generate new token** (classic)
3. Select scopes:
   - `repo` (full control of private repositories)
   - `workflow` (to manage GitHub Actions)
4. Generate and copy the token (you won't see it again)
5. Store it securely or use it in your deployment process

### Method 2: Fine-Grained Personal Access Token (Recommended)
1. Go to **Settings** → **Security** → **API access** → **Fine-grained tokens**
2. Click **Generate new token**
3. Configure:
   - **Repository access**: Select specific repositories
   - **Repository permissions**:
     - `Contents`: Read and write
     - `Pages`: Read and write
     - `Actions`: Read and write (if using GitHub Actions)
4. Generate and copy the token

### Method 3: OAuth App
For applications, you can register an OAuth App:
1. Go to **Settings** → **Developer settings** → **OAuth Apps**
2. Click **New OAuth App**
3. Configure with appropriate redirects and permissions
4. Use the client ID and secret for authentication

## 📁 Repository Access

### Required Repository Permissions
When deploying to GitHub Pages, ensure your token or account has:
- **Read/Write** access to the repository
- **Pages** permission enabled
- **Contents** permission enabled (for commit pushes)

### Repository Settings
1. Go to your repository → **Settings** → **Pages**
2. Configure the source:
   - **Branch**: Select the branch (e.g., `main`, `gh-pages`, or a folder)
   - **Folder**: Usually `/ (root)` or `/docs`
3. Save and wait for the first deployment

### Collaboration Access
- For team deployments, add collaborators with appropriate permissions:
  - **Write** permission for deployers
  - **Admin** permission for repository owners
- Use GitHub Teams to manage access at scale

## 🛣️ Vite Base Path Configuration for GitHub Pages

GitHub Pages serves your site at `https://<username>.github.io/<repository-name>/` or a custom domain.

### Configure Vite Base Path

In your `vite.config.ts`, set the `base` option:

```ts
// vite.config.ts
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  base: '/claude_code_treasure_game/', // Match your repository name
});
```

Or in `vercel.ts`:
```ts
import { routes, deploymentEnv, type VercelConfig } from '@vercel/config/v1';

export const config: VercelConfig = {
  // ... other config
  // Vercel handles base path automatically
};
```

### Environment-Specific Base Path

For different deployment environments, use environment variables:

```ts
// vite.config.ts
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  base: import.meta.env.BASE_PATH || '/',
});
```

Then set the environment variable:
- Local development: `BASE_PATH=/`
- GitHub Pages: `BASE_PATH=/claude_code_treasure_game/`

### HTML Base Tag (Alternative)

Alternatively, you can use the HTML `<base>` tag in your `index.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <base href="%BASE_PATH%">
  <!-- other head content -->
</head>
<body>
  <!-- app content -->
</body>
</html>
```

Then inject the base path during build:
```bash
BASE_PATH=/claude_code_treasure_game/ vite build
```

## 🚀 Deployment Process

### Option 1: Direct GitHub Pages Deployment
1. Build your project: `npm run build`
2. Deploy using a tool like:
   - `gh-pages` package
   - GitHub Actions workflow
   - Vercel (recommended)

### Option 2: Using Vercel (Recommended)
1. Connect your GitHub repository to Vercel
2. Vercel automatically detects the framework and configures the base path
3. Deploy with `vercel` CLI or through the dashboard
4. Preview deployments are automatically configured

## 🔧 Troubleshooting

### Common Issues

**Issue: Assets not loading on GitHub Pages**
- **Solution**: Ensure the `base` path matches your repository name exactly
- Check that all asset paths are relative or use the base path

**Issue: Routing problems (404 on refresh)**
- **Solution**: Configure GitHub Pages to redirect all requests to `index.html`
- Add a custom `404.html` that redirects to `/index.html`

**Issue: Mixed content warnings**
- **Solution**: Use relative paths or ensure your site is served over HTTPS
- GitHub Pages serves all sites over HTTPS

### Verification Steps
1. After deployment, check the GitHub Pages URL
2. Open browser dev tools and check:
   - Network tab for failed asset requests
   - Console for JavaScript errors
   - Application tab to verify service worker and caching
3. Test both build and serve modes

## 📝 Best Practices

1. **Use consistent naming**: Repository name should match the base path
2. **Test locally first**: Use `vite preview` to test the production build locally
3. **Automate deployment**: Set up GitHub Actions for automatic deploys
4. **Monitor deployments**: Check GitHub Pages status after each deploy
5. **Use environment variables**: Keep configuration separate from code

## 🔗 Related Resources

- [GitHub Pages Documentation](https://docs.github.com/pages)
- [Vite Base Configuration](https://vitejs.dev/guide/build.html#public-base-path)
- [Vercel Deployment Guide](https://vercel.com/docs)
- [GitHub Actions for Deployment](https://docs.github.com/actions/deployment)