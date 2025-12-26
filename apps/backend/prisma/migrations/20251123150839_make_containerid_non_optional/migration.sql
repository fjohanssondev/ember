/*
  Warnings:

  - Made the column `containerId` on table `server` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "server" ALTER COLUMN "containerId" SET NOT NULL;
