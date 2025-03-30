import { Elysia } from "elysia";

const app = new Elysia()
  .get("/", () => "Hello from Elysia API!")
  .listen(Bun.env.APP_PORT || 3000);

console.log(`🦊 Elysia is running on http://localhost:${app.server?.port}`);
