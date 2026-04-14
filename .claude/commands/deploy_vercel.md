# Deploy to Vercel

This command will deploy your local treasure game project to Vercel and display the live URL.

## Command

`/deploy-vercel`

## Implementation

Run the Vercel CLI to deploy the current project:

```bash
# Deploy and capture the live URL
VERCEL_URL=$(vercel --prod --confirm --silent 2>&1 | grep -o 'https://[^ ]*\.vercel\.app' | head -1)
echo "Deployed to: $VERCEL_URL"
```

## Example Output

After a successful deployment you’ll see a line like:

```
Deployed to: https://my-treasure-game-123.vercel.app
```

You can copy this URL to share your deployed game.

## Requirements

- Vercel CLI installed (`npm install -g vercel`)
- Logged in to your Vercel account (`vercel login`)
- The project must be configured with a `vercel.json` (if you need custom settings)
- Ensure the build command matches your Vite project (e.g., `npm run build`)

## Customization

If you need to specify a different build command or output directory, add a `vercel.json` in the project root:

```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "build"
}
```