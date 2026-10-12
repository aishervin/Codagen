CREATE TABLE IF NOT EXISTS projects (id TEXT PRIMARY KEY, user_id TEXT NOT NULL, name TEXT NOT NULL, description TEXT NOT NULL DEFAULT '', repo_url TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now')));
CREATE INDEX IF NOT EXISTS projects_user_id_idx ON projects(user_id);
CREATE TABLE IF NOT EXISTS sessions (id TEXT PRIMARY KEY, project_id TEXT NOT NULL REFERENCES projects(id) ON DELETE CASCADE, title TEXT NOT NULL DEFAULT 'New session', provider TEXT NOT NULL DEFAULT 'gemini', created_at TEXT NOT NULL DEFAULT (datetime('now')));
