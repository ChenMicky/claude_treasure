# GitHub Pages Deployment Guide

## Setup Complete ✅

Your project is now configured to deploy to GitHub Pages instead of Vercel.

## Configuration Changes Made

1. **package.json**:
   - Added `gh-pages` as a dev dependency
   - Added `predeploy` script (builds the project before deployment)
   - Added `deploy` script (pushes to GitHub Pages)
   - Set `homepage` to your GitHub Pages URL

2. **vite.config.ts**:
   - Added `base: '/claude_code_treasure_game/'` to handle GitHub Pages routing

## Deployment Commands

### Deploy to GitHub Pages
```bash
npm run deploy
```

This will:
1. Build your project (`npm run build`)
2. Deploy the build folder to GitHub Pages

### Local Development
```bash
npm run dev
```

## Important Notes

- Make sure to replace `<your-username>` and `<your-repo-name>` in the homepage URL if needed
- The project must be in a GitHub repository
- You need to have GitHub CLI (`gh`) installed and authenticated
- After deployment, your site will be available at: `https://<your-username>.github.io/<your-repo-name>`

## Troubleshooting

If you encounter issues:
1. Ensure you're on the correct branch (usually `main` or `master`)
2. Check that your GitHub repository is public (or you have proper authentication)
3. Verify the homepage URL in package.json matches your repository settings
4. Run `npm run build` locally to ensure the build works before deploying