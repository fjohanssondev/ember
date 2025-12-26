/*
  Warnings:

  - You are about to drop the `GameServer` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GameServer" DROP CONSTRAINT "GameServer_userId_fkey";

-- DropTable
DROP TABLE "GameServer";

-- CreateTable
CREATE TABLE "server" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" "Games" NOT NULL,
    "serverName" TEXT NOT NULL,
    "password" TEXT,
    "ip" TEXT,
    "port" INTEGER NOT NULL,
    "containerId" TEXT,
    "status" "GameStatus" NOT NULL DEFAULT 'CREATING',
    "maxPlayers" INTEGER NOT NULL DEFAULT 10,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "server_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "server_port_key" ON "server"("port");

-- CreateIndex
CREATE UNIQUE INDEX "server_containerId_key" ON "server"("containerId");

-- CreateIndex
CREATE INDEX "server_userId_idx" ON "server"("userId");

-- CreateIndex
CREATE INDEX "server_status_idx" ON "server"("status");

-- AddForeignKey
ALTER TABLE "server" ADD CONSTRAINT "server_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
