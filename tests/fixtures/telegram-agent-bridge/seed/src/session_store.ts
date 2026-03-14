const sessions = new Map<string, string>();

export function rememberSession(chatId: string, workspace: string) {
  sessions.set(chatId, workspace);
}

export function getSessionWorkspace(chatId: string) {
  return sessions.get(chatId);
}
