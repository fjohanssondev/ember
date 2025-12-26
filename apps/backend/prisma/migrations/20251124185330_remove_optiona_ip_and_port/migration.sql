/*
  Warnings:

  - Made the column `password` on table `server` required. This step will fail if there are existing NULL values in that column.
  - Made the column `ip` on table `server` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "server" ALTER COLUMN "password" SET NOT NULL,
ALTER COLUMN "ip" SET NOT NULL;
