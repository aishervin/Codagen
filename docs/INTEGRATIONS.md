# Integrations

## AI providers
Set GEMINI_API_KEY, DEEPSEEK_API_KEY and OPENAI_API_KEY as Cloudflare Worker secrets, not browser variables. Proxy calls through authenticated endpoints with model allowlists, request limits, timeouts and redacted logs.

## GitHub
Create an OAuth App with callback https://YOUR_DOMAIN/api/auth/github/callback. Store the client secret as a Worker secret. Request minimum scopes, encrypt tokens at rest, and support revocation.

## Cloudflare
Use a scoped API token limited to required account/services. Store it as CLOUDFLARE_API_TOKEN. Never use the global API key.

## Actions
Use workflow_dispatch with strict input allowlists, concurrency limits and least-privilege permissions. GitHub Actions is a build/test runner, not an unrestricted public shell.
