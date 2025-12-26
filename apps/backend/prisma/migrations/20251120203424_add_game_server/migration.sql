-- CreateEnum
CREATE TYPE "Games" AS ENUM ('ENSHROUDED');

-- CreateEnum
CREATE TYPE "GameStatus" AS ENUM ('CREATING', 'RUNNING', 'STOPPED', 'ERROR');

-- CreateTable
CREATE TABLE "GameServer" (
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

    CONSTRAINT "GameServer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GameServer_port_key" ON "GameServer"("port");

-- CreateIndex
CREATE UNIQUE INDEX "GameServer_containerId_key" ON "GameServer"("containerId");

-- CreateIndex
CREATE INDEX "GameServer_userId_idx" ON "GameServer"("userId");

-- CreateIndex
CREATE INDEX "GameServer_status_idx" ON "GameServer"("status");

-- AddForeignKey
ALTER TABLE "GameServer" ADD CONSTRAINT "GameServer_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
