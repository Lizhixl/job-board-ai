FROM --platform=linux/arm64 node:20-alpine

WORKDIR /app

RUN cat > server.js <<'JS'
const http = require("http");

const server = http.createServer((req, res) => {
  if (req.url === "/api/health") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify({
      status: "healthy",
      timestamp: new Date().toISOString()
    }));
    return;
  }

  res.writeHead(200, { "Content-Type": "text/html" });
  res.end("<h1>Job Board AI CI/CD Test OK 2026-05-18 14:10</h1>");
});

server.listen(3000, "0.0.0.0");
JS

EXPOSE 3000

CMD ["node", "server.js"]
