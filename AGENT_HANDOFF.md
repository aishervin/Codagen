# Codagen implementation handoff

Goal: build a secure, web-first AI coding workspace deployed on Cloudflare's free/standard platform.

## Product requirements
1. Project dashboard, persistent projects/sessions, upload and browse project files.
2. Chat with Gemini, DeepSeek, and OpenAI-compatible APIs, proxied through Worker routes.
3. Editor with diff preview, save, explicit commit/push to selected GitHub repository/branch.
4. GitHub OAuth, repository picker, secure token storage, revoke/disconnect.
5. Cloudflare connection for Workers/Pages deployments and logs, using least-privilege tokens.
6. Integration vault encrypting keys at rest; never return plaintext secrets after save.
7. Job runner via GitHub Actions workflow_dispatch; show status, logs and artifacts. No arbitrary shell endpoint.
8. Isolated project preview; never execute untrusted project code in the Worker.
9. Tests, accessible responsive UI, docs and CI.

## Next steps
- Finish auth/session handling before repo operations.
- Add authenticated API routes for projects, chat, GitHub repos/contents/commits, Cloudflare deploy/logs, Actions jobs.
- Add rate limits, validation, audit events, CSRF and SSRF protections, ownership checks, secret redaction, upload limits and path-traversal defense.
- Add mocked-provider tests and integration tests. Validate npm install, npm run build, npm test before deployment.

## Security non-negotiables
- Never put provider/GitHub/Cloudflare credentials in VITE_* or client bundles.
- OAuth state must be signed, expiring, server-side single-use; use secure HttpOnly SameSite cookies.
- No unrestricted shell commands. Use allowlisted workflow inputs and repository permissions.
- Enforce ownership at every API boundary. Do not claim a deploy or commit succeeded until confirmed by the remote API.
