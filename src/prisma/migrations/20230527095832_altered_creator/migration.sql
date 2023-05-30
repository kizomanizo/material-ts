/*
  Warnings:

  - You are about to drop the column `userId` on the `item` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `item_category` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `item` DROP FOREIGN KEY `item_userId_fkey`;

-- DropForeignKey
ALTER TABLE `item_category` DROP FOREIGN KEY `item_category_userId_fkey`;

-- AlterTable
ALTER TABLE `client` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `insurance` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `item` DROP COLUMN `userId`,
    ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `item_category` DROP COLUMN `userId`,
    ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `item_inventory` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `item_stock` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `item_store` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `item_supplier` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `order_discount` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `person` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `createdBy` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `user_role` ADD COLUMN `createdBy` VARCHAR(191) NULL;
