# Codagen

A web-first AI coding workspace designed for Cloudflare. Current repository status: starter implementation, not production-ready.

## Stack
- React + TypeScript + Vite UI
- Cloudflare Workers API
- Cloudflare D1 project metadata
- Multi-provider chat: Gemini, DeepSeek, and OpenAI-compatible endpoints
- GitHub Actions CI

## Quick start
1. Install Node.js 20+ and npm.
2. Run `npm install`.
3. Copy `.env.example` to `.env` and configure provider keys.
4. Run `npm run dev`.

## Deploy
Configure the D1 database in `wrangler.toml`, set Worker secrets using `wrangler secret put`, then run `npm run deploy`.

## Current limitations
This is an MVP scaffold. GitHub repository write operations, secure OAuth token storage, encrypted integration secrets, durable job execution, file editor, and preview sandbox still require implementation. Do not expose provider keys in browser code or deploy with placeholder OAuth settings.
See [AGENT_HANDOFF.md](AGENT_HANDOFF.md) for the implementation plan and security checklist.
