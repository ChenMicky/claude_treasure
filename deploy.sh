#!/bin/bash

# GitHub Pages Deployment Script
# This script builds and deploys your project to GitHub Pages

set -e

echo "🚀 Starting deployment to GitHub Pages..."

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI (gh) is not installed."
    echo "   Please install it from: https://github.com/cli/cli"
    echo "   Or deploy manually using the steps below."
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "⚠️  Not authenticated with GitHub."
    echo "   Please run: gh auth login"
    exit 1
fi

# Build the project
echo "🏗️  Building project..."
npm run build

# Deploy to GitHub Pages
echo "🚀 Deploying to GitHub Pages..."
gh-pages -d build

echo "✅ Deployment complete!"
echo "🌐 Your site will be available at: https://$(gh api user --jq .login).github.io/$(gh repo view --json nameWithOwner -q .nameWithOwner | sed 's/.*\///g')"
echo ""
echo "Or manually browse to: https://<your-username>.github.io/claude_code_treasure_game"