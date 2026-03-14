import http from "node:http";

const server = http.createServer((_, res) => {
  res.writeHead(200, { "content-type": "application/json" });
  res.end(JSON.stringify({ ok: true }));
});

server.listen(3000, () => {
  console.log("Notes API listening on :3000");
});
