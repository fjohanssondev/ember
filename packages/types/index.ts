// Re-export App type from backend
export type { App } from "../../apps/backend/src/index";

// Re-export Prisma enums
export type { GameStatus, Games } from "../../apps/backend/generated/prisma_client/enums";
export { GameStatus as GameStatusEnum, Games as GamesEnum } from "../../apps/backend/generated/prisma_client/enums";

