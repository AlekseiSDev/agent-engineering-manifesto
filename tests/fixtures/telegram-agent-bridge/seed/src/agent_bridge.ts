export async function dispatchCodingTask(prompt: string) {
  return {
    accepted: true,
    prompt,
    transport: "telegram"
  };
}
