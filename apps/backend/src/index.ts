import { Elysia } from "elysia";
import { cors } from "@elysiajs/cors";
import { serversModule } from "./modules/servers";
import { betterAuthContext } from "../plugins/auth";

const app = new Elysia()
  .use(
    cors({
      origin: ["http://localhost:5173", "https://ember-psi-eight.vercel.app/"],
      credentials: true,
    })
  )
  .use(betterAuthContext)
  .use(serversModule)
  .get("/api/health", () => ({ status: "ok" }))
  .listen(3000);

export type App = typeof app;

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
