-- Create a custom command file for GitHub Pages deployment

# GitHub Pages Deployment Command

To deploy your Interactive Treasure Box Game to GitHub Pages, follow these steps:

## Prerequisites

1. Make sure you have a GitHub repository created
2. Install GitHub CLI: https://cli.github.com/
3. Login to GitHub CLI: `gh auth login`

## Deployment Steps

### Option 1: Using GitHub Pages with gh CLI (Recommended)

```bash
# Navigate to your project directory
cd /Applications/Code/Claude_lesson2/chapter2/claude_code_treasure_game

# Initialize git if not already done
git init
git add .
git commit -m "Initial commit for GitHub Pages deployment"

# Create a new repository on GitHub or use existing one
gh repo create claude-code-treasure-game --public --source=. --push --web

# OR if you already have a repository:
# git remote add origin https://github.com/YOUR_USERNAME/claude-code-treasure-game.git
# git push -u origin main

# Deploy to GitHub Pages
gh pages --remote origin --push --source dist
```

### Option 2: Manual Deployment

```bash
# Build the project
npm run build

# Copy contents of build/ folder to GitHub Pages
# Method 1: Using git subtree
mkdir -p docs
git subtree split --prefix build/ -b gh-pages
git push origin gh-pages:gh-pages

# Method 2: Direct copy (for GitHub Pages settings)
cp -r build/* docs/
git add docs/
git commit -m "Deploy to GitHub Pages"
git push origin main
```

### Option 3: Using GitHub Actions

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '20'
      - run: npm install
      - run: npm run build
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build
```

## After Deployment

Once deployed, your game will be available at:
- **https://YOUR_USERNAME.github.io/claude-code-treasure-game/**

Or if using a custom domain, configure it in GitHub repository settings → Pages.

## Verification

After deployment, verify by:
1. Visiting the URL above
2. Testing game functionality
3. Checking browser console for errors